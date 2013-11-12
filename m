Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg6Rc-0002wq-Su
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 05:23:21 +0000
Message-ID: <5281BBEE.7000502@freescale.com>
Date: Tue, 12 Nov 2013 13:26:06 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
References: <1383818858-5410-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1383818858-5410-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, dedekind1@gmail.com, t.figa@samsung.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8807=E6=97=A5 18:07, Huang Shijie =E5=86=99=
=E9=81=93:
> In default way, we use the ecc_strength/ecc_step size calculated by our=
selves
> and use all the OOB area.
>
> This patch adds a new property : "fsl,use-minimum-ecc"
>
> If we enable it, we will firstly try to use the datasheet's minimum req=
uired
> ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
> in the nand_chip{}). So we may have free space in the OOB area by using=
 the
> minimum ECC, and we may support JFFS2 with some SLC NANDs, such as Micr=
on's
> SLC NAND.
>
> If we fail to use the minimum ECC, we will use the legacy method to cal=
culate
> the ecc_strength and ecc_step size.
>
> Signed-off-by: Huang Shijie<b32955@freescale.com>
> ---
> v1 -->  v2: rebase this patch on the latest l2-mtd.
> v2 -->  v3: change the descriptions.
> ---
>   .../devicetree/bindings/mtd/gpmi-nand.txt          |    8 ++++++++
>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
>   2 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Docu=
mentation/devicetree/bindings/mtd/gpmi-nand.txt
> index 551b2a1..458d596 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -17,6 +17,14 @@ Required properties:
>   Optional properties:
>     - nand-on-flash-bbt: boolean to enable on flash bbt option if not
>                          present false
> +  - fsl,use-minimum-ecc: Protect this NAND flash with the minimum ECC
> +                       strength required. The required ECC strength is
> +                       automatically discoverable for some flash
> +                       (e.g., according to the ONFI standard).
> +                       However, note that if this strength is not
> +                       discoverable or this property is not enabled,
> +                       the software may chooses an implementation-defi=
ned
> +                       ECC scheme.
>
>   The device tree may optionally contain sub-nodes describing partition=
s of the
>   address space. See partition.txt for more detail.
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index 8f4e5b1..b849b92 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -353,6 +353,9 @@ static int legacy_set_geometry(struct gpmi_nand_dat=
a *this)
>
>   int common_nfc_set_geometry(struct gpmi_nand_data *this)
>   {
> +	if (of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc")
> +		&&  set_geometry_by_ecc_info(this))
> +		return 0;
>   	return legacy_set_geometry(this);
>   }
>
Hi Brian:
Is this patch ok now? I hope it can be accepted at this merge-window.


thanks
Huang Shijie
