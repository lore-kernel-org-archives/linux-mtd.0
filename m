Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7265BC433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 22:33:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 110C9619A3
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 22:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 110C9619A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OdbWmTTcWdeyo6TJ8OzanumLYqZUzZVCiJoDClIoF9c=; b=caSfcqtoFwG8AGiPY92YZd9nX
	Fg/pc7rbfqDmSBhaCRUB0FSwXSMNCJSN1r4Nn/z5iGSYH4jgXpoVB/yPWilNIcsQhBTQZtHEe6xyI
	/2aZTVkTC/GJJZO3myPnZTbnMtnOh2dESL6E0ANY7FxDlPaEyLWcwSKcLKk7WnWU/GlPNottxTXLi
	m8Jdhx1xIhoH2/wo5mcNyC/4Jz3hAe2CL1Wvlv8RVWJ3e+fhUM7GTdqwkGQ4oyZTzADy4JYFPmNFg
	2G6kqGVJppzkpOb4nvFXDGXa8itjcpGr4alaFo8hwzQS2RagV8IzWnPuvmeatIxle7rFX5xWziB9w
	lBspsxo2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOT5Q-00CiCX-Gv; Mon, 22 Mar 2021 22:31:50 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOT5K-00CiBM-OD
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 22:31:45 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id CF6EC22235;
 Mon, 22 Mar 2021 23:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616452300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJoG/u8MI2x4uSTu5HQetJN+bIf3Y0nqyeCj3d2bX50=;
 b=OwNc03RxyOQAsGLwGlJHYhQjmOWeSzExvBTZ2CiikQTSjsySaVaRwudgUFkTQIBzv+s62H
 vuUbi4ZBI9DLuFjsHK10/WPOL5nsEKUDQysTC/ihrd51qTP+EmsWlBd3yI6HtFhp5Vj6of
 kru7ZcSqIJFgVNMQXQ2ITmS1xPUiYDI=
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 23:31:39 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sfdp: save a copy of the SFDP data
In-Reply-To: <20210322184214.ernzjfwfle6dfhpv@ti.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-2-michael@walle.cc>
 <20210322142141.pd7ondg6l76idz7d@ti.com>
 <0efba47de8737059b4f3c593c26297bf@walle.cc>
 <20210322184214.ernzjfwfle6dfhpv@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7e00a5fc05a186d5b34916e5a9f45a48@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_223143_001316_90F9A278 
X-CRM114-Status: GOOD (  26.17  )
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

Am 2021-03-22 19:42, schrieb Pratyush Yadav:
> On 22/03/21 04:32PM, Michael Walle wrote:
>> Am 2021-03-22 15:21, schrieb Pratyush Yadav:
>> > On 18/03/21 10:24AM, Michael Walle wrote:
>> > > +
>> > > +	sfdp->num_dwords = DIV_ROUND_UP(sfdp_size, sizeof(*sfdp->dwords));
>> >
>> > The SFDP spec says that Parameter Table Pointer should be DWORD aligned
>> > and Parameter Table length is specified in number of DWORDs. So,
>> > sfdp_size should always be a multiple of 4. Any SFDP table where this is
>> > not true is an invalid one.
>> >
>> > Also, the spec says "Device behavior when the Read SFDP command crosses
>> > the SFDP structure boundary is not defined".
>> >
>> > So I think this should be a check for alignment instead of a round-up.
>> 
>> Well, that woundn't help for debugging. I.e. you also want the SFDP 
>> data
>> in cases like this. IMHO we should try hard enough to actually get a
>> reasonable dump.
>> 
>> OTOH we also rely on the header and the pointers in the header. Any
>> other ideas, but just to chicken out?
> 
> Honestly, I don't think reading past the SFDP boundary would be too 
> bad.
> It probably will just be some garbage data. But if you want to avoid
> that, you can always round down instead of up.

Like I said, while the storage will be rounded up to a multiple of
DWORDs, only sfdp_size is transferred. Thus it case a pointer is not
DWORD aligned, we end up with zeros at the end.

I'll add a comment.

> This way you will only
> miss the last DWORD at most. In either case, a warning should be 
> printed
> so this problem can be brought to the user's attention.

I was about to add a warning/debug message. But its the wrong place.
It should really be checked in the for loop which iterates over the
headers before parsing them. You could check sfdp_size but then two
unaligned param pointers might cancel each other out.

This can be a seperate patch, besides adding a warning, should there
be any other things to do, e.g. stop parsing and error out?

..

>> > > +		goto exit;
>> > > +	}
>> > > +
>> > > +	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sfdp_size, sfdp->dwords);

Btw, this can be spi_nor_read_sfdp(). But I'm not sure, what this
whole dma capable buffer should be. Is kmalloc(GFP_KERNEL)
considered DMA safe?

The buffer ends in spi_nor_read_data(), which is also called from
mtdcore:

spi_nor_read_sfdp()
   spi_nor_read_raw()
     spi_nor_read_data()

mtd_read()
   mtd_read_oob()
     mtd_read_oob_std()
       spi_nor_read()
         spi_nor_read_data()

Is the buffer passed from mtd_read() also DMA-safe? Doesn't the SPI
drivers allocate DMA safe buffers if they need them?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
