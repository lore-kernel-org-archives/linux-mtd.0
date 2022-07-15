Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38218C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCJ+Gcue4GmDawBz0sDcvFP1KMThcrtS3K5o1B5o/MU=; b=4YiDKw0VMaXEieAqorfU7zDaLK
	mCzKliEOVo6X4rR3me1nIiM/z9GJP3ZqZ9SUsGt11ZsM3oVnQ3QB1IIj34iur8jn5Rpsl38yqXpCl
	zX1HCrYGKmqochU7mNLomZgWcpEhZC7sxUiok9QLDgmh9e9/OCQ7gtyHfxQ8N86KCW2MSCfIyWxaK
	bsZIwdn2LkKqxW/vIW1RF41LQbaHTQ4CaffAr4rz+qAD7mbvN/jtmUDP8RY6O2aBdlB4arCpFAwyM
	P4nVxtUTFCxCtGcshW+4r7V4ylzlH7/WzvuqLD1CRHg21jz/lRun2O37WzuwHjbc3FXNvC5sx4w5A
	JCo44XwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUbx-00B5R1-TK; Fri, 15 Jul 2022 23:20:42 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUAZ-00AtZF-VD
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 22:52:27 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0ED3022175;
	Sat, 16 Jul 2022 00:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657925529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE+oDGj+om8lhuzJzV1Y3FduLHUTrtVw+CNorJfqVPk=;
	b=rZd1K5eChfz7xO8uVX3E9KvzneH/+lPRqb0RLFje3dPxFYunWcGtSKVKBvJ6mO412pb4uV
	eLYaLaYQEWUph6iEDgfwMX55RYcxWQOJ5l1ZUgs5pz6uGi9Su1Nx8TbI1YRmGk5zqd+MJZ
	2f8VxH2TqNTuvSfd86OV1j5BJ+vH70A=
MIME-Version: 1.0
Date: Sat, 16 Jul 2022 00:52:06 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
 <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1ce1ac2fabf7e46e303da01782469355@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_155224_450446_7C3A4DDA 
X-CRM114-Status: GOOD (  27.69  )
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

SGksCgpBbSAyMDIyLTA3LTE1IDIyOjE1LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPiBPbiA3LzE0
LzIwMjIgNzozMCBBTSwgSmFlIEh5dW4gWW9vIHdyb3RlOgo+PiBPbiA3LzE0LzIwMjIgNzoyMSBB
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjItMDctMTQgMTY6MTYsIHNjaHJpZWIg
TWljaGFlbCBXYWxsZToKPj4+PiBBbSAyMDIyLTA3LTE0IDE1OjQ3LCBzY2hyaWViIEphZSBIeXVu
IFlvbzoKPj4+Pj4gT24gNy8xNC8yMDIyIDEyOjQxIEFNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+
Pj4+Pj4gV2hhdCBkb2VzICJkb2Vzbid0IGJvb3QgYXQgYWxsIiBtZWFuPyBBcmUgdGhlcmUgYW55
IGtlcm5lbCBzdGFydHVwCj4+Pj4+PiBtZXNzYWdlcz8KPj4+Pj4gCj4+Pj4+IEknbSBzaGFyaW5n
IHRoZSBlcnJvciBtZXNzYWdlcyBiZWxvdy4KPj4+PiAKPj4+PiBUaGFua3MuCj4+Pj4gCj4+Pj4+
IFvCoMKgwqAgMC43NDg1OTRdIHNwaS1ub3Igc3BpMC4wOiB3MjVxNTEybndxICg2NTUzNiBLYnl0
ZXMpCj4+Pj4+IFvCoMKgwqAgMC44NjUyMTZdIHNwaS1hc3BlZWQtc21jIDFlNjIwMDAwLnNwaTog
Q0UwIHJlYWQgYnVzd2lkdGg6NCAKPj4+Pj4gWzB4NDA2YzA3NDFdCj4+Pj4+IFvCoMKgwqAgMC44
NzI4MzNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+Pj4+PiBbwqDCoMKg
IDAuODc3OTg0XSBXQVJOSU5HOiBDUFU6IDEgUElEOiAxIGF0IGRyaXZlcnMvbXRkL210ZGNvcmUu
Yzo1ODMKPj4+Pj4gYWRkX210ZF9kZXZpY2UrMHgyOGMvMHg1M2MKPj4+Pj4gW8KgwqDCoCAwLjg4
NzIzN10gQ1BVOiAxIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKPj4+Pj4gNS4x
NS40My1BVVRPSU5DLWRpcnR5LTIzODAxYTYgIzEKPj4+PiAKPj4+PiBDb3VsZCB5b3UgcGxlYXNl
IHRyeSBpdCBvbiB0aGUgbGF0ZXN0ICh2YW5pbGxhKSBsaW51eC1uZXh0Pwo+Pj4gCj4+PiBvciBz
cGktbm9yL25leHQgWzFdIGFzIHRoZXJlIGFyZSBxdWl0ZSBhIGxvdCBvZiBjaGFuZ2VzLiBUaGUK
Pj4+IHBhdGNoZXMgc2hhbGwgYmUgYmFzZWQgb24gdGhhdC4KPj4gCj4+IE9rYXkuIExldCBtZSB0
cnkgdGhhdC4gSSB0ZXN0ZWQgaXQgdXNpbmcgNS4xNS40MyB3aXRoIGJhY2stcG9ydGVkCj4+IHNw
aS1ub3IgcGF0Y2hlcyBmcm9tIHRoZSBsYXRlc3QuIEknbGwgYmFjay1wb3J0IG1vcmUgY2hhbmdl
cyBmcm9tCj4+IHRoZSBzcGktbm9yL25leHQgYW5kIHdpbGwgdGVzdCB0aGUgSU5GTygweGVmNjAy
MCwgMCwgMCwgMCkgc2V0dGluZwo+PiBhZ2Fpbi4KPiAKPiBJIHRlc3RlZCB0aGUgc2V0dGluZyBh
Z2FpbiBhZnRlciBjaGVycnkgcGlja2luZyBhbGwgU1BJIHJlbGF0aW5nIAo+IGNoYW5nZXMKPiBm
cm9tIHRoZSAnZm9yLW5leHQnIGJyYW5jaCBvZgo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaSByZXBvc2l0b3J5LgoKVGhhdCBpcyBub3Qg
dGhlIHRyZWUgSSBtZW50aW9uZWQgaW4gbXkgcHJldmlvdXMgbWFpbC4gV2h5IGRvIHlvdQpjaGVy
cnktcGljayB0aGUgY2hhbmdlcyBpbnN0ZWFkIG9mIGp1c3QgdHJ5aW5nIHRoZSBzcGktbm9yL25l
eHQKdHJlZT8KCj4gTm8gbHVjayEgSXQncyBzdGlsbCBtYWtpbmcgdGhlIHNhbWUgd2FybmluZyBk
dW1wIGF0ICdhZGRfbXRkX2RldmljZScKPiBzaW5jZSAnbXRkLT5lcmFzZXNpemUnIGlzIGNoZWNr
ZWQgYXMgMC4KPiAKPiBJIHRyYWNlZCBpdCBmdXJ0aGVyIHRvIGNoZWNrIGlmIHRoZSBlcmFzZXNp
emUgaXMgcHJvcGVybHkgcGFyc2VkIGZyb20KPiB0aGUgc2ZkcCBhbmQgY2hlY2tlZCB0aGF0IGVy
YXNlIG1hcCBzZWVtcyBwYXJzZWQgYW5kIGluaXRpYWxpemVkCj4gY29ycmVjdGx5IGluICdzcGlf
bm9yX3BhcnNlX2JmcHQnIGJ1dCBwcm9ibGVtIGlzLCBhIHRhcmdldAo+IG10ZC0+ZXJhc2VzaXpl
IGlzIG5vdCBwcm9wZXJseSBzZWxlY3RlZCBpbiAnc3BpX25vcl9zZWxlY3RfZXJhc2UnIHNpbmNl
Cj4gdGhlICd3YW50ZWRfc2l6ZScgdmFyaWFibGUgaXMgaW5pdGlhbGl6ZWQgYXMgc2VjdG9yIHNp
emUgb2YgaW5mbyB0YWJsZQo+IHNvIGEgc2VsZWN0ZWQgdGFyZ2V0IG10ZC0+ZXJhc2VzaXplIGlz
IGFsc28gMCBzbyBsb29rcyBsaWtlIGl0J3MgdGhlCj4gcmVhc29uIHdoeSBpdCBjYW4ndCBpbml0
aWFsaXplIG10ZCBkZXZpY2UgaWYgd2UgdXNlCj4gSU5GTygweGVmNjAyMCwgMCwgMCwgMCkuCgpI
YXZlIGEgbG9vayBhdApodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMjA1MTAx
NDAyMzIuMzUxOTE4NC0yLW1pY2hhZWxAd2FsbGUuY2MvCndhbnRlZF9zaXplIGNhbiBiZSAwLiBJ
biB0aGlzIGNhc2Ugc3BpX25vcl9zZWxlY3RfdW5pZm9ybV9lcmFzZSgpCnNob3VsZCByZXR1cm4g
dGhlIGJpZ2dlc3QgdmFsaWQgZXJhc2UgdHlwZS4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGF0
CigxKSBzcGlfbm9yX3NlbGVjdF91bmlmb3JtX2VyYXNlKCkgcmV0dXJuIG5vbi1OVUxMCigyKSBj
aGVjayB3aGF0IHZhbHVlIGVyYXNlLT5zaXplIGhhcyAoSSBndWVzcyBpdCBzaG91bGQgYmUgNjRr
IGluIHlvdXIgCmNhc2UpCgogRnJvbSB3aGF0IHlvdSB0ZWxsIG1lIGVyYXNlLT5zaXplIHNob3Vs
ZCBiZSB6ZXJvLiBJZiB0aGF0IGlzIHRoZQpjYXNlIGxvb2sgYXQgc3BpX25vcl9wYXJzZV9iZnB0
KCkgd2hlcmUgdGhlIGVyYXNlIHNpemVzIGFyZSBwYXJzZWQuCkFsc28gdGFrZSBhIGxvb2sgYXQg
c3BpX25vcl9wYXJzZV80YmFpdCgpIHdoZXJlIHRoZSBlcmFzZSB0eXBlcyBtaWdodApiZSBjbGVh
cmVkIGFnYWluLgoKSSd2ZSBjaGVja2VkIHlvdXIgU0ZEUCBkYXRhIGFuZCBpdCBjb250YWlucyB0
aHJlZSB2YWxpZCBlcmFzZSBzaXplcwphbmQgb3Bjb2RlcyBmb3IgM2J5dGUgYWRkcmVzc2luZyBh
bmQgdHdvIHZhbGlkIGVyYXNlIG9wY29kZXMgZm9yIDQKYnl0ZSBhZGRyZXNzaW5nLiBTbyB0aGF0
IGxvb2tzIGFsbCBnb29kLiBBZnRlciBhbGwgdGhlIFNGRFAgcGFyc2luZwpJIGV4cGVjdCB0aGF0
IHlvdSBoYXZlIHR3byB2YWxpZCBlcmFzZSB0eXBlczoKICAtIGVyYXNlIHNpemUgNDA5NiB3aXRo
IGVyYXNlIG9wY29kZSAyMWgKICAtIGVyYXNlIHNpemUgNjU1MzYgd2l0aCBlcmFzZSBvcGNvZGUg
RENoCgo+IEFsc28sIGNoZWNrZWQgdGhhdCB0aGUgbXRkLT5lcmFzZXNpemUgaXMgc2V0IHRvIDQw
OTYgaWYgSSBlbmFibGUKPiBDT05GSUdfTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlMgc28gdGhl
IFNQSSBmbGFzaCBjYW4gYmUgaW5pdGlhbGl6ZWQKPiB3aXRoIHRoZSBJTkZPKDB4ZWY2MDIwLCAw
LCAwLCAwKSBzZXR0aW5nIGJ1dCwgaXQgc2hvdWxkIGNvdmVyIGV2ZW4KPiB3aGVuCj4gdGhlIGNv
bmZpZ3VyYXRpb24gaXMgbm90IGVuYWJsZWQuIEkgdGhpbmssIHRoaXMgcGF0Y2ggc2hvdWxkIGdv
IGFzIGl0Cj4gaXMuIFRoZSBlcmFzZXNpemUgc2VsZWN0aW5nIGlzc3VlIGNvdWxkIGJlIGZpeGVk
IHVzaW5nIGEgc2VwYXJhdGUKPiBwYXRjaC4KPiBBcmUgeW91IHN0aWxsIHN1cmUgdGhhdCB0aGUg
SU5GTygweGVmNjAyMCwgMCwgMCwgMCkgd29ya3MgaW4gdGhlCj4gbGF0ZXN0IHNwaS1uZXh0PwoK
SSd2ZSBnb3QgdHdvIHRlc3RlZC1ieSdzIHdpdGggdHdvIGRpZmZlcmVudCBmbGFzaGVzLCBzbyB5
ZXMsIEknbQpwcmV0dHkgc3VyZSBpdCB3b3JrcyBpbiBwcmluY2lwbGUuIEl0IG1pZ2h0IHN0aWxs
IGJlIHNvbWV0aGluZwp3cm9uZyB3aXRoIHlvdXIgZmxhc2ggdGhvdWdoLgoKLW1pY2hhZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
