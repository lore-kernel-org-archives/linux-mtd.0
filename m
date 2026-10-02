Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77AECA5FD4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 02:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MUeSXhzAv0PMQZckxh/CnpUhr2g8X4JeSbjln/DHoIg=; b=yiYZAa/pLW7lh/
	6wz4whdjtuP3XiilI5WmQYWBOp2/ru+5odkLtY38cDkCivbCeub6ciL8c1yhyJZXzZM/VG9Sttfen
	MaXNC9SMVbaSkY4aTm1H3wagRZgCzZxuVQVA7LHr7QV6jwGhNxFmzXggG3dwY71CMWeX1fJRY/O7G
	mYCEWQmBBB3pfHaASzFEkTL8+h+ekpINVcI/wVSHmnKAtHLH1Gldbz1Ak/Nr/nIAOakD1Nl+lU3E4
	dV27CQ5zxawZvb5SX6TPBXZIsQltOZ+XaeCo9cZbUQkim7ejWUVPLwq+/bpPdAkxUsmZm3Ev/WlNc
	qjfsJhI3Nn2mE5otGH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTJ6-0000000AWbG-2Hbc;
	Fri, 02 Oct 2026 02:47:32 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTJ3-0000000AWaq-3mbl
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 02:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ig
	PosaQZzzRdSuWu6GnBn41EP9uSuMfYZlnF4bOOBxI=; b=dJE1h+GfuqWnZhc/O1
	HfBJM+SRP2C8JjgjrT42zfgVuXVJ3c2Czdgii845JPoHstG7H8vBs0dK090fjiw6
	hWcB3YfR7dqzoW7zfbvije+mtLa7sVwIShNpR0hwZgmxU+ukLUHQ/4ZGndFMbp/3
	qVs67c0TvrhEAeIEycbndWkPo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4YvG79qL5ryBw--.20560S2;
	Fri, 02 Oct 2026 10:47:12 +0800 (CST)
From: wang wei <a929244872@163.com>
To: sashiko-bot@kernel.org,
	bbrezillon@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sashiko-reviews@lists.linux.dev,
	vigneshr@ti.com,
	wenyou.yang@microchip.com,
	yamada.masahiro@socionext.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	wang wei <a929244872@163.com>,
	stable@vger.kernel.org
Subject: [PATCH V3] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Fri,  2 Oct 2026 10:47:09 +0800
Message-Id: <20261002024709.16510-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3H4YvG79qL5ryBw--.20560S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw13Aw4xuF4kurWfCFy3urg_yoWrWr4fpr
	WUGayUKw4DGF9rurZrZ3Wru3WrJ3ZYya1j9FyfA34F93W5ury2va45KryYkF1UAF4rX3WY
	vrs3XryDC3WYv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREoGPUUUUU=
X-Originating-IP: [240e:390:6a3:2fd0:6949:c003:e98d:1ea]
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwhBdBGq-GzDAJwAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_194730_350591_9E875C07 
X-CRM114-Status: GOOD (  17.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The overridesize module parameter changes the size of the simulated
device after nand_scan() has completed. It updates nsmtd->size,
memorg->eraseblocks_per_lun, chip->chip_shift and chip->pagemask to
match the new geometry, but leaves the NAND_ROW_ADDR_3 option
untouched, even though nand_scan_ident() set it from the geometry
decoded out of the ID bytes.

When the ID bytes describe a device larger than 128 MiB and
overridesize shrinks the simulation to 128 MiB or less, the stale
option makes the core emit one extra row address byte (page >> 16,
always zero given the reduced page count) in every read, program and
erase operation, while the simulator state machine expects one byte
less. All accesses then fail with:

    nandsim: error: write_byte: address (0x0) isn't expected, expected
    state is STATE_CMD_READSTART, switch to STATE_READY

The opposite direction is equally broken: growing a small device past
128 MiB keeps NAND_ROW_ADDR_3 cleared, so the third row address byte
is dropped and the wrong pages are silently addressed.

This used to work before commit 14157f861437 ("mtd: nand: introduce
NAND_ROW_ADDR_3 flag"). Back then nandsim kept chip->chipsize in sync
with the override, and nand_command_lp() decided at run time, per
command, whether the third row address cycle was needed by testing
chip->chipsize against 128 MiB. This code thus always saw the
overridden size. The above commit moved the decision to
nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
scan time -- before nandsim applies the override -- and the
overridesize path was never taught to re-evaluate the flag. 

Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
the same test as nand_scan_ident().

The core encodes the third row address cycle as "the row address is
wider than 16 bits", ie. more than 65536 pages, regardless of the
page size. ns_init() however derives its expectation from the total
size with a hardcoded 128 MiB threshold, which is only equivalent
for 2 KiB-page devices. For 4 KiB-page devices between 128 MiB and
256 MiB (32768 < pgnum <= 65536) the row address still fits in two
bytes, so the core drops the third byte while ns_init() keeps
expecting it. Fix ns_init() to derive the row address width from the
page count as well, which also matches the small-page branch (32 MiB
of 512-byte pages is exactly 65536 pages).

Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
Cc: stable@vger.kernel.org
Signed-off-by: wang wei <a929244872@163.com>
---
Changes in v3:
- Drop the comment block on the flag re-evaluation.
- Also derive ns_init()'s pgaddrbytes/secaddrbytes from the page
  count instead of the hardcoded 128 MiB threshold: re-evaluating
  the flag alone would regress 4 KiB-page devices overridden into
  the 128-256 MiB range, where the stale flag used to match
  ns_init()'s (incorrect) 5-byte expectation serendipitously.
  Reported by reviewer.
  
Changes in v2:
  Remove unnecessary comments
  
---
 drivers/mtd/nand/raw/nandsim.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe96803..90dbb93 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -686,7 +686,7 @@ static int __init ns_init(struct mtd_info *mtd)
 			ns->geom.secaddrbytes = 3;
 		}
 	} else {
-		if (ns->geom.totsz <= (128 << 20)) {
+		if (ns->geom.pgnum <= (1 << 16)) {
 			ns->geom.pgaddrbytes  = 4;
 			ns->geom.secaddrbytes = 2;
 		} else {
@@ -2359,6 +2359,11 @@ static int __init ns_init_module(void)
 		targetsize = nanddev_target_size(&chip->base);
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
+
+		if (chip->chip_shift - chip->page_shift > 16)
+			chip->options |= NAND_ROW_ADDR_3;
+		else
+			chip->options &= ~NAND_ROW_ADDR_3;
 	}
 
 	ret = ns_setup_wear_reporting(nsmtd);
-- 
2.55.0.windows.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
