Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B08C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA9F2080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgnkn3fp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="Yi4BCTHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA9F2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=epdGrCyYBTaJryVEOvdtlTjgKvrWh5FqhdFlxypt7Nw=; b=mgnkn3fpGUg+6BEqGFoFWKMuSZ
	/GxCEZo1W2+KuAEoSwk6vvHRu7bahjXvEmv2eEUvSLrUJpeBXbfCm39g2zEhmApaH3dmUlaaEd/Uw
	nerqbS71V0xpMsKzSM04xHVm+/tCk98yEqjkOyf83ubsRmBZxX4WxfPJLQituNsHWnAHuRWRY/aWm
	hv3KoZc1Tl+9ZVo+z6201Tl4nGo7epCCh+OA4sXXGEVceSs/MVwn2TnC8HV4LF6LcLnkvkiMVJwgt
	RAOUVEMpZLsfUvIFI3iUFu01VLf2zf3pWof0bS7VYqsVGHA0OfuKUoEc+ajdwu/OgCnQKinzlIF77
	D7DiO+7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1PX-0006xX-Li; Tue, 05 Feb 2019 14:09:15 +0000
Received: from nh504-vm8.bullet.mail.kks.yahoo.co.jp ([183.79.57.94])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PH-0006lT-Hu
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:04 +0000
Received: from [183.79.100.140] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:08:56 -0000
Received: from [183.79.100.132] by t503.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:56 -0000
Received: from [127.0.0.1] by omp501.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:56 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 272255.26081.bm@omp501.mail.kks.yahoo.co.jp
Received: (qmail 45678 invoked by alias); 5 Feb 2019 14:08:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375736; bh=OMzmzjRyhNSx4e1SMYN9bU+iKwCwFlw5Y93urL6nTbU=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Yi4BCTHCNMXwJ1MPICQ5mkan5FJlL5tnQtQR9F9EyvhlcgDQ1RoX9XjfRC08Ai8/sKogWuK9OCsbjAV8d27kowjXREbCVFYAylzomYpyUJSKTTvN9ZEbGAdGwAbPcDSyYADwH2hcSp5uPRbgA5Klx9CCTy/m8D5YL0VX2fWB48g=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=KS2KRSoFofsCnNjG7RGrOdd4f1NcC79IifDqpckVa1aKqsCLoSLTty874XiPIJEkbb9GqMmeAnnYQTKu5PU3iSOzhs11BCGSkNa7/+QJm+7EKOfmO/gvVcbF3lzjGvcykjY5febwQbGBvF6EmEroTCN6CoGCRpIZ9D9UWiOOk18=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:56 -0000
X-YMail-JAS: l80whe8VM1l4m9r5qx5kCZeD5W0fSKcGfG.dhbJvYEoxx5M5TDjy4PTZzYuuQ36PQGa9pDAUgD.LPw3OBcFelInD37GOK_LPQHGGsIMLHCy2iFV5oyKqty4wbDLg3GtMcRmKSARMYw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: XgolY8gVM1lg2EZc2fxSjCZ5pEufKyrRethWaY.iTm3_TkR
 00QBKudsnM27dU_2r6dC4whdvFRNvGF5RjL5rMreAu3dMoN8j_m7mXnLfgcC
 a_YhvPJAKAUgFcnNmypDsKfhI_g2bjJImj0zh8kxBjDCmJbFAJAJ6_XYDFtm
 .5PkBy9dRssZuuOiKDCMnRxccIs__ExVbErOCc7VqKsn_Rf4je_Up.N8IaWm
 at1BlBdcw8ppjJsRzoOCH76O9OE0Th5Q9ICZhy8J2PvXY4GNqi5PSf.mWKn6
 hynqtkne8PmaI9SwzqYAru8GPyHmmrAp2mMfQKSzVzuBO2255sE_.fH0DQEb
 rIUXV1lnYx2CD5ktV9Niimevkik6syaJCp7up3wXgXDrf_pJrdsdTd5vw.RX
 QXk08AAi2cnD2Tt1Cuq3DagRd9lJbtf3acv9B4CVG6iiPBO0oU9m2ve8CaUO
 OtJWrYw8VANExHHsVWFH.yOZSt7zqOp.G6aWA_SqSl09DUIXMKS4IDTIDyRC
 JFyfylcibZ9_7i2aWIZkbfjTtHbZezWMNayLyInZq2G0UEYmoduoUENaeXDn
 ME4VR7.SH8q6GJve_Ni5euDblKa6bZsn4fwVFAruIyam.KPvI
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 04/11] mtd: cfi_cmdset_0002: Call xip_enable() once only in
 do_write_buffer().
Date: Tue,  5 Feb 2019 23:07:52 +0900
Message-Id: <20190205140759.2360-5-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060859_954991_8F44A237 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

By the removed goto statement it can be called xip_enable() once.
Also for a maintainability refactor it to call the function only once.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Split from the patch v1 3/3.

 drivers/mtd/chips/cfi_cmdset_0002.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1aacf22..92d3e82 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1878,10 +1878,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (chip_good(map, adr, datum)) {
-			xip_enable(map, chip, adr);
+		if (chip_good(map, adr, datum))
 			break;
-		}
 
 		if (time_after(jiffies, timeo)) {
 			ret = -EIO;
@@ -1907,13 +1905,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				 cfi->device_type, NULL);
 		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		xip_enable(map, chip, adr);
 		/* FIXME - should have reset delay before continuing */
 
 		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
 		       __func__, adr);
 	}
 
+	xip_enable(map, chip, adr);
+
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
