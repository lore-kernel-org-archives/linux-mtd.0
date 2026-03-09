Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B913EA8549
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 01:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vc8MyXkf+XvsYttXdYwOCPe40SzFTAlFrftdZ1Wo0w=; b=ITJVF+A1ba+lWX
	DrOv/MnEel4JXB2scKZgkVYFPfy7cDWES9WjjE4PBtPw1JVW/Nq+BtCmq218hdmC042ReDtYgaI7q
	MOat2Uil7TmMPNySYE++gN3qYtzd3IAcf6oKUf+3LEAJNT7MHVpxmxzHo59xnK5OdcfSQPZL81Aol
	k0xr1ws0/8+b15lRmGraCsxfwjjUW3M0zWSjA+p+cbOg2EKvZmdWE88OOCTpfdeyD8BZNMDtcGny+
	AGX8rOMj5Ax7iYXDQsv6SS3ANwHAS5YU1bKUVSiabl/b6gkjB3VGJPPckoRgNxKnEEgqr/aH+2K8r
	HbBf8vbFJAPCxXGuTWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzP7w-00000006VG0-1OtH;
	Mon, 09 Mar 2026 01:09:44 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzP7r-00000006VFf-3Q0M
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 01:09:41 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fTf6z0f18z8Xs70;
	Mon, 09 Mar 2026 09:09:31 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 62919PXG013932;
	Mon, 9 Mar 2026 09:09:25 +0800 (+08)
	(envelope-from fan.yu9@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 9 Mar 2026 09:09:26 +0800 (CST)
X-Zmail-TransId: 2afa69ae1dc63e1-427e6
X-Mailer: Zmail v1.0
Message-ID: <202603090909261904qeLJ4zFnhW7fFPmKw8sV@zte.com.cn>
Date: Mon, 9 Mar 2026 09:09:26 +0800 (CST)
Mime-Version: 1.0
From: <fan.yu9@zte.com.cn>
To: <richard@nod.at>, <chengzhihao1@huawei.com>, <linmiaohe@huawei.com>,
        <nao.horiguchi@gmail.com>
Cc: <cui.jinpeng2@zte.com.cn>, <zhang.yue5@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <yang.tao172@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIFJFU0VORF0gdWJpZnM6IHByZXZlbnQgY29ycnVwdGVkIGRhdGEgd3JpdGUgdmlhIGVycm9yX3JlbW92ZV9mb2xpb8KgwqA=?=
X-MAIL: mse-fl1.zte.com.cn 62919PXG013932
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: fan.yu9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 09 Mar 2026 09:09:31 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69AE1DCB.000/4fTf6z0f18z8Xs70
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_180940_016196_C188DCF5 
X-CRM114-Status: UNSURE (   7.01  )
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
Reviewed-by: xu xin <xu.xin16@zte.com.cn>
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
