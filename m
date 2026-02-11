Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D42EB597A
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LMedud1/c7d18aoa00r4WN541SZgxtpvZ/W+XgEg48=; b=vaVEEFzTOzy0GD
	pcu1wibhMSlJ4Ri053wXgP2MJq3VwIAEElnq/7PZAEgxLYwPh1ZfZ1+WAM776tTkHqvzh09YW9r/K
	5yelShs0VqCwuMd02qmJLNVozTaOzI9Kpd8hN1PAjNhl9qM9v7yQoXET1efFjQZRogDLrxW1FIKa5
	v3Z3HZxLIxp1jM3gDrQxG7R9N7ycEjI5yFRHwHG26FFFLfhZqiXvZjRsEYq6tsTWabqAjRpPCVSar
	DczYRrzTeqV8Vwd2z0vVjVjDQPyezeuc40tmAfPajNgrcYKmoqNXdupUKrDxLPqeyOqCCu/uqpsxg
	NxDicVbsifEQ8H5HUY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq4qM-00000000LjT-2yNp;
	Wed, 11 Feb 2026 07:41:02 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq4qJ-00000000Lj6-1YG7
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 07:41:01 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4f9r2W734yz5B11P;
	Wed, 11 Feb 2026 15:40:51 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 61B7eeAI045696;
	Wed, 11 Feb 2026 15:40:41 +0800 (+08)
	(envelope-from fan.yu9@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 11 Feb 2026 15:40:43 +0800 (CST)
X-Zmail-TransId: 2afa698c327bc49-e12cb
X-Mailer: Zmail v1.0
Message-ID: <20260211154043158VVS6WEc8yD82HcqScmYUn@zte.com.cn>
Date: Wed, 11 Feb 2026 15:40:43 +0800 (CST)
Mime-Version: 1.0
From: <fan.yu9@zte.com.cn>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
Cc: <cui.jinpeng2@zte.com.cn>, <zhang.yue5@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <yang.tao172@zte.com.cn>, <yang.yang29@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB1YmlmczogcHJldmVudCBjb3JydXB0ZWQgZGF0YSB3cml0ZSB2aWEgZXJyb3JfcmVtb3ZlX2ZvbGlv?=
X-MAIL: mse-fl1.zte.com.cn 61B7eeAI045696
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: fan.yu9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Wed, 11 Feb 2026 15:40:52 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 698C3283.001/4f9r2W734yz5B11P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_234059_589412_0744A165 
X-CRM114-Status: UNSURE (   6.55  )
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

When a memory corruption event triggers memory_failure, ext4 releases references to the affected dirty pages,
ensuring that no corrupted data is written to disk. However, ubifs currently lacks the error_remove_folio capability
and therefore cannot release references to faulty private memory. As a result, corrupted data may eventually be
written to flash storage.

Add generic_error_remove_folio support to ubifs, preventing corrupted memory data from being persisted to flash.

Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
Cc: Shengming Hu <hu.shengming@zte.com.cn>
---
 fs/ubifs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 3dc3ca1..34445b7 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1631,6 +1631,7 @@ static int ubifs_symlink_getattr(struct mnt_idmap *idmap,
    .dirty_folio    = ubifs_dirty_folio,
    .migrate_folio  = filemap_migrate_folio,
    .release_folio  = ubifs_release_folio,
+   .error_remove_folio = generic_error_remove_folio,
 };

 const struct inode_operations ubifs_file_inode_operations = {
--
1.8.3.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
