Return-Path: <SRS0=pV2g=VP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE27C76195
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 12:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DDDA21019
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 12:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pvmedts8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DDDA21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UlHpfceIn7oO8YxRdVSCapHkStuhsYIE/Doi6hLa68U=; b=Pvmedts8JpeqtD
	rvDP1u2S/ClmyDnaHlJ7rh6g/pPtDsMeqDBZT4dG8WPwcY2VqIjga1Eu5+vuTDRkC6UqATYvXT9sc
	R6fJ8Yzx6Kid4nvUBn1Auc30t28Ye0MuqEj38vtO8rxtD/bkgt1srH39A7PCHTthlRTeOom8/qln7
	SgxeSbT89WWamVMVbDtmPmrEbzJiLlBs0kAgWDdXspIftMY1R/3ggNag4RMJCYfKzV5ETXuTY3Kgv
	Ku+MZzjNRC1zKfgvxZAsn1J0tRtXCL83uiyCeMsWeO9qX8IJZmerZ1Z8IoRx4LEGkDwUiQvzfI0zw
	6GdTU6Y6pVE1oWzHwvcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ho59B-0006oQ-Ig; Thu, 18 Jul 2019 12:04:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho58s-0006PM-0H; Thu, 18 Jul 2019 12:04:11 +0000
X-UUID: 2f930c8223874ea796a9503796136922-20190718
X-UUID: 2f930c8223874ea796a9503796136922-20190718
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2007695564; Thu, 18 Jul 2019 04:04:03 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 18 Jul 2019 05:04:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 18 Jul 2019 20:04:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 18 Jul 2019 20:04:00 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <dedekind1@gmail.com>, 
 <adrian.hunter@intel.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1] ubifs: support page statistics in vmstat
Date: Thu, 18 Jul 2019 20:03:57 +0800
Message-ID: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_050410_051975_A4BBBE1E 
X-CRM114-Status: UNSURE (   6.36  )
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
Cc: linger.lee@mediatek.com, chienwei.chang@mediatek.com,
 kuohong.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently PGPGIN and PGPGOUT statistics in vmstat is only
hooked in submit_bio() for block device I/O path.

This patch adds this feature for ubifs as well.

Change-Id: I8505bd2a7aa9eadc6abcd68b7d8b870752e71339
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 fs/ubifs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 512e7d9c60cd..ffe7ce77f389 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -902,6 +902,8 @@ static int ubifs_bulk_read(struct page *page)
 
 static int ubifs_readpage(struct file *file, struct page *page)
 {
+	count_vm_events(PGPGIN, PAGE_CACHE_SIZE >> 9);
+
 	if (ubifs_bulk_read(page))
 		return 0;
 	do_readpage(page);
@@ -1032,6 +1034,8 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 		goto out_unlock;
 	}
 
+	count_vm_events(PGPGOUT, PAGE_CACHE_SIZE >> 9);
+
 	spin_lock(&ui->ui_lock);
 	synced_i_size = ui->synced_i_size;
 	spin_unlock(&ui->ui_lock);
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
