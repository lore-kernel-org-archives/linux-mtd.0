Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6440BC76196
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlECNzNhfwnL2yX+FKDhFhbwlDLIJ0urRhOFLPZX0HY=; b=nAMEYtuldQ1g9n07edhsDX/Ls8
	IgDnO/wWeqw2ko82zcH293rziI71w4TaZqV4nkSweIAh1+CiTA47EPtH+T2MM1DbcYhFH/YhGNxZK
	SofHE8HfUuDVpDr9KtGPQvP9kQU929ETvZHWQZDRGIZ3Mg2dsoGsvXVo/IHOiuNwZIJd/LH4fn2+A
	kIym0/yIo+bK0vk7DHyozTY1M2Qwkthe+zZYEKkx+3+IP1GvNagZhH6rNd7d2wmHxfVEAV0dbe3Ju
	3MZzB0RzVn/x/jggU50tePpdvGmHMAil5fdjzAfb9bbmGIINNdVgRk9HwJ2CHMBWMVimmwdQwyhVf
	WMzMJqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOk4-007HK2-0a;
	Thu, 06 Apr 2023 12:29:28 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOk0-007HJM-1P
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 12:29:26 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Psggp6NZBzSkrd;
	Thu,  6 Apr 2023 20:25:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 6 Apr 2023 20:29:13 +0800
Subject: Re: [PATCH] ubifs: remove unnecessary kobject_del()
To: Yangtao Li <frank.li@vivo.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>
References: <20230405130747.66006-1-frank.li@vivo.com>
 <20230406090813.24111-1-frank.li@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ce162145-e88f-9c5f-6182-4a57e8efd586@huawei.com>
Date: Thu, 6 Apr 2023 20:29:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230406090813.24111-1-frank.li@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_052924_682756_9F464064 
X-CRM114-Status: UNSURE (   7.07  )
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

Hi,
>> I think we should still reserve the 'redundant' kobject_del(),
>> removing it won't bring any performance improvement.
> 
> Since it's redundant, why not to remove it.
> 

In my personal view, 'redundant' means removing kobject_del() is okay, 
it won't bring any bugs. But removing it won't make code more 
readability or gain any performance improvement, so it could be 
reserved. Whether to remove kobject_del() depends on UBIFS maintainer, I 
just help to check if the modification could affect the normal logic.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
