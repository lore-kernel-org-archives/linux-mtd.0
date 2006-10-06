Received: from web215.biz.mail.re2.yahoo.com ([68.142.225.202])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GVtfa-0007la-Sj
	for linux-mtd@lists.infradead.org; Fri, 06 Oct 2006 13:39:37 -0400
Message-ID: <20061006173253.13269.qmail@web215.biz.mail.re2.yahoo.com>
Date: Fri, 6 Oct 2006 10:32:53 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Bug in edb7312.c ?
To: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.64.0610061120240.2435@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Come across this code and it looks it's broken


/*
 *      hardware specific access to control-lines
 *
 *      NAND_NCE: bit 0 -> bit 7
 *      NAND_CLE: bit 1 -> bit 4
 *      NAND_ALE: bit 2 -> bit 5
 */
static void ep7312_hwcontrol(struct mtd_info *mtd, int
cmd, unsigned int ctrl)
{
        struct nand_chip *chip = mtd->priv;

        if (ctrl & NAND_CTRL_CHANGE) {
                unsigned char bits;

                bits = (ctrl & (NAND_CLE | NAND_ALE))
<< 3;
                bits = (ctrl & NAND_NCE) << 7;

                clps_writeb((clps_readb(ep7312_pxdr) 
& 0xB0) | 0x10,
                            ep7312_pxdr);
        }
        if (cmd != NAND_CMD_NONE)
                writeb(cmd, chip->IO_ADDR_W);
}
