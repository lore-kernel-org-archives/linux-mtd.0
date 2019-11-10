Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC221C43331
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 15:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD52F20842
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 15:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bjJ+auls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD52F20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQeNRDdyBFoCzVFw1CCPrsVjtGFtpgPIjAGUr3CEds8=; b=bjJ+aulss3K6uL
	MXbnMzyh7REKreW81qcsecoM+9KgtfYLLfXhb/g0s1GgrmyLGnZrysVJ7LZrTbZsC+vT83D2z7gZJ
	fHE/vKReSQmeu6E/atGPZ1Ctc882JWNOigKAiXLPf6I8EWV8rKQU1gSzIMVDrCJ1Ykfx3Np52uHGj
	eJyXLAjOUcikSQgmFzpyLaF58KOXM4Hr8u+P8redNQ/gxV0jWGotH/2gU6m/4w21lsmOA3BYqguHo
	Z0RrnHEfGRblXF/l91AX5atxsAAMwIq6cBE3YLT0vZU6LBm37l2xp5u8dW8a722kOONpLXVy7Duwc
	fJowS005Obo1UsLR874g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTpCJ-0005ag-4K; Sun, 10 Nov 2019 15:32:15 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTpCB-0005U8-NL
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2019 15:32:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 002A318109A04;
 Sun, 10 Nov 2019 16:32:05 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2Ru61wYheJBX; Sun, 10 Nov 2019 16:32:05 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QChRCREvVjYt; Sun, 10 Nov 2019 16:32:05 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/15] mkfs.ubifs: close file descriptor in add_file error path
Date: Sun, 10 Nov 2019 16:30:45 +0100
Message-Id: <20191110153059.28878-2-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191110153059.28878-1-david.oberhollenzer@sigma-star.at>
References: <20191110153059.28878-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_073207_953965_A801C54B 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 72ae1b4..bf1290f 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1873,8 +1873,10 @@ static int add_file(const char *path_name, struct stat *st, ino_t inum,
 			dn->compr_size = 0;
 		} else {
 			ret = encrypt_data_node(fctx, block_no, dn, out_len);
-			if (ret < 0)
+			if (ret < 0) {
+				close(fd);
 				return ret;
+			}
 			out_len = ret;
 		}
 
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
