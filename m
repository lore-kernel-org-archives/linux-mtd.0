Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE7C5478C
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 02:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iN2tbnfaVif7pTjrSTfvi7Yon0SikKNBCtCzAKHJfDg=; b=rviudhR4g0mf8z
	r3ErdI5+AxNnxjGuc9flh6TmlAXX4mTi/Pbwj/e52oW6bndYdXAjzF+WxcgprlUlqfh+Ntmemdewt
	nhuPVleXbv5SVoZWltyFQkTjazboTB2cRtXJAghJbxqY941FIR5ArVCR6t6OMkuLD4M+gQDMNElod
	wjTOs96gE0rtdKrW/mPykJvYJURNmLyrralbKpYBmEUDgSqOa1bvRcmbNg/Wi62k2dLl8kVAvDBfO
	igipJKNHu1YYoflwVVqcokcQpkwG4yE7JQ7VF5uY8Ej01tIG5WtWd7A/Am43l4/o0xpP5ZiBTfHte
	bwnHNw3NGR4rioNNBhRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renW4-00000003WQy-07M7;
	Tue, 27 Feb 2024 02:48:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renVi-00000003WPq-3Mep
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 02:48:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TkML204DHz1h0jW;
	Tue, 27 Feb 2024 10:45:46 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A16071A0178;
	Tue, 27 Feb 2024 10:47:59 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 27 Feb
 2024 10:47:59 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lkp@intel.com>
Subject: [PATCH -next] ubifs: add_or_start_queue: fix kernel-doc warning
Date: Tue, 27 Feb 2024 10:42:04 +0800
Message-ID: <20240227024204.1080739-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_184803_022775_376D4C81 
X-CRM114-Status: UNSURE (   8.30  )
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

Fix kernel-doc warning found when using "W=1":
  fs/ubifs/journal.c:369: warning: expecting prototype for
  wake_up_reservation(). Prototype was for add_or_start_queue() instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402261912.yAxZePRG-lkp@intel.com/
Fixes: 556c19f563b6 ("ubifs: Queue up space reservation tasks if retrying many times")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 74aee92433d7..f997a85bcdce 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -359,7 +359,7 @@ static void wake_up_reservation(struct ubifs_info *c)
 }
 
 /**
- * wake_up_reservation - add current task in queue or start queuing.
+ * add_or_start_queue - add current task in queue or start queuing.
  * @c: UBIFS file-system description object
  *
  * This function starts queuing if queuing is not started, otherwise adds
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
