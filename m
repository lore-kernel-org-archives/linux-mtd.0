Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366A0C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 17 May 2023 02:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLKhW0Gy7MGJwKNZY8vkhUNSGwZoY7tMSIsDQsVEvoM=; b=bOikqQi9cFbPiL
	RU8zWRtA6JMDCgwJ5ET/ab0duQR1cadgMS2UwWgOKgeIYL0z7Tryo+DTnUOfyNRcSr6ptulKnx4O5
	gql1qYXgi2h+riHrTH51FZWhuLow622LXj1bnwUUqCYxMVxGx4R7hWDDpdqSxffG3lNxuAazjkyc+
	tK1KnM71YbjYv5Bc5j3VaMkjjsZzY8DxnmpdkxNzUSYsXsrcNKri82+qFHgNvYGQrccYnOBNKdJ7E
	jokFNnW1aLXoIOtgixJYxz1YIzpHOrxzj6DWQUc1S+eVCBJpmToehdPqQEWn7qVQj0nGx/8Yg4AK6
	YWVvVXpWtBQbH56ONoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6oH-007ogE-0p;
	Wed, 17 May 2023 02:22:37 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6oD-007odv-2e
	for linux-mtd@lists.infradead.org;
	Wed, 17 May 2023 02:22:36 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7DD172C03E9;
	Wed, 17 May 2023 14:22:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684290147;
	bh=I1TRBeRFMd1p0Xy4qdKWmd+xZbTpy3cRbMviYdouafA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=pdE4cKzGOqZ7A8qFDIXCJotRiRtuz+Q2HrJ2vDF9p25db9cj4HU4W8vGCVGiCVPOp
	 mFzIUaGfERf+qZeeLY2lXDioTmDYPpkHnVw2ziofpVetzPuiN2oIkbz6QvDDZGfg+k
	 BgBJHaJGLzrv7CJoJwBEbfArM4SgcE72qSP0aUwMqqrpQQm8gjT32hqxki4BCrJ2nx
	 lDCOOgi0CHiQfSDHtMHIFps8CEQsv6pMINp5IDYURMw/Q8swZnZffpjHocddcIsAjB
	 Z2P7MU3CbwEo88Igar1/KPUD/DVrddEY1I0LsxS2g9lEuGVx8qtqDn8eQYH9LKxC9w
	 m/pFbWZJaN3Bw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64643a630000>; Wed, 17 May 2023 14:22:27 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 14:22:27 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Wed, 17 May 2023 14:22:27 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Wed, 17 May 2023 14:22:27 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Marvell NFC timings on CN9130
Thread-Topic: Marvell NFC timings on CN9130
Thread-Index: AQHZh7FmJPDyhVgaf0OyIHAzbKJ+o69cXk8AgACV+wA=
Date: Wed, 17 May 2023 02:22:26 +0000
Message-ID: <40c38662-221f-b9bb-9699-625dd788defd@alliedtelesis.co.nz>
References: <17a9eee2-d84f-549d-a5ff-da88d43393c1@alliedtelesis.co.nz>
 <20230516192538.45b35b6b@xps-13>
In-Reply-To: <20230516192538.45b35b6b@xps-13>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <516FDD8E619228409D55A0DF82E4278B@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=ZyLz09ez2SdZ2DKszXAA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_192234_373165_517E3F83 
X-CRM114-Status: GOOD (  32.44  )
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


On 17/05/23 05:25, Miquel Raynal wrote:
> Hi Chris!
>
> Chris.Packham@alliedtelesis.co.nz wrote on Tue, 16 May 2023 04:46:38
> +0000:
>
>> Hi Miquel, Thomas,
>>
>> A hardware colleague reported a concern to me about a new design we have
>> using the Marvell CN9130 SoC (which I think was called Armada-8K before
>> they rebranded).
>>
>> Basically their concern is that the tWC timing they observe is faster
>> (~18ns) than the documented minimum in the hardware datasheet for the
>> CN9130 (25ns). Aside from not meeting the datasheet spec we've not
>> observed any other issue (yet).
> I would have expected the controller to support almost any kind of
> timings, including SDR EDO mode 5. tWC is 25ns with mode 4, but 20 on
> mode 5 (ONFI). So I believe you're running a system with a chip that is
> not compatible with the fastest mode. If that is the case, it may
> explain why you don't see errors with this chip: it may support
> slightly faster timings than it advertises.
>
> Anyway, if your findings are true, it means the current implementation
> is slightly out of spec and the timing calculation might require to be
> tweaked a little bit to reduce tWC.
>
>> I notice in the marvell_nand.c driver that marvell_nfc_init() sets the
>> NAND Clock Frequency Select bit (0xF2440700:0) to 1 which runs according
>> to the datasheet the NAND flash at 400MHz . But the calculations in
>> marvell_nfc_setup_interface() use the value from
>> clk_get_rate(nfc->core_clk) which is still 250MHz so I'm wondering if
>> maybe the fact that the NAND flash is being run faster is having an
>> impact on timings that are calculated around the core_clk frequency.
> What if you reset this bit? Do you observe different timings? I hope
> you do, otherwise this is a dead-end.
Yes if we clear the bit the timings go from ~18ns to about 30ns.
> The timings are derived from this clock but I remember seeing different
> rates than the ones I expected with no obvious explanation (see the "*
> 2" in the calculation of period_ns and the comment right below). So
> maybe this is due to the 400MHz vs. 250MHz issue you are reporting, or
> there is an undocumented pre-scaler in-between (this is my original
> guess).

I wondered if the * 2 was because of this or because of the comment that 
the ECC_CLK is 2*NF_CLK. That probably also means that a number of SoCs 
are running with an extra *2 that don't need to be (e.g. Armada-385).

>> Do you think that the timings calculations should take the NAND Clock
>> Frequency Select setting into account?
> There is not much about this clock in the manual, so if the clock is
> feeding the logic of the controller generating the signals on the bus,
> then yes. You can verify this with the test mentioned above.
>
> Could you check the values set to tWP and tWH with and without the bit
> and probe the signals in both cases? Maybe the "* 2" in the
> period_ns calculation will vanish if we use 400MHz as input clock rather
> than clk_get_rate() (or better, expose the bit as a mux-clock and use
> it to tell the CCF the right frequency) and you'll get a sharper tWC in
> the end, which hopefully should match the spec this time.

I was going to have a look to see if I can get the NAND clock to 
correctly reflect the value when the NAND Clock Frequency Select bit is 
set. In the meantime I'll also do some experiments removing the * 2 and 
hard-coding the frequency at 400MHz.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
