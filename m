Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CD5CD342B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DngriQtGHFWjCiep6HyaosbZgyHSgzXivg2DEMloWKM=; b=07cgzodeoW1vzj
	A2hE0gKvuqKPAhmoQPH9FwQRNTvZlPtw1F76SLS3sgLQh1zZ9HstTpKxMO44iqaKLF8vKVMY8N8Wg
	t59BIkY/CCUzlAzamGFqbWBOQywKLDcnL3Ga0BZ49XWZpoRTiQCMNhCafRfR1lDlkS8PX7YQE88Vo
	iiIIYbbgk8/jIYy5UY1SKIWGoniaSUSj1cdsirs9LgI6W2EBUUCfBPzy2fQnP71RewyPSPzRtYkcy
	JeVS6jjJ41x8S0VaorYiCgWGpJNd2R+MaVkKTOdDO5hxSusox4+SAT1W6cwUxNFsGXsMe8YpUQ+ay
	s6fPjGtGzZwydudehJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7u2-0000000EdRM-1OLI;
	Mon, 02 Sep 2024 14:19:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7tK-0000000EdG0-0qwc
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 14:18:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F3F6FF802;
	Mon,  2 Sep 2024 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725286726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JF7JwMRD9iwv16HTVdkRVbNX1b4HkqNeP3wNC+6sYi4=;
	b=kmp7tOfDYQRIxM4dxZwo5PUGEyMKtUFGcxhq/4Scxhh5ecbzZRxRcFP66Q+agVwruXGj+x
	Q2gIpAICGAs1nXXelxQCG147MmAhje3LnpbbzKWP8xStceAM29ZdMa5/HVJDkzLB1nRLA5
	eNBDokn/ZBHR+eNAJxkSZoBpgivegWpFO1fds1pLxtlFipEgCqAZg34clZvC4DWAQaxbZw
	oRZ2cu/bD4Oea5o9k6xZ16TS29MS4pypNd3uQ5bHSctUZWhZXNZmiO/mxkyJN0q0RONDVh
	pldNef6z3hYC5zowqhrAh/Ky4W52SKIu++f9y5ZNvnXR6jpTLLa0zApqcOCHJg==
Date: Mon, 2 Sep 2024 16:18:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <kernel@salutedevices.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, "Mark
 Brown" <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, "Md
 Sadre Alam" <quic_mdalam@quicinc.com>, Ezra Buehler
 <ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
 <avromanov@salutedevices.com>
Subject: Re: [PATCH v2 2/5] mtd: spinand: add OTP support
Message-ID: <20240902161844.2bf982ef@xps-13>
In-Reply-To: <bb137aef-4ca9-4825-99b7-12f7e17c9550@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
	<20240827174920.316756-3-mmkurbanov@salutedevices.com>
	<bb137aef-4ca9-4825-99b7-12f7e17c9550@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_071850_392171_4EF43CED 
X-CRM114-Status: GOOD (  11.47  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDI3
IEF1ZyAyMDI0IDIwOjU3OjA0ICswMzAwOgoKPiBIZWxsbywgTWlxdWVsLiBUaGFuayB5b3UgZm9y
IHRoZSByZXZpZXcuCj4gUmVnYXJkaW5nIHlvdXIgcXVlc3Rpb24gKCBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDA3MTcxMDM2MjMuNmQ2YjYzYmVAeHBzLTEzLyApOgo+IAo+ID4+ICtp
bnQgc3BpbmFuZF9vdHBfcmVhZChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIGxvZmZf
dCBmcm9tLCBzaXplX3QgbGVuLAo+ID4+ICsJCSAgICAgdTggKmJ1Ziwgc2l6ZV90ICpyZXRsZW4p
Owo+ID4+ICsKPiA+PiAraW50IHNwaW5hbmRfb3RwX3dyaXRlKHN0cnVjdCBzcGluYW5kX2Rldmlj
ZSAqc3BpbmFuZCwgbG9mZl90IGZyb20sIHNpemVfdCBsZW4sCj4gPj4gKwkJICAgICAgY29uc3Qg
dTggKmJ1Ziwgc2l6ZV90ICpyZXRsZW4pOwo+ID4+ICsgIAo+ID4gCj4gPiBXaHkgZXhwb3Npbmcg
c3BpbmFuZF9vdHBfcmVhZCBhbmQgc3BpbmFuZF9vdHBfd3JpdGUgPyAgCj4gCj4gRm9yIHRoZSBT
UEktTkFORCBjaGlwcyB3ZSBoYXZlIChNaWNyb24sIEVTTVQsIEZPUkVTRUUpLCB0aGUgY29tbWFu
ZAo+IHNlcXVlbmNlIGZvciByZWFkaW5nL3dyaXRpbmcgT1RQIGlzIHRoZSBzYW1lLiBJIGRlY2lk
ZWQgdG8gbWFrZSB0aGVzZQo+IGZ1bmN0aW9ucyBnbG9iYWwgYmVjYXVzZSBvdGhlciBjaGlwcyBw
cm9iYWJseSBoYXZlIHNpbWlsYXIgcmVhZC93cml0ZQo+IE9UUCBvcGVyYXRpb25zIGFzIHdlbGwu
CgpPZiBjb3Vyc2UsIEkgdW5kZXJzdGFuZCB5b3UgbWlnaHQgbmVlZCB0aGVtLCBidXQgdGhlbiB0
aGUgY2hhbmdlIGRvZXMKbm90IGJlbG9uZyB0byB0aGlzIHBhdGNoLiBBY3R1YWxseSB5b3UndmUg
ZG9uZSB0aGF0IGNvcnJlY3RseSBmb3IgdGhlCnNwaW5hbmRfd2FpdCgpIGhlbHBlci4KCllvdSBj
YW4gZG8gYWxsIHRoZSAibWFrZSBmb28oKSBnbG9iYWwiIG9wZXJhdGlvbnMgaW4gYSBzaW5nbGUg
cGF0Y2ggaWYKeW91IHdhbnQuCgpJIHdpbGwgc29vbiByZXZpZXcgbW9yZSBpbiBkZWVwIHRoZSBj
b250ZW50IG9mIHRoaXMgcGF0Y2hzZXQgYWdhaW4uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
