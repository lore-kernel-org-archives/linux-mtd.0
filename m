Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E88C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:58:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E031020853
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 12:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PK9rgke7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E031020853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUBg3x+rtoIVrHUvK5H+qV9ksKe31yy2I0/OATH+PMI=; b=PK9rgke7DLKwEodnFnXPYmPO6A
	LshM0jXoUU9LekfaRp9O7e+3GB7QM4FToH4epumZv44mrZpOkWe6+OUb4+X7ysDK5K7QiOtslWh7x
	hoDS9IfwTuEv0W9QFICWDlAMFRU7S2bwpq/LfBT3cXuWKfnFJ/LmSCMqLl1cxyOvnQbYtUeWv95pc
	85YC2CL5wBeG+fZcGMPjyzkMFM2KMFDY5VSH58QcAGSE5EqnbjUWC107dkG+wzX0SZzR7OfAWo/I3
	H2b4HfSuONBe/l4GEFh0ss+SrdlH6Vqb/9Jhspd1PZVtYUPJf0bF8KKypiD/so7gPkChc0B9QABZK
	XrvIVv/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqFpl-000891-IQ; Tue, 30 Jun 2020 12:57:57 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqFpi-00087t-Hd
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 12:57:55 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D32EB321179DE5861F99;
 Tue, 30 Jun 2020 20:57:41 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 20:57:35 +0800
From: Hou Tao <houtao1@huawei.com>
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/3] fixes for ubifs xattr operations
Date: Tue, 30 Jun 2020 21:04:35 +0800
Message-ID: <20200630130438.141649-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.25.0.4.g0ad7144999
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

Hi,

The patch set tries to fix the race between ubifs xattr read
operations and write operations.

Now inode_lock() is acquired during xattr write ops (set & remove),
however no extra lock is taken in xattr read ops (list & get), and
it leads to three problems:

(1) ubifs_listxattr() may incur memory corruption and assertion failure

(2) ubifs_xattr_get() may incur assertion failure

(3) ubifs_xattr_get() may return a stale xattr value

To fix it, instead of adding a xattr-related rwsem for ubifs inode,
we decide to fix these problems simply and still do xattr read operation
locklessly. The major concern is that xattr read operations (list & get)
may return xattr names or values which is still in creation or removal
process, but we think that's OK because no stale name or value is
returned, just either the old ones or the new ones.

Comments are weclome.

Regards,
Tao

Hou Tao (3):
  ubifs: check the remaining name buffer during xattr list
  ubifs: protect assertion of xattr value size by ui_mutex during xattr
    get
  ubifs: ensure only one in-memory xattr inode is created

 fs/ubifs/xattr.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.25.0.4.g0ad7144999


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
