Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D864FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 01:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkdPSpmaEtcPWjZBLNU8OX3dy5lPmVWvexasDkCnYXg=; b=FaghzeeMgnSHnPWzsVbGC2x3yc
	Cuuqjiupk+XvP+nZvAKMT1/60YWdGd+P4HERo54yZfgpLmIaRjJBj9ZjPWS60kSl8wliDaKByJiSa
	RqGA7xzM+uVOKx1Y8JxgXfozw2UOoU54L2ILXFwBRir4ca0AU2ZCKEQx8DvFe8jzxOlbFRHwXltIh
	zw7ssPOkJv2kPbTBdCm5IbRa2BhJaw2aExej+Qlh243a1ck4osnbSOXYLYb18KbnKdhgZoC4rfT2Z
	9zO5Q9fRSPcRIKkZ2/jVkYuDoBoujIVEYhkMBoI0q37aQKlxQB1hsmuMDf5HfvvURSvZCu/7wCWlR
	vtvLidMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Grs-00DC4r-49; Mon, 17 Jan 2022 01:31:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Gro-00DC3l-9x
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 01:31:30 +0000
Received: from kwepemi100002.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JcZ943yHzzcbYP;
 Mon, 17 Jan 2022 09:30:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100002.china.huawei.com (7.221.188.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 09:31:15 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 09:31:14 +0800
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, mcoquelin stm32 <mcoquelin.stm32@gmail.com>, "kirill
 shutemov" <kirill.shutemov@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
 <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
 <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
 <23886736.260777.1642185939371.JavaMail.zimbra@nod.at>
 <88df000c-97a6-ff3f-a1e2-10fa4da8c604@huawei.com>
 <face6dce-d860-a7e6-fe9c-39f59cef22c5@huawei.com>
 <626252388.262848.1642240912242.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <89fd8bab-3c12-f76d-b23f-f41ea8fc2dd7@huawei.com>
Date: Mon, 17 Jan 2022 09:31:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <626252388.262848.1642240912242.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_173128_567843_104A61E6 
X-CRM114-Status: GOOD (  13.43  )
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

> FYI, I think I understand now our disagreement.
> You assume that old Fastmap PEBs are *guaranteed* to be part of Fastmap's erase list.
> That's okay and this is what Linux as of today does.
> 
> My point is that we need to be paranoid and check carefully for old Fastmap PEBs
> which might be *not* on the erase list.
> I saw such issues in the wild. These were causes by old and/or buggy Fastmap
> implementations.
> Keep in mind that Linux is not the only system that implements UBI (and fastmap).
Uh, that is really a point, I met UBI implemented in Vxworks ever. Now, 
you convinced me, we should process fastmap with considering bad 
images(caused by other implementations). Let's keep this wonky assertion 
until a better fix.
> 
> So let me give the whole situation another thought on how to improve it.
> I totally agree with you that currently there is a problem with fm->used_blocks > 1.
> I'm just careful (maybe too careful) about changing Fastmap code.
> 
> Thanks,
> //richard
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
