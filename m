Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJwqq-0006uP-Ja
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 01:37:18 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 9/9] mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID
Date: Fri, 5 Oct 2012 03:37:11 +0200
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
 <1348544455-17656-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1348544455-17656-10-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210050337.12011.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> Datasheets for the following Samsung NAND parts (both MLC and SLC) describe
> extensions to the Samsung 6-byte extended ID decoding table:
[...]

This breaks my board with K9F2G08 part:

[    0.860000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 
256MiB 3,3V 8-bit), page size: 2048, OOB size: 64


> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 7e93d0d..bcb58ce 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2939,19 +2939,18 @@ static void nand_decode_ext_id(struct mtd_info
> *mtd, struct nand_chip *chip, /*
>  	 * Field definitions are in the following datasheets:
>  	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
> -	 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
> +	 * New style   (6 byte ID): Samsung K9GAG08U0F (p.44)
>  	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
>  	 *
>  	 * Check for ID length, cell type, and Hynix/Samsung ID to decide what
>  	 * to do.
>  	 */
> -	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
> -			(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
> +	if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
[...]

I believe the above hunk is wrong, reverting it fixes the problem.

Best regards,
Marek Vasut
