Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F7E9E310
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uc8hLYLoZBj8qKAgX7DPDKybPsW6m3ZUqTlTi9EbCTI=; b=FKGmiS/nbYJyRG
	Q+taXVhsy18C0t05H3EvgxJrVemVMupMbf/k03nRlmFQrSADCp5hST4BJMvcp3xPXs1da9TSHNbH7
	aaoe9UNtnqICug0ZuEq0k78zviBgLwpJN6ApZqnK9Jw/xa4ut848D51I/xJUJgkKEwDIXGokuMnHl
	6u7sxGe1NIhphyT9y7zt6VdaZGoAcSItCvPPEMxvsXcR3M1r+ePLirghNgdWFIJgHkQDrzql1Soh0
	zmhL+BBoSm3d4gBS4SpsX5+fcnqfJtyU+8l/kFN+YLty3x6wtGfbW/vtT23daQmawjFtaGkZpQPP/
	iFSAhwmK3IdgkufpDK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB0I-00000000iTq-3QlD;
	Wed, 11 Feb 2026 14:15:42 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB0E-00000000iTW-1U2L
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 14:15:41 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fB0nw1DTKz5B13Y;
	Wed, 11 Feb 2026 22:15:32 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 61BEFQVq009838;
	Wed, 11 Feb 2026 22:15:26 +0800 (+08)
	(envelope-from fan.yu9@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 11 Feb 2026 22:15:29 +0800 (CST)
X-Zmail-TransId: 2af9698c8f01f01-ae3b8
X-Mailer: Zmail v1.0
Message-ID: <20260211221529715WQDbX2CWifJrBOSLR_8XF@zte.com.cn>
Date: Wed, 11 Feb 2026 22:15:29 +0800 (CST)
Mime-Version: 1.0
From: <fan.yu9@zte.com.cn>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
Cc: <cui.jinpeng2@zte.com.cn>, <zhang.yue5@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <yang.tao172@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSB1YmlmczogcHJldmVudCBjb3JydXB0ZWQgZGF0YSB3cml0ZSB2aWEgZXJyb3JfcmVtb3ZlX2ZvbGlvwqA=?=
X-MAIL: mse-fl2.zte.com.cn 61BEFQVq009838
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: fan.yu9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 11 Feb 2026 22:15:32 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 698C8F04.000/4fB0nw1DTKz5B13Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_061538_568365_59D7CBAD 
X-CRM114-Status: UNSURE (   6.64  )
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

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

When a memory corruption event triggers memory_failure, ext4 releases
references to the affected dirty pages, ensuring that no corrupted data
is written to disk.

However, ubifs currently lacks the error_remove_folio capabilityand
therefore cannot release references to faulty private memory. As a result,
corrupted data may eventually be written to flash storage.

Add generic_error_remove_folio support to ubifs,
preventing corrupted memory data from being persisted to flash.

Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes in v2:
- Some format fixes according to
https://lore.kernel.org/all/20260211173233604W9pVxv17lV3V2uYD3zCOq@zte.com.cn/

 fs/ubifs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index ca41ce8208c4..730318eb1ba8 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1635,6 +1635,7 @@ const struct address_space_operations ubifs_file_address_operations = {
 	.dirty_folio	= ubifs_dirty_folio,
 	.migrate_folio	= filemap_migrate_folio,
 	.release_folio	= ubifs_release_folio,
+	.error_remove_folio = generic_error_remove_folio,
 };

 const struct inode_operations ubifs_file_inode_operations = {
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
