Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AA8C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VQJCH0xEINnjsWUcielYcEFBaxCweu8J98a3T0VjEk=; b=Vgb1Z5eqCqQENf
	RLJOC/7dZCbSyod1317KHgeYb4K5Hc0lA5oWHlbrQhB0zfiYT+6fPAnCrWyEpcydViHUI8AaEILgK
	y2n/mBfpi/pEMYQcChQCbMgFpxtQXgLSa4o+mofvPmnZ8JMNO1P05CQOoqHnegk1QqGfhf3xULdjM
	tFPJPWg+zs92pdPxPnbg9mbHqXJpqCVLcqPYGRurmzjGc2B59VkSunDLyFUsuBHafCLw0uS7oVri5
	6cgmZwHPtkvmaXJ7RWxczYdfZmCNNRjlBxtT4YJngqEG38nAeEGvgEtqINscRuNlSMLmJezNYOk2j
	IDW3UNiqVPsjFXao0XBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPXHC-004Vum-QQ; Wed, 02 Mar 2022 22:16:55 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPXH8-004Vt7-TP; Wed, 02 Mar 2022 22:16:52 +0000
Received: by mail-qt1-x82a.google.com with SMTP id f18so3042267qtb.3;
 Wed, 02 Mar 2022 14:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qFb1AQXGto8rW2v4HENONQPyad9zpp2Lw3iyL5e2hcw=;
 b=TGLsEu6t++tXeHwptrWF0tmRCBkIkJHDm4VFCqheaPgdP8JHAuqJrpBzSg8NQ9fp8F
 XGDXGLQ9OJkcaVoPa7f/ow+MOL8mQC7QNnJ6ZoiOKaO0jqhk5+Mefa7o+fgkgIQA8GqA
 QF3kXKcFGBmGfZhGMttHslQaXysRkuvCylHUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qFb1AQXGto8rW2v4HENONQPyad9zpp2Lw3iyL5e2hcw=;
 b=aDslSKTsNl7mQwdek1LhpPZ3AhYFm8CMzOduo8/uJTP8QmcmWVostRc0jyOMwGFCUW
 GNk2lWOxao9bjeANwlbZsvm4WRvtwUAg5QvBAUHLEUjqMwsLJ04LkTf8GPsrxJnzW/5c
 6AwY83PwU9rodTsaB/ikKyc/o/hMEy3emkcgS7PBjy47QHQKZbSxZTZGcI2Sk/tWOoW8
 TWY17FOazS1ED9G4qLe/vwMlKmUeOZoNhvux7e37o0aWxBDZg8HfagrMVRviM1iZy3IB
 KBSxf9Xbaug8aGaC0mJ0jgGiLXAgSvkfY+yb/3IrYLnjK7mTwPrCyeVHINfdB839lEws
 MxPw==
X-Gm-Message-State: AOAM533Uigkni7xoC00VIs5p9TpzYDr03QcaQGGhMU/wWGl/RgRaUMTy
 QksaCC1zl/aQPuDWipQW034CwJLjCxaGkhGCLp5R1l93CfQ=
X-Google-Smtp-Source: ABdhPJzkJ0p0YYS9ZflUh9jGYrmogt5rxOjUJMxJJf96LA6FonDZUDNtoD1pgTQcDhJlQxMnIZ36OkJc+TL5n2hUco4=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr25724587qta.58.1646259409105; Wed, 02
 Mar 2022 14:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20220302173114.927476-1-clg@kaod.org>
 <20220302173114.927476-2-clg@kaod.org>
In-Reply-To: <20220302173114.927476-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Mar 2022 22:16:35 +0000
Message-ID: <CACPK8XcQfC6qfMDLzzLeK5BKmBnrspruvruJ9xGdydZgWefVOw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] mtd: spi-nor: aspeed: Rename Kconfig option
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
X-CRM114-CacheID: sfid-20220302_141651_225398_3FB7C075 
X-CRM114-Status: GOOD (  18.61  )
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
b3JnPiB3cm90ZToKPgo+IFRvIHByZXBhcmUgdHJhbnNpdGlvbiB0byB0aGUgbmV3IEFzcGVlZCBT
TUMgU1BJIGNvbnRyb2xsZXIgZHJpdmVyIHVzaW5nCj4gdGhlIHNwaS1tZW0gaW50ZXJmYWNlLCBj
aGFuZ2UgdGhlIGtlcm5lbCBDT05GSUcgb3B0aW9uIG9mIHRoZSBjdXJyZW50Cj4gZHJpdmVyIHRv
IHJlZmxlY3QgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gdXNlcyB0aGUgTVREIFNQSS1OT1IgaW50
ZXJmYWNlLgo+IE9uY2UgdGhlIG5ldyBkcml2ZXIgaXMgc3VmZmljaWVudGx5IGV4cG9zZWQsIHdl
IHNob3VsZCByZW1vdmUgdGhlIG9sZCBvbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExl
IEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKQXMgdGhlIG1haW50aWFuZXIgb2YgdGhlIGFzcGVlZCBz
eXN0ZW1zIGFuZCB0aGUgb3BlbmJtYyBrZXJuZWwsIEkKdGhpbmsgdGhpcyBtYWtlcyB0aGUgbW9z
dCBzZW5zZS4KClJldmlld2VkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgoKPiAt
LS0KPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnICB8IDIgKy0KPiAg
ZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZSB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnCj4gaW5kZXggNWMwZTBlYzJlNmQxLi44NzZhNDcw
NDJmZWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29u
ZmlnCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnCj4gQEAg
LTEsNSArMSw1IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+
IC1jb25maWcgU1BJX0FTUEVFRF9TTUMKPiArY29uZmlnIFNQSV9BU1BFRURfU01DX01URF9TUElf
Tk9SCj4gICAgICAgICB0cmlzdGF0ZSAiQXNwZWVkIGZsYXNoIGNvbnRyb2xsZXJzIGluIFNQSSBt
b2RlIgo+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX0FTUEVFRCB8fCBDT01QSUxFX1RFU1QKPiAg
ICAgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNICYmIE9GCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29udHJvbGxlcnMvTWFrZWZpbGUgYi9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
bnRyb2xsZXJzL01ha2VmaWxlCj4gaW5kZXggZTdhYmJhNDkxZDk4Li4xZTI4Mjk3ZmIxZTggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZQo+ICsr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvTWFrZWZpbGUKPiBAQCAtMSw1ICsx
LDUgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+IC1vYmotJChDT05G
SUdfU1BJX0FTUEVFRF9TTUMpICAgKz0gYXNwZWVkLXNtYy5vCj4gK29iai0kKENPTkZJR19TUElf
QVNQRUVEX1NNQ19NVERfU1BJX05PUikgICAgICAgKz0gYXNwZWVkLXNtYy5vCj4gIG9iai0kKENP
TkZJR19TUElfSElTSV9TRkMpICAgICArPSBoaXNpLXNmYy5vCj4gIG9iai0kKENPTkZJR19TUElf
TlhQX1NQSUZJKSAgICArPSBueHAtc3BpZmkubwo+ICBvYmotJChDT05GSUdfU1BJX0lOVEVMX1NQ
SSkgICAgKz0gaW50ZWwtc3BpLm8KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
