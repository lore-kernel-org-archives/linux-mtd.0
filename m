Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE4EA8116
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUPLIGRuWGSeNMDsUJXQ6Y3mm262Ai5TJzXDA/n1vy4=; b=HFOH15NTEKGR9P
	oQmBAqfRXklb2F1Wvzan8dw1QWJomkufTWdRei8CyaOiHNmsDqpB8XKne+kNsPq+mQwzONgWV8YgM
	CAwMPaLcOMY6IOHSNvF5r9b6eIIoGxweFKaxZjZX12hsjZOTsMxut/C2hIgeFVeHEYcKEytr0eLiy
	IlYD5S3AutylgxWwp1r9Z5sPMDAh6D9K6mp/q+Xsw3HYlA6D0TLZpIeKh7B0ezAyQX+J8+6Z1w8pt
	IYlWvE7JCX29LWih4bYdloERsHbt8mBsdoqbenejHs09AkBbNPKphLbouYCHTmdPyX+0kpPVtK9fe
	5TMDBDmaDCrvnDy0o+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo0K-0000000H0Dw-0DnT;
	Tue, 10 Feb 2026 13:42:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo0H-0000000H0CQ-1NkC
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 13:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDFC44560
	for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2026 13:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828ADC2BCB3
	for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2026 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730928;
	bh=KvCWqb2hqYTj26lrrDonWv4/5HcZhD/EcQOLJLovuUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=myUYicc/p3YYVczXMTgj6o6RxiHJ52msY1URNyD2WD8dKWIH+8EzynRC2t7e2pr5x
	 PeannzEm9qLGMN9F8WpoxokzBDYaV7JYTqXWPIcDWj42wEUCsh5f3gFly6h0BZ5rIx
	 7H8YlRHQbwVh84EH4nL9i1b18mPZruFQSFxlr0oVOpLqiXy3oUlrgzYbyZR3URHtvE
	 bvlBG2EfS6PLcQfdhuf1z2c9P6cVRoJS5XdH6opU8WNtH6u9lZD257uUVfJ4uCb+yx
	 6MsLCjmizr37jWfMrnrArF/xw9P1KS1bR42QKRWu6O/HqvFAJ+eYcb0XrwXPZQhRJT
	 oGwEpwq+8im5w==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so1130092a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2026 05:42:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4Fx0JxIKOWpqQCBNtJKOE6s1qVqQ+7F56PK3I3oDCV2A+baImx69j46Y59WhZ7ZQ6ykbaUAj7sw4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Qg2IXQVHB98kFBfcq3tl+LvSgRMA8kBwrYO0RlbYzE2zF6VE
	nVPDcVwOaWFrnT0y7C4xqz0BpmE21R3hqFBekXhc/b81VnGnGf7EzKa3u/gQgxIp2uA/eSM8Xfc
	AYKzKBf/DyAZHWUQ1sigytYnOjqejFA==
X-Received: by 2002:a50:c8c6:0:b0:65a:2903:3164 with SMTP id
 4fb4d7f45d1cf-65a2903460fmr254675a12.30.1770730926783; Tue, 10 Feb 2026
 05:42:06 -0800 (PST)
MIME-Version: 1.0
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com> <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Feb 2026 07:41:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
X-Gm-Features: AZwV_QhEv7cl8ZxKnJCe5nmdFpEiI7-_VBEnnhT0PzMh2ys-GVQbQoUyTL66giA
Message-ID: <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org, 
	matthias.bgg@gmail.com, julien.massot@collabora.com, eugen.hristev@linaro.org, 
	jiaxin.yu@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_054209_407390_8BBF42FB 
X-CRM114-Status: GOOD (  13.93  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNjo1NuKAr0FNIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vCjxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4g
QWRkIHN1cHBvcnQgZm9yIHRoZSBtZWRpYXRlayxtdDgxOTItYXVkc3lzIGNvbXBhdGlibGUsIHdo
aWNoIHVzZXMKPiBhIGRpZmZlcmVudCBhdWRpbyBjb250cm9sbGVyIChtdDgxOTItYWZlLXBjbSkg
Y29tcGFyZWQgdG8gbXQ4MTgzCj4gYW5kIG10MjcwMS4KPgo+IFRoaXMgcmVzb2x2ZXMgYSBkdGJz
X2NoZWNrIHdhcm5pbmcgb24gYWxsIE1UODE5MiBkZXZpY2V0cmVlcy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXVkc3lz
LnlhbWwgICAgICAgICB8IDQ2ICsrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXVkc3lz
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21l
ZGlhdGVrLGF1ZHN5cy55YW1sCj4gaW5kZXggZjNhNzYxY2JkMGZkLi4wOWE2YzE2ZTdlODIgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRl
ay9tZWRpYXRlayxhdWRzeXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXVkc3lzLnlhbWwKPiBAQCAtNDgsMTkgKzQ4
LDM5IEBAIHJlcXVpcmVkOgo+ICAgIC0gY29tcGF0aWJsZQo+ICAgIC0gJyNjbG9jay1jZWxscycK
Pgo+IC1pZjoKPiAtICBwcm9wZXJ0aWVzOgo+IC0gICAgY29tcGF0aWJsZToKPiAtICAgICAgY29u
dGFpbnM6Cj4gLSAgICAgICAgY29uc3Q6IG1lZGlhdGVrLG10ODE4My1hdWRpb3N5cwo+IC10aGVu
Ogo+IC0gIHByb3BlcnRpZXM6Cj4gLSAgICBhdWRpby1jb250cm9sbGVyOgo+IC0gICAgICAkcmVm
OiAvc2NoZW1hcy9zb3VuZC9tZWRpYXRlayxtdDgxODMtYXVkaW8ueWFtbCMKPiAtZWxzZToKPiAt
ICBwcm9wZXJ0aWVzOgo+IC0gICAgYXVkaW8tY29udHJvbGxlcjoKPiAtICAgICAgJHJlZjogL3Nj
aGVtYXMvc291bmQvbWVkaWF0ZWssbXQyNzAxLWF1ZGlvLnlhbWwjCj4gK2FsbE9mOgo+ICsgLSBp
ZjoKCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssYXVkc3lzLnlhbWw6NTI6MjoKW3dhcm5pbmddIHdyb25nIGluZGVudGF0aW9uOiBleHBlY3Rl
ZCAyIGJ1dCBmb3VuZCAxIChpbmRlbnRhdGlvbikKCgo+ICsgICAgIHByb3BlcnRpZXM6Cj4gKyAg
ICAgICBjb21wYXRpYmxlOgo+ICsgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICBlbnVt
Ogo+ICsgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDI3MDEtYXVkc3lzCj4gKyAgICAgICAgICAg
ICAtIG1lZGlhdGVrLG10NzYyMi1hdWRzeXMKPiArICAgdGhlbjoKPiArICAgICBwcm9wZXJ0aWVz
Ogo+ICsgICAgICAgYXVkaW8tY29udHJvbGxlcjoKPiArICAgICAgICAgJHJlZjogL3NjaGVtYXMv
c291bmQvbWVkaWF0ZWssbXQyNzAxLWF1ZGlvLnlhbWwjCj4gKwo+ICsgLSBpZjoKPiArICAgICBw
cm9wZXJ0aWVzOgo+ICsgICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgY29udGFpbnM6Cj4g
KyAgICAgICAgICAgY29uc3Q6IG1lZGlhdGVrLG10ODE4My1hdWRpb3N5cwo+ICsgICB0aGVuOgo+
ICsgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICBhdWRpby1jb250cm9sbGVyOgo+ICsgICAgICAg
ICAkcmVmOiAvc2NoZW1hcy9zb3VuZC9tZWRpYXRlayxtdDgxODMtYXVkaW8ueWFtbCMKPiArCj4g
KyAtIGlmOgo+ICsgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICBjb21wYXRpYmxlOgo+ICsgICAg
ICAgICBjb250YWluczoKPiArICAgICAgICAgICBjb25zdDogbWVkaWF0ZWssbXQ4MTkyLWF1ZHN5
cwo+ICsgICB0aGVuOgo+ICsgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICBhdWRpby1jb250cm9s
bGVyOgo+ICsgICAgICAgICAkcmVmOiAvc2NoZW1hcy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1s
Iwo+ICsKPgoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9t
ZWRpYXRlayxhdWRzeXMueWFtbDo4NDoxOgpbd2FybmluZ10gdG9vIG1hbnkgYmxhbmsgbGluZXMg
KDIgPiAxKSAoZW1wdHktbGluZXMpCgpQbGVhc2UgZml4IGFzIHRoZXNlIGFyZSB3YXJuaW5ncyBp
biBsaW51eC1uZXh0IG5vdy4KCgo+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPgo+IC0t
Cj4gMi41Mi4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
