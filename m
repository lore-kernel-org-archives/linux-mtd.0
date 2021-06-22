Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A62EC2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 20:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B1860FF2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 20:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B1860FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/umL8ly9uqSja6sNcCvy+rVIaOkxP8FjpfSV7+RFjPo=; b=qpH/WqpxC+T2VD8JMfWR20Tjpm
	q3XOE6nIBg1MWvLVcO1S6sSZjVaO8GNY0eVHr7ZJdrvW1+S/OGdtg+0XD4gd95aFBPtCgVqqgI+SQ
	tE9Cm9h7tctTpkv30uXAr9C+4Uqz2v/viBjDyqrQ8exO23SyJXiOLpzvxsV8Ob/5LWKDqW/4hLNYG
	D/pRs4GH4hCHbmQg4i6fKRNi/80542UvFNGB9OyYjw0oJTgt+ScD/tfll4vY7lDBW06kNMl4k8SPn
	u1gW1Kx77gvJ2QSp9QlHeLmOG/sMu0eQNAnFMXshWFT97rKcsZrfGw26MjEdpXYeSOzYWNk5DQMOI
	eRseDnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvnTE-008PU5-QG; Tue, 22 Jun 2021 20:58:08 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvnTB-008PT4-5Q
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 20:58:07 +0000
Received: by mail-ej1-x62c.google.com with SMTP id gt18so445724ejc.11
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2021 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XbZaI8K20oT3k/49PtUoFjFtDiZq/0PLWOxESWu6WS0=;
 b=Yw4rkA9CknhtZPlC6ZZGq6GHOjihftbzh2lICXfrXc5PkLwB5XmYuGKUF7Ftez5dsn
 yWCfLV5OPnQTgn065SFBujchcziRF1BFcHPzUTg9cMFsJwEOC8ZSACv0HIGRSt5An/4w
 OYY2z9vGS8KinILH7o7AdnpXBowqeWE1Tpwew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XbZaI8K20oT3k/49PtUoFjFtDiZq/0PLWOxESWu6WS0=;
 b=fV+hFTq+1uUDy7qfRIIyRK5pbD9RD6VuZgQjkxpyRIWHd8wHWhm4Tzj/A7mZC0hJy3
 fiIDj+hQk8Wlew8gfw3L3bKz+rKa5itXAwhL+FRsNfVRK9lh5I2CW62vsZ8cwAxsJb69
 +YL11BB0fklYuD+AHrLV3gpnCN90eEEHOeaUL3CdEg+70gylJ2Hqfp88EwpI1gQdQInL
 6p62Vm7+yxPph5jaPZGld9JFzJbmt6yLZTY17OJeGUpRpMG1n5fcAO35sz9IrKe3DLlE
 J4dU4dBnZGt/zvwTmbH6nOvQP/jCqr+Uqgl2CkRmR640Gun06P43BCq4IHfc+CjqpmTS
 Qe5w==
X-Gm-Message-State: AOAM533sse7Ll7yvWJTAH3keJSJg3z6GHmIQs8o/zTEclFLbfrZUi5NT
 Hkm6Q9n25NvGAde2VRb2b7nZZA==
X-Google-Smtp-Source: ABdhPJxIxsxt8wgHeE9e1bSbY9BLozd91OTHWWutrT/ACm/4YzWSp+I2xS4Cy2fMkZQdD/6IZJxFjw==
X-Received: by 2002:a17:906:3ed4:: with SMTP id
 d20mr5137636ejj.515.1624395482859; 
 Tue, 22 Jun 2021 13:58:02 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id jz12sm2745310ejc.94.2021.06.22.13.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 13:58:02 -0700 (PDT)
Subject: Re: [RFC 2/3] mtd: spi-nor: core: compare JEDEC bytes to already
 found flash_info
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, linux-kernel@vger.kernel.org,
 Esben Haabendal <esben@geanix.com>, Zhengxun Li <zhengxunli@mxic.com.tw>,
 Jaime Liao <jaimeliao@mxic.com.tw>, masonccyang@mxic.com.tw,
 ycllin@mxic.com.tw
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
 <20210621152320.3811194-3-linux@rasmusvillemoes.dk>
 <223232ecd0865e819477f17cd464ab08@walle.cc>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d43f021d-8f95-7857-b70b-91e22b0a8e2a@rasmusvillemoes.dk>
Date: Tue, 22 Jun 2021 22:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <223232ecd0865e819477f17cd464ab08@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_135805_437917_2566697E 
X-CRM114-Status: GOOD (  37.21  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/06/2021 13.57, Michael Walle wrote:
> [+ some people from MXIC as they are ones who posted to the ML
> lately. Feel free to forward this mail to the corresponding people.]
> =

> Am 2021-06-21 17:23, schrieb Rasmus Villemoes:
>> Macronix engineers, in their infinite wisdom, have a habit of reusing
>> JEDEC ids for different chips. There's already one
>> workaround (MX25L25635F v MX25L25635E), but the same problem exists
>> for MX25L3205D v MX25L3233F, the latter of which is not currently
>> supported by linux.
>>
>> AFAICT, that case cannot really be handled with any of the ->fixup
>> machinery: The correct entry for the MX25L3233F would read
>>
>> =A0=A0=A0=A0=A0=A0=A0 { "mx25l3233f",=A0 INFO(0xc22016, 0, 64 * 1024,=A0=
 64, SECT_4K |
>> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ ) },
>>
>> while the existing one is
>>
>> =A0=A0=A0=A0{ "mx25l3205d",=A0 INFO(0xc22016, 0, 64 * 1024,=A0 64, SECT_=
4K) },
>>
>> So in spi_nor_init_params(), we won't even try reading the sfdp
>> info (i.e. call spi_nor_sfdp_init_params), and hence
>> spi_nor_post_sfdp_fixups() has no way of distinguishing the
>> chips.
>>
>> Replacing the existing entry with the mx25l3233f one to coerce the
>> core into issuing the SPINOR_OP_RDSFDP is also not really an option,
>> because the data sheet for the mx25l3205d explicitly says not to issue
>> any commands not listed ("It is not recommended to adopt any other
>> code not in the command definition table, which will potentially enter
>> the hidden mode.", whatever that means).
> =

> Maybe we should ask Macronix if it is safe to send the RDSFDP command.
> Can anyone from MXIC comment this?

Yeah, that would be useful to know, but I don't have any hopes
whatsoever of Macronix engineers being able to help sort out the mess
they've created by reusing IDs in the first place. They don't seem to
understand how that can possibly be a problem.

I, and my client, have contacted them on several occasions to ask how
we're supposed to deal with that. At one point, the answer was
"MX25L3233F support Serial Flash Discoverable Parameters (SFDP) mode,
MX25L3205D does not support.", but when I asked the obvious follow-up
("but the MX25L3205D datasheet warns against doing RDSFDP or any other
not explicitly allowed command"), I got no response.

Another response was

"I can only comment on Linux 4.4, as that is the only version that I
have supporting material for. Basically we have a patch for MTD/SPI-NOR
(see attached). This is to allow allow the MTD subsystem to cope with
devices that have the same ID (see below first paragraph of application
note attached). Please note that the MX25L3205D had an EOL notification
on 14th May 2010."

and that attached patch is a 173KB .patch file that made me taste my
breakfast again.

And they keep repeating the argument that when a chip is EOL, it's OK to
reuse its ID (because obviously nobody have used that chip in a product
that would receive OS updates, so any OS released later than that EOL
date can just include support for the newer chip and drop the old one...).

>> In order to support such cases, extend the logic in spi_nor_read_id()
>> a little so that if we already have a struct flash_info* from the name
>> in device tree, check the JEDEC bytes against that, and if it is a
>> match, accept that (device tree compatible + matching JEDEC bytes) is
>> stronger than merely matching JEDEC bytes.
> =

> This won't help much without a proper dt schema. No in-tree devicetree
> could use is because the DT validation would complain.

I can certainly extend the regexp in jedec,spi-nor.yaml to match this
new one. DT is supposed to describe the hardware, so I can't see how
that could possibly be controversial.

 So if this will
> go in (and the maintainers are rather hesitant to add it, I tried
> it myself [1]), you'd also need to add it to jedec,spi-nor.yaml and
> get an ack from Rob.

Thanks for that link. So it seems this isn't the first time recycled IDs
have come up, and not just for Macronix.

Yes, vendors shouldn't recycle IDs. They do. They should be punished by
people not using those chips in new designs. Doesn't work, hardware
designers do use them. Auto-detection is preferred over using hard-coded
values from DT. Sure, absolutely, and when the ID is known to be
ambiguous, by all means throw in all the heuristics and chip-specific
quirks one can think of to disambiguate. But at the end of the day,
there are chips out there which cannot be distinguished without help
from DT, and as DT is supposed to describe the hardware, why is that
such a big problem?

And I'm not suggesting any change whatsoever as to how a compatible
string of merely "jedec,spi-nor" would be handled - it would just take
the first chip with the read JEDEC id, then apply any appropriate quirks
and fixups.

Rasmus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
