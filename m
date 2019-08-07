Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9F4C433FF
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 10:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE52121E6C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 10:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tS7XfImY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE52121E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gL4VcQpaYkac9izIV0bt1HsOFHx0wgI42sCTuCAwHo=; b=tS7XfImYZm0H3X
	/q12Vl0IrebSJCLPUKOmQfBK5vsXHFlswhDF9ayZYkD98OzlCt2ikwb16hhRHveqJ99Zie4Yj/sDI
	Q4/A0ZfMz0uh7mgXqeOcUNI1IL3YyxVHtVG2qBRtbh6cCJhQgP7u9NANe98Ko6QzPejX46F8H3Zl6
	i8YWurLBG11OKw+LF9BQykpR3bYQSNUhl46OZw801/yoxBrIGJ/GDDtwOZeoXUtfrZTpMT2NC7QMU
	iBplBYJAZ3JuHSPs4ZvXxHFroqAfYMtRYSIx/OcNc7+wo6ENqBLFwR6pzPJXQ+cKPXd+Luy1W+MBK
	qjnubLyxTMjNFmw6p8FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvIs2-0002NB-Ak; Wed, 07 Aug 2019 10:08:38 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvIru-0002J8-Pi
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 10:08:33 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9E20A240002;
 Wed,  7 Aug 2019 10:08:27 +0000 (UTC)
Date: Wed, 7 Aug 2019 12:08:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 8/8] mtd: spinand: micron: Enable micron flashes with
 multi-die
Message-ID: <20190807120826.3b9e43d6@xps13>
In-Reply-To: <20190722055621.23526-9-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-9-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_030831_281425_52098937 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Chuanhong Guo <gch981213@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIyIEp1
bCAyMDE5IDA3OjU2OjIxICswMjAwOgoKIndpdGggbXVsdGlwbGUgZGllcyIgaW4gdGhlIHRpdGxl
Cgo+IEZyb206IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+
IAo+IFNvbWUgb2YgdGhlIE1pY3JvbiBmbGFzaGVzIGhhcyBtdWx0aS1kaWUsIGFuZCBuZWVkIHRv
IHNlbGVjdCB0aGUgZGllCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGF2ZSBtdWx0aXBs
ZSBkaWVzIGFuZAo+IGVhY2ggdGltZSB3aGlsZSBhY2Nlc3NpbmcgaXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU2hpdmFtdXJ0aHkgU2hhc3RyaSA8c3NoaXZhbXVydGh5QG1pY3Jvbi5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jIHwgMTQgKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9taWNyb24uYwo+
IGluZGV4IDFlMjhlYTNkMTM2Mi4uZmEyYjQzY2FmMzlkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9u
LmMKPiBAQCAtOTAsNiArOTAsMTkgQEAgc3RhdGljIGludCBtaWNyb25fZWNjX2dldF9zdGF0dXMo
c3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICAJcmV0dXJuIC1FSU5WQUw7Cj4gIH0K
PiAgCgpQbGVhc2UgZXhwbGFpbiBpbiBhIGNvbW1lbnQgd2hhdCB5b3UgZG8gaGVyZSwgbGlrZSBp
biB0aGUgY29tbWl0IHRpdGxlLgoKPiArc3RhdGljIGludCBtaWNyb25fc2VsZWN0X3RhcmdldChz
dHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gKwkJCQl1bnNpZ25lZCBpbnQgdGFyZ2V0
KQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSU5BTkRfU0VUX0ZFQVRVUkVfT1Ao
MHhkMCwKPiArCQkJCQkJICAgICAgc3BpbmFuZC0+c2NyYXRjaGJ1Zik7Cj4gKwo+ICsJaWYgKHRh
cmdldCA9PSAxKQo+ICsJCXRhcmdldCA9IDB4NDA7Cj4gKwo+ICsJKnNwaW5hbmQtPnNjcmF0Y2hi
dWYgPSB0YXJnZXQ7CgppZiAodGFyZ2V0ID09IDEpCiAgICAgICAgKnNwaW5hbmQtPnNjcmF0Y2hi
dWYgPSAweDQwCgpzcGFjZQoKPiArCXJldHVybiBzcGlfbWVtX2V4ZWNfb3Aoc3BpbmFuZC0+c3Bp
bWVtLCAmb3ApOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IG1pY3Jvbl9zcGluYW5kX2RldGVjdChz
dHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIHsKPiAgCWNvbnN0IHN0cnVjdCBzcGlf
bWVtX29wICpvcDsKPiBAQCAtMTA1LDYgKzExOCw3IEBAIHN0YXRpYyBpbnQgbWljcm9uX3NwaW5h
bmRfZGV0ZWN0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgCXNwaW5hbmQtPmZs
YWdzID0gMDsKPiAgCXNwaW5hbmQtPmVjY2luZm8uZ2V0X3N0YXR1cyA9IG1pY3Jvbl9lY2NfZ2V0
X3N0YXR1czsKPiAgCXNwaW5hbmQtPmVjY2luZm8ub29ibGF5b3V0ID0gJm1pY3Jvbl9vb2JsYXlv
dXRfb3BzOwo+ICsJc3BpbmFuZC0+c2VsZWN0X3RhcmdldCA9IG1pY3Jvbl9zZWxlY3RfdGFyZ2V0
Owo+ICAKPiAgCW9wID0gc3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudChzcGluYW5kLAo+ICAJCQkJ
ICAgICAgICZyZWFkX2NhY2hlX3ZhcmlhbnRzKTsKCgoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
