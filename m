Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E557C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 14:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E506060273
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 14:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E506060273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zbncXtR/VhCb2YjIOhHC79l10he0O7SIFOZ99Cp8YOs=; b=Z7cW0WhZQ+EZN1SWFmgs8pHPs+
	WkWDPPwO5ZNjPbjFZ53xPz54wN64BAUe4+Ok0lHgVMIJLOqQZe4/+A7tP0plCbXuk3poZ2ydgqeg8
	NFjwYV3bc1hdhP4LbJlzNc2SZiqa02aYvskQ3FKtJdv0EL1F7ER07qaBlvDfE4phZSB4DCkZiz4nE
	e2WGRpdyWcorJ8aTiwval8KRQuOijEouYhI8v1m+iNi0I6gjp5JF78ioR+ECuxyGhx/EMXnr2ZVIn
	81fQQ8pAUuObIucn6zC1UHokyfCSnYjOk37Mg98NdcQKUkvFq6Et7vaJMeHXARiW6pHaaTzY3gq8v
	Uf9DIbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmdFd-00Fu5Y-La; Mon, 15 Nov 2021 14:46:29 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmdFa-00Fu4d-PI; Mon, 15 Nov 2021 14:46:28 +0000
Received: by mail-lj1-x22c.google.com with SMTP id e7so21503985ljq.12;
 Mon, 15 Nov 2021 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f9990VLRY1mM2sii4oucAgZqtJr4f6UTn2nlUsBeiyA=;
 b=MKv4lJzovSleVVtb8Uez4QS8nWVoyslVc4dAhZ3Ja9hcfOWhdQeyMWw6FHhrLjYpMe
 nYJhoHPJHieO78N1tejBSn1JjrO7HehrBzOD6p80ebHQ/GkZbHzj+oDCc5U4EAGGyBKV
 xbJLawSqjqY4fBNx9jKlTQhw4P401MYqth7VhZkzSxvdhwOw2g0BxwUpHsNeyVoCEXwg
 AneGSb38fLLRS0lfd/WXUhHjDQTfopD289+UYtNAyG6eoU7lhx2ZHI9h8rOgSDINeyOy
 BSHVlS4ECWcjRF5ej1E2mdUBpiNe11q16/40ayNE4SINNFWYIMy3ZhzwXNTN4fPHDK38
 wMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f9990VLRY1mM2sii4oucAgZqtJr4f6UTn2nlUsBeiyA=;
 b=UYUkTM449k12GWplqbF12yS82dqdqz10EjualyRoIOofbRTfMT6QOLoqeq3vPrZmIk
 x9y34lb0AZwozaMRwDG2EbL6YLBOWQ6EgtTw0j0YRGmmAYLUmWS5iZbn3yeLGmV1hVIo
 nqgAUbatDbGmEuDoWSDKa0E6qvX4TzS2VRBfE7vYFwQVanluStM5r0pLwiICqSWikDQa
 Olrh/o5oO4BFmJxA4MRAzLa6FVlMdYleB3yNLVU1IYwefvIMFb3iX2OwyK6epIjAW8Ou
 MOqAm/qYeRwviI4KPaR3yG3CDi2UM5PNRyG5vYK3ALfMK6lyoirs3BqDfJAmXBR+FBqe
 O18w==
X-Gm-Message-State: AOAM531niOWjIbD3XCdZmGl+ALo5FvC7/JhNQ5JX1DPp3a/qu6hM85GY
 /eoZNGQfsMkiQ26+Kuu3OrI=
X-Google-Smtp-Source: ABdhPJyGzX+uJoClUoX59O9YRdwTgWzR3XA1e/9PtaHs0iyNVaYjGst0rpo/clkWJ4amyTD6J2hiFA==
X-Received: by 2002:a2e:b711:: with SMTP id j17mr29887114ljo.39.1636987584324; 
 Mon, 15 Nov 2021 06:46:24 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.googlemail.com with ESMTPSA id j2sm1445777lfr.109.2021.11.15.06.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:46:24 -0800 (PST)
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Lars-Peter Clausen <lars@metafoo.de>, Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Orson Zhai
 <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
 <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
Date: Mon, 15 Nov 2021 17:46:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_064626_850916_ADD75B2A 
X-CRM114-Status: GOOD (  28.27  )
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

MTUuMTEuMjAyMSAxNDo1MywgTGFycy1QZXRlciBDbGF1c2VuINC/0LjRiNC10YI6Cj4gT24gMTEv
MTUvMjEgMTE6NDIgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+IE9uIE1vbiwgTm92IDE1LCAy
MDIxIGF0IDExOjE0IEFNIExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPgo+PiB3
cm90ZToKPj4+IE9uIDExLzE1LzIxIDk6NTMgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+Pj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4+Pgo+Pj4+IFRoaXMgZmllbGQg
aXMgbmV2ZXIgc2V0LCBhbmQgc2VydmVzIG5vIHB1cnBvc2UsIHNvIHJlbW92ZSBpdC4KPj4+IEkg
YWdyZWUgdGhhdCB3ZSBzaG91bGQgcmVtb3ZlIGl0LiBJdHMgYmVlbiBsZWdhY3kgc3VwcG9ydCBj
b2RlIGZvciBhCj4+PiB3aGlsZSwgYnV0IHRoZSBkZXNjcmlwdGlvbiB0aGF0IHRoZXJlIGlzIG5v
IHVzZXIgaXMgbm90IHJpZ2h0Lgo+Pj4KPj4+IFRoZSB0ZWdyYTIwX3NwZGlmIGRyaXZlciBvYnZp
b3VzbHkgdXNlcyBpdCBhbmQgdGhhdCB1c2VyIGlzIHJlbW92ZWQgaW4KPj4+IHRoaXMgcGF0Y2gu
IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gc3BsaXQgdGhhdCBvdXQgaW50byBhIHNlcGFyYXRl
Cj4+PiBwYXRjaCB3aXRoIGEgZGVzY3JpcHRpb24gd2h5IHRoZSBkcml2ZXIgd2lsbCBzdGlsbCB3
b3JrIGV2ZW4gd2l0aAo+Pj4gc2xhdmVfaWQgcmVtb3ZlZC4gTWF5YmUgdGhlIGJlc3QgaXMgdG8g
cmVtb3ZlIHRoZSB3aG9sZSB0ZWdyYTIwX3NwZGlmCj4+PiBkcml2ZXIuCj4+IE9rLCBJJ2xsIHNw
bGl0IG91dCB0aGUgdGVncmEgcGF0Y2ggYW5kIHRyeSB0byBjb21lIHVwIHdpdGggYSBiZXR0ZXIK
Pj4gZGVzY3JpcHRpb24gZm9yIGl0LiBXaGF0IEkgc2F3IGluIHRoYXQgZHJpdmVyIGlzIGl0IGp1
c3QgcGFzc2VzIGRvd24gdGhlCj4+IHNsYXZlX2lkIG51bWJlciBmcm9tIGEgJ3N0cnVjdCByZXNv
dXJjZScsIGJ1dCB0aGVyZSBpcyBub3RoaW5nIGluCj4+IHRoZSBrZXJuZWwgdGhhdCBzZXRzIHVw
IHRoaXMgcmVzb3VyY2UuCj4+Cj4+IERvIHlvdSBvciBzb21lb25lIGVsc2UgaGF2ZSBtb3JlIGlu
Zm9ybWF0aW9uIG9uIHRoZSBzdGF0ZSBvZiB0aGlzCj4+IGRyaXZlcj8gSSBjYW4gc2VlIHRoYXQg
aXQgZG9lcyBub3QgY29udGFpbiBhbnkgb2ZfZGV2aWNlX2lkIGJhc2VkCj4+IHByb2JpbmcsIHNv
IGl0IHNlZW1zIHRoYXQgdGhpcyBpcyBlaXRoZXIgZGVhZCBjb2RlLCB0aGUgcGxhdGZvcm1fZGV2
aWNlCj4+IGdldHMgY3JlYXRlZCBieSBzb21lIG90aGVyIGNvZGUgdGhhdCBpcyBubyBsb25nZXIg
Y29tcGF0aWJsZSB3aXRoCj4+IHRoaXMgZHJpdmVyLgo+IAo+IEkndmUgbG9va2VkIGludG8gdGhp
cyBhIHdoaWxlIGJhY2ssIHdoZW4gSSB0cmllZCB0byByZW1vdmUgc2xhdmVfaWQuIEFuZAo+IGFz
IGZhciBhcyBJIGNhbiB0ZWxsIHRoZXJlIHdlcmUgbmV2ZXIgYW55IGluLXRyZWUgdXNlcnMgb2Yg
dGhpcyBkcml2ZXIsCj4gZXZlbiBiYWNrIHdoZW4gd2UgdXNlZCBwbGF0Zm9ybSBib2FyZCBmaWxl
cy4gTWF5YmUgc29tZWJvZHkgZnJvbSBOdmlkaWEKPiBrbm93cyBpZiB0aGVyZSBhcmUgb3V0LW9m
LXRyZWUgdXNlcnMuCgpUaGF0IFRlZ3JhIFNQRElGIGRyaXZlciB3YXMgbmV2ZXIgdXNlZC4gU3Rp
bGwgdGhlcmUgaXMgYSBncm93aW5nCmludGVyZXN0IG5vd2FkYXlzIGluIG1ha2luZyBpdCBhbGl2
ZSBieSBpbXBsZW1lbnRpbmcgSERNSSBhdWRpbyBzdXBwb3J0CmZvciBUZWdyYTIwIFNvQy4gSXQg
d2FzIG9uIG15IHRvZG8gbGlzdCBmb3IgYSBsb25nIHRpbWUsIEknbGwgdHJ5IHRvCnByaW9yaXRp
emUgdGhhdCB3b3JrIDUuMTcsIGl0IHNob3VsZG4ndCB0YWtlIG11Y2ggZWZmb3J0LgoKVGhlIHNs
YXZlX2lkIHNob3VsZCBiZSByZW1vdmVkIGFueXdheXMsIGl0IHdvbid0IGJlIG5lZWRlZC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
