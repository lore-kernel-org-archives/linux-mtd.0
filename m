Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B73C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=toNKYj9rL051X8INNkWr2SfXnfV6F6HRVIvq8SowVTA=; b=BF6SOzAgB43Zze
	KVY3Ol3VnbzqzhuycXbbESSaBKBKClkFmcwXZmuy5uKO+5LBvLlxFWVJ2kapxZFx7mNLccq6Gz71B
	McFaQ8gPXLBlj5lJQIa6x5plSz3ijDn0Penr8wQqEfzyZyv0e3zdSKlhHdoPIpacFNN8d6bEBNCJp
	6Xz5+H+9wkgHln/VAy/j7Pc9DGBGQGvpt1uM3BA+DU1TYkWAAsLEvEgs3WbPWys0+lMSD1UokJZEH
	tG5XwrLd4KgtENg7spbFotgnwpUh+r/2OTz7xU2Cq+m/RGVYGgwrTuCF+u3nXRUFszXDWBs2X8NBY
	0MZ3/I8FMz2Oe4zABZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVj0-00000006bot-0F3K;
	Mon, 26 Aug 2024 09:09:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVix-00000006bnm-2TId
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:09:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WslDY09lnzhYS7;
	Mon, 26 Aug 2024 17:07:09 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id DDA17140258;
	Mon, 26 Aug 2024 17:09:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 17:09:11 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next 0/2] ubifs: remove unused ioctl flags and support FS_IOC_GETFSSYSFSPATH
Date: Mon, 26 Aug 2024 17:16:58 +0800
Message-ID: <20240826091700.2812779-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_020919_908783_DCD62A22 
X-CRM114-Status: UNSURE (   6.50  )
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

The GETFLAGS/SETFLAGS are unused in ubifs internal, so we can
remove them. And also adding support for FS_IOC_GETFSSYSFSPATH
just like other file systems.


Hongbo Li (2):
  ubifs: remove unused ioctl flags GETFLAGS/SETFLAGS
  ubifs: add support for FS_IOC_GETFSSYSFSPATH

 fs/ubifs/ioctl.c | 6 ------
 fs/ubifs/super.c | 2 ++
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
