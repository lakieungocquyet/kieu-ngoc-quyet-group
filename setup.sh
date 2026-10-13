SCRIPT_DIR_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pixi init --format pixi
pixi workspace channel add -m pixi.toml "bioconda"
pixi workspace environment add kieu-ngoc-quyet-group

pixi add --no-install \
    fastp=* bwa=* samtools=* gatk4=* bcftools=* snpeff=* snpsift=* t1k=* seqkit=* optitype=* delly=* dicey=* tracy=* cnvkit=* mosdepth=* \
    "openjdk>=21" \
    jq=* go-yq=* pymol-open-source=* \
    pyyaml=* pandas=* xlsxwriter=* seaborn=* cyvcf2=* ruamel.yaml=*

pixi add --no-install \
    python=* \
    pandas=* \
    seaborn=* \
    numpy=* \
    ipykernel=*

pixi add --no-install \
    r-base=* \
    r-cowplot=* \
    r-ggforce=* \
    jupyterlab=* \
    jupyter=* \
    r-irkernel=* \
    r-ggplot2=* \
    r-scales=* \
    r-gtable=* \
    r-argparse=* \
    r-ggrepel=* \
    r-gggenes=* 

pixi install -e kieu-ngoc-quyet-group
# Use command "pixi shell -e kieu-ngoc-quyet-group" to activate "kieu-ngoc-quyet-group" environment.

"$SCRIPT_DIR_PATH/.pixi/envs/kieu-ngoc-quyet-group/bin/python3" -m ipykernel install --user --name=ip --display-name "Python3 kernel"

"$SCRIPT_DIR_PATH/.pixi/envs/kieu-ngoc-quyet-group/bin/Rscript" -e "IRkernel::installspec(name = 'ir', displayname = 'R kernel')"
jupyter kernelspec list

# Use command "jupyter kernelspec uninstall ir" to remove R kernel