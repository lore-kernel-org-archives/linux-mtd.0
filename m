Received: from [212.18.0.9] (helo=mail-out.m-online.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NQel2-00057d-2d
	for linux-mtd@lists.infradead.org; Fri, 01 Jan 2010 10:29:28 +0000
To: Wan ZongShun <mcuos.com@gmail.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH] ARM: NUC900: rename mtd nand driver name
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <4B3DC972.1020702@gmail.com>
References: <4B3DC972.1020702@gmail.com>
Date: Fri, 01 Jan 2010 11:28:48 +0100
Message-Id: <20100101102848.53C483F6FF@gemini.denx.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Wan ZongShun,

In message <4B3DC972.1020702@gmail.com> you wrote:
>
> Dear David,
> 
> Due to I have renamed the platform_device.name,so this patch changes
> this nand driver platform_driver name.
> 
> Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>
> 
> ---
>  drivers/mtd/nand/w90p910_nand.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/w90p910_nand.c
> b/drivers/mtd/nand/w90p910_nand.c
> index 7680e73..c2e9b68 100644
> --- a/drivers/mtd/nand/w90p910_nand.c
> +++ b/drivers/mtd/nand/w90p910_nand.c
> @@ -358,7 +358,7 @@ static struct platform_driver w90p910_nand_driver = {
>  	.probe		= w90p910_nand_probe,
>  	.remove		= __devexit_p(w90p910_nand_remove),
>  	.driver		= {
> -		.name	= "w90p910-fmi",
> +		.name	= "nuc900-fmi",
>  		.owner	= THIS_MODULE,
>  	},

Maybe you also want to rename the file w90p910_nand.c => nuc900_nand.c ?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The universe, they said, depended for its operation on the balance of
four forces which they identified as charm,  persuasion,  uncertainty
and bloody-mindedness.      -- Terry Pratchett, "The Light Fantastic"
