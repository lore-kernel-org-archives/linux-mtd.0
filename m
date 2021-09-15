Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC770C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 08:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6239161214
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 08:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6239161214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PjRhEWp05wxtDydWI0z6gMqppKYUV8miRO2yPX3J0wg=; b=ZhhAe7MVrK7neQKrTq+sMiBOm5
	fG65xaX/2OJvETBbNbHFedMUuaVoKICE1Z+RULFinzjvCHbiBstqF6COpu1Bi7fVlLe5/y+3eqUMh
	hmvhUN3mQn7wP4uoAfNFp4ZOdu1Luy+qSrq2Us7PvlHEk/d1VG7gU7lEnf+sqsGsNNWZ9PKO7u9tx
	l11uDXN/6/LdAr/ECIHizyF0c8XsRXXLnah0PPMPUBXqHBNK7qAYyesAfVBKVUD3rBT/31knItWU1
	i81uanfT1uRZfvwGueOolrgxFUcphQV/qIFE+o9f1Xlc86cs9c3sTA90HoCi37gVyoQje5EHtRAnm
	WjyB3QnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQQa2-008Vup-RM; Wed, 15 Sep 2021 08:47:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQQa0-008VuR-JQ
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 08:47:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2774661214;
 Wed, 15 Sep 2021 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631695664;
 bh=37HeyMHel+k/wlDZvQA9JOKb2529T3W+e5XKkmXDX1I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dGqbUPjOCF/tGXC2a/x4Tmy4N6McGkTrftspLLYg5pcCCUzTSFDB9wHiNBQyLikxp
 zJ4qheoU0Z9msh+F9O+XpzXHA5XGdlhn0g1F/mBmUgBmTY6SfVeA3BJtcArYUAZLTI
 H5z0OyDRGJAk5OyKdzGQvgfZnMiQreMM/32mYa/A5km2VPeOUiiCucgKDIpFC4EWlC
 mhJJITNokSVVdr2R6yiFBvRSY6m/4cbuWHuNITw/7BGk/oljPga6OYqmPlQk42gejD
 gnkPlfYkU14qGvj08Jr45FSn69n4XRjprS4tTPqEGQ0eBOoRhqRMdQQ+duTec1x6xU
 2N4NEv4hOlVLw==
Subject: Re: [PATCH v4 8/8] memory: gpmc-omap: "gpmc, device-width" DT property
 is optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-9-rogerq@kernel.org>
 <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <6a06f4bd-f20a-8b5a-c152-0877707670ff@kernel.org>
Date: Wed, 15 Sep 2021 11:47:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_014744_712877_9AE651E5 
X-CRM114-Status: GOOD (  13.39  )
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

Hi Krzysztof,

On 15/09/2021 10:12, Krzysztof Kozlowski wrote:
> On 14/09/2021 14:27, Roger Quadros wrote:
>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>> at one place. Default to 8-bit width if none present.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>
> 
> All the comments from v3 are still applicable because it seems you
> ignored them. Please respond to them.
> 
> It's the second patch where the reviewer's comments got lost, so it
> creates rather poor impression.

I was wondering what comments and then realized that gmail server has put
all your messages into spam folder.

I'm very sorry about that. I will address your comments ASAP.

cheers,
-roger

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
