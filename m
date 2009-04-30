Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzTWB-0004H7-Rb
	for linux-mtd@lists.infradead.org; Thu, 30 Apr 2009 10:29:34 +0000
Message-ID: <49F97D72.8030109@embeddedalley.com>
Date: Thu, 30 Apr 2009 14:29:06 +0400
From: Vladimir Barinov <vbarinov@embeddedalley.com>
MIME-Version: 1.0
To: Holger Schurig <h.schurig@mn-solutions.de>
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v3)
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>	<1239210502-822-1-git-send-email-vbarinov@embeddedalley.com>	<20090408172818.GR14383@pengutronix.de>
	<200904291252.15650.h.schurig@mn-solutions.de>
In-Reply-To: <200904291252.15650.h.schurig@mn-solutions.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	dwmw2@infradead.org, linux-arm-kernel@lists.arm.linux.org.uk,
	Lothar Wassmann <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Holger,

Could you explain how this message is related to this thread?
This patch as well as linux-mtd mail list doesn't care about platform 
specific code that you can do in your custom mx21 based board.

Holger Schurig wrote:
> Hmm, in u-boot v2, drivers/nand/nand_imx.c, I read:
>
>
> /*
>  * MX21 Hardware contains a bug which causes HW ECC to fail for two
>  * consecutive read pages containing 1bit Errors (See MX21 Chip Erata,
>  * Erratum 16). Use software ECC for this chip.
>  */
>
> BTW, in my version of MC9328MX21CE.pdf it's number 18.
>
>
> Do you know if all I need on i.MX21 is then
>
> static struct mxc_nand_platform_data nand_board_info = {
>        .width = 1,
>        .hw_ecc = 0,  /* Broken hardware */
> };
>   
Great, so the current mxc_nand driver can support your imx21 cpu through 
platform data.

Regarding to me then I use mx27 cpu and it's errata taken from FSL site 
says nothing about HW ECC:
http://www.freescale.com/files/32bit/doc/errata/MCIMX27CE.pdf?fsrch=1
nor in addendum:
http://www.freescale.com/files/dsp/doc/ref_manual/MCIMX27RMAD.pdf?fsrch=1

I can successfully flash jffs2 image to NAND flash, mount and read the 
context.
Ditto I can do with ubifs. All this with hw_ecc = 1.

Regards,
Vladimir
