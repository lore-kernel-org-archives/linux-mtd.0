Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A87C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 07:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HA4ADGyOfABHe8xhCvdgk33P3/q6aex+h1Sc2cVumQU=; b=cukwsj/tAFoe5Gy38vridQ7FcD
	lNdCwtEUHGlP7iNnDTk8NaP1fn4KkO7YqATNCzm4CsCm0yRPWtuwOfYbivMkzQDYRYft84BGocoJG
	l4IRzNmcECr9lFozIYZRIFTDK2PaiYbvXL6rqGVwpTp3EtFpMJTWuq8ZmUtkw5Wp+vMquEo/VQFxj
	OWfdzsPsJ7D1AOX8g0XbZPm8LM5d8U9OLGufhqCg/5cKuqiYB+hneqvDJOgcR4oQJkcxok9HoMvff
	lxPqH2qfD8JZ8fjl6VM0gFGyyddttUp7h9By0MEhMn4tIOB/E3xRedIXxt7d5t6FFez6EcdrZGadh
	H4nCyZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtU2-00BwFJ-Fj; Thu, 14 Jul 2022 07:42:02 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtTz-00BwC8-V8
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2022 07:42:01 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id E640B22246;
	Thu, 14 Jul 2022 09:41:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657784516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogFlYqmAqQxn6+1FR20t7h2PNmZxGGdMcvOHgoKXDus=;
	b=hEOd3Qbl+ejzDleZB42HjtegmxzoDlxldOSpYYz5UopFPl+JTTvk0V4TxayqnlK/TsZewn
	Mjsapjb+BR0iriYSZdgBMlBCaYSdUk30e0xkttEvrf54SVTaJa2scq2yMuH1YVvp7EEZ7x
	JS+DXe40yXDwPEEqsGHyLzgFUisYuJ8=
MIME-Version: 1.0
Date: Thu, 14 Jul 2022 09:41:55 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_004200_189629_25552BA6 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpBbSAyMDIyLTA3LTEzIDIzOjAxLCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPiBPbiA3LzEz
LzIwMjIgNzozMiBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gQW0gMjAyMi0wNy0xMyAxNjoy
Niwgc2NocmllYiBKYWUgSHl1biBZb286Cj4+Pj4+ICvCoMKgwqAgeyAidzI1cTUxMm53cSIsIElO
Rk8oMHhlZjYwMjAsIDAsIDY0ICogMTAyNCwgMTAyNCkKPj4+PiAKPj4+PiBQbGVhc2UgdXNlIElO
Rk8oMHhlZjYwMjAsIDAsIDAsIDApIGFuZCB0ZXN0IHdldGhlciBpdCB3aWxsIHN0aWxsCj4+Pj4g
d29yayBjb3JyZWN0bHkuIFdlIHdpbGwgdGhlbiBiZSBhYmxlIHRvIGNvbnZlcnQgaXQgdG8gU05P
Ul9JRDMoKQo+Pj4+IGxhdGVyLgo+Pj4gCj4+PiBUZXN0ZWQgaXQgYnV0IGl0IGRvZXNuJ3Qgd29y
ayB3aXRoIElORk8oMHhlZjYwMjAsIDAsIDAsIDApLiBJJ2xsIGtlZXAKPj4+IGl0IGFzIGlzLgo+
PiAKPj4gQ2FuIHlvdSBwbGVhc2UgbG9vayBpbnRvIHRoaXM/IEknZCBleHBlY3QgdGhpcyB0byB3
b3JrIGlmIHRoZSBTRkRQCj4+IHRhYmxlcyBhcmUgY29ycmVjdCBiZWNhdXNlIGFsbCB0aGlzIHNo
b3VsZCBjb21lIGZyb20gdGhlIHRhYmxlcy4KPj4gWW91IGNhbiBsb29rIGF0IC9zeXMva2VybmVs
L2RlYnVnL3NwaS1ub3Ivc3BpMC4wL3BhcmFtcyBhbmQgc2VlCj4+IHdoYXQgaXMgY2hhbmdpbmcg
dGhlcmUuCj4gCj4gSSB0ZXN0ZWQgaXQgYWdhaW4gYnV0IHJlc3VsdCBpcyBzdGlsbCB0aGUgc2Ft
ZS4gSSBjYW4gY2hlY2sgdGhlIHBhcnNlZAo+IGluZm8gbGlrZSBiZWxvdyBpZiBJIHVzZSBJTkZP
KDB4ZWY2MDIwLCAwLCA2NCAqIDEwMjQsIDEwMjQpIGJ1dCBJIGNhbid0Cj4gZXZlbiBjaGVjayB0
aGUgZGVidWdmcyBpbmZvIGlmIEkgdXNlIElORk8oMHhlZjYwMjAsIDAsIDAsIDApIHNpbmNlIGl0
Cj4gZG9lc24ndCBib290IGF0IGFsbC4gSSB0aGluaywgdGhpcyBwYXRjaCBzaG91bGQgZ28gYXMg
aXMgYW5kIHRoZSBzaXplCj4gcGFyc2luZyBpc3N1ZSBjb3VsZCBiZSBmaXhlZCB1c2luZyBhIHNl
cGFyYXRlIGZpeC4KCldoYXQgZG9lcyAiZG9lc24ndCBib290IGF0IGFsbCIgbWVhbj8gQXJlIHRo
ZXJlIGFueSBrZXJuZWwgc3RhcnR1cAptZXNzYWdlcz8KCkp1c3QgdG8gYmUgc3VyZSwgeW91IGhh
dmUgUEFSU0VfU0ZEUCBzZXQsIHJpZ2h0PwoKVGhlIGVudHJ5IHNob3VsZCBiZSAoc2tpcHBpbmcg
T1RQIHRvIG1ha2Ugc3VyZSB0aGF0IGlzbid0CnRoZSBwcm9ibGVtIGhlcmUpOgp7ICJ3MjVxNTEy
bndxIiwgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkgUEFSU0VfU0ZEUCB9CgotbWljaGFlbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
