Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5667C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 22:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2LKjYoUh2AZ23hwJ46h9qqqmbPi8BlN0qMrl7ofjfw=; b=bvSAlMZCu+MD2V
	dgrUWdVNGtWIlyO7MTaSVywTWC4cK0snHaw4xBGZkNl1h1Tc74FH/mLwFUtIJJtD6oS6nvFUSntjW
	m+qrnBkYyQTQcjkFXijDHHvB4JdZ/MKrDVwSnOmWn+t4JvC1+Ktp3Hi3BQbVGN7Lq5Io9wCHmFtWX
	ImtNOJcZLLwXQX3DFCC3c6sNhWLWbg9NrJg6KxyOuayyQhorIIfHzNb56esLrgrkPr/bVsMuYxg0b
	6R4+cOfLID2Rhfpuec3vMTVsFjh9bue799Lfe3gJDSkJGTougMUr78Xh2Dal1lCeg7xD7H0DoGxyK
	rM7cDuflkSjH6dHnNceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPXUJ-004ZBa-7o; Wed, 02 Mar 2022 22:30:27 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPXUG-004ZAS-Ks; Wed, 02 Mar 2022 22:30:26 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id jr3so2699196qvb.11;
 Wed, 02 Mar 2022 14:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ML24VFxrXfMfqzwDIQgpfFTM0/emw2jp9VMO0/xXk6E=;
 b=VD19IUJbn22IqGQs1TEnEdJ37rFzmLayB1HYyyMoWx7NVuIy7o5mYADHLr1b8cOxcb
 3Qpv3FDvdxxZnrp4UQLLp+15C+GY2NT4O8omYxlurZrzNO470WmltkCPDLJFc8dKNvQB
 KMM1JcMP2ZTm/PqIEJmdQXjsYEoiz1nngw/kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ML24VFxrXfMfqzwDIQgpfFTM0/emw2jp9VMO0/xXk6E=;
 b=CiIpneEtVhuSKFXzFhL1wMBFsrTcyfSAOo/oPKxMak6ARZPtTvycufyIwpJPVYvsow
 r/Wk4NOy/if4y6A9B0cPhTaSXzh6G2Mkzww85K0mNq/sPoNROnUqSVCsn3oYBT3ZCqIY
 uLbAtY6a/QYe0ZGNCsAcSjnvhu2tgoc81htFJjiK00g63WNnalbtcYag9oRfJHHmlW8d
 pOzJhiK25pTNlW36kN0huG0UGCfPVUoBt4cclroNGhxQOiZ93zI07Wd214yf8/AVzMQT
 TGAWKFwV5h+VgAd2J40eLUKTHBpImsxU4jnfZ1I59P/Se998DZsL3N1+rgIOV+OkfmlG
 YtWg==
X-Gm-Message-State: AOAM533oK8uGoQxJjxNztm5F13ZYX8j6uiibCKKkocq+A273w7s2ktQX
 TC/O2JC3KLhKSa7SPbiD7J1ujLOsj6el/e8kjgM=
X-Google-Smtp-Source: ABdhPJzJtD+iy3qA83qK2b0/uPlG0vWYsMm4HqktSZgOxSO0FWDUN9MgnYNyp1h+Wqy5l3jmjQa5X2HV+/qsLwLVQrA=
X-Received: by 2002:ad4:4347:0:b0:432:a1f0:f5aa with SMTP id
 q7-20020ad44347000000b00432a1f0f5aamr21695306qvs.49.1646260220663; Wed, 02
 Mar 2022 14:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-8-clg@kaod.org>
In-Reply-To: <20220302173114.927476-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:30:08 +0000
Message-ID: <CACPK8Xesu-3cfH+fPvNGW=JfntTarTSv1njb1FBZ7pD2-TMbMA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] spi: aspeed: Workaround AST2500 limitations
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_143024_710436_F06C8513 
X-CRM114-Status: GOOD (  21.11  )
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

T24gV2VkLCAyIE1hciAyMDIyIGF0IDE3OjMxLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPiB3cm90ZToKPgo+IEl0IGlzIG5vdCBwb3NzaWJsZSB0byBjb25maWd1cmUgYSBmdWxsIDEy
OE1CIHdpbmRvdyBmb3IgYSBjaGlwIG9mIHRoZQo+IHNhbWUgc2l6ZSBvbiB0aGUgQVNUMjUwMCBT
UEkgY29udHJvbGxlci4gRm9yIGhpcyBjYXNlLCB0aGUgbWF4aW11bQoKdHlwbzogdGhpcwoKPiB3
aW5kb3cgc2l6ZSBpcyByZXN0cmljdGVkIHRvIDEyME1CIGZvciBDRTAuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKUmV2aWV3ZWQtYnk6IEpvZWwg
U3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cgo+IC0tLQo+ICBkcml2ZXJzL3NwaS9zcGktYXNwZWVk
LXNtYy5jIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyBiL2RyaXZl
cnMvc3BpL3NwaS1hc3BlZWQtc21jLmMKPiBpbmRleCA5NzRhYjIxNWVjMzQuLmUxMzM5ODRkM2M5
NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCj4gKysrIGIvZHJp
dmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwo+IEBAIC00NDUsNiArNDQ1LDggQEAgc3RhdGljIGlu
dCBhc3BlZWRfc3BpX3NldF93aW5kb3coc3RydWN0IGFzcGVlZF9zcGkgKmFzcGksCj4gICAqIC0g
aW9yZW1hcCBlYWNoIHdpbmRvdywgbm90IHN0cmljdGx5IG5lY2Vzc2FyeSBzaW5jZSB0aGUgb3Zl
cmFsbCB3aW5kb3cKPiAgICogICBpcyBjb3JyZWN0Lgo+ICAgKi8KPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjUwMF9zcGlfZGF0YTsKPiArCj4gIHN0YXRpYyBpbnQg
YXNwZWVkX3NwaV9jaGlwX2FkanVzdF93aW5kb3coc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hp
cCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBsb2NhbF9v
ZmZzZXQsIHUzMiBzaXplKQo+ICB7Cj4gQEAgLTQ1Myw2ICs0NTUsMTYgQEAgc3RhdGljIGludCBh
c3BlZWRfc3BpX2NoaXBfYWRqdXN0X3dpbmRvdyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlw
LAo+ICAgICAgICAgc3RydWN0IGFzcGVlZF9zcGlfd2luZG93ICp3aW4gPSAmd2luZG93c1tjaGlw
LT5jc107Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogRHVl
IHRvIGFuIEhXIGlzc3VlIG9uIHRoZSBBU1QyNTAwIFNQSSBjb250cm9sbGVyLCB0aGUgQ0UwCj4g
KyAgICAgICAgKiB3aW5kb3cgc2l6ZSBzaG91bGQgYmUgc21hbGxlciB0aGFuIHRoZSBtYXhpbXVt
IDEyOE1CLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoYXNwaS0+ZGF0YSA9PSAmYXN0MjUw
MF9zcGlfZGF0YSAmJiBjaGlwLT5jcyA9PSAwICYmIHNpemUgPT0gU1pfMTI4TSkgewo+ICsgICAg
ICAgICAgICAgICBzaXplID0gMTIwIDw8IDIwOwo+ICsgICAgICAgICAgICAgICBkZXZfaW5mbyhh
c3BpLT5kZXYsICJDRSVkIHdpbmRvdyByZXNpemVkIHRvICVkTUIgKEFTVDI1MDAgSFcgcXVpcmsp
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgY2hpcC0+Y3MsIHNpemUgPj4gMjApOwo+ICsg
ICAgICAgfQo+ICsKPiAgICAgICAgIGFzcGVlZF9zcGlfZ2V0X3dpbmRvd3MoYXNwaSwgd2luZG93
cyk7Cj4KPiAgICAgICAgIC8qIEFkanVzdCB0aGlzIGNoaXAgd2luZG93ICovCj4gLS0KPiAyLjM0
LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
