Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQmnY-0001MH-IZ
	for linux-mtd@lists.infradead.org; Sun, 07 Nov 2004 08:09:37 -0500
Received: by wproxy.gmail.com with SMTP id 57so106344wri
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Nov 2004 05:09:30 -0800 (PST)
Message-ID: <c2bc1f4041107050978fc06ff@mail.gmail.com>
Date: Sun, 7 Nov 2004 21:09:30 +0800
From: zheng wei <jeanwelly@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Can't enable ecc check in mtd.
Reply-To: zheng wei <jeanwelly@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, sir
 I cannot enable ecc check in mtd, the message in nand.c, func int
nand_write_page (),
printk (KERN_WARNING "Writing data without ECC to NAND-FLASH is not
recommended\n");

In mtd/nand.c,
static int nand_write_page (struct mtd_info *mtd, struct nand_chip
*this, int page, u_char *oob_buf,  struct nand_oobinfo *oobsel)
{
	int 	i, status;
	u_char	ecc_code[6], *oob_data;
	int	eccmode = oobsel->useecc ? this->eccmode : NAND_ECC_NONE;
//??????? I have initialize the eccmode to NAND_ECC_HW3_512,
...
}

I have enable the ecc check in mizi linux 2.4.18 for ARM2410.

Thank you
