Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345B4E6BF18
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pY59U9vdp5QA7VKlHutRdggtSLBy6U77Pzbm8Jb49AA=; b=QL4S2xaIq3qY1V
	dj+OTmC7l9fIRfUMx7cqAttzC/PqodNeuwTjXtLvP8/Xj4BnpbPIPziEFvXUBJz1ql2/ATLb46uVd
	BNlH0mvRK88MUywm5J+5TV2FGH53AC1jRpezPF9Wugetn4g/7o0j38+oeUlJHEW2iSdcevJeJVujy
	MLDi5/FwnLjK5rHvedIhGwSfpiwFksV9/GvPIA/MhfiPxMBc+FCVSk+8Ihq2LJrE74iGuAsLsLovg
	661pVW199kZRew0yCCDG6wYhwT2/PgaeLEkSpPTBem8Jkc/p4O31SxvIv/1y5LPTuOV6ji7744n5j
	ccIFoq8YNwfR1igCDX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpYh-00000001agY-0ysS;
	Fri, 30 Jan 2026 14:33:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpYd-00000001ag2-3qYe
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 14:33:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B273C22F5F;
	Fri, 30 Jan 2026 14:32:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 893836075A;
	Fri, 30 Jan 2026 14:32:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55F67119A8874;
	Fri, 30 Jan 2026 15:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769783572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A5can+eY+4csM5OYkATRQZryaMHBwuJRBTYQxU8KRLY=;
	b=AgALEglGx71hlug2G5IZdRzlyVmvcTltLBAj+ZZHKaI3Kc0IyOU0/0GaS5xNDvIeBdxMj7
	B25hAUkRjGJD2W+LdJlHeDaZktAYfWRDi4w4BBEY96fH3jBfMGhN8I0T5JKwaKKAcVPXJA
	xKJpkjk1zGjZEacJGiqnYnHI3WksBM94b3QIlsgyJ03g/yMfWgNhqvbCWOTQDF7BrhW/ru
	oQV+zeKvbaaEb9nrUslZcCEwCJ7aRx2qFQi3o4IfE6z0WzKHhmzYRr9fEXl6Wk6ysg2ObT
	iD3zUHoHYmOf3uwCI4PZrHxVp+520ZSlh1+X2D4cF6e8P2D4I/F3PzvfwKte4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>,  Michal Simek <monstr@monstr.eu>,
  Bernhard Frauendienst <kernel@nospam.obeliks.de>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 0/3] mtd: Add support for stacked memories
In-Reply-To: <176971398683.256348.665652099075371899.b4-ty@bootlin.com>
	(Miquel Raynal's message of "Thu, 29 Jan 2026 20:15:32 +0100")
References: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
	<176971398683.256348.665652099075371899.b4-ty@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 30 Jan 2026 15:32:48 +0100
Message-ID: <87h5s3i31r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_063312_121060_B90E1A3B 
X-CRM114-Status: GOOD (  11.87  )
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

SGVsbG8sCgpPbiAyOS8wMS8yMDI2IGF0IDIwOjE1OjMyICswMSwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IE9uIFRodSwgMjkgSmFuIDIwMjYgMTM6
MDk6MjYgKzAxMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6Cj4+IFtUTDtEUiBmb3IgdjE1OiBhcyBh
Z3JlZWQgd2l0aCBBbWl0IEknbSBzZW5kaW5nIGEgbmV3IGl0ZXJhdGlvbiBvZiBoaXMKPj4gcGF0
Y2hlcyB0byBmaXggdGhlIGJ1aWxkLXRpbWUgZmFpbHVyZSBkdWUgdG8gYSBtb2R1bGUgZGVwZW5k
ZW5jeQo+PiBsb29wLiBPcmlnaW5hbCBjb3ZlciBmb2xsb3dzLl0KPj4gCj4+IFRoaXMgcGF0Y2gg
c2VyaWVzIGFkZHMgc3RhY2tlZCBzdXBwb3J0IGJ5IGVuaGFuY2luZyB0aGUgZXhpc3RpbmcgbXRk
LWNvbmNhdAo+PiBkcml2ZXIgdG8gYmUgbW9yZSBnZW5lcmljLgo+PiAKPj4gWy4uLl0KPgo+IFRo
YW5rIHlvdSBmb3IgZmluYWxseSByZS1zZW5kaW5nIHRoZSBzZXJpZXMgYWZ0ZXIgZml4aW5nIHRo
ZSByb2JvdAo+IHdhcm5pbmcsIEkgd2lsbCBub3Qgd2FpdCBmb3IgbWVyZ2luZyBpdCBiZWNhdXNl
IHRoaXMgbmVlZHMgdG8gZmluYWxseQo+IGdldCBpbiwgYW5kIGl0J3MgYmVlbiBvdmVyIHRoZSBt
YWlsaW5nIGxpc3QgZm9yIDggbW9udGhzIHdpdGgganVzdCBhCj4gS2NvbmZpZyBzeW1ib2wgdG8g
Zml4LCBzbzoKClVuZm9ydHVuYXRlbHksIGZvciB0aGUgdGhpcmQgdGltZSwgdGhpcyBzZXJpZXMg
YnJlYWtzIHdoZW4gcm9ib3RzIGdvCm92ZXIgaXQgKHNlZSB0aGUgb2Uta2J1aWxkLWFsbEBsaXN0
cy5saW51eC5kZXYgTUwpLCBzbyBJIHdpbGwgZHJvcCBpdAphZ2FpbiA6LS8KClNvcnJ5LApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
