Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5486D37E37
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jan 2026 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YFv+4ntJ5ybXQpyC7NPXf+7tP/4KSGelZDov1JSlPc=; b=a33VbKQtc8BEUZ
	ZTBxLErHinPtHQzfIlsR/VMYhxue7nCPz7GqAT53hvtgNDlP2DsJ1r9+BEQanD8jjyYOJpoQnrN73
	iXtfNYbip8bBTM/ec46Byu1lQxx88tw4rLQkpU0rJX5LQWCCmgOiNUCVXwHoUodPEEJtiQUB8Ji5G
	bxbjWh3LR9s2eE6C6xgbP+yncJQpD/fVFo4kYNoRM9a7az3zeSWaswJKqSvQkfXA3L4CPMaw2Qxh5
	GkeE2lHtiIFCxMXBY9oo7zZObBzoZ7z30/wHt80FKhbys9R9LLdBk0jvm/qZZb81kguU9F3JNNoCe
	8wWlpFvNWMxQgXcKRekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Od-00000009Qho-3mIW;
	Wed, 14 Jan 2026 13:58:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1Oa-00000009Qg2-1Rkv
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jan 2026 13:58:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9263D4E420D5;
	Wed, 14 Jan 2026 13:58:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 642E06074A;
	Wed, 14 Jan 2026 13:58:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03BC910B6824C;
	Wed, 14 Jan 2026 14:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768399122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YNjffRp1/8+T59mlTHNitsw61Xuht8VMpF+gPH6kU5M=;
	b=RbaU2diT+2o3nYB+qso994IAQmLHQwmq2nb5Cm1S9sWjjd2N+g9lyE1PdQq6qr2dcnN0K+
	PjOdZ5IKST7oHXinJnIYyn3PT3yAmfDlxk/9qYNbc9iDtqTCVRS6fWWHoUIdMrTENH2zjl
	L6IGjRDuGzHQspn8gMkoYiQbyQwNaY+YI+uTmwQ/yrdrAdN6NH6phsf22oGnt1p5aoI4C7
	/Wo6Inw3e8tZA+sijnhWDwdmRU52crDrkE9NfW8byUv1DZFjaTRGmJruYxeij3y3CNxyTk
	RfRlF6UmoxshF9bek40/kEqIDjKA0QoSRep7ESTW522/Zx/K6pqUADvOErmXoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Brian Norris <computersforpeace@gmail.com>,
  Kamal Dasu <kdasu.kdev@gmail.com>,  William Zhang
 <william.zhang@broadcom.com>,  Nick Terrell <terrelln@fb.com>,  David
 Sterba <dsterba@suse.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Simon Glass
 <sjg@chromium.org>,  Linus Walleij <linusw@kernel.org>,  Ulf Hansson
 <ulf.hansson@linaro.org>,  Marcus Folkesson <marcus.folkesson@gmail.com>,
  Tony Lindgren <tony@atomide.com>,  Roger Quadros <rogerq@kernel.org>,
  Hauke Mehrtens <hauke@hauke-m.de>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mmc@vger.kernel.org
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node
 properties are documented
In-Reply-To: <CAL_JsqKV+3ZnqpbQ4USmJh-dngik_jZdnpOw0bGcxD0RSSzfxA@mail.gmail.com>
	(Rob Herring's message of "Fri, 9 Jan 2026 18:34:17 -0600")
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
	<20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org>
	<87fr8fxipc.fsf@bootlin.com>
	<CAL_JsqKV+3ZnqpbQ4USmJh-dngik_jZdnpOw0bGcxD0RSSzfxA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 14 Jan 2026 14:58:35 +0100
Message-ID: <87ms2gwb1w.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_055848_542661_7F337102 
X-CRM114-Status: GOOD (  17.61  )
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

SGkgUm9iLAoKPj4gPiArJGRlZnM6Cj4+ID4gKyAgcGFydGl0aW9uLW5vZGU6Cj4+ID4gKyAgICB0
eXBlOiBvYmplY3QKPj4gPiArICAgIGlmOgo+PiA+ICsgICAgICBub3Q6Cj4+ID4gKyAgICAgICAg
cmVxdWlyZWQ6IFsgY29tcGF0aWJsZSBdCj4+ID4gKyAgICB0aGVuOgo+PiA+ICsgICAgICAkcmVm
OiAnIycKPj4gPiArICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+PiA+ICsgICAg
ZWxzZToKPj4gPiArICAgICAgJHJlZjogJyMnCj4+Cj4+IFRoaXMsIGhvd2V2ZXIsIGlzIHRvdGFs
IGJsYWNrbWFnaWMgdG8gbWUuIFdvdWxkIHlvdSBtaW5kIGV4cGxhaW5pbmcgd2hhdAo+Pgo+PiAg
ICAgICAkcmVmOiAnIycKPj4KPj4gaW5kaWNhdGVzPyBJcyB0aGlzIGEgcGxhY2Vob2xkZXIgaW5k
aWNhdGluZyAiYSByZWZlcmVuY2UgbXVzdCBiZSBnaXZlbj8KPgo+IEl0J3Mgd2hhdCdzIGtub3du
IGFzIEpTT04gcG9pbnRlcnMuIFRoZSAnIycgaXMgYSByZWZlcmVuY2UgdG8gdGhlIHRvcAo+IGxl
dmVsIG9mIHRoaXMgc2NoZW1hLgo+Cj4+IEFsc28gSSBkbyBub3QgdW5kZXJzdGFuZCB0aGUgZmlu
YWwgZWxzZSBjYXNlLCB3aGF0IGlzIGl0IGNvdmVyaW5nPwo+Cj4gSXQncyByZWFsbHkganVzdCB0
aGVyZSBzbyBhICRyZWYgdG8KPiBwYXJ0aXRpb24ueWFtbCMvJGRlZnMvcGFydGl0aW9uLW5vZGUg
YXBwbGllcyB0aGUgc2NoZW1hIChhbGwgb2YKPiBwYXJ0aXRpb24ueWFtbCkgd2hldGhlciB0aGVy
ZSdzIGEgY29tcGF0aWJsZSBwcm9wZXJ0eSBvciBub3QuCj4KPiBUaGlzIGFsbCBqdXN0IHdvcmtz
IGFyb3VuZCB0aGF0IGEgc2NoZW1hIGxpa2UgdGhpcyBkb2Vzbid0IHdvcms6Cj4KPiAkcmVmOiBm
b28ueWFtbAo+IGlmOgo+ICAgLi4uCj4gdGhlbjoKPiAgIHVuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UKPgo+IFRoZSBldmFsdWF0aW9uIG9mIHVuZXZhbHVhdGVkUHJvcGVydGllcyBkb2Vzbid0
ICJzZWUiIHRoZSAkcmVmIGJlaW5nCj4gaW4gdGhlIHBhcmVudC4gU28gd2UgY2FuJ3QgZmFjdG9y
IG91dCB0aGUgJHJlZi4KCk9vb2gsIG9rLCBmdWxseSB1bmRlcnN0b29kLiBJIHRoaW5rIEkgYWxy
ZWFkeSBmYWNlZCB0aGF0IHByb2JsZW0KYmVmb3JlLiBGaXJzdCB0aW1lIEkgaGVhciBhYm91dCBK
U09OIHBvaW50ZXJzLCB0aGFua3MgYSBsb3QgZm9yIHRoZQpoZWFkcyB1cC4KClJlZ2FyZGluZyB0
aGlzIHNlcmllcywgaXQgZmVlbHMgbGlrZSBpbiB0aGUgZW5kLCBpZiBJIHVuZGVyc3Rvb2QgdGhl
CmRpc2N1c3Npb24gd2l0aCBLcnp5c3p0b2YgY29ycmVjdGx5LCB0aGVyZSBpcyBubyBtb2RpZmlj
YXRpb24gdG8gYnJpbmc/CkxldCBtZSBrbm93IGlmIHlvdSBwbGFuIG9uIHNlbmRpbmcgYSB2MiBv
ZiBpZiBJIHNoYWxsIHRha2UgdjEgb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
