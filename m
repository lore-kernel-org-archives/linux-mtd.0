Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2ECC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jan 2022 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GBGKo3tvRR0RcCY4AG7wR+2jNbbo15Wn7NKJncMmW0=; b=k+aiixC09H5mk7aUcYsWmF5nVE
	KXT18Hc2v27h+Rgmi/LteBsUS3THhdcrNJLHbqvo4QdgZ7nhK6hRjgoePIDlKuAZqBDupmFllG/HH
	y2K+yiwJdCe9CYQCw1HDUhaStGmVT6rGJ6X7ckGKQEWjDsI5J1NDae4xF6mM9mmBrR0yRfK/wzqEi
	YgugF1qV0xrCFau6mTtzdRtfPbik9K7f5UobeoMS+yRoQtD+jNFKEZL7euh0dDSGmnduuhiVZospS
	bPoiX80aW6OIWWS2RN5tZd/UIaUogqIaOG5XZrwNGThhwMu/Xx149NutiJpKwvTvvo5l6z6Ho132S
	A0xxt4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8ehU-00ApUb-4v; Sat, 15 Jan 2022 08:46:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8ehR-00ApUH-An
 for linux-mtd@lists.infradead.org; Sat, 15 Jan 2022 08:46:15 +0000
Received: from kwepemi100005.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JbWrP07zzzZf5k;
 Sat, 15 Jan 2022 16:42:28 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100005.china.huawei.com (7.221.188.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 15 Jan 2022 16:46:09 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 15 Jan 2022 16:46:08 +0800
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, mcoquelin stm32 <mcoquelin.stm32@gmail.com>, "kirill
 shutemov" <kirill.shutemov@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
 <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
 <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
 <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
 <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
 <23886736.260777.1642185939371.JavaMail.zimbra@nod.at>
 <88df000c-97a6-ff3f-a1e2-10fa4da8c604@huawei.com>
Message-ID: <face6dce-d860-a7e6-fe9c-39f59cef22c5@huawei.com>
Date: Sat, 15 Jan 2022 16:46:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <88df000c-97a6-ff3f-a1e2-10fa4da8c604@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_004613_594446_BB6ECDA3 
X-CRM114-Status: UNSURE (   7.22  )
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

>> Yes. But if you look into ubi_wl_init() you see that fastmap anchor PEBs
>> get erases synchronously(!). The comment before the erasure explains why.
> About erasing fastmap anchor PEB synchronously, I admit curreunt UBI 
> implementation cannot satisfy it, even with my fix applied. Wait, it 
> seems that UBI has never made it sure. Old fastmap PEBs could be erased 
> asynchronously, they could be counted into 'fmh->erase_peb_count' even 
> in early UBI implementation code, so old fastmap anchor PEB will be 
> added into 'ai->erase' and be erased asynchronously in next attaching. 
In next attaching old fastmap PEBs will be processed as following:
ubi_attach_fastmap -> add_aeb(ai, &ai->erase...)
ubi_wl_init
   list_for_each_entry_safe(aeb, tmp, &ai->erase)
     erase_aeb       // erase asynchronously
       ubi->lookuptbl[e->pnum] = e
   list_for_each_entry(aeb, &ai->fastmap, u.list)
     e = ubi_find_fm_block(ubi, aeb->pnum)
     if (e) {
        ...
     } else {
       if (ubi->lookuptbl[aeb->pnum])     // old fastmap PEBs are 
assigned to 'ubi->lookuptbl'
         continue;
     }
> But, I feel it is not a problem, find_fm_anchor() can help us find out 
> the right fastmap anchor PEB according seqnum.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
