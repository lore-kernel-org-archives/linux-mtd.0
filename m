Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C938C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:01:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0338920754
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9PIV03u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HuLb35l3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0338920754
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o4NnCpthwY9bUHeC0cjWAEvUCIO2wxssk+Sy7Tz0ARI=; b=Z9PIV03uoDBP77BE2LDjNQL0I
	lJM8juKBY7Z3EIby85/PrZHTAMTN0ycNA+Nx8JLm3NZn0l8LnnRkRzCashcs8We3sWqBb4dKR18mn
	ku1EcGkzp7U9bNh+sYmXcUa53wWbg3cUA9uTjqG1QmmAK6JMJ3XJnKTPQSCx5ef5m3yJlJunbNlJh
	8zi8IboE4Mpr4kSU9VwqXC9M78dmHlQDEhGYi9fX9JioFaa9Z6NKl1AKW65asKbFDuSC9IYql5xq7
	rs8bl590rilDuzCtFmijRDScQvY1U517QaapFbX7WrzJt6RJlAVBYeaGnOYy3v2zoIFPCNmdnhNhF
	Ixnhyax1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNces-0001Mv-1L; Wed, 30 Sep 2020 14:00:38 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNcep-0001M4-5o
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 14:00:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08UE0VBs038428;
 Wed, 30 Sep 2020 09:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601474431;
 bh=B4u4mPz3Mw0LWhoGuVNSTssSPC917P+CIGSb15A4hlk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HuLb35l3qVY0R4iQuUpbG12KK1BH1M14KiX+3CG0sEhVDnvsNV/C2lXv0MuGEOv/y
 mShBnIKWtxw06mQ7AB+tvkjZNmeKeNUtNA4frQHE8qI5EI5Iy1ekwtbUtoJl14N5pS
 E9lXlNd1YTIPpYFAde86ECU4VPFTMSC80ILBfsNE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UE0VoW017073;
 Wed, 30 Sep 2020 09:00:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 09:00:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 09:00:31 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UE0Srx039832;
 Wed, 30 Sep 2020 09:00:29 -0500
Subject: Re: [RESEND PATCH 1/2] mtd: spi-nor: do not touch TB bit without
 SPI_NOR_HAS_TB
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
 <20200921112450.4824-2-i.mikhaylov@yadro.com>
 <9bfb10df-64d8-4a5e-b0ad-a8b5f4efc56f@ti.com>
 <4a5945534f7b41cb799c044ec8c9d31c61d5beda.camel@yadro.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <758b2772-3c44-1184-066e-df890d05a21a@ti.com>
Date: Wed, 30 Sep 2020 19:30:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a5945534f7b41cb799c044ec8c9d31c61d5beda.camel@yadro.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_100035_299040_7432B375 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/30/20 6:37 PM, Ivan Mikhaylov wrote:
> On Wed, 2020-09-30 at 15:06 +0530, Vignesh Raghavendra wrote:
>>
>> On 9/21/20 4:54 PM, Ivan Mikhaylov wrote:
>>> Some chips like macronix don't have TB(Top/Bottom protection)
>>> bit in the status register. Do not write tb_mask inside status
>>> register, unless SPI_NOR_HAS_TB is present for the chip.
>>>
>>
>> Not entirely accurate.. Macronix chips have TB bit in config register
>> and is OTP and hence should not be touched ideally...
>>
>> You still need to "read" that bit to determine actual scheme (Top vs
>> Bottom). This is needs to be done before 2/2 enables SPI_NOR_HAS_LOCK
>> flag for macronix flashes.
> 
> Vignesh, that's the point about this commit to generalize this part about TB bit
> plus there is already exist SPI_NOR_HAS_TB flag which representing state of TB
> existence. I didn't add any support for macronix's TB bit, that's true but
> that's enough to make macronix chips able to use lock mechanism with default
> 'use_top' or any other chips which doesn't have TB bit.

Right, but 2/2 "enables" locking mechanism for Macronix flashes. Therefore its 
necessary to take TB bit into account so that implementation is correct. 
What if OTP bit is set as "use_bottom"? Although this is non default, 
we need to take care of this case for correctness.

> 
>> I guess macronix does not support SR_SRWD right? This needs special
>> treatment as well.
> 
> It does support SR_SRWD as well. No need any special treatment here.
> 

I did not find it in one Macronix datasheet at least:
https://www.macronix.com/Lists/Datasheet/Attachments/7902/MX25L25673G,%203V,%20256Mb,%20v1.6.pdf

Are you sure all Macronix flashes support SRWD?

> Thanks.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
