MIME-Version: 1.0
In-Reply-To: <20100408133303.GK3688@pengutronix.de>
References: <q2tba216b431004060652jeb9df33eqd141836e46980f00@mail.gmail.com>
	<20100407134039.GE3688@pengutronix.de>
	<o2oba216b431004080520u924ffafby3a88e18471b560b@mail.gmail.com>
	<20100408133303.GK3688@pengutronix.de>
Date: Thu, 8 Apr 2010 16:13:27 +0200
Message-ID: <o2qba216b431004080713n9a264511qc4066544cdac10aa@mail.gmail.com>
Subject: [PATCH v3 0/2] ARM: MXC: mxc_nand: support i.MX21
From: Ivo Clarysse <ivo.clarysse@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow mxc_nand.c to function on i.MX21 SoCs, since:

1) On i.MX21, if the NFC_INT_MASK bit in NFC_CONFIG1 is set, the NFC_INT
 bit of NFC_CONFIG2 always reads out zero, even if an operation is
 completed.

2) On i.MX21, sending a RESET command to the NAND flash controller does
 not trigger an interrupt, nor does it cause the NFC_INT bit of
 NFC_CONFIG2 to get set.

3) After reset is performed, NFC registers are again in their
 default values.

This patch series:

- (Re-)sets all NFC registers after reset

- Uses enable_irq / disable_irq_nosync instead of NFC_INT_MASK
  to mask NFC interrupts (allowing NFC_CONFIG2:NFC_INT to used on i.MX21)
