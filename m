Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F458C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoeVaBphtQ2iqP2AWhgoZaf4ekjk1z7CD7hsLPznFnc=; b=ZoBV82p9qFcfy6ycR0jhCffmcl
	modlx+Sj741+ya6Q6+Unpa7cdJJbk0i7fE+zhOJiqmcNN8ZYZGmrv2ewpoaKIz2+mPx9ORLyXMcxK
	0fuP7v11WqiThXY5FVxQTgxG3NeGnGSkikHz7ALsd3oKlSjtkJWv3Y1glkfztuYMo91p3bQO0jOu/
	wA1lGDm1YYNCYXM3ql5j6GMiR/YVYUg/B3cIaO6XVVLPhwMaveFWUVaa8+854NauXK7aIVMDzBQRJ
	x1kNA4pxRtWA9t9newtxGpqjHthCm382zc1d7/WGrSgaZHws2nMGSw8dHEPH3Ayxgrrdah4MVsf+I
	3VlSqXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FaK-00G6j2-Ji; Tue, 11 Jan 2022 11:45:04 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FaG-00G6i4-UA
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 11:45:02 +0000
Received: from kwepemi500001.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JY80W5sD9zVfjR;
 Tue, 11 Jan 2022 19:41:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500001.china.huawei.com (7.221.188.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 19:44:50 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 19:44:50 +0800
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, mcoquelin stm32 <mcoquelin.stm32@gmail.com>, "kirill
 shutemov" <kirill.shutemov@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-13-chengzhihao1@huawei.com>
 <361758697.248157.1641857025490.JavaMail.zimbra@nod.at>
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
 <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
Date: Tue, 11 Jan 2022 19:44:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_034501_170488_1E5AB0BB 
X-CRM114-Status: GOOD (  10.28  )
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
> In ubi_wl_init() there is another corner case documented:
>                          /*
>                           * The fastmap update code might not find a free PEB for
>                           * writing the fastmap anchor to and then reuses the
>                           * current fastmap anchor PEB. When this PEB gets erased
>                           * and a power cut happens before it is written again we
>                           * must make sure that the fastmap attach code doesn't
>                           * find any outdated fastmap anchors, hence we erase the
>                           * outdated fastmap anchor PEBs synchronously here.
>                           */
>                          if (aeb->vol_id == UBI_FM_SB_VOLUME_ID)
>                                  sync = true;
> 
> So ubi_wl_init() makes sure that all old fastmap anchors get erased before UBI
> starts to operate. With your change this is no longer satisfied
I seem to understand the another case. But I'm still confused that why 
outdated fastmap PEBs cannot be erased. When UBI comes to this point, it 
means UBI is attached by **full scanning mode**, scan_fast() returns two 
values:
   UBI_NO_FASTMAP: scan all pebs from pnum UBI_FM_MAX_START, ai is 
assigned with scan_ai, at last, all fastmap pebs are added into 
'ai->fastmap'
   UBI_BAD_FASTMAP: scan all pebs from pnum 0, all fastmap pebs are 
added into 'ai->fastmap'

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
