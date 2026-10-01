Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450B1CA5FCB
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6jCUrrhFfXdkNBBPi7tDKDxUzi8fVcv2jaR9tnBUkdE=; b=VrgymO15QAnSWH
	uVtMnXWB5S/FRuS/ONqSmrbXqa9228Rv1KgYMLG3oVEWBDWJZlk6847QcXPto/+5xwIqsDNmcB4jC
	Rj/XmcUvOVDTnPmYH/4lBHjD6OnI6IRXMw0zHdy7LH9Bwf/3w30WlLhpf630kW+zyScK828MXt5eY
	uHaoEFmQyM3JhvFwm60EjwYb9XN/u+JRFyuese0Ka88/QFbT/CzKBQSPfdaOn40ur7G7B/oj5ahnr
	/76KbFJQLk+hRL30paXXfAym2y873RjSJFZ3SW73XhkJvyI6nlxvwCa7X2k1GtfOBzlntKbsJ9nmM
	t4iGXElFF2ctl4oYpXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGCl-000000098iU-1ClV;
	Thu, 01 Oct 2026 12:48:07 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGCh-000000098hc-3jLY
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 12:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=TJ
	GjbuaLcP+ZIwC3nLI3tROoCLY39LzAtjrRQpNRkCI=; b=QWmBdyLnTwBsK46du4
	AorTsudiPgpZGBDY7lSYIX4DitBMNLfdyy8YrnX1ZtL67yS3T7O6HpkXQqUGJgfS
	ojvs38Xntl0ULKQj/5gvK/f5Xh/0THdURyUUJdyZFNpDiIZu31coMpHhuWkO3Abe
	sdwHC+svB/TGux6k7oXnTNQ8Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnrwtnVr5qjk7FBw--.47576S2;
	Thu, 01 Oct 2026 20:47:37 +0800 (CST)
From: wang wei <a929244872@163.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org,
	yamada.masahiro@socionext.com,
	wenyou.yang@microchip.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wang wei <a929244872@163.com>
Subject: [PATCH V2] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Thu,  1 Oct 2026 20:47:33 +0800
Message-Id: <20261001124733.43559-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnrwtnVr5qjk7FBw--.47576S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw13Aw4xuF4kurWfCFy3urg_yoW5Xw18pr
	W8Wa4UKr4kG3WDurZrua18uw1rJwsYyayj9FyrZryrua45u342ga45K345KF1UAF4rX3WY
	vrs3Xa4DC3W5tw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRY2NAUUUUU=
X-Originating-IP: [240e:390:6a3:2fd0:1078:fc47:80b1:d61]
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwQn5oGq+Vmny6wAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_054804_297495_00C70ED3 
X-CRM114-Status: GOOD (  14.20  )
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
the same test as nand_scan_ident(), so that the address width emitted
by the core always matches ns->geom.pgaddrbytes, which ns_init()
derives from the overridden total size.

Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
Signed-off-by: wang wei <a929244872@163.com>
---
 drivers/mtd/nand/raw/nandsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe96803..ac82dd7 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
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
