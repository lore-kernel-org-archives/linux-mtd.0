Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311BBC3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amYMOyVN6q7YhtpEXicRynqfsDDQJYxunV3AeoTMXX0=; b=2+A6uSGLO6lNJx
	3WgiwrKvSlvsCHS5mzb7fa44pnid7QwrCl4IHU7k6jp9wWvbIwlK1T38dMF6FbmFRkcGObWRrfSWb
	ZOJoSDCmppoi949gVYPlzeWriZHK/8kuGslziNyD6PkunA0hDE7HkaXrHejkU3OxuV4NKHMytBImz
	SIv2SbcSf0YS8SE+iQv8jWjW3AefmP2BeMNOuDGfz+7Tpx5ZmbZGYFctkv6bKzFW9ubcSP6kJVSad
	qjVHKRd53zmOpL34xp8n1zbPgUBzIkI8yAkJeHbcPjzb1KrvWPv6vogLL4YEtPjcpOXSie8CbGwRc
	sS7KhVEZLHmhPD0cZjjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHfTz-00ALpM-0u;
	Mon, 25 Dec 2023 07:34:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHfTw-00ALod-0g
	for linux-mtd@lists.infradead.org;
	Mon, 25 Dec 2023 07:34:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Sz8mF60hpzsSkt;
	Mon, 25 Dec 2023 15:34:05 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E54E180078;
	Mon, 25 Dec 2023 15:34:29 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Mon, 25 Dec 2023 15:34:28 +0800
Message-ID: <2bbd0297-9a79-a27e-285e-d695cb46f34f@huawei.com>
Date: Mon, 25 Dec 2023 15:34:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/5] ubi: Use the fault injection framework to enhance
 the fault injection capability
To: Randy Dunlap <rdunlap@infradead.org>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231225071055.1721000-1-wangzhaolong1@huawei.com>
 <20231225071055.1721000-2-wangzhaolong1@huawei.com>
 <3464b187-d280-4b7f-8187-123dc51ad0c3@infradead.org>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <3464b187-d280-4b7f-8187-123dc51ad0c3@infradead.org>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_233436_436668_62475173 
X-CRM114-Status: UNSURE (   7.32  )
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


Thanks for the heads-up on the spelling errors. I'll make a
correction soon

Thanks
ZhaoLong Wang
> Hi--
> 
> On 12/24/23 23:10, ZhaoLong Wang wrote:
>> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
>> index 2ed77b7b3fcb..138fae7e8f96 100644
>> --- a/drivers/mtd/ubi/Kconfig
>> +++ b/drivers/mtd/ubi/Kconfig
>> @@ -104,4 +104,13 @@ config MTD_UBI_BLOCK
>>   
>>   	   If in doubt, say "N".
>>   
>> +config MTD_UBI_FAULT_INJECTION
>> +	bool "Fault injection capability of UBI device"
>> +	default n
>> +	depends on FAULT_INJECTION_DEBUG_FS
>> +	help
>> +	   this option enable fault-injection support for UBI devices for
> 
> 	   This option enables
> 
>> +	   testing purposes.
>> +
>> +	   If in doubt, say "N".
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
