Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7982C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 01:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMbgAGOIQ/dHNu3yuohS7hNUBPYM30qbH0phrSFoXaM=; b=FZcgb2YHSvhx9Y6c1P0DiaW38b
	s3kEcQNcwqINi4vJRkjJoKfmbCa/9UoflxPZ1Fr7/Nlrojgx3UPCzeZPtaR5vKSjK0WMM79KGDVHG
	K0GLmmjl7zOxO03XZFMn5Bba3FIjhWxcVClj8OtChDhI/rJD2iK2U12jDC9QmNYqwbVEbv5z36bJ1
	7njTO12Cvl3B3dujl6OqZ79pQ9gAbQLbrLOPYeSJ+pr+Np25Fq0P2dIiPYL2ZUzPnzprfsB6Oz8Yv
	3IQ8v+/GUWpelhdbns+idQ0y4xuIx7hiB0HYQWDuEeAk6Rx0fhJrmgM4Fb2xqaJ3qZm9PQv5GK1v+
	FO2revCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9H0b-00DCzf-Cv; Mon, 17 Jan 2022 01:40:33 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9H0Y-00DCz5-CP
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 01:40:32 +0000
Received: from kwepemi500007.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JcZJG1SYXzZdwP;
 Mon, 17 Jan 2022 09:36:46 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500007.china.huawei.com (7.221.188.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 09:40:28 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 09:40:27 +0800
Subject: Re: [PATCH v6 15/15] ubi: fastmap: Fix high cpu usage of ubi_bgt by
 making sure wl_pool not empty
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-16-chengzhihao1@huawei.com>
Message-ID: <e37980e5-962a-1223-cd46-b793a2caac6c@huawei.com>
Date: Mon, 17 Jan 2022 09:40:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20211227032246.2886878-16-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_174030_947279_134F1FF4 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi Richard,
> Fix it by:
>    1) Adding 2 PEBs reserved for fm_anchor and fm_next_anchor.
>    2) Abandoning filling wl_pool until free count belows beb_rsvd_pebs.
> Then, there are at least 2(EBA_RESERVED_PEBS + MIN_FASTMAP_RESERVED_PEBS -
> MIN_FASTMAP_TAKEN_PEBS[1]) PEBs in pool and 1(WL_RESERVED_PEBS) PEB in
> wl_pool after calling ubi_refill_pools() with all erase works done.
> 
> This modification will cause a compatibility problem with old UBI image.
> If UBI volumes take the maximun number of PEBs for one certain UBI device,
> there are no available PEBs to satisfy 2 new reserved PEBs, bad reserved
> PEBs are taken firstly, if still not enough, ENOSPC will returned from ubi
> initialization.
> 
Can you come up with a better solution that can be compatible with old 
images? In other words, can we solve this problem not by adding new 
reserved PEBs?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
