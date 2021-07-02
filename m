Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC32FC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 09:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 810FB61183
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 09:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 810FB61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3shWoZmGekEeGTHYPG5qcJrHdhzau465KS7abDo/D18=; b=krLQUz/biKTNSN
	BP/Sdch2eBTKNiUeg7qQLkWYp3WtEHSPrHK+Pug39p/+RthWFE8U6ZfJcNlI1yDqrB2ne9IUHXDgr
	dhKswrTd/by5cnBv/wyCaWBjaT9MISaoR5nQuwMI8EBbKhLuEkw6uy8hzDgCaEQxK+oYVukxtCgyg
	R0oqZhiV5G/dA8PqAI7sJ6rs1BZLjHT1ckDc5D2PlOYwn1dy5PlMpUarHuQ3zxRmCeOxLs31cX8Fb
	DR46RcyyWtatMan1bTlQRts5X1fsLDgwxC/MJF6OGl0UeA9d8XQUfKh83TKzQuKD/7iQO6GONGBqE
	f/I6VE+O5szLQnq9OUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFdM-002fQ4-QX; Fri, 02 Jul 2021 09:38:52 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFdJ-002fP3-9g
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 09:38:50 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 54B1822249;
 Fri,  2 Jul 2021 11:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625218727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BgGFzoe/HAoDDHuJaUL6REa6//gf/BtKSwE8c/6Kq/Q=;
 b=bjoxUW9Ns8ZMyl9hbo0Z2kkkCOSIR4uAI+h1Kv2HZmm1sf2WT185CQuTeK1sGJ9AtDNlBa
 Fu/AWNLuHVzGiQdCb8ZXQDcMB3SRvN7cqTP9951iDsg+DVBW33lg9v3CZbp3uvxo1Y9o9V
 Dx4NCswCEDXTYuScDWe2bVwbLVBpKnU=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] mtd: core: handle flashes without OTP gracefully
Date: Fri,  2 Jul 2021 11:38:41 +0200
Message-Id: <20210702093841.32307-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_023849_534762_26C9A36F 
X-CRM114-Status: GOOD (  13.99  )
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

There are flash drivers which registers the OTP callbacks although the
flash doesn't support OTP regions and return -ENODATA for these
callbacks if there is no OTP. If this happens, the probe of the whole
flash will fail. Fix it by handling the ENODATA return code and skip
the OTP region nvmem setup.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/mtdcore.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b5ccd3037788..6881d1423dd6 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -880,7 +880,10 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
 	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
 		size = mtd_otp_size(mtd, true);
-		if (size < 0)
+		/* ENODATA means there is no OTP region */
+		if (size == -ENODATA)
+			size = 0;
+		else if (size < 0)
 			return size;
 
 		if (size > 0) {
@@ -896,7 +899,10 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 
 	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
 		size = mtd_otp_size(mtd, false);
-		if (size < 0) {
+		/* ENODATA means there is no OTP region */
+		if (size == -ENODATA) {
+			size = 0;
+		} else if (size < 0) {
 			err = size;
 			goto err;
 		}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
