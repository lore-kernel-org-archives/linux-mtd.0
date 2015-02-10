Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YLG2w-0008K7-11
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 19:00:37 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] mtd: teach mxc-nand about ONFI probing
Date: Tue, 10 Feb 2015 19:59:54 +0100
Message-Id: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

this series implements support for ONFI probing in mxc-nand.
Before a PARAM command was just ignored and the following read_bytes
read whatever then happened to be available from the controller's RAM.
But actually this wasn't that bad because the driver already failed to
read the ONFI marker at offset 32 in response to the READID command and
so the PARAM command wasn't issued at all :-)

Patch 1 is a robustness fix. Patch 2 is necessary to not make the
controller stuck when the READPAGE command is issued before the flash
chip is identified. Patch 3 is needed to be able to read more than 6
bytes in the read_byte callback. Finally patch 4 fixes the driver to
allow reading out the READID ONFI marker and patch 5 implements support
for the PARAM command.

Patch 6 implements a WARN that triggers when the core requests an
unknown command from the driver. In the case of missing PARAM support it
wouldn't have triggered because READID at offset 0x20 failed, too, but
it might be worthwhile anyhow; I'm not sure though, so I marked it RFC.
Not sure the set of commands will grow in the near future ...

Best regards
Uwe

Uwe Kleine-König (6):
  mtd: mxc-nand: Add a timeout when waiting for interrupt
  mtd: mxc-nand: Only enable hardware checksumming for fully detected
    flashes
  mtd: mxc-nand: Do the word to byte mangling in the read_byte callback
  mtd: mxc-nand: Allow to use column addresses different from 0
  mtd: mxc-nand: Implement support for PARAM command
  [RFC] mtd: mxc-nand: Warn on unimplemented commands

 drivers/mtd/nand/mxc_nand.c | 146 ++++++++++++++++++++++++++++----------------
 1 file changed, 93 insertions(+), 53 deletions(-)

-- 
2.1.4
