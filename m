Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79207C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:59:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4687F208DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeBitrCk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4687F208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bS0YkFfUEBneZ8flBxjyGPjopGOCHf3tMJ+xSL78pzo=; b=TeBitrCk9HIRes6gVfh98QdPs
	HmXuj1jqHGlcVxs0qLoJFyFvE2mShAXTMp6WqqG1N5/EJ3R1nRiifzsOie6MFt8zHVPqxyDD9HrrR
	OGGD10wBSrL7ahqWSMRReUf/EHkZ86UFq5rngaGbEUvGU7GQ8rlasQ8eRij0kGWGTsSR2zhH2z00B
	S7f9pjhK5Z53fITACRZ7/MwIszKxnaBpnF07gVtj/HZFa+tues+oR9wcukKFhA5dEkUPp4FC55ZnM
	rcGEfokUXmgh9cNTKwMRQbrHGjQ5ulyAwASyRGOIt177FjQNte4ppR6/4an+hscWNAI/owvlKUTLS
	XaPXBMkyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqFpm-00089C-Ks; Tue, 30 Jun 2020 12:57:59 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqFpi-00087u-H6
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 12:57:55 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D73AEEBB9A014284A02A;
 Tue, 30 Jun 2020 20:57:41 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 20:57:36 +0800
From: Hou Tao <houtao1@huawei.com>
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] ubifs: check the remaining name buffer during xattr list
Date: Tue, 30 Jun 2020 21:04:36 +0800
Message-ID: <20200630130438.141649-2-houtao1@huawei.com>
X-Mailer: git-send-email 2.25.0.4.g0ad7144999
In-Reply-To: <20200630130438.141649-1-houtao1@huawei.com>
References: <20200630130438.141649-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
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
Cc: houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When there are concurrent xattr list and xattr write operations,
it is possible xattr_names + xattr_cnt has been increased a lot
by xattr write op since its last read in the begin of ubifs_listxattr().
So ubifs_listxattr() may find these newly updated or added xattrs,
try to copy these xattr names regardless of the remaing buffer size,
and lead to the corruption of buffer and assertion failure.

Simply fixing it by checking the remaining size of name buffer
before copying the xattr name.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/ubifs/xattr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 9aefbb60074f..5591b9fa1d86 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -429,6 +429,12 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		fname_len(&nm) = le16_to_cpu(xent->nlen);
 
 		if (xattr_visible(xent->name)) {
+			if (size - written < fname_len(&nm) + 1) {
+				kfree(pxent);
+				kfree(xent);
+				return -ERANGE;
+			}
+
 			memcpy(buffer + written, fname_name(&nm), fname_len(&nm) + 1);
 			written += fname_len(&nm) + 1;
 		}
-- 
2.25.0.4.g0ad7144999


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
