Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1833C5AE49
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8HKr2zX7MFVMnecbZPNzklsAIdHPmwvay6AlnauAH8=; b=CCywoviLeAZseG
	CIrq8q3wpvv2Veb1ep9W2wHBJO5jZv7APXkjdURZkxFKwNd+Dbq4opZuNQLBB2n3qzCg4a/1MRodu
	kH1VVddT8ChQhZ4C7uF68Dr+8cHQz8hOrDXZ78I1dETIJLlM+tcLxGmf/kvePK9np4e86fqMOFhlo
	22ObqpBz6mqjghBLnFxx8eLfnK6mwF/aoIkM+HKBGxqYzaOs9BoCBO8dgYq3Jqsmsw4Tvp9RcMaoX
	gEp55LVxFPJAMEGFp8TOo/lOyLhxyK2VuutO0Epm2wI8kUGhZvCFgh4luxPt2GgDpwH20rfiZmC5o
	LqUXa4qsX6FvZbvv3xHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQdt-0000000BxBc-39ca;
	Mon, 10 Aug 2026 14:06:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQdp-0000000BxAb-2vf4;
	Mon, 10 Aug 2026 14:06:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 332781A153C;
	Mon, 10 Aug 2026 14:06:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04E596033B;
	Mon, 10 Aug 2026 14:06:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF18F11C4A82D;
	Mon, 10 Aug 2026 16:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786370768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CvM3MTmlrFxN3QrG/GnOK9O/WjcLd399D+a1DSfnP44=;
	b=sOj3nodO6jx41/2DNx2k4PciPwaiWzQV9MwLm1ov+xDgDV1DNDjN66VbS6IReNs6nrXycZ
	hgj71e3rCeJTMAaaIoCHTgjMYH+Jt++u/eWRWlswU2SlpnylYQ3IGJagrRGLpmsHJLBphv
	VlyMrkiwL9vuX001v2/SCfGZ71zxLsqD09o++95HNiK3bZc2UGhkgoRLsELcX17ATxr3DX
	uFQwVc3nMa3oLx3KbhFeIXhHQMLlGu5rEgS9yqJ/01HiZ2TkFZtybkqsZX/2NT9FXI2jYZ
	DO1pFXFkiUI3lH0XSyMhxdWBvx4JX9jAOa2latSKIuF2l3IYqy95rUAHF2yeRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Steam Lin" <STLin2@winbond.com>,  "Hsin-Yi
 Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
In-Reply-To: <DKL2WROHNLXJ.3239EBUTVXRQL@kernel.org> (Michael Walle's message
	of "Mon, 10 Aug 2026 09:18:07 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com>
	<87se4rem0l.fsf@bootlin.com> <DKL2WROHNLXJ.3239EBUTVXRQL@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 16:05:59 +0200
Message-ID: <875x1iqddk.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070613_878247_0F35FBDC 
X-CRM114-Status: GOOD (  23.25  )
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

T24gMTAvMDgvMjAyNiBhdCAwOToxODowNyArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUgQXVnIDYsIDIwMjYgYXQgOTozOCBBTSBDRVNULCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIZWxsbyBNaWNoYWVsLAo+Pgo+Pj4+IE9uZSB0aGluZyB0
aGF0IGNvbWVzIHRvIG1pbmQgaXMgaGFyZHdhcmUgd3JpdGUgcHJvdGVjdGlvbi4gSWYKPj4+PiB0
aGVyZSdzIG5vdGhpbmcgYmVmb3JlIHRoYXQgY29kZSB3aGljaCBjaGVja3MgaXQsIHRoZSB2ZXJp
ZnkgbWlnaHQKPj4+PiBmYWlsIGlmIHRoZSBoYXJkd2FyZSB3cml0ZSBwcm90ZWN0aW9uIGlzIGVu
YWJsZWQuIFNvIHdlIHNob3VsZAo+Pj4+IHNvbWVob3cgY2hlY2sgZm9yIHRoYXQgYW5kIGRyb3Ag
dGhlIHZlcmlmeSBoZXJlLgo+Pj4KPj4+IEJ1dCBob3cgZG8geW91IHRoaW5rIHdlIHNob3VsZCBo
YW5kbGUgaXQ/IFdpbGwgdGhlIFFFIGJpdCB3cml0aW5nCj4+PiB2ZXJpZmljYXRpb24gZmFpbCBp
ZiBIVyBXUCBpcyBlbmFibGVkPwo+Cj4gSXQgc2hvdWxkLCBiZWNhdXNlIHlvdSBjYW5ub3QgYWx0
ZXIgdGhlIFNSLgo+Cj4+IExvb2tpbmcgaW50byB0aGlzIGZ1cnRoZXI6IHdlIHNoYWxsIHJldHVy
biBhbiBlcnJvciBpZiB0aGUgUUUgYml0IGlzIG5vdAo+PiBzZXQuIEl0IGp1c3QgdGVsbHMgdGhl
IGNhbGxlciB0aGF0IHF1YWQgbW9kZSBjYW5ub3QgYmUgdXNlZC4gVGhlbiB1cCB0bwo+PiB0aGUg
Y2FsbGVyIHRvIGVpdGhlciBoYXJkIGZhaWwgb3IganVzdCBkZWdyYWRlIGludG8gc2luZ2xlIG1v
ZGUgKG1heWJlCj4+IGJlY2F1c2Ugb2YgYSBzdHJhcHBlZCBXUCkuIFdoYXQgd2Ugc2hvdWxkIGRv
IGlzIHRvIHByb3Bvc2UgYSBEVCBwcm9wZXJ0eQo+PiB0byBmbGFnIHdoZW4gV1AgaXMgc3RyYXBw
ZWQgaW4gaGFyZHdhcmUsIHRoaXMgd291bGQgbWFrZSB0aGUgY29udGVudCBvZgo+PiB0aGUgc3Rh
dHVzIHJlZ2lzdGVycyBpbW11dGFibGUgYW5kIHdlIHdvdWxkIGp1c3Qgc2tpcCB0aGUgZW50aXJl
IHdyaXRlCj4+IG9wZXJhdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UsIGluc3RlYWQgb2YgZGVsaWJl
cmF0ZWx5IHRyeWluZyBhbmQgZ2V0IGEKPj4gMTAwJSBmYWlsdXJlIHJhdGUuIE5ldmVydGhlbGVz
cywgdGhlIGNoYW5nZXMgaW50cm9kdWNlZCBoZXJlIGFyZSBraW5kIG9mCj4+IG9ydGhvZ29uYWwg
YW5kIGRvIG5vdCBhbHRlciB0aGUgY3VycmVudCBiZWhhdmlvdXI7IHdlIHNoYWxsIGhvd2V2ZXIK
Pj4gbGlzdGVuIGlmIHBlb3BsZSBzdGFydCBjb21wbGFpbmluZyBhYm91dCB0aGlzIGFuZCBwZXJo
YXBzIGltcGxlbWVudCB0aGUKPj4gc29sdXRpb24gcHJvcG9zZWQgYWJvdmUuCj4KPiBUaGVyZSBp
cyBhbHJlYWR5IGEgcHJvcGVydHkgaW4gdGhlIERULCB3aGVyZSB5b3UgYWxtb3N0IGNlcnRhaW5s
eQo+IGtub3cgdGhhdCBxdWFkIG1vZGUgaXMgaW1wb3NzaWJsZS4gSWZmIHRoZXJlIGFyZSBmb3Vy
IHJ4L3R4IGxpbmVzCj4gKHNwaS17cngsdHh9LWJ1cy13aWR0aCkuIEkgaGF2ZW4ndCBzZWVuIGEg
Zmxhc2ggKGV2ZW4gaW4gbGFyZ2VyCj4gcGFja2FnZXMpIHdoZXJlIHRoZXJlIGlzIGEgZGVkaWNh
dGVkIFdQIyBwaW4uCj4KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IGEgZHQgcHJvcGVydHk/IElmICgx
KSB0aGUgZmxhc2ggaXMgdXNpbmcgdGhlIFdQIwo+IHBpbj8gT3IgKDIpIGlmIGl0IGlzIHVzaW5n
IHRoZSBXUCMgcGluIGFuZCBpdCdzIHRpZWQgdG8gbG93Pwo+Cj4gRm9yICgxKSB5b3UgaGF2ZSB0
aGUgUUUgYml0LCBpZiBpdCdzIHNldCwgV1AgaXMgdHVybmVkIG9mZiBhbmQgdmljZQo+IHZlcnNh
Lgo+Cj4gRm9yICgyKSwgdGhhdCBkb2Vzbid0IG1ha2Ugc2Vuc2UsIGJlY2F1c2UgdGhhdCBwaW4g
Y291bGQgYmUgdGllZAo+IHRvIHNvbWUga2luZCBvZiBsb2dpYyB3aGljaCBjYW4gY2hhbmdlIGR1
cmluZyBydW50aW1lLgo+Cj4gRldJVywgSSBkb24ndCBjYXJlIHRvbyBtdWNoLCB5b3UndmUgYXNr
ZWQgd2h5IHRoZXJlIGlzIGEKPiB2ZXJpZmljYXRpb24gc3RlcCwgSSd2ZSBqdXN0IGFuc3dlcmVk
IDopCgpUaGFuayB5b3UgOikgQW55d2F5LCBJJ3ZlIHJlaW5zdGF0ZWQgdGhlc2UgY2hlY2tzIGlu
IG15IGxhc3QgdmVyc2lvbi4KCklmIHlvdSBsb29rIGF0IGl0LCBkb24ndCBmb2N1cyBvbiB0aGUg
Y29tbWl0IGFib3V0IHRoZSBuYW1lcywgSSBuZWVkIHRvCmZpeCB0aGF0IHVwIGFnYWluIGJ5IGFk
ZGluZyBzb21lIGtpbmQgb2YgImhpZGUiIGZsYWcgZm9yIHRoZSBSViBjaGlwcywKaW5zdGVhZCBv
ZiBkcm9wcGluZyB0aGUgbmFtZXMgKHRoZSByZXN0IHdvbid0IGNoYW5nZSBtdWNoKS4KClRoYW5r
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
