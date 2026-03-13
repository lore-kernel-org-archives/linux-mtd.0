Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20AB105F781
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gzb/ZF6DAtXR5zwcSWtY+OUdgwvatUELX/vpyGEvdw=; b=QnGW7lRQwBfy0g
	7Sx7EfAdzgB+qyJW8j07mU9ILq2usD+TFi36jSOih6HRKn4TwHoDD7s3cZ0PFL+8ekMIYDKGedPTk
	G4lOr/R+1r1G6oB1095xDSDe4VCPYpiOQ4R/k/JTEv/+LVcKYZjAXnDzcBPiQWqDm3mnms0XWVRM5
	2UnJZDFy5lwXGiLi9hZF/DonEKbygoEsPZ087mgnOCIiNdr7IECcJxsXyEjI0MPFeHfccWUDeHsd1
	4qZsNOhAC3bWCzOcI/XoFw9o4zIbNUIOlcmOj72lFaXqtAiQmNqGhp+Da5IfVuoOj6rBqit5DNtdy
	g7Pci8JR5EohToUVeDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yKd-0000000HK6l-1aHI;
	Fri, 13 Mar 2026 08:57:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yKZ-0000000HK5U-0JtM
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 08:57:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D49C1A2E20;
	Fri, 13 Mar 2026 08:57:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C7F660027;
	Fri, 13 Mar 2026 08:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFC1E10369DC5;
	Fri, 13 Mar 2026 09:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773392231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V8KMVy0DcXPG0QLpYu/1/bMyEp34wzRyySJdIx927ek=;
	b=SZPQYkvkyP8FuqGjQ6RPYbzuLKRd4IuCymeqsA0BMrp+qAInkkK8Rhl7QVrzQ33j3zxIRK
	1+RF4Gqd9Wt19QjxfDU3wxm6TH5vt4BXMPb/zGCRw+LFL3Pj7xlx8DZ1gZPt7d8ajdpWsE
	LCtln8B9kkohVW6BpBzyxKTJgjP7JGycAzVQA56CIFDsnT8Ijag2CUZKuWOQZivBXWzYjQ
	p29nAPNYGs9F5Iip7KFp4YJMGZmhGTZUo5q6H4zDi1NA7muwOnLhY0DeDENhPq0YLl5dRE
	/E0AdtWg/N65HigqJl7HY+GRvI8kSvxXXbAlrrFVEkTfCobY6QM4aS+NP5DjyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Akhila YS <akhilayalmati@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: hisilicon,504-nfc: convert to DT schema
In-Reply-To: <87y0jwjeg6.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 13
	Mar 2026 09:55:53 +0100")
References: <20260307-hisi504-1-v1-1-8bf9a186faf2@gmail.com>
	<20260312152851.GA3190071-robh@kernel.org>
	<87y0jwjeg6.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Mar 2026 09:57:09 +0100
Message-ID: <87sea4jee2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_015715_246149_C684B372 
X-CRM114-Status: GOOD (  10.89  )
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

T24gMTMvMDMvMjAyNiBhdCAwOTo1NTo1MyArMDEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIZWxsbywKPgo+Pj4gKyAgIiNhZGRyZXNzLWNlbGxz
IjoKPj4+ICsgICAgY29uc3Q6IDEKPj4+ICsKPj4+ICsgICIjc2l6ZS1jZWxscyI6Cj4+PiArICAg
IGNvbnN0OiAwCj4+Cj4+IFRoZXNlIGNhbiBiZSBkcm9wcGVkIGFzIHRoZSBjaGlsZCAocGFydGl0
aW9ucykgZG9lc24ndCBoYXZlIGFuCj4+IGFkZHJlc3MuCj4KPiBXZWxsLCB0aGUgY2hpbGQgc2hv
dWxkLCBiZWNhdXNlIGl0IHNob3VsZCBiZSB0aGUgTkFORCBkZXZpY2UgKHdpdGgsIGFzCj4gYWRk
cmVzcywgdGhlIGNoaXAgQ1MpIGluc3RlYWQgb2YgJ3BhcnRpdGlvbnMnLiBJZiB0aGUgZHJpdmVy
IGluIGZyb250IG9mCj4gdGhhdCBiaW5kaW5nIGRvZXMgbm90IHN1cHBvcnQgdGhhdCwgcGxlYXNl
IHdhaXQgZm9yIEZyYW5rIExpJ3Mgd29yayB0bwo+IGNsZWFybHkgaWRlbnRpZnkgdGhlIGxlZ2Fj
eSBiaW5kaW5ncyB0byBiZSBtZXJnZWQgYW5kIHJlZmVyZW5jZSBpdCBpbgo+IHRoZSB0b3AgbGV2
ZWwgYWxsT2YuCgpJIGZvcmdvdCB0byBzaGFyZSB0aGUgbGluaywgaGVyZSBpdCBpczoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjYwMzA5MjAwMzUxLjE3OTExNjItMS1GcmFu
ay5MaUBueHAuY29tL1QvI3QKCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
