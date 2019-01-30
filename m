Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFABC282D5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 08:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5E321473
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 08:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sqF4Y3Cg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZQZ92By"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5E321473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PkV6UnEpi/72APfiBW58d9cOUE7pFmP7QwQHLD3dODY=; b=sqF4Y3CgXG/uhV
	qQirAVc07zbu+QS4tteFEZCCzz6dJpyh7dLISDQZ3FWqZGieqghDAdcjy9QanF00UxfQ3Psd9DjWp
	GHWhnFFeAWXDKTwmcsgIUDPipJda7h2KWT3nBqFoyJ25+RgLraqs5lHvZi/9zIF6VVr7xj6C3gHJd
	31Dok/53lAq+HRmS3WMfIeonju9pZvJapyuxf8/xHC+ic+HU25WMyDe0LiMq9ksxOBZvO9WG1bA6y
	C2v3mybU9r/IcbhvZzZQPJoKvwo5kPeDSN28boSoVhM/Nl0xm9hxaZng4/W3NBs5kLsCEV/VMgJEz
	/13XrY42w4kh9skw84kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1golWf-0006Oz-Rg; Wed, 30 Jan 2019 08:47:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1golWX-0006Of-NJ
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 08:47:10 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A999C21473;
 Wed, 30 Jan 2019 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548838029;
 bh=ViobS3Rrq90H2vAnWOxd0O05jt4ZtDsQ14/LPuykNR0=;
 h=From:To:Subject:Date:From;
 b=IZQZ92ByDKRqi/C8nLTaXfut2o88TIdRzbdd+xker7NR/ocVxEy5eLtlyHSunqjNb
 l7iDS23X1jtqRiclLZv3HMos0fUozzxDggj+WNKRwDH+K55i9wjjoosKUy4PkQl7QT
 A2JbJksKtqw6UP7s8Ctpjh1GfS8vf3rsIR1Vz9Sg=
From: Boris Brezillon <bbrezillon@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Remove a debug trace in mtdpart.c
Date: Wed, 30 Jan 2019 09:47:00 +0100
Message-Id: <20190130084700.6290-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_004709_773866_E1509E43 
X-CRM114-Status: GOOD (  11.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 2b6f0090a333 ("mtd: Check add_mtd_device() ret code") contained
a leftover of the debug session that led to this bug fix. Remove this
pr_info().

Fixes: 2b6f0090a333 ("mtd: Check add_mtd_device() ret code")
Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/mtdpart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 60104e1079c5..e6d9467f6be0 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -632,7 +632,6 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	mutex_unlock(&mtd_partitions_mutex);
 
 	free_partition(new);
-	pr_info("%s:%i\n", __func__, __LINE__);
 
 	return ret;
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
