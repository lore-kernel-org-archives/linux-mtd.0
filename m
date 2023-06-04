Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41DBC7EE23
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Jun 2023 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2lxAvrKswsPHP1cp8zttRyYCqRk3GKd9k7OTHAtXJg=; b=ABZFITDehoSvMI
	oRU34GqLTX9SsPY/oYqUIoJo1fXKGImxWedPQ3XiwG52tzwhBlWoBhovLDRJ7tJY5xoF1Uughvbcl
	OBJNtAElQJ5u5DN5n1pNpwplW83uQx9YISADio4q7dr82GbMb49gy7ylkCm1tdMx+le+LkoKb5mrj
	t/CHvmu+bFP2fuEGX2iVXWf53ob+fQDgF/DmEQ6pZN04OV8DGGyvM2kmkevLdv6xZoBAfd0O4TWYh
	UJyJ38cGKE6ODQ/J+UUPHR8pDyoUPLnFYRKvbiYbsGt/bpMBhTGRtxLI9j86iN01aJzyoVklSFW/9
	u3aew7WQFVo7rCwVp31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lyk-00C2bb-31;
	Sun, 04 Jun 2023 11:32:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lyg-00C2b4-1x
	for linux-mtd@lists.infradead.org;
	Sun, 04 Jun 2023 11:32:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8251761191
	for <linux-mtd@lists.infradead.org>; Sun,  4 Jun 2023 11:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1969CC4339B
	for <linux-mtd@lists.infradead.org>; Sun,  4 Jun 2023 11:32:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kxcwvAk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1685878368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTuf2rgjmV4Fdkx6etCDTqwKm6goZ6ExDKto19ioKrY=;
	b=kxcwvAk6ZhLMTGt4xW1W0HL4JjRkvZ5BzmNOAQufn95Xoa7HE/qHMkaGZ2K93aEFh0CO93
	qcGdkOHKv9G3cg8dw31HZ/DawpjEWgksauTaPYAk6UCJid5X36bNDghOEOrAYZ0udfAxbE
	iq7oeT67NFSn/JJpk1UfpWBEv/TfYMo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1a4233f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-mtd@lists.infradead.org>;
	Sun, 4 Jun 2023 11:32:47 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7841dc9871dso2667320241.0
        for <linux-mtd@lists.infradead.org>; Sun, 04 Jun 2023 04:32:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDwPeoNE0xVQ5P6KBkoNkWCvfYNgobfZVLdS3KYRMVynBDVijE7t
	qooTkTb2OdTCS1f2sRnuFlSbemDvcLwmEpBSXCc=
X-Google-Smtp-Source: ACHHUZ7jC4lQ5HH2Nicf9QR7BEd/tgyg0hbJkyNGzxF+y9OwOjMjVu3P5YgfWOr/qGNkWDVzdlPDVP1wDmlG3VzawvE=
X-Received: by 2002:a05:6102:f85:b0:439:3e26:990e with SMTP id
 e5-20020a0561020f8500b004393e26990emr3621361vsv.6.1685878366380; Sun, 04 Jun
 2023 04:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230603183159.3566505-1-linus.walleij@linaro.org>
In-Reply-To: <20230603183159.3566505-1-linus.walleij@linaro.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Jun 2023 13:32:35 +0200
X-Gmail-Original-Message-ID: <CAHmME9r7kk89qX0Q86byD+RTfqp82Qop9srtymw7t5riS4GZmw@mail.gmail.com>
Message-ID: <CAHmME9r7kk89qX0Q86byD+RTfqp82Qop9srtymw7t5riS4GZmw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: otp: Put factory OTP/NVRAM into the entropy pool
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_043254_999261_728BAAFD 
X-CRM114-Status: GOOD (  30.57  )
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

T24gU2F0LCBKdW4gMywgMjAyMyBhdCA4OjMy4oCvUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoZSBmYWN0b3J5IE9UUCwgaWYgc3VwcG9ydGVk
LCBjb250YWlucyBmYWN0b3J5LXByb2dyYW1tZWQKPiBpbmZvcm1hdGlvbiBzdWNoIGFzIHR5cGlj
YWxseSB0aGUgc2VyaWFsIG51bWJlciBvciBwcm9kdWN0aW9uCj4gd2VlayBmb3IgdGhlIGNoaXAu
Cj4KPiBBcyB0aGlzIGlzIGRldmljZS11bmlxdWUgaW5mb3JtYXRpb24sIHN1Ym1pdCBpdCBpbnRv
IHRoZQo+IHN5c3RlbSBlbnRyb3B5IHBvb2wuCj4KPiBUaGlzIGRvZXMgbm90IGNvdW50IGFzIGlt
cHJvdmVtZW50IG9mIHRoZSBlbnRyb3B5IGFzIHN1Y2gKPiBidXQgaW4gcHJhY3RpY2UgaXQgbWFr
ZXMgaXQgYSBiaXQgbW9yZSByYW5kb20gdG8gbWl4IGluIHRoZXNlCj4gbnVtYmVycy4KPgo+IENj
OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+IEFja2VkLWJ5OiBKYXNvbiBBLiBE
b25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0tCj4gQ2hhbmdlTG9nIHYxLT52MjoKPiAt
IERyb3AgdGhlIGNvbmRpdGlvbmFsIHRvIHJldHVybiBhcyBtYW55IGJ5dGVzIGFzIHJlcXVlc3Rl
ZAo+ICAgdG8gYWRkIHRoZSBPVFAgdG8gdGhlIGVudHJvcHkgcG9vbDogaXQgZG9lc24ndCBtYXR0
ZXIKPiAgIHdoYXRzb2V2ZXIgaW4gdGhpcyBjYXNlLgo+IC0gQ29sbGVjdGVkIEphc29uJ3MgQUNL
Lgo+Cj4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBwYXRjaCBJIG1hZGUgdG8gYWRkIE1NQy9TRC1j
YXJkIHNlcmlhbAo+IG51bWJlcnMgdG8gcmFuZG9tbmVzcywganVzdCB3aXRoIHJhdyBOT1IgZmxh
c2guCj4gLS0tCj4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyB8IDE5ICsrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCA2MDY3
MGIyZjcwYjkuLmQwMzQxMmE4MjU0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAj
aW5jbHVkZSA8bGludXgvaWRyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9iYWNraW5nLWRldi5oPgo+
ICAjaW5jbHVkZSA8bGludXgvZ2ZwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yYW5kb20uaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgo+ICAj
aW5jbHVkZSA8bGludXgvbGVkcy5oPgo+IEBAIC05NjYsNiArOTY3LDI0IEBAIHN0YXRpYyBpbnQg
bXRkX290cF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gICAgICAgICAgICAgICAg
IH0KPgo+ICAgICAgICAgICAgICAgICBpZiAoc2l6ZSA+IDApIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIFRoZSBmYWN0b3J5IE9UUCBj
b250YWlucyB0aGluZyBzdWNoIGFzIGEgdW5pcXVlIHNlcmlhbAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAqIG51bWJlciBhbmQgaXMgc21hbGwsIHNvIGxldCdzIHJlYWQgaXQgb3V0IGFuZCBw
dXQgaXQKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpbnRvIHRoZSBlbnRyb3B5IHBvb2wu
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqb3RwOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBvdHAgPSBrbWFsbG9jKHNp
emUsIEdGUF9LRVJORUwpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghb3RwKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZXJyID0gbXRkX252bWVtX2ZhY3Rfb3RwX3JlZ19yZWFkKG10ZCwgMCwg
b3RwLCBzaXplKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyIDwgMCkgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWUob3RwKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
fQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFkZF9kZXZpY2VfcmFuZG9tbmVzcyhvdHAsIHNp
emUpOwoKTXkgc3VnZ2VzdGlvbiB3YXMgdG8gdXNlIGBlcnJgIGhlcmUsIG5vdCBgc2l6ZWAuIEJ1
dCBpdCdzIG5vdCBsaWtlIGl0CnJlYWxseSBtYXR0ZXJzIG11Y2ggZWl0aGVyIHdheS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
