Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB48CA5FCE
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=svFgpO3QNkDR5MeZNnLfxOSJA3Jz+gboi4nYCfSA0QI=; b=PRCY3ZjCEzyDnR
	y5PV8KiuDmiSjYuOCgwU5TVvAMZoRolspDUp/M8nvVSa055YeP2SfGKGC7/+tTDg3FR0LIDOsrXu6
	KM1qz209I878EV53k7UiO8i3gZV9bh4bAjttiwMkWlc4iedAJxwohidPpp1t89wC2GWLAHXlrx8Sx
	oyDwqxzhVmkTzpKxuQevLQhDQ4RIAM7THxsKEf0cHzQtCdWTsZZNDT/2WVYOyyeyP6D2jfki+kxxS
	CV4ZHmsufw9+jPWxVfcA111zdWkc/oud5NspC4ibiVN95uBaVgMJtyTHmqzW2XeJ41Ka3MfKAO3t+
	7lH2xcD8D+H2SsfwAXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE7m-00000008WHW-2PuQ;
	Thu, 01 Oct 2026 10:34:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE7j-00000008WH4-2FTR
	for linux-mtd@bombadil.infradead.org;
	Thu, 01 Oct 2026 10:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jYeLowNWzMOo2rbwRyD6w4MGRCdOM2szKiDsZS/kv5M=; b=A+bX+F6Ax0GUGiL8wBW5hUAZGr
	InzopvHBMaOCclr9JXD1FX1hroU5/H5l9vscTbiTnC7wMBIxCp2YUuXpx3NMuGQvVmDbzoJV+AZoS
	14eiQ4tlLRTvJaCtLPusWluzoC1RBrtvVI5IRbP82+VHnLfPEdAxfHaPnYT8Z2UGLsPvvrWSf7sdB
	jv5uCEe7PLq0DxqfwO5M8PJ5fJMDaRtCHCHorWSUXtw0pTJopDyUS6m1cDaxJs9Ib/g0yUwc0HPSw
	k6DUekLXK3M3iF4aiHGahDBPtmUX6qZh1pPw9SjrXDjkGoBgKdGe4VnESUh3RHLfarQNDRQpBP9aT
	HQhmO2uA==;
Received: from m16.mail.163.com ([220.197.31.3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCE7f-00000004qcM-21LJ
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 10:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jY
	eLowNWzMOo2rbwRyD6w4MGRCdOM2szKiDsZS/kv5M=; b=lNs8a1Idq2ik7e8f23
	HnMevpwSmfdTsH8esbXq/o/TR3D77S9vxJwH/2laFlg4F0KGWsofoaz0Nr60HH54
	1CWfQkIEKnZT6Kx6fWLi8w74hEhN5/JiLifq1YIIfq1HcirDjrrzSSHnjm1FO/V2
	Sy/p39F4zRxaqDgMICWYPA4F4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnek0ZN75qDS1mCQ--.60794S2;
	Thu, 01 Oct 2026 18:34:01 +0800 (CST)
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
Subject: [PATCH] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Thu,  1 Oct 2026 18:33:59 +0800
Message-Id: <20261001103359.20216-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: PygvCgCnek0ZN75qDS1mCQ--.60794S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw13Aw4xuF4kurWfCFy3urg_yoW5ZF1kpF
	WrWa4UGr4DKFnrWrZrua18Zw1rJwsYyayj9FyfZryF93W5ZrW2va45K345KF1UAF4rX3WY
	qrs3XFykC3W5taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiL0UUUUUU=
X-Originating-IP: [240e:390:6a3:2fd0:1078:fc47:80b1:d61]
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwRoexGq+Nxoe5QAA3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_113444_366161_8BCB5A97 
X-CRM114-Status: GOOD (  16.59  )
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
chip->chipsize against 128 MiB. The decision thus always saw the
overridden size. The above commit moved the decision to
nand_scan_ident(), which encodes it once into NAND_ROW_ADDR_3 at
scan time -- before nandsim applies the override -- and the
overridesize path was never taught to re-evaluate the flag. The
commit that introduced the regression is:

    https://git.kernel.org/torvalds/c/14157f861437ebe2d624b0a845b91bbdf8ca9a2d

Re-evaluate NAND_ROW_ADDR_3 right after overriding chip_shift, using
the same test as nand_scan_ident(), so that the address width emitted
by the core always matches ns->geom.pgaddrbytes, which ns_init()
derives from the overridden total size.

Fixes: 14157f861437 ("mtd: nand: introduce NAND_ROW_ADDR_3 flag")
Signed-off-by: wang wei <a929244872@163.com>
---
 drivers/mtd/nand/raw/nandsim.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe96803..176db89 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2359,6 +2359,18 @@ static int __init ns_init_module(void)
 		targetsize = nanddev_target_size(&chip->base);
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;
+
+		/*
+		 * NAND_ROW_ADDR_3 was set by nand_scan_ident() from the
+		 * geometry decoded out of the ID bytes, which the size
+		 * override has just made stale. Re-evaluate it against
+		 * the new geometry, otherwise the core emits one more (or
+		 * one less) row address byte than the simulator expects.
+		 */
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
