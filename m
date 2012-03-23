Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SB5CT-0000tA-UH
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2012 14:10:45 +0000
Received: by obbup16 with SMTP id up16so2983610obb.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Mar 2012 07:10:39 -0700 (PDT)
Message-ID: <4F6C8451.1020005@gmail.com>
Date: Fri, 23 Mar 2012 09:10:25 -0500
From: Rob Herring <robherring2@gmail.com>
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH] mtd: spear-smi: Update compatible property
References: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar@st.com>
In-Reply-To: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: devicetree-discuss@ozlabs.org, artem.bityutskiy@linux.intel.com,
 spear-devel@list.st.com, linux-mtd@lists.infradead.org, viresh.linux@gmail.com,
 sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/23/2012 03:48 AM, Viresh Kumar wrote:
> SPEAr SMI controller version is same for all SPEAr machines. Thus we don't need
> per machine compatible property in driver.

Until the next chip...

> Thus this patch updates compatible entry to: "st,spear-smi", so that it
> works for all SPEAr machines.
> 

There is no reason all machines can't use "st,spear600-smi" in their
dts. It doesn't have to be a spear600, just compatible with it. Really
you want the string to be the oldest SOC the block is in and then newer
SOCs can claim compatibility with the old version.

This is also bad that you would break any existing dtb's out there. This
is probably not a concern yet since it's all new and in transition, but
down the road this is something that can't be done.

Rob

> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> ---
>  .../devicetree/bindings/mtd/spear_smi.txt          |    4 ++--
>  drivers/mtd/devices/spear_smi.c                    |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
> index 7248aad..80dfd96 100644
> --- a/Documentation/devicetree/bindings/mtd/spear_smi.txt
> +++ b/Documentation/devicetree/bindings/mtd/spear_smi.txt
> @@ -1,7 +1,7 @@
>  * SPEAr SMI
>  
>  Required properties:
> -- compatible : "st,spear600-smi"
> +- compatible : "st,spear-smi"
>  - reg : Address range of the mtd chip
>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>    representing partitions.
> @@ -16,7 +16,7 @@ Optional properties:
>  Example:
>  
>  	smi: flash@fc000000 {
> -		compatible = "st,spear600-smi";
> +		compatible = "st,spear-smi";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		reg = <0xfc000000 0x1000>;
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
> index bebce11..f392594 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -1113,7 +1113,7 @@ int spear_smi_resume(struct platform_device *pdev)
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id spear_smi_id_table[] = {
> -	{ .compatible = "st,spear600-smi" },
> +	{ .compatible = "st,spear-smi" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, spear_smi_id_table);
