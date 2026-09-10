Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C4C79FBB
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 22:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9q2qBKs+mLvRr/ei8qNCYlRWe+Mp4sEdAdpZJL+C0xE=; b=jWJOwdEkOgM+QJ
	Zk1rNydXAXLS4kOpQDSb4xMN49vCHmeH/pXkbj1yIk6R82oTG2IRB0ffu3CyifFFQZpn+Dx9csKhl
	QuxWHW4UjCTp3bbSNBUGDXd16o1L6WZasvbGOIhzNu/SUvmv8hMfFyBoirSyHlMBcq/rHBIHKpwCJ
	NjDTV0dQnQqL+d47p+fQwwlO34dqKwPe5j2u8vcpAyMY8BwTFFP9/H/1MdP1JnYNCPUAvMMNJXtjb
	LLQlN6I8WqvlcPT7GOkdIEh2PI5ZTzWFxmarBF5oQrMJHrNrDO0XAKd2wgNUeYCdczxxxjLehrgGR
	/cdg6whJwDWCwaPoejxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nV6-0000000FVAb-0De2;
	Thu, 10 Sep 2026 22:44:12 +0000
Received: from b224-5.smtp-out.eu-central-1.amazonses.com ([69.169.224.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nV3-0000000FVAE-3GrC
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 22:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hi6pntjfnmhxrdkbpi4sl3ndfqswqs3i; d=sagnik.me; t=1789080246;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nCzSdtDWzC4sEJUp51PV43H20jePBNMZ4BprgO78mu0=;
	b=VQQXG/zZ2jh93hv/YB6qM1ps3ZJl8Utz69iddAQlberDieJgU3YLCNHcqhsKaNwW
	yctuFFNjvcfuAP6kxVBmf0MoQjwnzjeX66SSXsqUfJmAXj15IS9XG/ZNKC45qTe68c5
	9tTaMgquZpb+uv+WcajITSNCeA4+qzkDaUn7/H/q61KG7oGGesWe6/qxDq9Hy0lwK13
	WTUzQSREfp1zJn8hbdKTVBoj1N6WfyDc+4hiJ3H4GGVVWkBx9rLpeMW9iUHV8Sk7rj9
	FAbkk2OcTp2rMvR//fgV+Eotx83Y24p1vPjk7e75UVoEhqBNyoXJF7a/mQFiLtil9a0
	yhX/+kP6LA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=sokbgaaqhfgd6qjht2wmdajpuuanpimv; d=amazonses.com; t=1789080246;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=nCzSdtDWzC4sEJUp51PV43H20jePBNMZ4BprgO78mu0=;
	b=NWtWuMgrVnKCLUaOLiyK3NSJ0hCKHkcjggaplhiHqJAI1evUmZHuyhcmk3sCnF1p
	43oxLFSOSzgfea0L0FVUcuRVwDD8BPFWDOpjAgGZno1RuX14WyxAOBJIF68r5C9XNlz
	Fp320qAErJ+8nlc7OVsg3DugxmjtqHDPPzgDru2A=
From: Sagnik Sasmal <sagnik@sagnik.me>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org, 
	mikhail.kshevetskiy@iopsys.eu, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: spinand: Do not update the QE bit on devices without one
Date: Thu, 10 Sep 2026 22:44:05 +0000
Message-ID: <010701a08d7e1638-79aaf1ea-cc8c-49e8-ba74-cba028aaa183-000000@eu-central-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
References: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: ::1.eu-central-1.PI0qW2sOnv0WHLkqY53RTxXQVzstwFEIoB04n7YZrig=:AmazonSES
X-SES-Outgoing: 2026.09.10-69.169.224.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154410_011452_14ACA108 
X-CRM114-Status: GOOD (  15.06  )
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

Commit be0b86c648bf ("mtd: spinand: Gather all the bus interface
steps in one single function") moved quad-enable setup into
spinand_configure_chip(). The new code only determines whether quad
mode is needed when SPINAND_HAS_QE_BIT is set, but calls
spinand_init_quad_enable() unconditionally. This clears configuration
register bit 0 on devices without a QE bit.

That bit is not universally a QE bit. On the Winbond W25N02KV it is
H-DIS, which disables the active-low HOLD function. Clearing H-DIS
enables HOLD during single and dual I/O operations. If IO3 is not kept
high, the flash can pause a command and ignore clock and data.

H-DIS is not restored by the FFh reset command, allowing the incorrect
state to survive an SoC warm reboot while the flash remains powered.

Before the refactoring, spinand_init_quad_enable() returned without
touching the configuration register on devices without
SPINAND_HAS_QE_BIT. Restore that behavior by only calling the helper
when the flag is set.

Return zero explicitly once SSDR configuration completes, as all errors
are returned immediately. This avoids returning an uninitialized value
when neither optional configuration step runs.

The regression was reproduced on a JioRouter JIDU6401 with an MT7986
SoC and a W25N02KV. With Linux 6.18.44, sysupgrade failed and the
following warm reboot hung in BL2. With this change applied, both
sysupgrade and warm reboot completed successfully.

Fixes: be0b86c648bf ("mtd: spinand: Gather all the bus interface steps in one single function")
Cc: stable@vger.kernel.org
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Assisted-by: LLM
Signed-off-by: Sagnik Sasmal <sagnik@sagnik.me>
---
Changes in v3:
- Return zero explicitly after successful SSDR configuration, avoiding an
  uninitialized return value on devices with neither SPINAND_HAS_QE_BIT
  nor a configure_chip callback, as reported by sashiko-bot.
- Compile-tested for arm64 with W=1.

Changes in v2:
- Call spinand_init_quad_enable() only inside the
  SPINAND_HAS_QE_BIT condition, as suggested by Miquel.
- Retested on a JioRouter JIDU6401; sysupgrade and the following warm
  reboot completed successfully.

 drivers/mtd/nand/spi/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 43bbe2629..95353777d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1813,11 +1813,11 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 		    spinand->ssdr_op_templates.write_cache->data.buswidth == 4 ||
 		    spinand->ssdr_op_templates.update_cache->data.buswidth == 4)
 			quad_enable = true;
-	}
 
-	ret = spinand_init_quad_enable(spinand, quad_enable);
-	if (ret)
-		return ret;
+		ret = spinand_init_quad_enable(spinand, quad_enable);
+		if (ret)
+			return ret;
+	}
 
 	if (spinand->configure_chip) {
 		ret = spinand->configure_chip(spinand, SSDR);
@@ -1825,7 +1825,7 @@ static int spinand_configure_chip(struct spinand_device *spinand)
 			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int spinand_init_flash(struct spinand_device *spinand)
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
