Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36FEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2VBhxRFZqfQnzo0OLB9zCgnY7p9f/kQqOCVMpCjSrs=; b=L+XJ9vyKviO1mo
	ZkpF2PmpXfznIy6wZRPBrYTdrbdZHYb1vJEDoDeyWG7GCoTCvyaLFejF/BQXkNwEaLJD9vTcTuy5T
	o2s875ylBpiKXYm0umRvp+h8nLP61a2d0f4ljsmPiJpECJ8ZnytoKX1g7hlC2u9S9fkRrGBQRn3Bg
	unBj62d/Ny2BiOpOHSjeS0dnbkBR4BFjR5yUBAe0LguVwNHD9OizoFHu7uNKPkvO5IByiDRQcEdSL
	udcbwA4d7+jBWw2VYwSCiwentvOO8mffR63ARXE7YrVhCuEOzJ9ST3QLZtJCUoelCTxr07km9fYy5
	LOtbbzgRVvD/9qapZU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njxhx-004uqm-3s; Thu, 28 Apr 2022 06:32:57 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njxhu-004upc-Kn
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2022 06:32:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S6Wdqn115702;
 Thu, 28 Apr 2022 01:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651127559;
 bh=AuCn46SOHizXCif9euMaGC+fc3ayXPHXv/N04x/Z+Lg=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=hOAufCDdTKPVxcbQVRLW3ejTQaZTPsrKUNLeOUGgmxstevT/karR5A4Re31oiJvW+
 RWUn36VBBjPJFcamRkqAQYMHgarPBcmgz0svSXW6TN0cCXBL2JL9LH+ZskzF6HLoZB
 ClKyeFtSQeOVm4b4oasc0i9QBS1Xt2OamzFW8Rxg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S6WdPo049938
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Apr 2022 01:32:39 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 01:32:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 01:32:39 -0500
Received: from [172.24.145.176] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S6Wa6s010886;
 Thu, 28 Apr 2022 01:32:37 -0500
Message-ID: <b1f196f2-04ec-fa3c-557f-85ec9e6472f3@ti.com>
Date: Thu, 28 Apr 2022 12:02:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>
CC: Tokunori Ikegami <ikegami.t@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <stable@vger.kernel.org>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
 <6b09d10e-2098-9fb7-be4c-ae67d802cd2d@leemhuis.info>
 <20220411094047.06556ee1@xps13> <20220427113709.01f460c8@xps13>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20220427113709.01f460c8@xps13>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_233254_813579_AE9157CB 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 27/04/22 15:07, Miquel Raynal wrote:
> Hi Vignesh,
> 
> miquel.raynal@bootlin.com wrote on Mon, 11 Apr 2022 09:40:47 +0200:
> 
>> Hello,
>>
>> regressions@leemhuis.info wrote on Sun, 10 Apr 2022 10:51:17 +0200:
>>
>>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>>> to make this easily accessible to everyone.
>>>
>>> Miquel, Richard, Vignesh: what's up here? This patchset fixes a
>>> regression. It's quite old, so it's not that urgent, but it looked like
>>> nothing happened for two and a half week now. Or was progress made
>>> somewhere?  
>>
>> Vignesh, I'm waiting for your review/ack ;)
> 

Sorry for the delay, I was able to test this series and to see no
regression on CFI an HyperFlashes that I have access to

I think series is in good shape now.

So

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>


[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
