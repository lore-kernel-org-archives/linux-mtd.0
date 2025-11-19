Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB53ECF3182
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/zHRGa8IZpEw7diGSQNbsm2FQ9kSUPXdSIWPSH6lOM=; b=YRXkryVhmyuVsC
	4v4F6MEu48ALT5K/QsqYudFLSyErz1sdvewUDGFPe0I+ETOQe0xlvN0LlnXGocgXMYoCFlbQjPmk7
	ns3HjIpylz9ugBpwUtaiywMNCBfPOyCllSFpedV1//YG+FsvH70zC/cyaKOoQNit4qVaADmd9Tv9x
	mT562PVLIjoc1bKFfvNZODfX3RmHJw4BQXjyXJecG1kA1keEvTRciP6Xi4Jm5hJNrIA3UWUpcfJlF
	nvEfTl8CAIS05uQqWpBI6fNOZFtoKnVO0w9q6z0nB271qQtdqZzL0uRa3k/aA3sS/7GzjpYyeF904
	toKd9gKEWWd0JvEMEhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeKf-00000002qph-38OP;
	Wed, 19 Nov 2025 09:18:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeKb-00000002qnp-0tEE
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 09:18:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74C0A1A1BD0;
	Wed, 19 Nov 2025 09:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A48460721;
	Wed, 19 Nov 2025 09:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A1E4103719DE;
	Wed, 19 Nov 2025 10:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763543906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qaMenLfvLw2Uad2z/52NeS/7HGvf+XS4cn22Ov6FPYo=;
	b=HIETclIQRdK5ecv2f7KZjGW7UMNfFdmXCTTW//dK0HO4dNTFVk/YjZWHf8MwXbmksy9hb3
	YjkfJI/n4D7bG1i+M249qqhCqM/yHTRj/uUrZB39zINJad8auuoeffM6efrptLnjmDI/XP
	E5SZ2oHX+Ivv6bcitYM2Y1LGE5O1tco+3sATiJh4qIBgWyyWGwbu7vz3z5AhRBzAdJU7wI
	+w1F2efBL7j0H9BYhdXumJ3DUHc7pzjzcRzbN5jEqmgWc9dib7j6spckkm4UYX6xB5LksZ
	YuJaNTKNCuUTs6LroZRg1QWa4fNVOf07jk4FJyr3d+wKRjbdpim0URDZVokr2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Jonathan Corbet" <corbet@lwn.net>,
  "Sean Anderson" <sean.anderson@linux.dev>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 06/19] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
In-Reply-To: <DEBQ9IUDZJ7T.33VMFGMNKPEUY@kernel.org> (Michael Walle's message
	of "Tue, 18 Nov 2025 10:53:42 +0100")
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
	<20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>
	<DEBQ9IUDZJ7T.33VMFGMNKPEUY@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 10:18:23 +0100
Message-ID: <875xb6e5y8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_011829_393842_306627DF 
X-CRM114-Status: GOOD (  19.62  )
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

T24gMTgvMTEvMjAyNSBhdCAxMDo1Mzo0MiArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgTm92IDE0LCAyMDI1IGF0IDY6NTMgUE0gQ0VULCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBBZGQgY29tbWVudHMgYWJvdXQgaG93IHRoZXNlIHJlcXVl
c3RzIGFyZSBhY3R1YWxseSBoYW5kbGVkIGluIHRoZSBTUEkKPj4gTk9SIGNvcmUuIFRoZWlyIGJl
aGF2aW91ciB3YXMgbm90IGVudGlyZWx5IGNsZWFyIHRvIG1lIGF0IGZpcnN0LCBhbmQKPj4gZXhw
bGFpbmluZyB0aGVtIGluIHBsYWluIEVuZ2xpc2ggc291bmRzIHRoZSB3YXkgdG8gZ28uCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9zd3AuYyB8IDggKysrKysrKysKPj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivc3dwLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3N3cC5jCj4+IGluZGV4IDli
YzVhMzU2NDQ0NjY1YWQ4ODI0ZTllMTJkNjc5ZmQ1NTFiM2U2N2QuLmVkZTAzZjI2ZGUzYzY1ZmY1
M2MxY2I4ODhjMmM0M2FlYTI2OGI4NWEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3dwLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zd3AuYwo+PiBAQCAtMzQxLDYg
KzM0MSwxNCBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfc3JfaXNfbG9ja2VkKHN0cnVjdCBzcGlfbm9y
ICpub3IsIGxvZmZfdCBvZnMsIHU2NCBsZW4pCj4+ICAJcmV0dXJuIHNwaV9ub3JfaXNfbG9ja2Vk
X3NyKG5vciwgb2ZzLCBsZW4sIG5vci0+Ym91bmNlYnVmWzBdKTsKPj4gIH0KPj4gIAo+PiArLyoK
Pj4gKyAqIFRoZXNlIGlvY3RscyBiZWhhdmUgYWNjb3JkaW5nIHRvIHRoZSBmb2xsb3dpbmcgcnVs
ZXM6Cj4+ICsgKiAtPmxvY2soKTogTmV2ZXIgbG9ja3MgbW9yZSB0aGFuIHdoYXQgaXMgcmVxdWVz
dGVkLCBpZS4gbWF5IGxvY2sgbGVzcwo+Cj4gVGhhdCBiZWhhdmlvciBzb3VuZHMgc28gd3Jvbmcu
Li4gVGhlIHVzZXIgcmVxdWVzdHMgYSByZWdpb24gdG8gYmUKPiBsb2NrZWQsIGFuZCBpdCBpc24n
dCBhY3R1YWxseSBsb2NrZWQuCgpBZ3JlZWQuIEkgcmVhbGx5IGdvdCBwdXp6bGVkIGJ5IHRoYXQu
Cgo+PiArICogLT51bmxvY2soKTogTmV2ZXIgdW5sb2NrcyBtb3JlIHRoYW4gd2hhdCBpcyByZXF1
ZXN0ZWQsIGllLiBtYXkgdW5sb2NrIGxlc3MKPgo+IFRoYXQgc2VlbXMgc29tZXdoYXQgc2FuZS4K
Pgo+IE1heWJlIHdlIHNob3VsZCByZXR1cm4gLUVJTlZBTCBpZiBvZnMgb3Igb2ZzK2xlbiBhcmVu
J3QgYXQgc2VjdG9yCj4gYm91bmRhcmllcy4gWWVhaCBpdCdzIGEgY2hhbmdlIGluIHRoZSBVQVBJ
LCBidXQgSSdtIG5vdCBzdXJlIHRoZQo+IGN1cnJlbnQgYmVoYXZpb3IgaXMgbm90IGhhcm1mdWwg
YW5kIG1pc2xlYWRpbmcuCgpJIHdvdWxkIGV2ZW4gZ28gZnVydGhlciBhbmQgcHJvcG9zZSB0byBy
ZXR1cm4gLUVJTlZBTCB3aGVuZXZlciB0aGUKcmVxdWVzdCBpcyBub3QgZXhhY3RseSBkb2FibGUu
IEJlaW5nIGF0IGEgYmxvY2sgYm91bmRhcnkgaXMgbm90IGVub3VnaCwKYXMgdGhlcmUgYXJlIG1h
bnkgYm91bmRhcmllcyB3ZSBjYW5ub3QgZGVzY3JpYmUgd2l0aCBqdXN0IDQgcHJvdGVjdGlvbgpi
aXRzLgoKQnV0IHRoaXMgaXMgc29tZXdoYXQgYSB1QVBJIGNoYW5nZSBpbmRlZWQuIFNvIGluIHRo
ZSBmaXJzdCBwbGFjZSwgSSB3aWxsCmtlZXAgdGhpcyBjb21tZW50LiBCdXQgaWYgd2UgZmVlbCBs
aWtlIHdlIHNob3VsZCBtYWtlIHRoZSB1QVBJIHN0cmljdGVyLAppdCBjYW4gY29tZSBvbiB0b3Au
IERvaW5nIHRoaXMgd291bGQgcmVxdWlyZSBhIGJyb2FkIGFja25vd2xlZGdlbWVudC4KCj4+ICsg
KiAtaXNfbG9ja2VkKCk6IENoZWNrcyBpZiB0aGUgcmVnaW9uIGlzICpmdWxseSogbG9ja2VkLCBy
ZXR1cm5zIGZhbHNlIG90aGVyd2lzZS4KPj4gKyAqICAgICAgICAgICAgICAgVGhpcyBmZWViYWNr
IG1heSBiZSBtaXNsZWFkaW5nIGJlY2F1c2UgdXNlcnMgbWF5IGdldCBhbiAidW5sb2NrZWQiCj4+
ICsgKiAgICAgICAgICAgICAgIHN0YXR1cyBldmVuIHRob3VnaCBhIHN1YnBhcnQgb2YgdGhlIHJl
Z2lvbiBpcyBlZmZlY3RpdmVseSBsb2NrZWQuCj4+ICsgKi8KPj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc3BpX25vcl9sb2NraW5nX29wcyBzcGlfbm9yX3NyX2xvY2tpbmdfb3BzID0gewo+PiAgCS5s
b2NrID0gc3BpX25vcl9zcl9sb2NrLAo+PiAgCS51bmxvY2sgPSBzcGlfbm9yX3NyX3VubG9jaywK
Pgo+IEFueXdheSwgYXMgaXQgaXMgaG93IGl0J3MgY3VycmVudGx5IGJlaGF2aW5nOgo+Cj4gUmV2
aWV3ZWQtYnk6IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgoKVGhhbmtzIQpNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
