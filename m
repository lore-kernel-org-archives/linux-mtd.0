Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92D2C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 09:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7509206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 09:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWD7aJH9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="qEPcIhan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7509206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP69I90twkzZsXwm/kKrarO4sA3vZCAJ4P3wjnkEphw=; b=mWD7aJH9HhLPEM
	Q6j8qS5wY8EOs+dTELYwS9l6kNFaO2naGnNwYX4HnN2wOjvzsQn6ignGshOjL3efVkSacGgzQYcRK
	whPHW603BGr38RXUxgEhpnc3rDlMUveM9en8xVjxEU6yfb630+J9W+jGZmpG+T7mpHcDIyHbPdalG
	m7oAkItRyz8d1clKC++XRj/J/6HGakdbFxdxSshCNvOfrWNXF3PviUNORU1A9wEvfGI5W/wfviOkZ
	QjDjb7TFKLx0o+zJ+bnOrrKyRcY+b82PWlSRkv7eLv0foQmzvHUp8FtqbkcDV4UraWrtdhbbk0IiL
	hRtCE2u4b7Omw64iL0nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ9x4-0005Jy-Ka; Thu, 14 May 2020 09:14:50 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ9x1-0005Ip-0E
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 09:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1857; q=dns/txt; s=axis-central1;
 t=1589447687; x=1620983687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HMPIw2OmBeMpCYd6syFLgAS07O1MkiKoPSSia5Ie2zg=;
 b=qEPcIhanxfoT2tz75vM+1RymvJ5vqRa2MOrT4zOpC97tf2G8pD0QB+CX
 ajo88KwqIjc2e7bfENDezUxsvXULQoSYRUwrHUz0tVCGNtuh0desffuvR
 9S9fQe+P3gQmZQZFK3+9PBzYTT7hR5Sbd+3BecDVwIXYVIJPrXhvab60I
 QGyUWR0GSLO+6fizP2eI8JA+T6l+zzKl7WuCGfXHfN/VRnWGdnmlduy4I
 oFCXRgQ2Fm3HRGIH7eXtqmFG6O4ncNL0nOt0z99jP7ew0ExNo3CgfXGJQ
 hoK3aNnxneMTO2D3ap42n9I+o3WZXaM3XsZFKdQ0cG3qCvEeBU78BPIgG w==;
IronPort-SDR: oiPPwtyHsC0rTYAPfVw2wPNHgJtOFAcmXc/9i09vBazcy6tDVUqXmXrr8/rRMCYLkyZjkkhv3A
 NZR9DeveBnM7nhwsaFFnXD4K0BKjsIXC0p69j+z3COIal43SfN4oo0Mho525A+k/6sTqrm7oix
 bZrDbBC0NSCh430v7XCDOzARTrjqBenUbaQ2TwaWVrYtwQt5HkEPm0jJzTVHrzUq8rFs7Xp1KO
 0XHNpq+N5jXf7nChE4J4YqnaxygeY1h8tYTg6bvaQZxIp96qP3/GOv4k4EawQ9SwViYSVmG4I7
 q/M=
X-IronPort-AV: E=Sophos;i="5.73,390,1583190000"; 
   d="scan'208";a="8476128"
From: Rickard Andersson <rickaran@axis.com>
To: <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: rawnand: Use the ->init_data_interface() hook
Date: Thu, 14 May 2020 11:13:41 +0200
Message-ID: <20200514091342.16924-1-rickaran@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <richard@nod.at;>
References: <richard@nod.at;>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_021447_381066_C5C348C2 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: rickaran@axis.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Rickard x Andersson <rickaran@axis.com>

Check if the NAND vendor provided hook works and check that
the NAND controller can handle the timings.

Signed-off-by: Rickard x Andersson <rickaran@axis.com>
---
 drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8744f0033f78..974050a04f23 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -955,6 +955,30 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	return ret;
 }
 
+static int nand_try_init_data_interface(struct nand_chip *chip)
+{
+	int ret = chip->ops.init_data_interface(chip);
+
+	if (!ret) {
+		/*
+		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
+		 * controller supports the requested timings.
+		 */
+		ret = chip->controller->ops->setup_data_interface(chip,
+						 NAND_DATA_IFACE_CHECK_ONLY,
+						 &chip->data_interface);
+	}
+
+	if (ret) {
+		/* The provided data interface timings did not work */
+		chip->ops.init_data_interface = NULL;
+		memset(&chip->data_interface, 0,
+		       sizeof(struct nand_data_interface));
+	}
+
+	return ret;
+}
+
 /**
  * nand_choose_data_interface - find the best data interface and timings
  * @chip: The NAND chip
@@ -980,8 +1004,11 @@ static int nand_choose_data_interface(struct nand_chip *chip)
 	 * ->init_data_interface() is expected to update the entire chip's
 	 * nand_data_interface structure.
 	 */
-	if (nand_has_init_data_interface(chip))
-		return chip->ops.init_data_interface(chip);
+	if (nand_has_init_data_interface(chip)) {
+		ret = nand_try_init_data_interface(chip);
+		if (!ret)
+			return 0;
+	}
 
 	/*
 	 * First try to identify the best timings from ONFI parameters and
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
