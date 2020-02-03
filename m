Return-Path: <SRS0=yeSB=3X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAFCC3524D
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 08:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6932080D
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2020 08:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="heH3I5ea";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="34KtE2IG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6932080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xMv1ghuh6XanvSC5wuSH7YIiJrRzVHeWxrAnJHBnjC0=; b=heH3I5eaKm0nos
	7giyJe9o/Cttsh5zRwyQvGpbd27nDIuj9f431f9Bu0bF4k/Cg75eHqL2ba6hqmjTbBVCy7hUlkkQ7
	gYeETUYtJ0EwLv7TUULGUvpYXET93hXI4qHy09sFnceQI84W/UjHmr32XepuMAY96Qwm9gHPMyg5w
	uIxeIKgygsFDW6aw7nMSH/6p43rcQVG1T0Xo8NHYOXWlqXHsHa7W4uYE3pcdiOmZ1dyBuXmPXS6zn
	8KNWOXr6itK3tHOgr1MW/mg/a6fVWCVqv4tGs+JtwtKuDMASRXXfJsU+U0OQu/aHFTRf1M8eG8XCP
	LGwx9lzR64utgaIy8dCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyWio-0006X2-1J; Mon, 03 Feb 2020 08:04:42 +0000
Received: from de-deferred1.bosch-org.com ([139.15.180.216])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyWik-0006Wa-NB
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2020 08:04:41 +0000
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
 by si0vms0224.rbdmz01.com (Postfix) with ESMTPS id 48B0XT0RPPz3bR
 for <linux-mtd@lists.infradead.org>; Mon,  3 Feb 2020 08:56:57 +0100 (CET)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 48B0Vw6Jjgz4f3lwJ;
 Mon,  3 Feb 2020 08:55:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key2-intmail; t=1580716536;
 bh=dR0OCFMQPsXNo97crEg1yUxuzoykpIY59HiIsBMOCy4=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=34KtE2IGF1spPxsgi1h5fDlTAR30aMyZD+YkG7hfKnOROXA9HjGxn9lhDuJD8q3dU
 dd8szEDZqynvrQWNvQhi1sp23Yf70TfBpkqSgWk/IbGfzV2O8PsL/vvRCCZ+/MNZ7O
 dOffVQuBMS2o8jP2y3IZr+VwxMk+36BKDF5uvfUc=
Received: from si0vm02576.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 48B0Vw5y9sz2n6;
 Mon,  3 Feb 2020 08:55:36 +0100 (CET)
X-AuditID: 0a3aad0d-f41ff700000047b3-ef-5e37d1f80c55
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm02576.rbesz01.com (SMG Outbound) with SMTP id 58.11.18355.8F1D73E5;
 Mon,  3 Feb 2020 08:55:36 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 48B0Vw4BBJzC9s;
 Mon,  3 Feb 2020 08:55:36 +0100 (CET)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1847.3; Mon, 3 Feb 2020 08:55:36 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <sergei.shtylyov@cogentembedded.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: hyperbus: Add proper error message for missing compatible
Date: Mon, 3 Feb 2020 08:55:31 +0100
Message-ID: <20200203075531.3739-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SW0wTaRzF+WYqMzSODgOW/1bwMjHxEgVEawlsvOCDJJqoD/pgpDjIQBta
 IDNFlE3XrqzGsmhQQKWWSgghQVS0KKJEit2NchFFNO4KUTSAQSReIF5hZdsO2D7sy5eTc77f
 dzInQ+JMJaEkdZlGXsjk9GygXCaPuxix4stDtSba+fuS2KZD1UTsvfM9ROxk53tiPZ74onQS
 S6yvOph495/r2DZ8l/znVF6v28cLUWv3yLUD34Oy84n9NZcyzGh8RgEKIoFeDddc/XgBkpMM
 fQaDiSNvCU/A0E0IbHZeCuoQ9E90e4NAehncKDrq1aG0Bh711Hg1TkdA9cCIV4fQW6G8txLz
 aBm9CBzNH7w+RcfDWecdQmqeD6dqCzDJD4a2sgGZ9M58yL92Fpc0wO2hIVy6vxAuWG/MKEKz
 rX6I1Q+x+iEVCD+PFKIuep8hOkalXhMppPBiXvTKyL1ZBgeShqQa0f1PaS6EkciFVCTGzqGc
 LWs0zKyUrNQDWk7UJgs5el5kldTBEUsSE/LDFnNSDDpR1GVluhCQOBtK/Rqn0jBUKncgjxey
 JMyF5pIyNoxKJ7fuZuh0zshn8Hw2L0yn8STJAhX+QK1hggU+nd+fptMbp2M2gkIBAQGMwj/x
 r8XIIBdaRc50dz/zPEGJ2ZxB1KVP4T9JODPt+tB2pFaGUVFdbob2pNqczB+tynCqb7d7gDl+
 gY8cRn2IRGwIFe+BZ7r/Sl8fUGbPRMFTpg+KqXUztAOH4hI92Bs/Iui+aSXAefuJAr5UjYbB
 x64rAK2jjgiYPFSzEOwNk8thsLBFBWXmCTUUHuvYAPYnPRugcaB7GzR9ur8dLDffJYHFUaGB
 5+aiZOhr6MyAofFyA9jelwpQP2oRofjflhxwOG/lQt/TOya4fP3qbwjeVR8+huDMn99OICir
 MJ9EcLy9qxTByB9f3WfhYJ0dDbsnxdyTUjtXeyY1csb/mXTK9X2j0oz0j1cFviFml29OqN+i
 YMfSarY/jpM13ysOtZ38ajvd+rL3YmtupGMwKvnz6+Z5ts+/2ExLk3aOx47BYVPVsw4TlqCs
 Hht8dXrHN9Pzdec2bsptqaus7c9THWnk8ivw8ZdHy5IaljxQrOj/fsLpWCzvTPmrTU/iu4Yr
 H5VYwj8s+LuDlYlabuUyXBC5/wDf5ayPNQQAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_000439_373938_BCFA27B0 
X-CRM114-Status: GOOD (  11.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: dirk.behme@de.bosch.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case the compatible "cypress,hyperflash" is not given
output a proper error message. Do it the same way as some
lines above.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/mtd/hyperbus/hyperbus-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
index 6af9ea34117d..61b0f686a6dc 100644
--- a/drivers/mtd/hyperbus/hyperbus-core.c
+++ b/drivers/mtd/hyperbus/hyperbus-core.c
@@ -73,8 +73,10 @@ int hyperbus_register_device(struct hyperbus_device *hbdev)
 
 	np = hbdev->np;
 	ctlr = hbdev->ctlr;
-	if (!of_device_is_compatible(np, "cypress,hyperflash"))
+	if (!of_device_is_compatible(np, "cypress,hyperflash")) {
+		pr_err("hyperbus: 'cypress,hyperflash' compatible missing\n");
 		return -ENODEV;
+	}
 
 	hbdev->memtype = HYPERFLASH;
 
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
