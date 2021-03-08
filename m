Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06C4C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 03:26:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5313A64F29
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 03:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5313A64F29
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G67A0DOa/k003K5s0zYSzBO0+g1P3b5H4sdszWBBfy0=; b=XaiED6uNp38lYnEW1d8EBJHrH
	NKgZo9+xe3UdlFjN4KgCYGt1pSXy9jyOq7Bm64dYOfqkwxN/Cni6YwZr8CAsZItzzJyvOxM4MAIbP
	72pKDB7wE6qHVD/5OCLoTPD2xQ+2VQH4TLYXKjPrThUxzySuEJyUucNHth0kvJXKvpcUFsS5OFsBq
	jX7srfVJrF5UO0Kq2CblEL/y4uiMH5xb+bT47Fa9sPdNmL7oeP6W3J/lSGBdBsJvcRap88MnSiFbL
	oL0m/x3GmZAbFxnjFNrlrdPpcBOigM9QoL2WD+GDu6aamzkYeQyFzGTyxyiTjQYjJhYrtXOAkyHdS
	4rAnYKcAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6WH-00EoZ1-CH; Mon, 08 Mar 2021 03:25:21 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6WA-00EoW3-4I
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 03:25:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id BF7E81817F780;
 Mon,  8 Mar 2021 04:25:05 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4ZdZv8dUn829; Mon,  8 Mar 2021 04:25:05 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ygrKFSAQLVMa; Mon,  8 Mar 2021 04:25:05 +0100 (CET)
Subject: Re: MTD partition size limit
To: Alexander Bykov <kozyavk@gmail.com>, linux-mtd@lists.infradead.org
References: <CAH+riKsGjQ5wyehExguAq2tY21jqCi3MhXYg3PNRL-n5tTJUdw@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Message-ID: <c2ac0d01-9858-94c5-79f0-94b7ca4a1b05@sigma-star.at>
Date: Mon, 8 Mar 2021 04:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAH+riKsGjQ5wyehExguAq2tY21jqCi3MhXYg3PNRL-n5tTJUdw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_032515_822295_40C75A17 
X-CRM114-Status: GOOD (  11.95  )
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

On 2/26/21 4:57 PM, Alexander Bykov wrote:
> Hi.
> Do I understand correctly that If I want to use MTD/UBI/UBIFS on a raw
> NAND device I must partition it in chunks of less than 2GB each?
> I'm trying to install the latest linux kernel on an old Allwinner A10
> tablet which has 8GB NAND attached.
> 
> erase_flash works.
> 
> ubiformat fails with
> libmtd: error!: cannot seek mtd1 to offset -2147483648
> 
> ubiattach fails with error 22 (Invalid argument)
> 

This could be caused by missing large file support in your version of
mtd-utils. A patch has recently been added that enforces large file by
default. But to the best of my knowledge, there is definitely no such
limit on partition size.

Can you try with mtd-utils from the git tree?
(git://git.infradead.org/mtd-utils.git)

It should work as of commit e91700286ff531f344f4d9a1f1c96c501bfeadad

Greetings,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
