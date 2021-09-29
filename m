Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D5BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7710613A7
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 11:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7710613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjeRzaGCwSNZoflvG4iYaOeYZpKQ08oLcFRP6fL6qSI=; b=uAWKEhc1LUWXgF
	nFBH71Mrn7c6kHYXtobw+HvPandril2YzyBFbXkVcdENJGtwhEiutQH8YzD1yvAFhNX9QdVemVWEn
	X0CDrpw9D0YtkuArtezOEPSlJpsltE3Q9EICSg+E1sq/ZPqiO1x/MjyD1BwgLkyblJ7ATPMRP1Hpo
	TKEgjkyx1W6EGpWdcbtG8i067+VPG5tDoVCSoukK3pzJdX8z12ZZ7TndARh70YAjD4+/4naWCjMJ0
	PfR/mDFjAbnhb5GzvxBULpjwFCPJfyx7i+flCWTqkHnvDDtcvjPMfyhsyzF+0X3p3slFpwj+A4I+i
	K8hjZQv4e83FhXNDdcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVYAQ-00Atz0-0l; Wed, 29 Sep 2021 11:54:30 +0000
Received: from thorn.bewilderbeest.net ([2605:2700:0:5::4713:9cab])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVYAM-00AtwL-4R
 for linux-mtd@lists.infradead.org; Wed, 29 Sep 2021 11:54:27 +0000
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0769E703;
 Wed, 29 Sep 2021 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916464;
 bh=TO54FDsoCMWCMt79Pdb9/ZG9fjkHhkFEnzaM9kEuuFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRFSmCsuA73GFLA2ZHn1JHXvx/nQv0K/qCNkNKiFrd2PdnRnKilrKd5z0zpb3mwwH
 mSZgbq9RE1MUVuwlHAVYZi9Rp3ApmmZLsJOloly5AU1DJZgNyb0U4dHpnVjvDRVb5a
 8eBWHqXed0OrO6Yx+f50VYXSZriDiFVU7p46SiRU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Zev Weiss <zev@bewilderbeest.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] mtd: core: clear out unregistered devices a bit more
Date: Wed, 29 Sep 2021 04:54:04 -0700
Message-Id: <20210929115409.21254-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_045426_226019_6609B553 
X-CRM114-Status: GOOD (  10.68  )
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

This allows an MTD device that has been unregistered to be easily
re-registered later without triggering "already registered" warnings in
mtd_device_parse_register() and add_mtd_device().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/mtdcore.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c8fd7f758938..e22266f63ae9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -747,6 +747,9 @@ int del_mtd_device(struct mtd_info *mtd)
 
 		device_unregister(&mtd->dev);
 
+		/* Clear dev so mtd can be safely re-registered later if desired */
+		memset(&mtd->dev, 0, sizeof(mtd->dev));
+
 		idr_remove(&mtd_idr, mtd->index);
 		of_node_put(mtd_get_of_node(mtd));
 
@@ -1018,8 +1021,10 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
-	if (master->_reboot)
+	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
+		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
+	}
 
 	if (master->otp_user_nvmem)
 		nvmem_unregister(master->otp_user_nvmem);
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
