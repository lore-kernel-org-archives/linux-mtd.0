Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420CC87FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cv2ritomha/oK/J1QkVFPjGM86v0Z7rz7TP0ZXszheU=; b=Npn1LdFWPehJV0
	+O0WTRG2B8CtyxdMRjO+oWiZcM4pg/+uSbN4FhNX41tSvV9CnbbSZlRd2hc2NMJPM/5hi33UzA4oC
	fDFB6+m3SuHr2q8h6Jo6MjtXjFxljG5SXqFuRWzpsctYalS4dL4ZBdNamcbs2igOIZWTGSQGkHoZY
	CuXgZofwUXkGeZYs9NZVT4TM4ajBkdVM85a95DG3WIzzKIKKVLTTHGEvyYLQC2s951//JT+tf5MpS
	oW2EIflYX9tUPguKgZZ8SmiQ5165a9pUFOwftL2mD9vEj8OUAK1L1DYQkoFea5vNCOVJELXZI95Dk
	EntcPN6B4NijiMVYP1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk7MR-00000001VXZ-1YFt;
	Thu, 07 Aug 2025 20:37:15 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk7MO-00000001VWc-1wDc
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 20:37:14 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3F9782C0243;
	Fri,  8 Aug 2025 08:36:57 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754599017;
	bh=y0DYJVSsNXPdytRNQYmyRz7C0P4oOVIvP0/h5Yko+b0=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=Fru1hK2XTrOliT/C8U8d373h6rlWN3tyM8n6f0gCkXicqCGjWPU+w6Xoo61zlTtQa
	 /Q/eZTNaD8JayNoivpYu0KnRrHz+tN17qaQTLv6dIjH7flylbrpBH5RZYI8yYegDZK
	 DrxZUwmZUOGH7M5wNPnNllsxxa/y+7OA3w2NpalBMzpm5JPsprL02XCgsOszF5xoCi
	 LiSfpSYHHCCE3ryRFMYetly4a9Ahix13pfQj+FANpo/5MMFImG7weKjRaU7L53rgSN
	 +1aO0Cd+gq5LjQC05VVbpU+4tWM85P+fjsp14DTPbRpfJIYMuxNaufx32ZjsclTvQa
	 oWNNpsVMTuJeQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68950e690000>; Fri, 08 Aug 2025 08:36:57 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 8 Aug 2025 08:36:57 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Fri, 8 Aug 2025 08:36:57 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>,
	"tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: NAND ECC errors
Thread-Topic: NAND ECC errors
Thread-Index: AdwHqGyt2keeh0YRQwu69CO4vX1Wiv//nAQA
Date: Thu, 7 Aug 2025 20:36:56 +0000
Message-ID: <2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>
References: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>
In-Reply-To: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <08F4B90AD91C2C41B05555B084FCF973@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=68950e69 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KShMqH2TfZRXdTvFQPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_133712_979682_C00ACADB 
X-CRM114-Status: GOOD (  27.08  )
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

Hi Markus,

On 08/08/2025 03:16, markus.stockhausen@gmx.de wrote:
> Hi,
>
> Chris (CC) developed the drivers/spi/spi-realtek-rtl-snand.c for the
> Realtek switch platform. Thanks for that and the inclusion into mainline.
> While adding it to one of my devices I'm getting ECC errors.
>
> Situation is as follows.
>
> - Linksys LGS328 (with RTL9301 SOC and that NAND controller)
> - OpenWrt with Kernel 6.12 longterm
> - The Realtek SPI NAND driver (backported from current master)
> - Macronix MX35LF1GE4AB (1GBit)
> - Boot via TFTP
>
> I found a vendor UBI partition in NAND that I want to analyze.
> It is actively and the vendor firmware seems to work on in.
> I assume it contains a filesystem with configuration and logs.
> During ubiattach I get tons of errors "ubi0 warning: ubi_io_read:
> Error -77  (ECC error) while reading 64 bytes from PEB 0:0, read
> only 64 bytes, retry".
>
> Call stack shows:
>
> spinand_mtd_regular_page_read
>    spinand_read_page
>      spinand_load_page_op
>      spinand_wait -> sets status = STATUS_ECC_UNCOR_ERROR
>      nand_ecc_finish_io_req start
>        spinand_ondie_ecc_finish_io_req run
>          spinand_check_ecc_status start
>            macronix_ecc_get_status -> reads status & returns -EBADMSG
>
> Reading data from NAND directly I see this data layout for 2K data
>
> - 4x 512 bytes data
> - 4x 6 bytes oob = 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
> - 4x 10 bytes ECC
>
> A quick ECC calc for empty blocks says it must be BCH6. So now I have
> several options but have no idea if I'm right or which to follow.
>
> 1. The NAND chip seems to have ECC build in. Ignored by vendor?
As far as I understand the expectation in Linux was that all SPI-NAND 
chips have on-die ECC.
> 2. There is a hardware ECC controller -> Driver must be coded
Yes there is an ECC controller in the RTL93xx chips but based on the 
comment above (and some pretty useless documentation) I elected not to 
attempt to use it.
> 3. Maybe I must activate the software BCH driver
Software BCH might be an alternative to using the ECC controller.
> 4. The old vendor firmware (Linux 4.x) uses other ECC logic.
I think this is the crux of the problem. Realtek seem totally 
uninterested in upstreaming support for their chips (not sure how that's 
going to pan our with emerging requirements like RED and CRA) so it's 
left to people like you and I. In the meantime their SDK has made 
decisions that upstream don't know about and when it comes to things 
like NAND ECC layouts this causes problems.
> Anyone good ideas what to do first from here?

Probably depends. Blanking the NAND chip and reformatting it will 
resolve the errors from and upstream point of view. That's obviously not 
really going to be something you want to do if you expect to swap back 
and forth between the stock firmware and an upstream kernel.

You'll probably want to convince the mtd code to allow the on-die ECC to 
be disabled and find whatever software BCH settings are needed that work 
with the stock firmware. Then we could maybe look at using the ECC 
controller to accelerate that.

> Thanks in advance.
>
> Markus
>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
