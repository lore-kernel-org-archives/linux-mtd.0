Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A45C04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 16:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E83F520863
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 16:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="twzLko++"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E83F520863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VGQQPHmQ76gaBYFV4UkAk1if+HRcy8vCHBOYAGt05U=; b=twzLko++UHkLBg
	n14CyNN5X4GPHn4vmrzVfLw3Umgr1Iq800OthiQoT78403DqJuY0flo1+O1TmyBmo+lQuPNO3WxTi
	uHNCOxMYe3nAMk62qdIlXJ0S+PMf/IN34tgZ0xe6CIdOSl1TTxaoBQg1mVWNLQck2/BXVfviYGts/
	bnhc8vCCuZQsl6AV5K5q40qWmAEOg65rLosVGVyNd6/xkT0iuiB9Q1vByKpE4MV5Y4+EzHDwwRASr
	n7q7eAbkw+QKFwW2Spk6w18vjitJsogIvRVx28jOBpKjmA+mr8plxC29wrG6s+EKie8BnS01lZGw2
	Z7GxNt+oDVniYnsTISYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQa1o-0005At-20; Tue, 14 May 2019 16:11:44 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQa1g-0005A1-UL
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 16:11:39 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 58C216000B7;
 Tue, 14 May 2019 18:11:29 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 14 May
 2019 18:11:28 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 14 May 2019 18:11:28 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Thread-Topic: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Thread-Index: AQHVBypxyGCaW3KLokGl7ivY8UUpB6Zo92KAgAGv7YCAAAg0AA==
Date: Tue, 14 May 2019 16:11:28 +0000
Message-ID: <e53a0569-6eca-4385-007d-baffc3f5c7ea@kontron.de>
References: <20190510121727.29834-1-lede@allycomm.com>
 <3cb32209-f246-e562-2aee-fdf566a60b30@kontron.de>
 <1023ba21-b188-1dcc-3ecc-c563d4cb8a67@allycomm.com>
In-Reply-To: <1023ba21-b188-1dcc-3ecc-c563d4cb8a67@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <69EEC9F891FDAF4C9BBF3481A0F38A3B@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 58C216000B7.AD04F
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, lede@allycomm.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_091137_319100_1B932C1B 
X-CRM114-Status: GOOD (  18.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jeff,

On 14.05.19 17:42, Jeff Kletsky wrote:
> On 5/13/19 6:56 AM, Schrempf Frieder wrote:
> 
>> Hi Jeff,
>>
>> I just noticed I hit the wrong button and my previous reply was only
>> sent to the MTD list, so I'm resending with fixed recipients...
>>
>> On 10.05.19 14:17,lede@allycomm.com  wrote:
>>> From: Jeff Kletsky<git-commits@allycomm.com>
>>>
>>> The GigaDevice GD5F1GQ4UFxxG SPI NAND is in current production devices
>>> and, while it has the same logical layout as the E-series devices,
>>> it differs in the SPI interfacing in significant ways.
>>>
>>> To accommodate these changes, this patch also:
>>>
>>>     * Adds support for two-byte manufacturer IDs
>>>     * Adds #define-s for three-byte addressing for read ops
>>>
>>> http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/
>>>
>>> Signed-off-by: Jeff Kletsky<git-commits@allycomm.com>
>> Maybe it would be better to split this patch into three parts:
>> * Add support for two-byte device IDs
>> * Add #define-s for three-byte addressing for read ops
>> * Add support for GD5F1GQ4UFxxG
>>
>> Anyway the content looks good to me, so:
>>
>> Reviewed-by: Frieder Schrempf<frieder.schrempf@kontron.de>
>>
>> [...]
> 
> Thanks for the time in review and good words!

You're welcome!

> My apologies for an incomplete git-send-email config that left
> me nameless in the headers.

No problem, I guessed your name from the Signed-off-by tag ;)

> I wasn't sure if that was direction to submit as three patches
> at this time, but would be happy to do so if the consensus is
> that it the direction to follow.

I think it's common to separate logical different changes. This makes it 
easier to read.
Also the preparation changes only touch the SPI NAND core. I guess 
that's another reason why they should be separated from the 
chip-specific changes.

> At least for me, I feel that the other two don't really stand
> on their own without the context for their need.

I don't think that's a problem. Just add a note to the commit message 
that these core changes are needed to prepare for the GD5F1GQ4UFxxG support.

Thanks,
Frieder
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
