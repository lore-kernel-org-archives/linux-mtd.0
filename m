Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46710C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kksLZ8euCG4JCpwEJKmW4q8s02n8DfBRW3YMRr5igyU=; b=otlFgsY12ffHCZ
	GS4y0NpRxZxRANcbyJcYrKDbroQ2z3kf4cHTF90YSPjdzHpOm2y6WRgOsVl8wxNRx1cQ2bZR2v7c8
	vMHcJV1mLAs6KUblZfts3JPRtwiqW48EL8u6JZLB07GjM+jP7SPsbysh9igGe26pT2WyIX7uCEA5P
	YDDynjGB+elkapUbMSxmJP/6A55F6rZbCHiVLMfulw5BMhTOwXwLmxgjzXmDh2RLHPt50fO8tbfbr
	Xh+gqv9LAOCHVB6PG778/HwNWUeSUG6J4GfTzqUHv06jHDLLt2kR3s/CwPboDgc8M3uGqrynJkNh6
	p62yN4EdzSyUoGUcN3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdd8-00000009CYs-1z8a;
	Fri, 21 Jun 2024 12:44:38 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdd4-00000009CUv-0Aj5
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 12:44:35 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6f8d0a00a35so1810401a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2024 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718973873; x=1719578673; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
        b=ky1YXop6mvWnueX9+qz7nlQQnokX327d13mLWowrXyPTMYnoExosTqgA+aUAb1CFjU
         HDRBFwTTTQTh3+kMK53sylHUyk5zI/O8SdO6rpTvbwTyj4BLEDKyKWhwyweczIxxrktO
         C7BpcboDra1N9eUTRYvI0e8VeyaRvi9MQzEvLzEIvvxm0Ew5DIAgsTzudIoqpRskkYWn
         W7lWgp8TfIXBFh6itcAO6+4V1QZnF4hK8lQKqy9axDLsn/u6PmROd/hVjMdlj61ZRJGE
         WMzSv6XtS+kbpZtG0eZLo8KQvacV3dY1QgBdvtePUW/yXt5P7NKRNgzkJzP6Yq+7zbKt
         B9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973873; x=1719578673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5l08J6QwTAydc1Q035PbR16J+Enp8p+H6+DUEul73Uc=;
        b=NwROrxb8FxOM7muKnNLqoHoXLQdcLZT7YhQ6N3/xjmSDes5jRYQL0uh5eXOaYKMFjb
         Rq4gpzzJHozBSXt+bXobkzvb/hnyyAODwXkZnF0V+QBzUWUosln4ca21XRi+t2BNRbsC
         n//I1uGQiWuh5cab4RJS8JLjnVdti5Agtny8e2IdGnpT5zbSYkGr3PxaDCGIwLJyWmAT
         GNXTMoYsn81tgfZcNUQQl2y8rFsuaDRUa/qKPIZcG4wyGTFepSZYH/O4Cw/ROqgrmmEP
         jTJ54FOgmMI5yLIkGMNF4mFo7erG3zi9UOfwl1N7eGXRx4F2481kvc5iWkBcGYdxHl0u
         1eQg==
X-Forwarded-Encrypted: i=1; AJvYcCUkldgelMiG4NgNAyYnn0tCYTT8a0ZejJTvSXAOz2Nu0HZCXo/VE/lstwIburSc/NIrkNR2oCKoGDDkPVFoVrJDj/Bcc9vCaH8QkSrrGg==
X-Gm-Message-State: AOJu0Yy3FGbwxK7CqB1Vmh2KTPXLaBew50ufe/fHoma8Up2KXX/RVJcS
	V9uzykaWPu5yhzuevX29kwxzpXPhJaXhmx4pewMR6lTZp7aTScQN5y4X9kfIYv71WCaw3f0ONO4
	cRtQ84vEPuOTzQZ4b5gpRzX7dCmg3n1boNpLbzQ==
X-Google-Smtp-Source: AGHT+IEOZNlyLp+OxVrBD22Lk7qV9DoUmsFRWzsrduGbMG3NGbu8paAH4Nzg2EEG9ozpibJTiN4vqzTSJCMR3pLWBf8=
X-Received: by 2002:a9d:76cd:0:b0:6f9:e6a5:dad2 with SMTP id
 46e09a7af769-70074dc525emr9327837a34.17.1718973872714; Fri, 21 Jun 2024
 05:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com> <20240621103019.783271f4@xps-13>
In-Reply-To: <20240621103019.783271f4@xps-13>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 21 Jun 2024 14:44:21 +0200
Message-ID: <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, 
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Markus Elfring <Markus.Elfring@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_054434_206122_9D83A4FA 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTA6MzDigK9BTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFBpb3RyLAo+Cj4gcGlvdHIud29qdGFz
emN6eWtAdGltZXN5cy5jb20gd3JvdGUgb24gVGh1LCAyMCBKdW4gMjAyNCAxOTo1NjozOSArMDIw
MDoKPgo+ID4gTW92ZSBhd2F5IGZyb20gcGwwOHggcGxhdGZvcm0gZGF0YSB0b3dhcmRzIGRldmlj
ZSB0cmVlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFdvanRhc3pjenlrIDxwaW90ci53
b2p0YXN6Y3p5a0B0aW1lc3lzLmNvbT4KPgo+IEkgZG9uJ3Qgc2VlIGFueSBjaGFuZ2UgcmVnYXJk
aW5nIHRoZSBOQU5EIGNvbnRyb2xsZXIgbm9kZSBpbiB0aGUgZGV2aWNlCj4gdHJlZSwgaXMgdGhl
cmUgYW55IGRlcGVuZGVuY3kgd2l0aCBvdGhlciBwYXRjaGVzIGZyb20gdGhlIHNhbWUgcGF0Y2hz
ZXQKPiBvciBtYXkgSSBhcHBseSB0aGlzIGRpcmVjdGx5IHRvIG5hbmQvbmV4dD8KPgo+IFRoYW5r
cywKPiBNaXF1w6hsCgpZZXMsIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiAiW3Y0LDA0LzEwXSBBUk06
IGR0czogbHBjMzJ4eDogQWRkIG1pc3NpbmcKZG1hIGFuZCBpMnMgcHJvcGVydGllcyIKd2hpY2gg
d2lsbCBiZSBzcGxpdHRlZCBpbnRvIHR3byBvciBtb3JlIHNlcGFyYXRlIHBhdGNoZXMgcGVyIHJl
cXVlc3QKaW4gdGhlIGNvbW1lbnRzLgpJJ2QgbGlrZSB0byBrZWVwIGRyaXZlciBjaGFuZ2VzIGFu
ZCBjb3JyZXNwb25kaW5nIGNoYW5nZXMgaW4gRFRTIGluCnRoZSBzYW1lIHBhdGNoCmJ1dCBJJ3Zl
IG1hZGUgYSBzZXBhcmF0ZSBwYXRjaCBmb3IgRFRTIHBlciByZXF1ZXN0IGZyb20gdjIgb2YgdGhl
IHBhdGNoIHNldC4KCi0tClBpb3RyIFdvanRhc3pjenlrClRpbWVzeXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
