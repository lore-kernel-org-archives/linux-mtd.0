Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A74C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XPwiMZmy6vuNqvjMSA1bgtM49QVOaMcHuqRtoI+hSY=; b=bL5JfJgLc17eIH
	9SPB1sjI7gIKk+B2GAosRf3KIG91+pl7rFQn00PPtC5dLNo+HTeLubcRtWGek52+RCliXp0qjnSNQ
	iO+0akToHmNGNF/JzLKlyz5i3usKAL7ptXiSZvNFer0mCX/ICrkuzavYs5icOOjogl19qMiL2AAa8
	pR6dPRAo3ZiGfRLFHd8pANFgx2pmR8anIrDs4sNB/Zr/ZBankMVmYHv6eTacFTvlJyLtSIxH1dQjx
	Vq+ln51nLpKooMi4kNj8ird/U5qints2qzaLKB2aN2YB8kK9UAXIwODh6a7kpZ/36gcJLe45RGjDQ
	duaiJdBZQbl7l81Zn+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7A8-0000000AQi7-1Xyt;
	Thu, 06 Mar 2025 09:05:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq72A-0000000APPV-3WXO;
	Thu, 06 Mar 2025 08:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nGwcEVedx/JIyaFBS6j1W8a/OxxJvsbDFiq4EOhTUjo=; b=k3byhzb00j7wIBgkXRuB3E8pTS
	/OQuf6LoqeNMJUOmIoB84peIoeaFfhwnL9Ps5VGAvTo8fqksJqagO5aOKcJRiV6UBMBeQN7vZ+u9v
	zzarYUAigIDkK4Tc9YeAwWk/AHoOauZ9BOyeoIxGRAajOddAt9MmcjXRbeZJwrq8r3Ew1yUJnr7f/
	EeLtyuSImhORYXRbjeHRBhdAly6qv1RNUzQEyYA/A9ULL6kPa8S61uZV+7hESCnFSW+d/ei1Z6GqW
	1X8eN7KPvqGLVPIALgm2thLbusDZ1TzTDASD2VvaQOMyoy0YWFfyR4PBs61mhJRe/0ElYOOydVfHg
	fnjKyHVQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq727-00000000yg6-295I;
	Thu, 06 Mar 2025 08:56:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095C644346;
	Thu,  6 Mar 2025 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741251403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGwcEVedx/JIyaFBS6j1W8a/OxxJvsbDFiq4EOhTUjo=;
	b=bcsa9PFyZi1TSiKo447e1/X2al16CgcgnqKVunZQwmCl3qnrX42lHDEfhvyrbmi8JXKkhB
	n46Csjqw3jAiRBM19KIhHdgmgeuOcDB9nXpJmo2rqQc6VkrgUp7DkciYqtcArEWHn73+zs
	vOaVZVP1a9rn2+5TNQVfaCcttQlc7xWDfaaCNHhImxl/3QrjVunzqykZTzJ+uZrQDZpbrk
	mQc62IoiFiU82VxHheDJGLNJIe17Q+EtySnPObBAlP183ahUQNB1rJMFzBM0rLgZNyf9gN
	ihY0C10PIAZEEmNNvFV5HSlCP3iqRxg87xIM0B21c1zjCt7p66avf6QbXYbKxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: <Manikandan.M@microchip.com>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <Nicolas.Ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <devicetree@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <Varshini.Rajendran@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
In-Reply-To: <D891QPQIT13L.1S55ZM1J286PE@kernel.org> (Michael Walle's message
	of "Thu, 06 Mar 2025 09:39:31 +0100")
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
	<D889CRJC6W19.2LDQCDVG7BLNG@kernel.org>
	<6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com>
	<87eczawo9q.fsf@bootlin.com> <D891QPQIT13L.1S55ZM1J286PE@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Mar 2025 09:56:42 +0100
Message-ID: <87o6yev8ol.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepofgrnhhikhgrnhgurghnrdfosehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheppfhitgholhgrs
 hdrhfgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghv
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_085647_675902_C4E16664 
X-CRM114-Status: GOOD (  14.57  )
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

Cj4+ID4+IEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gaGF2ZSB0aGlzIG9uZS1vZmYg
aW4gYSBwYXJ0aWN1bGFyCj4+ID4+IGRyaXZlci4gSWYgYXQgYWxsLCB0aGlzIHNob3VsZCBiZSBo
YW5kbGVkIGluIHRoZSBjb3JlLiBTb3JyeSwgYnV0Cj4+ID4+IHRoaXMgcmVhbGx5IGxvb2tzIGxp
a2UgYW4gdWdseSBoYWNrLgo+PiA+PiAKPj4gPgo+PiA+IEJlY2F1c2UgdGhlIEVVSSBpZGVudGlm
aWVyIHdpdGhpbiB0aGUgU0ZEUCBpcyB1bmlxdWUgdG8gdGhlIAo+PiA+IFNTVDI2VkYwNjRCRVVJ
IGZsYXNoLCBJIG9wdGVkIHRvIGhhbmRsZSBpdCBoZXJlIHJhdGhlciB0aGFuIGluIHRoZSBjb3Jl
Lgo+PiA+Cj4+ID4gQWxzbyBoZXJlIHRoZSBNQUMgYWRkcmVzcyBkYXRhIHJlc2lkZXMgd2l0aGlu
IHRoZSAweDI2MC0weDI2RiByYW5nZSwgSSAKPj4gPiB3aWxsIHJlc2l6ZSB0aGUgbnZtZW1fY29u
ZmlnLnNpemUgdG8gMHgxMCBpbnN0ZWFkIG9mIHJlZ2lzdGVyaW5nIHRoZSAKPj4gPiBmdWxsIFNG
RFAgcmVnaW9uIGFzIE5WTUVNLgo+Pgo+PiBPcGVuIHF1ZXN0aW9uIHRvIGFsbCBwYXJ0aWVzIGlu
IHRoaXMgdGhyZWFkOiBob3cgZG8gd2UgZ2l2ZSBhbiBvZmZzZXQgaW4KPj4gdGhlIGRldmljZSB0
cmVlIHRoYXQgaXMgcmVsYXRpdmUgdG8gdGhlIHNmZHAgcmVnaW9uIGFuZCBub3QgdGhlIGRhdGEK
Pj4gcmVnaW9uPyBJIGJlbGlldmUgd2UgY2FyZSBub3QgdG8gbWl4IHRoZXNlIGFyZWFzIHdoaWxl
IGRlc2NyaWJpbmcuCj4KPiBZb3UgZG9uJ3QgZG8gaXQsIGJlY2F1c2UgdGhlcmUgaXMgbm90IGV2
ZW4gYSByZWxhdGl2ZSBvZmZzZXQgdGhhdCBpcwo+IGZpeGVkLiBUaGVyZSBzaG91bGQgYmUgYSBw
b2ludGVyIHRvIHRoZSB2ZW5kb3IgdGFibGUgaW5zaWRlIHRoZSBTRkRQCj4gc3RydWN0dXJlLiBU
aHVzLCB5b3UgbmVlZCB0byBwcm9wZXJseSBwYXJzZSBpdC4KCklmIHRoZXJlIGlzIG5vdGhpbmcg
c3RhdGljIGFuZCB0aGUgbG9jYXRpb24gY2FuIGJlIGRlcml2ZWQgYnkgcmVhZGluZwp0aGUgY2hp
cCB0YWJsZXMsIEknZCBzdWdnZXN0IHRvIG9mZmxvYWQgdGhpcyBvdXQgb2YgdGhlIHNwaS1ub3Ig
Y29yZSBhbmQKaW5zdGVhZCB1c2Ugc29tZSBraW5kIG9mIGFuIG52bWVtIGxheW91dCBkcml2ZXIg
dG8gcmV0cmlldmUgdGhlCmNvcnJlc3BvbmRpbmcgcmVnaW9uPwoKPiBSZWdhcmRpbmcgaG93IHRv
IHJlZmVyZW5jZSBpdCB3aXRoaW4gdGhlIGRldmljZSB0cmVlLCBJJ2QgYXNzdW1lCj4gc29tZXRo
aW5nIGFsb25nICdjb21wYXRpYmxlID0gImplZGVjLHNmZHAtdmVuZG9yLXRhYmxlLU5OTiI7JyBv
cgo+IHNpbWlsYXIuIEJ1dCBubyBzdGF0aWMvcmVsYXRpdmUgb2Zmc2V0cy4KCkkgc2VlLiBXZSBu
ZWVkIHRvIGludm9rZSBvdXIgRFQgYmluZGluZyBndXJ1cy4KCkNoZWVycywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
