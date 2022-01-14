Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFB7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mkkcFB489rWxpk7Gv5y4qvQe+217hExFz5X6EkmesWs=; b=SMEs/esw1/Gfee
	YGXnMPFqYmMKZMBkTD6U2HZHB9/C/VXOJPuVnzRkF+MDH975wndwvptpicQYZ5DRT3kRpIfUu4PU9
	137uR0Zzc1hkwtd3xij1b4+n2Ux9fW+5nogci5hWQjnSlYCoV+aRSXD46emghcO/TCZr9EimIpmQX
	V8LVn0Zt7BhkQ1Cgs+oRsKsNBX2mlfTG/2emeq3ETtqEWDHwA6Zx5ebMGj0fA+kOh9P8AEv9aAJGW
	rKDAnRCJoMa4+BQit9wN5K+dnyT4q7SY2GasfxvPIv/joauXLMiI1sU5B54ugl+W9wHZwyomvZi5M
	Npmjt5mpSaDuqYw70Gvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JfA-008feL-C6; Fri, 14 Jan 2022 10:18:28 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Jeg-008fR7-0p
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 10:18:00 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JZxxj5YSZz8wP0;
 Fri, 14 Jan 2022 18:15:05 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 14 Jan
 2022 18:17:50 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH -next v3 0/2] jffs2: fix two memory leak when mount jffs2
Date: Fri, 14 Jan 2022 18:28:52 +0800
Message-ID: <20220114102854.3399585-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_021758_249958_5A10EE14 
X-CRM114-Status: UNSURE (   6.38  )
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

V1->V2:
	In jffs2_scan_medium,
	if s = kzalloc(sizeof(struct jffs2_summary), GFP_KERNEL);
	returns error, go to "out" to do clear. Null pointer dereference
	occurs when if (s->sum_list_head) is executed in "out".

V2->V3:
	Sorry for the noise, but there seems to be a more elegant way to
	fix the memory leak in jffs2_scan_medium. When memory allocation
	fails or CONFIG_JFFS2_SUMMARY is N, s is NULL.For the former case,
	add the new tag "out_buf" to avoid it.In the latter case,
	jffs2_sum_reset_collected is also an empty function and does nothing.

Baokun Li (2):
  jffs2: fix memory leak in jffs2_do_mount_fs
  jffs2: fix memory leak in jffs2_scan_medium

 fs/jffs2/build.c | 4 +++-
 fs/jffs2/scan.c  | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
