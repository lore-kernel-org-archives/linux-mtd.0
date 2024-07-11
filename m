Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70420C3DA42
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 03:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mq7tXlaPJH1PPWREfsFJI0PbijdaVSNFMJXkAjssMcU=; b=gDoNsO0nqZl/ZG
	Ix6SEcx8pABx34a5mvw4klAg2awMAAa3X5bOws2ZkO43MXJc/aiNy/3BbZnLhf1bRZNPhhsYVg5DY
	IG5+uIkxrKmxRTOPA97fRpd35UElY63nZ6cZGTm+b5fLAe6DdfbNwtlD7DBvQBxsBL5/U6cQ79BAL
	EPWAuddWdvroa4eS+OCbz6xmJ87a1T07HxmVDWTHSHIQ2gkBKJpkUzxyiHEjKOuhtv897nijY4piR
	U92TnoXxYAsTw+oLTSXy/Zl2FXm/NJjMD6ZywRO/KtohRlSQqw9SPINkdr3hUUJ5nLnDHpzUDtTur
	icl+cUsGwSJjR3XZ6t5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkF1-0000000CXs2-3MiK;
	Thu, 11 Jul 2024 03:13:07 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkEx-0000000CXrM-3Tus
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 03:13:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WKKRc3sSQzwWdn;
	Thu, 11 Jul 2024 11:08:12 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C5B0180ADF;
	Thu, 11 Jul 2024 11:12:56 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 11 Jul 2024 11:12:55 +0800
Message-ID: <099a4327-aa59-d560-8397-fc3fbd345262@huawei.com>
Date: Thu, 11 Jul 2024 11:12:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC 0/1] ubifs: inode deletion deadlock
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <chengzhihao1@huawei.com>
References: <20240711030624.266440-1-wangzhaolong1@huawei.com>
From: Wang Zhaolong <wangzhaolong1@huawei.com>
In-Reply-To: <20240711030624.266440-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_201304_076853_5260F3E6 
X-CRM114-Status: UNSURE (   6.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> Hi.
> 
> While the previous patch set [1] aimed to address the ABBA deadlock between
> inode reclaiming and deleted inode writing, I discovered that the problem
> still persists in the form of an AA deadlock after applying those changes.
> 
> The core issue is that although [1] avoids the ABBA deadlock by getting the
> xattr inodes before locking BASEHD's wbuf->io_mutex. But the inode reclaiming
> process can still get stuck waiting for the xattr inodes that have already
> been marked as I_FREEING.
> 

My bad, I need to add the link [1]

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=414540 [1]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
