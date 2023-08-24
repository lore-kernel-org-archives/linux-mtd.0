Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEF0C3DA6F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AAlUQPWBpkUnlSi0WP/uwEIDpYYuVEYSaujic5u59Wo=; b=P0tviNmCRdtO1O
	Kzg18fbNm1B5kXgAGY34TA+lEPlWULt2wtj2Ei4a82ez4hHD24wrqaJyS0OKqEb62y90nfcikHSSd
	XbHIgbNZ3H3GSwGnmOnD1Hz5qKDllMVaSvFgQ6laqOV+VCAxNwc4dM3Tzt2Z3n1LmhFtnrEmFTC8Q
	6GmxPbhCx0x4cW6OOjAxpPKUq7IE+etHLGmk5WYz0kxn/1UP7+QEz6sb0AOU/3io0D07o2zv7l5yx
	/IF1tod7FSWvepjvXyjV527/0FrnHOseQit94SAu5IGIjsomFRs8Eg1Awps9K00/lKJzbtiT2WwbC
	D99wpk2KS/vVO6+pofYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ9yt-0036hZ-2O;
	Thu, 24 Aug 2023 13:02:35 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ9yo-0036gA-36
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 13:02:33 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1692882135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=764+ADku53uG0TLoltnzcYABy0UaWHYVfSfFwTud+/k=;
	b=K4PAty6uB5JqX2OPUUwZl9E0C3aZr9HVyufF6LyeFuD96xOQZiaLEkN2cDYUmF2DTNWwEs
	CLAvbhsVtfKJe5fEKpHQYdHkgZvCwkVRO+Zwcf3pZ5h6BwqDW3DcqqUyuTvEUNgdKKi1ZE
	YZxXtVD1xhMekzxyWD7+MXFAcXS1Srs=
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tom Rix <trix@redhat.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: lpddr_cmds: Added literal suffix
Date: Thu, 24 Aug 2023 16:02:15 +0300
Message-Id: <20230824130215.10396-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_060231_883042_0BD18644 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

The value of an arithmetic expression
1 << lpddr->qinfo->DevSizeShift is subject to overflow
due to a failure to cast operands to a larger data
type before performing arithmetic

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 3c3939bc2dad..14e36ae71958 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -61,7 +61,7 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 		mtd->_point = lpddr_point;
 		mtd->_unpoint = lpddr_unpoint;
 	}
-	mtd->size = 1 << lpddr->qinfo->DevSizeShift;
+	mtd->size = 1ULL << lpddr->qinfo->DevSizeShift;
 	mtd->erasesize = 1 << lpddr->qinfo->UniformBlockSizeShift;
 	mtd->writesize = 1 << lpddr->qinfo->BufSizeShift;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
