Received: from mail.mtekvision.com ([218.49.29.145]
	helo=mtv-mail.INFRA.MTEKVISION.COM)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4qp9-0007aJ-2V
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 06:23:21 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: oobavail size calculation error in nand_base.c
Date: Fri, 15 May 2009 15:23:09 +0900
Message-ID: <FD296E38A61CDB45A5F0E6CCD4B459432EAC4D@mtv-mail>
References: <37597.192.168.10.89.1242365806.squirrel@dbdmail.itg.ti.com>
From: "Park Jinyoung" <parkjy@mtekvision.com>
To: "vimal singh" <vimalsingh@ti.com>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I didn't realize that problem was patched, sorry.
And thanks for your reply.

Jinyoung Park

-----Original Message-----
From: vimal singh [mailto:vimalsingh@ti.com]=20
Sent: Friday, May 15, 2009 2:37 PM
To: Park Jinyoung
Cc: tglx@linutronix.de; linux-mtd@lists.infradead.org
Subject: Re: oobavail size calculation error in nand_base.c

This issue is already noticed by Snehaprabha Narnakaje. And a patch is
already
sent to fix this by David Brownell.

http://lists.infradead.org/pipermail/linux-mtd/2009-April/025205.html


Sorry, last time I replied on wrong subject line... :)

---
Vimal

On Thu, May 14, 2009 at 1:58 PM, Jinyoung Park <parkjy@mtekvision.com>
wrote:
> Hello.
>
> I found error in nand_base.c.
> In nand_scan_tail() function, oobavail size calculation result is
> wrong as follow circumstances.
>    - Define nand_ecclayout using full oobfree array like below.
>        .oobfree =3D { {2, 6}, {11, 2}, {16, 8}, {27, 2}, {32, 8}, {43,
2},{48,
> 8}, {59, 2} }
>    - Using ARM EABI cross compiler when kernel compile also enable
> "Use the ARM EABI to compile the kernl" feature in kernel menuconfig.
>      I using ARM EABI compiler that codesourcery release
arm-2008q3-51.
>
> In this case, right oobavail size is 38 but result is too much
> value(e.g. 2703572308...). It's random.
> I think sometimes happen that after beyond oobfree array(oobfree[8])
> is not 0 when ARM EABI compilation.
> Below codes are my modified code. Please check...
>
> Thanks.
>
> diff --git a/drivers/mtd/nand/nand_base.c
b/drivers/mtd/nand/nand_base.c
> index 3d7ed43..abb5998 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2756,9 +2756,12 @@ int nand_scan_tail(struct mtd_info *mtd)
>        * the out of band area
>        */
>        chip->ecc.layout->oobavail =3D 0;
> -       for (i =3D 0; chip->ecc.layout->oobfree[i].length; i++)
> +       for (i =3D 0; i < MTD_MAX_OOBFREE_ENTRIES; i++) {
> +       if (chip->ecc.layout->oobfree[i].length =3D=3D 0)
> +               break;
>        chip->ecc.layout->oobavail +=3D
>                chip->ecc.layout->oobfree[i].length;
> +       }
>        mtd->oobavail =3D chip->ecc.layout->oobavail;
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
