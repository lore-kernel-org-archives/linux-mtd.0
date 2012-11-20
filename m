Date: Tue, 20 Nov 2012 21:05:18 +0100 (CET)
From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
To: Sascha Hauer <kernel@pengutronix.de>
Message-ID: <880504158.1762783.1353441918369.JavaMail.root@advansee.com>
In-Reply-To: <1214095427.1646097.1353358014121.JavaMail.root@advansee.com>
Subject: mtd: nand: mxc: oobfree layout?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sascha Hauer,

I've seen in the history of mxc_nand.c that you have worked on the
nand_ecclayout structs. The following things look abnormal. Can you confirm=
?
 - nandv1_hw_eccoob_smallpage and nandv2_hw_eccoob_smallpage:
    * Why are bytes 0 and 1 in oobfree? These bytes are used for bad block
      information on the 16-bit variants of these 512-byte-page NANDs.
 - nandv1_hw_eccoob_largepage:
    * According to the i.MX31 reference manual, the BI bytes of the spare a=
rea
      buffers are not free to use. So why are bytes 5, 11, 27, 43 and 59 in
      oobfree? On the contrary, if this note is a mistake in the RM, then w=
hy
      are bytes 21, 37 and 53 not in oobfree?
 - nandv2_hw_eccoob_smallpage, nandv2_hw_eccoob_largepage and
   nandv2_hw_eccoob_4k:
    * Why is byte 6 not in oobfree?

Best regards,
Beno=C3=AEt
