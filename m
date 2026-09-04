Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44C7C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAQ8xUmszpXbGSAUE9w2nSlPCsqidYNYPukXZLgD1v8=; b=wido+X6yM81Gln
	II+9FFXSbYkeWEskNDidQJu1ixqEHitDf9ORmNDSeOyD14WOvqNipcaPsTw38+bh8WvF9fOPkggzi
	PspPqvpHCW8EvoyUENXG+ZVoYOTUjeJXti+sBYEcnKPZHBPneBZRlxdacgF4f4lpXc98zYzuENBJj
	iy2AcXi0eCnpmEkgRW5L58XIwOIM1pAOsJgmT8L5lEJnVlNyEOwrvfz+DKKAtw/GOtSBuESkvrZxz
	86m/0Ns2iSdAiMuhlwK5MUNN8PTi8trIk1w4EuQzbGTClosBiT56uGNEaPhs4n3QS0Oi/GBDrhNNj
	uixoHolBPrgPs6xubl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wj8-00000002iyN-0lO7;
	Fri, 04 Sep 2026 16:25:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wj5-00000002ixo-2yrb
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 16:25:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C6104E41512;
	Fri,  4 Sep 2026 16:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 015486057F;
	Fri,  4 Sep 2026 16:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82B0211C787BD;
	Fri,  4 Sep 2026 18:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788539109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iyGbuXlnEHu5IZ2Y67+lbl3dPNb3QBxNs0BWA67Ll5g=;
	b=G+ANkK2H6/aFhwPmFuRcpqZ3mwSHSh27XhVyoIdKGhKiRh/20momsiWHTh1jGlCagjl9cp
	un/H+5TyQwux9KIktJkpzPZ6jCT3Z6rwB/tVCpsCuNWahE1y3jJagSC4rqIvV5Tb2ypt9T
	onqcj3ltdvwMCbcgYcUzvmLyn29Pi3ZLAJkQkBWtEZPh+Lh/5POHGevtKB8qf8cCwGbOsT
	HCm0aLkvWmbkj0uzmUAYID3fLTUjOakvSH7bgymRSJGFFgt+UNfSADXosw9xS+AiaxW5si
	qACcfiALENuz0P6Dm/Gs1y4cPv9XOk5T3bn8+gLIbQsV2VAjGjFM8HAkfgqQ5A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,
  <sebin.francis@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v9 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <8733vp0yuv.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 04
	Sep 2026 18:23:36 +0200")
References: <20260825171737.776052-1-s-k6@ti.com>
	<20260825171737.776052-17-s-k6@ti.com> <8733vp0yuv.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 18:25:04 +0200
Message-ID: <87wlt1yof3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092515_890479_A48D6644 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Ck9uIDA0LzA5LzIwMjYgYXQgMTg6MjM6MzYgKzAyLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8gU2FudGhvc2gsCj4KPj4gK3N0YXRpYyBi
b29sIHNwaW5hbmRfdHJ5X3JhbmtlZF92YXJpYW50KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3Bp
bmFuZCwKPj4gKwkJCQkgICAgICAgc3RydWN0IHNwaV9tZW0gKm1lbSwKPj4gKwkJCQkgICAgICAg
ZW51bSBzcGluYW5kX2J1c19pbnRlcmZhY2UgaWZhY2UsCj4+ICsJCQkJICAgICAgIHUzMiAqdHJp
ZWRfbWFzaykKPj4gK3sKPj4gKwljb25zdCBzdHJ1Y3Qgc3BpbmFuZF9vcF92YXJpYW50cyAqdmFy
aWFudHMgPSBzcGluYW5kLT5hbGxfcmVhZF92YXJpYW50czsKPj4gKwlzdHJ1Y3Qgc3BpbmFuZF9t
ZW1fb3BzICp0ZW1wbGF0ZXMgPSBpZmFjZSA9PSBPRFRSID8KPj4gKwkJJnNwaW5hbmQtPm9kdHJf
b3BfdGVtcGxhdGVzIDogJnNwaW5hbmQtPnNzZHJfb3BfdGVtcGxhdGVzOwo+PiArCWNvbnN0IHN0
cnVjdCBzcGlfbWVtX29wICpiZXN0Owo+PiArCWludCByZXQ7Cj4+ICsKPj4gKwlpZiAoIXZhcmlh
bnRzKQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwl3aGlsZSAoKGJlc3QgPSBzcGluYW5k
X29wX2ZpbmRfYmVzdF92YXJpYW50KHNwaW5hbmQsIHZhcmlhbnRzLCBpZmFjZSwKPj4gKwkJCQkJ
CSAgICAqdHJpZWRfbWFzaywgTlVMTCkpKSB7Cj4+ICsJCSp0cmllZF9tYXNrIHw9IEJJVChiZXN0
IC0gdmFyaWFudHMtPm9wcyk7Cj4+ICsJCXNwaW5hbmQtPm1heF9yZWFkX29wID0gKmJlc3Q7Cj4+
ICsJCXNwaW5hbmQtPm1heF9yZWFkX29wLm1heF9mcmVxID0gMDsKPj4gKwkJc3BpbmFuZC0+bWF4
X3dyaXRlX29wLm1heF9mcmVxID0gMDsKPj4gKwkJcmV0ID0gc3BpX21lbV9leGVjdXRlX3R1bmlu
ZyhtZW0sICZzcGluYW5kLT5tYXhfcmVhZF9vcCwKPj4gKwkJCQkJICAgICAmc3BpbmFuZC0+bWF4
X3dyaXRlX29wKTsKPj4gKwkJaWYgKHJldCAmJiByZXQgIT0gLUVPUE5PVFNVUFApCj4+ICsJCQlk
ZXZfZGJnKCZtZW0tPnNwaS0+ZGV2LCAiJXMgb3B0aW1pemF0aW9uIGZhaWxlZDogJWRcbiIsCj4+
ICsJCQkJaWZhY2UgPT0gT0RUUiA/ICJPRFRSIiA6ICJTU0RSIiwgcmV0KTsKPj4gKwkJaWYgKCFy
ZXQgJiYgc3BpbmFuZC0+bWF4X3JlYWRfb3AubWF4X2ZyZXEpIHsKPj4gKwkJCXRlbXBsYXRlcy0+
cmVhZF9jYWNoZSA9IGJlc3Q7Cj4+ICsJCQlpZiAoc3BpbmFuZC0+YWxsX2NvbnRfcmVhZF92YXJp
YW50cykgewo+PiArCQkJCXRlbXBsYXRlcy0+Y29udF9yZWFkX2NhY2hlID0KPj4gKwkJCQkJc3Bp
bmFuZF9maW5kX2NvbnRfcmVhZF92YXJpYW50KHNwaW5hbmQsIGJlc3QsIGlmYWNlKTsKPj4gKwkJ
CQlzcGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPQo+PiArCQkJCQkhIXRlbXBsYXRlcy0+Y29u
dF9yZWFkX2NhY2hlOwo+Cj4gSSBiZWxpZXZlIHlvdSBhbG1vc3QgYWRkcmVzc2VkIHRoZSBjb25j
ZXJucyByYWlzZWQgaW4gdjcgYWJvdXQKPiBjb250X3JlYWRfcG9zc2libGUsIGV4Y2VwdCB3aGF0
IHlvdSBkbyBoZXJlIGlzIHN0aWxsIGEgYml0IGRhbmdlcm91cwo+IHNpbmNlIHlvdSBjb3VsZCBy
ZS1lbmFibGUgY29udGludW91cyByZWFkcyBvbiBub19jc19hc3NlcnRpb24gY2FwYWJsZQo+IGNv
bnRyb2xsZXJzLiBJIGJlbGlldmUgeW91IHNob3VsZCBjbGVhciB0aGUgZmxhZyBvbmx5LCBuZXZl
ciByaXNrIHRvIHNldAo+IGl0LCBzb21ldGhpbmcgbGlrZToKCmNmLiBTYXNoaWtvJ3M6IFtIaWdo
XSBVbmNvbmRpdGlvbmFsIG92ZXJ3cml0ZSBvZiBgc3BpbmFuZC0+Y29udF9yZWFkX3Bvc3NpYmxl
YApieXBhc3NlcyBzeXN0ZW0gY2FwYWJpbGl0eSBjaGVja3MsIHJpc2tpbmcgdW5zdXBwb3J0ZWQg
Y29udGludW91cyByZWFkcy4KCj4KPiBpZiAoIXRlbXBsYXRlcy0+Y29udF9yZWFkX2NhY2hlKQo+
ICAgICBzcGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsKPgo+IFdpdGggdGhpcyBm
aXhlZCwKPgo+IFJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+Cj4gSSBiZWxpZXZlIEkgd2lsbCB0YWtlIHRoaXMgcGF0Y2ggb25seSBhZnRlciBN
YXJrIHRha2VzIHRoZSBiYXRjaCBiZWZvcmUsCj4gd2hpY2ggbG9va3MgbW9zdGx5IGdvb2QgZm9y
IG15IG5vbi1zcGktZXhwZXJ0IGV5ZXMuIEVpdGhlciBNYXJrIHNoYXJlcwo+IGFuIGltbXV0YWJs
ZSB0YWcsIG9yIEkgd2FpdCBvbmUgY3ljbGUuCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
