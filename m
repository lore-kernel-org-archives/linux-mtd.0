Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9C1CD6E60
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKLJLxo7/spiyPhBnL+2IdJsRO4na4qSCMhqzNd/hcU=; b=cJoiXVkYN48NzL
	ZIjKxyubLVOmloymbqx+yQkNuRrQuP3VL9fHt3wjzczRRKJ8LtN/0KMZ3AnEkCPUVsSMo3jgorUZ7
	QbZNifGoavErLvq51CF522NWyKk7NRItkHXxm+cvEJGU7XKk6dDUTQhDFsGT8wObi3jGDTS2JQ95E
	qGryTjVPqPldPAULDau0KUzhMCXtHzObDdtDrvYy0fPgqXgpELikkRr8LXLSZSW7AcoNHT4nfo5VZ
	YuuXrTev5CWHzuS9aKNu36Nb8L6zBwEX9l85JuR5R+Fu+9819TDN3Z9qDawOJvpz67O/sreHsS9sn
	BoMKtp/rQZKGwVJIeDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNsk-0000000CwFQ-2bsw;
	Tue, 02 Jun 2026 12:06:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNsh-0000000CwEo-2Mz9
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 12:06:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04B7AC6220A;
	Tue,  2 Jun 2026 12:06:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DAEB603BC;
	Tue,  2 Jun 2026 12:06:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4434C108883E7;
	Tue,  2 Jun 2026 14:05:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780401959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=owdZim6KsYd46rLD3GD+Jz+Use5sF9LDFtAk9cEMNaM=;
	b=WO9str+tuV5dWyX5XyfMv+Rspu5G+WZ/YjGP5t6EmZYyVlT+YiLiYFgaD0APLZL/4wOWA1
	X7UG2dvYSp/iFn/zMSxpEmDHpLOqrO44Wfp0fIBl+BK2Qi84TKrT9gZp1BUNi5YVNSvR1G
	GrA45i8bXD2eB7tE39rCVFQQS/3rnboaPQmIaSmTSmwZdJuHiwS02SKZu25duSyjRfx1re
	l8nWfMM+y+NGQudYh+tl2+iyhRFzzzsGUgg89kLbf5kl9KTnmQHpCiyyy+YGxm27GT6Ptn
	UPu9056IVeMWKQvzTHAKX48nXH3ej34MkbgKwtMf1C/UruJJHAL707KzXNOomg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Conor Dooley <conor@kernel.org>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <takahiro.kuwano@infineon.com>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com> (Santhosh Kumar
	K.'s message of "Mon, 1 Jun 2026 13:15:59 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-2-s-k6@ti.com>
	<20260528-clergyman-kindling-20971775ba78@spud>
	<eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 14:05:53 +0200
Message-ID: <87cxy92llq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_050603_811850_3F66BF3B 
X-CRM114-Status: GOOD (  17.80  )
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

SGVsbG8gQ29ub3IsIFNhbnRob3NoLAoKPj4gSSBhbHNvIGRvbid0IGdldCB0aGUgcG9pbnQgb2Yg
dGhpcyBwcm9wZXJ0eSwgd2h5IGNhbid0IHlvdSBqdXN0IHNldAo+PiB0aGUKPj4gbWF4IHRoYXQg
dGhlIGRldmljZSBjYW4gZG8gYW5kIGlmIHRoZSBjb250cm9sbGVyIGNhbiBjb25maWd1cmUgaXRz
ZWxmIHRvCj4+IGJlIGZhc3QgZW5vdWdoIGl0IHdpbGwgZG8gc28sIGFuZCBpZiBpdCBjYW4ndCB0
aGVuIGl0J2xsIHBpY2sgd2hhdGV2ZXIKPj4gdGhlIGZhc3Rlc3QgaXQgY2FuIGFjdHVhbGx5IGRv
IGluc3RlYWQ/CgpJZiBJIG1heSwgdGhpcyBpcyBub3QgZG9hYmxlIGJlY2F1c2UgdGhlcmUgaXMg
YWx3YXlzIGEgcGhhc2UgYXQgbG93CnNwZWVkLiBCeSBsb3cgc3BlZWQsIEkgbWVhbiB0aGUgc3Bl
ZWQgd2hpY2ggYWxsb3dzIHJlbGlhYmxlIGRhdGEKdHJhbnNmZXJzIGJldHdlZW4gdGhlIGhvc3Qg
YW5kIHRoZSBkZXZpY2UuIFRoaXMgIm1heGltdW0gbG93IiBzcGVlZCBpcwpub24gZGlzY292ZXJh
YmxlLCBpdCBpcyBuZWNlc3NhcnkgdG8gZGVzY3JpYmUgaXQuIEFzIG9mIHRvZGF5LCBpdCBpcwp3
aWRlbHkgdXNlZCAoYW5kIEkgYmVsaWV2ZSBmb3IgZ29vZCByZWFzb25zKSBhbmQgY292ZXJzIDk5
Ljk5JSBvZiB0aGUKdXNlIGNhc2VzLgoKPj4gU2VlbXMgbGlrZSB5b3UncmUgYWJ1c2luZyBhIHBl
cmlwaGVyYWwgcHJvcGVydHkgdG8gZW5jb2RlIGluZm9ybWF0aW9uCj4+IGFib3V0IHRoZSBjb250
cm9sbGVyLgo+Cj4gVGhlIGNvbnRyb2xsZXItc2lkZSBhcHByb2FjaCB5b3UgbWVudGlvbmVkIGlz
IHNpbWlsYXIgdG8gd2hhdCBJIGhhZCBpbgo+IHYyLCB3aGVyZSBhIGNvbXBhdGlibGUtc3BlY2lm
aWMgYmFzZV9mcmVxIGlzIHVzZWQgZm9yIG5vbi1QSFkgb3BzLgo+Cj4gTWlxdWVsLAo+Cj4gSSB0
aGluayB3ZSBzaG91bGQgcmV2ZXJ0IHRvIHRoZSB2MiBhcHByb2FjaC4KPgo+IFRoZSBub24tUEhZ
IGZyZXF1ZW5jeSBpcyBhIGNvbnRyb2xsZXIgbGltaXRhdGlvbi9jYXBhYmlsaXR5IHJhdGhlciB0
aGFuCj4gYSBmbGFzaCBjaGFyYWN0ZXJpc3RpYywgc28gaXQgc2VlbXMgbW9yZSBhcHByb3ByaWF0
ZSB0byBrZWVwIGl0IGluIHRoZQo+IGNvbnRyb2xsZXIgZHJpdmVyIGFzIENvbm9yIHN1Z2dlc3Rl
ZC4KClRoZSBub24gdHVuZWQgZnJlcXVlbmN5IGlzIHRoZSBtYXhpbXVtIGZyZXF1ZW5jeSBvbmUg
Y291bGQgdXNlCnJlbGlhYmx5LiBJdCBpcyBub3QgY29udHJvbGxlciBzcGVjaWZpYy4gSXQgaXMg
bW9zdGx5IGJvYXJkIHNwZWNpZmljLAphbmQgdG8gc29tZSBleHRlbmQgbWF5IGFsc28gYmUgY2hp
cCBzcGVjaWZpYy4KClRoZSB0dW5lZCBmcmVxdWVuY3kgaXMgdGhlIG1heGltdW0gZnJlcXVlbmN5
IG9uZSBjb3VsZCB1c2UgcmVsaWFibHkKYWZ0ZXIgbGluZSBhIGNvbnRyb2xsZXIgb3IgY2hpcCBz
cGVjaWZpYyB0cmFpbmluZyBwcm9jZWR1cmUuIEl0IGlzCmFsc28gdGhlIHJlc3VsdCBvZiBhbiBh
Z2dyZWdhdGVkIHNldCBvZiBub24gZGlzY292ZXJhYmxlIGhhcmR3YXJlCmxpbWl0YXRpb25zOgot
IGJvYXJkIHJvdXRpbmcKLSBjaGlwIGNhcGFiaWxpdHkKLSBjb250cm9sbGVyIGNhcGFiaWxpdHkK
CldlIG11c3QgdHJ5IHRvIHRoaW5rIGFib3V0IG90aGVyIChub24gVEkpIHBvc3NpYmxlIHVzZSBj
YXNlcyBvZiB0aGVzZQpwcm9wZXJ0aWVzIGFuZCBhbHNvIHRha2UgaW50byBhY2NvdW50IHRoZSBl
eGlzdGluZyBEVCBleHBlY3RhdGlvbnMuIElmCnR1cm5pbmcgdGhlIHByb3BlcnR5IGludG8gYW4g
YXJyYXkgaXMgdG9vIGNvbXBsZXgsIHdlIG1heSBnbyBmb3IgYQpzZWNvbmQgcHJvcGVydHksIGJ1
dCBJIGJlbGlldmUgdGhlIG5hbWUgc2hvdWxkIG5vdCBiZSBUSSBzcGVjaWZpYyAoYnV0CkknbGwg
bGV0IHRoZSBmaW5hbCBkZWNpc2lvbiB0byB0aGUgRFQgZ3VydXMpLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
