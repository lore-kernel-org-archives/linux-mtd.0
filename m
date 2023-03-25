Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC57DC6FD1C
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Mar 2023 01:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQij6yRY5SV/0jLLyQE9a8HK6EXs4ZXfFeojP08+0E8=; b=T/vune9OD8WEACG3A7Aqdg8tRe
	k20a13jwy4U8cG0jtEMeSil79JYbJB4iJsZDDz0SDszGXuszX3MH8miJqpcuTx4u6iNTUGK0pq5uO
	iWWauEb9TeOIUlSq1mLg9X9K4ZuO6wSuwuiWAOPa2mAb85/VuMlB00XO0ktZynnm7+ZF5IwgiVKkX
	CdnmaVyyx2F7C2rwnPkleqRRJ2bCh0gz4UkAiS3I2+RCHwWoFP9ltx5nyYN10oVs224XohgYYYVr1
	7DQFurVI9FBVVkx4LhB2LhNuJA5GyJSpu/iE1n2PtUYiaHG4Nvi28UMkdSl/io5HJAYZaeZ/Jjoeu
	19CMEdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfsJe-005uaz-2P;
	Sat, 25 Mar 2023 01:03:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfsJb-005uaQ-1q
	for linux-mtd@lists.infradead.org;
	Sat, 25 Mar 2023 01:03:29 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Pk15026PVzrX4f;
	Sat, 25 Mar 2023 09:02:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 09:02:41 +0800
Subject: Re: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size
To: Nicolas Schichan <nschichan@freebox.fr>
CC: <george.kennedy@oracle.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <s.hauer@pengutronix.de>, <yi.zhang@huawei.com>
References: <20230306013308.3884777-1-chengzhihao1@huawei.com>
 <20230324161923.1456371-1-nschichan@freebox.fr>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2c2c2ce9-795b-4f76-cde9-db4a4066dcc1@huawei.com>
Date: Sat, 25 Mar 2023 09:02:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230324161923.1456371-1-nschichan@freebox.fr>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_180327_800618_7E8A97BA 
X-CRM114-Status: GOOD (  10.54  )
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

Hi,
> 
>> Following process will make ubi attaching failed since commit
>> 1b42b1a36fc946 ("ubi: ensure that VID header offset ... size"):
>>
>> ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB
>> modprobe nandsim id_bytes=$ID
>> flash_eraseall /dev/mtd0
>> modprobe ubi mtd="0,2048"  # set vid_hdr offset as 2048 (one page)
>> (dmesg):
>>    ubi0 error: ubi_attach_mtd_dev [ubi]: VID header offset 2048 too large.
>>    UBI error: cannot attach mtd0
>>    UBI error: cannot initialize UBI, error -22
>>
>> Rework original solution, the key point is making sure
>> 'vid_hdr_shift + UBI_VID_HDR_SIZE < ubi->vid_hdr_alsize',
>> so we should check vid_hdr_shift rather not vid_hdr_offset.
>> Then, ubi still support (sub)page aligined VID header offset.
>>
>> Fixes: 1b42b1a36fc946 ("ubi: ensure that VID header offset ... size")
>> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
>> ---
>>   v2->v3: Use printing format '%zu' for UBI_VID_HDR_SIZE.
>>   drivers/mtd/ubi/build.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> [...]
> 
> Hello,
> 
> Having had the problem, and found this patch as a fix, feel free to
> add my:
> 

Thanks for testing.

> Tested-by: Nicolas Schichan <nschichan@freebox.fr>
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
