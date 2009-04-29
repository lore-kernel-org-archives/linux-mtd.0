Received: from mx51.mymxserver.com ([85.199.173.110])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lz7PN-0004qy-Sv
	for linux-mtd@lists.infradead.org; Wed, 29 Apr 2009 10:53:04 +0000
From: Holger Schurig <h.schurig@mn-solutions.de>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v3)
Date: Wed, 29 Apr 2009 12:52:15 +0200
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>
	<1239210502-822-1-git-send-email-vbarinov@embeddedalley.com>
	<20090408172818.GR14383@pengutronix.de>
In-Reply-To: <20090408172818.GR14383@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904291252.15650.h.schurig@mn-solutions.de>
Cc: Vladimir Barinov <vbarinov@embeddedalley.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, Lothar Wassmann <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hmm, in u-boot v2, drivers/nand/nand_imx.c, I read:


/*
 * MX21 Hardware contains a bug which causes HW ECC to fail for two
 * consecutive read pages containing 1bit Errors (See MX21 Chip Erata,
 * Erratum 16). Use software ECC for this chip.
 */

BTW, in my version of MC9328MX21CE.pdf it's number 18.


Do you know if all I need on i.MX21 is then

static struct mxc_nand_platform_data nand_board_info = {
       .width = 1,
       .hw_ecc = 0,  /* Broken hardware */
};
