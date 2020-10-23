Return-Path: <SRS0=Iiny=D6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC158C55178
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2020 07:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295B120936
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2020 07:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pUpAxXIg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295B120936
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daT8GO0315/9FaIGa7AR8GGSnofeE9Mqdq4nsXaJw0Y=; b=pUpAxXIgOzFTs/Q6srr3bPwQS2
	2cFKEEgs/7F2+Tl2zxPoRbkRNt5Xv96znowtdPKbFcwMTpXue73zNaDYugz4YASUh0uCUX50HAZ5C
	6kJT39gHT+iPfHGvLNz93VVT6AnQLZLh3BuyBlPHG6QVPDs0SG1XZ9DXCAEWztap3cJ9ABoGp2QxE
	2QRLyuuk0LRp0JrvnWpjoPQ5OkNDwmskAP5vK8xWw5ct2gzuWL7VQmOEYvTPJ8629pupLZqFe6xkJ
	DD0eStz+vDsIizTs7qRXV5NJQN39ENHt+mcInvkYI0d8SGct2GjwRMQRCY95QpFBjMOQwisb0fs/T
	cUjXAqDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVrN8-0002Rg-II; Fri, 23 Oct 2020 07:20:22 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVrN2-0002PB-E8
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2020 07:20:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 38FCB976143959F2F30C;
 Fri, 23 Oct 2020 15:19:57 +0800 (CST)
Received: from [10.174.177.167] (10.174.177.167) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 23 Oct 2020 15:19:52 +0800
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20200630130438.141649-1-houtao1@huawei.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <e2a0ddaa-402f-a4e0-ed0a-74ce7d620722@huawei.com>
Date: Fri, 23 Oct 2020 15:19:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200630130438.141649-1-houtao1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.167]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_032017_934675_2812B325 
X-CRM114-Status: GOOD (  16.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

I have written two xfstest cases [1] for these fixes three months ago, could you please
check whether the proposed solution is OK ?

Regards,
Tao

[1]: https://www.spinics.net/lists/fstests/msg14383.html

On 2020/6/30 21:04, Hou Tao wrote:
> Hi,
> 
> The patch set tries to fix the race between ubifs xattr read
> operations and write operations.
> 
> Now inode_lock() is acquired during xattr write ops (set & remove),
> however no extra lock is taken in xattr read ops (list & get), and
> it leads to three problems:
> 
> (1) ubifs_listxattr() may incur memory corruption and assertion failure
> 
> (2) ubifs_xattr_get() may incur assertion failure
> 
> (3) ubifs_xattr_get() may return a stale xattr value
> 
> To fix it, instead of adding a xattr-related rwsem for ubifs inode,
> we decide to fix these problems simply and still do xattr read operation
> locklessly. The major concern is that xattr read operations (list & get)
> may return xattr names or values which is still in creation or removal
> process, but we think that's OK because no stale name or value is
> returned, just either the old ones or the new ones.
> 
> Comments are weclome.
> 
> Regards,
> Tao
> 
> Hou Tao (3):
>   ubifs: check the remaining name buffer during xattr list
>   ubifs: protect assertion of xattr value size by ui_mutex during xattr
>     get
>   ubifs: ensure only one in-memory xattr inode is created
> 
>  fs/ubifs/xattr.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
