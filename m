Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD6FC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY3Co4zG5gL4IFY5zGQcohEtCuQjiIEJyRhuGMYbVEo=; b=hAE0CWoaGtalHqe/KAH9TBh7ha
	0PrZ+oRlkT+31dJMli0kaoXlqlcRsZ7WPHGPfO2Moz3a/CwQGkRk/uvX5GFUJreNyjFlpIKLdbe6j
	5wuJSWnOpbySeYfg3xAML0e7El35AstXiMEm1Ka7vRTZeGDOy7oqZSeOiYHBZ9USt75mObpzzGOZD
	m1yj87+v6QVqngyYJ2g+HxMBINWOvmZc6/R6mfJG0pxZgLCHqFlK+TinhOh81AxeyrsMevlJqI9ZR
	ftj9Gf0ORG8eRkEoomWyAMHOdxplv9C2/FUKr0FSTi/bXX5Zv65nTKEFs5mKVq3ynPdxSwuIiGKRK
	FK4Eus2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouUro-00Gp0u-WA; Mon, 14 Nov 2022 08:30:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouUrl-00Goyz-OP
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 08:30:55 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N9j8m61k3zqSS1;
	Mon, 14 Nov 2022 16:27:04 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 16:30:49 +0800
Received: from [10.67.109.54] (10.67.109.54) by kwepemm600005.china.huawei.com
 (7.193.23.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 14 Nov
 2022 16:30:49 +0800
Subject: Re: [PATCH] mtd: lpddr2_nvm: i2c: mux: reg: Fix possible
 null-ptr-deref
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221114020141.28138-1-tanghui20@huawei.com>
 <20221114090408.7ed0e7c1@xps-13>
CC: <richard@nod.at>, <vigneshr@ti.com>, <u.kleine-koenig@pengutronix.de>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>
From: Hui Tang <tanghui20@huawei.com>
Message-ID: <61283ee9-5737-e707-d0c6-5d13ea80723d@huawei.com>
Date: Mon, 14 Nov 2022 16:30:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20221114090408.7ed0e7c1@xps-13>
X-Originating-IP: [10.67.109.54]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_003054_016325_7B99EA36 
X-CRM114-Status: GOOD (  10.78  )
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



On 2022/11/14 16:04, Miquel Raynal wrote:
> Hi Hui,
>
> tanghui20@huawei.com wrote on Mon, 14 Nov 2022 10:01:41 +0800:
>
>> It will cause null-ptr-deref when resource_size(add_range) invoked,
>> if platform_get_resource() returns NULL.
>>
>> Fixes: 96ba9dd65788 ("mtd: lpddr: add driver for LPDDR2-NVM PCM memories")
>> Signed-off-by: Hui Tang <tanghui20@huawei.com>
>> ---
>>  drivers/mtd/lpddr/lpddr2_nvm.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
>> index 367e2d906de0..cf8e86eb4b2c 100644
>> --- a/drivers/mtd/lpddr/lpddr2_nvm.c
>> +++ b/drivers/mtd/lpddr/lpddr2_nvm.c
>> @@ -433,6 +433,8 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
>>
>>  	/* lpddr2_nvm address range */
>>  	add_range = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (IS_ERR(add_range))
>
> platform_get_resource() just returns NULL upon error.

Thanks

>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
