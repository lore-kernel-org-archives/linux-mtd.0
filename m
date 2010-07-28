Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeGCU-00070R-VM
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2010 23:38:15 +0000
Message-ID: <4C50BF59.3020700@broadcom.com>
Date: Wed, 28 Jul 2010 16:38:01 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Florian Fainelli" <ffainelli@freebox.fr>
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from
	NAND device
References: <201007290047.06394.ffainelli@freebox.fr>
In-Reply-To: <201007290047.06394.ffainelli@freebox.fr>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index a81b185..ad7f58f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
<snip>
> @@ -190,6 +194,9 @@ typedef enum {
>   /* Device behaves just like nand, but is readonly */
>   #define NAND_ROM		0x00000800
> 
> +/* Chip supports ONFI */
> +#define NAND_ONFI		0x00001000

I've been wondering: how independent are the flags in include/linux/mtd/bbm.h
and nand.h? I've working on some patches dealing with various such flags. For
instance, I know that the following patch dealt with a potential conflict
between flags in bbm.h and nand.h:
http://lists.infradead.org/pipermail/linux-mtd/2010-June/030703.html

I don't know if there's a possibility of conflict between NAND_BBT_WRITE (bbm.h)
and your new NAND_ONFI (nand.h); both are 0x00001000. I know *some* options are
written into nand_chip->options and later copied onto the options in
nand_bbt_descr->options for BBT usage, e.g., I just rewrote part of this as a
new function nand_create_default_bbt_descr() in nand_bbt.c:
http://lists.infradead.org/pipermail/linux-mtd/2010-July/030911.html

Other pieces of the code perform similar functions at the moment.

Brian
