Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CE0CD6E55
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4B6CPw3rCyMkYx56bnVV5wLzobuD58nSAkU3hTeL76w=; b=OvWsOV/PXoDn80
	TaJNM7VlHKgU9GqndSTDlKBlnfSYAtAJpst/WWgIQGa+b45vIa8R0lfMSB+UNP4k1JKxiU81LNAzH
	pE1FpX+KbZDejwWzhmZ/JTwEmwbTpVmI6MHoE++K2uQIPMhy8XbYOvFIF0D2I17RH9i8hPid18zSv
	bNdRMz3sg0jxEHSZvFSih66uCRbTYrOLBLDgx4N/y3Klt3wt+hsJ5G61iwxxymigFw3Mmd2aU1wca
	GOxjPCnSArtStf/dLAslzkFr8wgZ4NuzAfggEZZZHND5m6KQ3K0JDX/mWnlcA0DMlwLPN1wZBByuj
	TLABr6RkoK9nZSQ7YVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoTL-0000000FWQr-3ICU;
	Wed, 03 Jun 2026 16:29:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoTH-0000000FWQK-2gAl
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 16:29:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 28BDE1A0119;
	Wed,  3 Jun 2026 16:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E53485FA0A;
	Wed,  3 Jun 2026 16:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B54DB10888CCF;
	Wed,  3 Jun 2026 18:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780504172; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=evJt7jmzVDi65ASf5TV7iH2Zz3iluscmSfjgvIWeKvo=;
	b=j0+LeAkK88BbWrccUSUayANR5ESpZBgsiz/KRZIKU/qnUFp7VrLXTMIRxvkSG8haI5oJPp
	+FiKfGoDdHHpQ5rWPYhHIObzT7sLN+ghTk3GGk5YD1GxgddcjdX8LNk6XR3jIklJMxrz++
	sO3TPVXrKTsAlRZBcngPPo/HwdisCGHSCyxebtrWqhjY0O8gDQMB5fgzdNjQzmJOeRpHUB
	Abfq6u9XCz+NxpxkAI7mmWw9yalVcEk06S1VssIK2Q3FqJUN9B1ixeiv5UroML0g41TYQP
	yQTCHj4GUrRzmsxkQQM1BX+MATmUP5PmvN7ObRmh+PJe6F2wn5NKd9Ed0C+QSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260603-neatly-twine-e89b923f5cb6@spud> (Conor Dooley's message
	of "Wed, 3 Jun 2026 17:07:21 +0100")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-2-s-k6@ti.com>
	<20260528-clergyman-kindling-20971775ba78@spud>
	<eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
	<87cxy92llq.fsf@bootlin.com>
	<20260602-aptly-bunkbed-1bd3a8d63d54@spud>
	<875x3zzkji.fsf@bootlin.com> <20260603-neatly-twine-e89b923f5cb6@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 03 Jun 2026 18:29:27 +0200
Message-ID: <87o6hry4d4.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_092935_810372_FD300AB6 
X-CRM114-Status: GOOD (  16.56  )
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

Cj4+ID4+ID4gVGhlIG5vbi1QSFkgZnJlcXVlbmN5IGlzIGEgY29udHJvbGxlciBsaW1pdGF0aW9u
L2NhcGFiaWxpdHkgcmF0aGVyIHRoYW4KPj4gPj4gPiBhIGZsYXNoIGNoYXJhY3RlcmlzdGljLCBz
byBpdCBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIHRvIGtlZXAgaXQgaW4gdGhlCj4+ID4+ID4gY29u
dHJvbGxlciBkcml2ZXIgYXMgQ29ub3Igc3VnZ2VzdGVkLgo+PiA+PiAKPj4gPj4gVGhlIG5vbiB0
dW5lZCBmcmVxdWVuY3kgaXMgdGhlIG1heGltdW0gZnJlcXVlbmN5IG9uZSBjb3VsZCB1c2UKPj4g
Pj4gcmVsaWFibHkuIEl0IGlzIG5vdCBjb250cm9sbGVyIHNwZWNpZmljLiBJdCBpcyBtb3N0bHkg
Ym9hcmQgc3BlY2lmaWMsCj4+ID4+IGFuZCB0byBzb21lIGV4dGVuZCBtYXkgYWxzbyBiZSBjaGlw
IHNwZWNpZmljLgo+PiA+PiAKPj4gPj4gVGhlIHR1bmVkIGZyZXF1ZW5jeSBpcyB0aGUgbWF4aW11
bSBmcmVxdWVuY3kgb25lIGNvdWxkIHVzZSByZWxpYWJseQo+PiA+PiBhZnRlciBsaW5lIGEgY29u
dHJvbGxlciBvciBjaGlwIHNwZWNpZmljIHRyYWluaW5nIHByb2NlZHVyZS4gSXQgaXMKPj4gPj4g
YWxzbyB0aGUgcmVzdWx0IG9mIGFuIGFnZ3JlZ2F0ZWQgc2V0IG9mIG5vbiBkaXNjb3ZlcmFibGUg
aGFyZHdhcmUKPj4gPj4gbGltaXRhdGlvbnM6Cj4+ID4+IC0gYm9hcmQgcm91dGluZwo+PiA+PiAt
IGNoaXAgY2FwYWJpbGl0eQo+PiA+PiAtIGNvbnRyb2xsZXIgY2FwYWJpbGl0eQo+PiA+Cj4+ID4g
UmlnaHQsIGFuZCB0aGlzIEkgZ3Vlc3MgaXMgd2hhdCBzY3VwcGVycyBsZXR0aW5nIHRoZSBjb250
cm9sbGVyIGRyaXZlcgo+PiA+IHNvcnQgdGhlIGNvbmZpZ3VyYXRpb24gb3V0IGl0c2VsZiBhbmQg
bGVhdmluZyB0aGUgcHJvcGVydHkgYXMtaXMuCj4+ID4gSXQgY291bGQgYmUgdGhhdCB0aGUgc3Bl
ZWQgaW4gc3BpLW1heC1mcmVxdWVuY3kgaXMgbG93ZXIgdGhhbiB0aGUgImJhc2UKPj4gPiBzcGVl
ZCIgb2YgdGhlIGNvbnRyb2xsZXIgYnV0IGJlY2F1c2Ugb2YgYm9hcmQgcm91dGluZyBvciBkZXZp
Y2UKPj4gPiBjYXBhYmlsaXR5IHRoYXQgdGhlIHR1bmVkIG1vZGUgaXMgc3RpbGwgcmVxdWlyZWQs
IHJpZ2h0Pwo+PiAKPj4gSSBkbyBub3QgYWN0dWFsbHkgZXhwZWN0IGFueSB0dW5lZCBtb2RlL2Zy
ZXF1ZW5jeSB0byBiZSBtYW5kYXRvcnkuCj4KPiBJIHRoaW5rIHlvdSBtaXN1bmRlcnN0b29kIG15
IHVzZSBvZiAicmVxdWlyZWQiLCBJIG1lYW50IHRoYXQgdGhlIG5ldwo+IHByb3BlcnR5L2luZm9y
bWF0aW9uIHdhcyBuZWVkZWQgaW4gdGhlIHNjZW5hcmlvIEkgZGVzY3JpYmVkLCBub3QgdGhhdCBp
dAo+IHNob3VsZCBiZSBhIHJlcXVpcmVkIHByb3BlcnR5IGluIGEgYmluZGluZy4KClllcyBJIG1p
c3VuZGVyc3Rvb2QgdGhlIHRlcm0gaW5kZWVkLiBIb3dldmVyIEkgc3RpbGwgZmFpbCB0byBjYXRj
aCB3aGF0CnlvdSBtZWFudCBoZXJlLCBJJ20gc29ycnkuIFdvdWxkIHlvdSBtaW5kIHJlcGhyYXNp
bmc/CgpKdXN0IHRvIGNsYXJpZnksIHR1bmVkIG1vZGVzIGFyZSBvbmx5IGJvbnVzZXMuCgpNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
