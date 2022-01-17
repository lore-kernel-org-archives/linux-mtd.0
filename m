Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC14C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 02:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuO5PFcTFK52qsiLssBV6n2dp+Q+TMsf8Xi2nuEjMJQ=; b=o9FA0eu7VkvdlIbFWRwbgP0vep
	jlSx5nOrCaDO0NWmnAhQVZinHJkFMlnDy18v45RkViv0eBGRyhLfbUcrLbdXx+np5+qJ9ZAQHHN6F
	KXsPlp8xZ9QZbLZUL07cTd/YDWjBMq6WvdUlMdpJdiUle7p3nJNGRJlSC+RFuCJhWJ3nDMgCVpZC5
	2a/Sdn6MCqXN8joSyWyLSOZlIrbvkkjCOXiqZJH+Tb40+JLfaVzNFmyL68V5qqt1u4cto6lGjOwrP
	lDa/NXf6nNCho6RSOwy2AqqFnGbaQI7exkMZ43YS6rYv5YbNUrReazJCmi9v0dOMy7ajgY3klM0O0
	CyGQg3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9I8Z-00DIC8-By; Mon, 17 Jan 2022 02:52:51 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9I8V-00DIB4-U3
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 02:52:49 +0000
Received: from kwepemi100002.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Jcbvc3twnz1FCgc;
 Mon, 17 Jan 2022 10:49:00 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100002.china.huawei.com (7.221.188.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 10:52:42 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 17 Jan 2022 10:52:41 +0800
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
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
 <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
 <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
 <23886736.260777.1642185939371.JavaMail.zimbra@nod.at>
 <88df000c-97a6-ff3f-a1e2-10fa4da8c604@huawei.com>
 <face6dce-d860-a7e6-fe9c-39f59cef22c5@huawei.com>
 <626252388.262848.1642240912242.JavaMail.zimbra@nod.at>
 <89fd8bab-3c12-f76d-b23f-f41ea8fc2dd7@huawei.com>
Message-ID: <e5f5093e-bddc-21d6-df96-d62654cf5b4f@huawei.com>
Date: Mon, 17 Jan 2022 10:52:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <89fd8bab-3c12-f76d-b23f-f41ea8fc2dd7@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_185248_331931_811B63E4 
X-CRM114-Status: GOOD (  12.98  )
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
>> FYI, I think I understand now our disagreement.
>> You assume that old Fastmap PEBs are *guaranteed* to be part of 
>> Fastmap's erase list.
>> That's okay and this is what Linux as of today does.
>>
>> My point is that we need to be paranoid and check carefully for old 
>> Fastmap PEBs
>> which might be *not* on the erase list.
>> I saw such issues in the wild. These were causes by old and/or buggy 
>> Fastmap
>> implementations.
>> Keep in mind that Linux is not the only system that implements UBI 
>> (and fastmap).
> Uh, that is really a point, I met UBI implemented in Vxworks ever. Now, 
> you convinced me, we should process fastmap with considering bad 
> images(caused by other implementations). Let's keep this wonky assertion 
> until a better fix.
>>
>> So let me give the whole situation another thought on how to improve it.
>> I totally agree with you that currently there is a problem with 
>> fm->used_blocks > 1.
>> I'm just careful (maybe too careful) about changing Fastmap code.
>>I reconsider the WARNON, it can recognize the bad images and fall back 
full scanning mode early. If linux kernel encounters the WARNON, it 
means something wrong with your image(caused by bad UBI implementation). 
I begin to like this strict check.
After comparing WARNON with the assertion:
   WARN_ON(count_fastmap_pebs(ai) != ubi->peb_count - ai->bad_peb_count 
- fm->used_blocks)
   ubi_assert(ubi->good_peb_count == found_pebs)
The 'found_pebs' consists of 'ai->erase', 'ai->free', 'ai->volumes' and 
'ai->fastmap'. The count_fastmap_pebs() includes 'ai->erase', 'ai->free' 
and 'ai->volumes'. This means the number of 'ai->fastmap' equals to 
'fm->used_blocks'. So, the 'ai->fastmap' adding position in my fix is right.
In a word, can you accept the point that 'WARNON' can help us recognize 
the bad fastmap images?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
