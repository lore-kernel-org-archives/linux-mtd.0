Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2621AC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 06:02:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C8064ECF
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 06:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9C8064ECF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JMxVn8VQS8XOHVY9963ZWQ2VHF7hpRVXqe9Upuz/IjA=; b=AdBV+S7r2HZtjhCWHfgmKyHh4
	O9bbeBiLZpssKNgFY0WnQOVqdTuX69nlNy9kQRhl23BdkDKQOJRFDDQYgyj2ODiuv2mHnn/gyRszC
	ZP8KsFOHwVYqLz2WgJljAyJr3H9iIypoXofYt6HpS41SkLqTlI5Xaf4rUYm4C0VWf5i5QN7J1lX5r
	uT+KaJ8AngQmGhCeu+y5WkdfL7C0Gw7hjgsLo0RuFoOQBfJhl6xRrMxNQ3oKTX9jjpXz6AOug0f53
	g3o4X+RU2PekSHQDnB89avIVPJiTreLqcqpopRh3ZLbOzaHe3xwwYfkHtAlCg37bYWmiV44a/+Zkg
	1he5rT3WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI3Vr-00D5Ae-In; Fri, 05 Mar 2021 06:00:35 +0000
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI3Vk-00D51T-BW
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 06:00:32 +0000
Received: from player794.ha.ovh.net (unknown [10.109.138.131])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6A82618DD74
 for <linux-mtd@lists.infradead.org>; Fri,  5 Mar 2021 07:00:17 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl
 [194.187.74.233]) (Authenticated sender: rafal@milecki.pl)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id 7305E1892CCB8;
 Fri,  5 Mar 2021 06:00:06 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034e6da37e-df57-45f4-80b0-8599f816782c,
 4F7D11A3904BD8E553EC742B87CBB6774FEDAA0F) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH -next] mtd: parsers: ofpart: make symbol
 'bcm4908_partitions_quirks' static
To: 'Wei Yongjun <weiyongjun1@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210304064600.3279138-1-weiyongjun1@huawei.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <99ecfde1-c176-7454-c273-df46d3620015@milecki.pl>
Date: Fri, 5 Mar 2021 07:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210304064600.3279138-1-weiyongjun1@huawei.com>
Content-Language: en-US
X-Ovh-Tracer-Id: 14478791329403997808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddthedgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepkeekgeefieeuhfdujeefgeektddujeekledvheehfeelfffhfeekjefhfeehuefhnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_060030_100495_F7638D44 
X-CRM114-Status: GOOD (  12.83  )
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

On 04.03.2021 07:46, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/mtd/parsers/ofpart_core.c:25:32: warning:
>   symbol 'bcm4908_partitions_quirks' was not declared. Should it be static?
> 
> This symbol is not used outside of ofpart_core.c, so this
> commit marks it static.
> 
> Fixes: 457da931b608 ("mtd: parsers: ofpart: support BCM4908 fixed partitions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Looks good ofc, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
