Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQnkj-0001cn-Lj
	for linux-mtd@lists.infradead.org; Sun, 07 Nov 2004 09:10:46 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: zheng wei <jeanwelly@gmail.com>
In-Reply-To: <c2bc1f4041107050978fc06ff@mail.gmail.com>
References: <c2bc1f4041107050978fc06ff@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 07 Nov 2004 15:02:14 +0100
Message-Id: <1099836135.2810.184.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can't enable ecc check in mtd.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-11-07 at 21:09 +0800, zheng wei wrote:
> Hi, sir
>  I cannot enable ecc check in mtd, the message in nand.c, func int
> nand_write_page (),
> printk (KERN_WARNING "Writing data without ECC to NAND-FLASH is not
> recommended\n");
> 
> In mtd/nand.c,
> static int nand_write_page (struct mtd_info *mtd, struct nand_chip
> *this, int page, u_char *oob_buf,  struct nand_oobinfo *oobsel)
> {
> 	int 	i, status;
> 	u_char	ecc_code[6], *oob_data;
> 	int	eccmode = oobsel->useecc ? this->eccmode : NAND_ECC_NONE;
> //??????? I have initialize the eccmode to NAND_ECC_HW3_512,

Maybe, but the variable which is checked is oobsel->useecc.

Read http://www.linux-mtd.infradead.org/tech/mtdnand/index.html
and  http://www.linux-mtd.infradead.org/tech/mtdnand/x215.html
and  http://www.linux-mtd.infradead.org/tech/mtdnand/c460.html

> I have enable the ecc check in mizi linux 2.4.18 for ARM2410.

Read http://www.linux-mtd.infradead.org/#kernelversions

tglx
