Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E325C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyHYk7I7QpIBMJyqE/ER+dVvQsXJSfN2p7gy6iSzJk4=; b=kVxdJlAgQ1L+73
	TWm7dL1DAmomNYmdu8WTxWTEHA8JnehPo6/g5XbqH8iSAbO6G63LBdnTUmVqu9r3Z25bUPwV534vT
	6zCVjCsIJAoKoZ6TOE/xYn81OqxfkAbCteWrtIal7m3UXZ+0nlhcSUKLhX+GgpnEc7ydAFiWoGVNi
	zDVyXWsH2HC8a3m/2Cd2xwYgLFZxZgVzYr65kyfPcfpaNtO1SG5lK3JSyCViLcfRn949BbRo7q8Yo
	2zlDWn02V/L4AwW4qy/He6MGyROyFB/tBLNgnU48B9ZOdh6Z1zwuLD8L/vgbybmF8w6Ih+IrOXDb4
	9Z4Pt7nA3clYMIgcSglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GP9-00GTSm-3B;
	Wed, 31 May 2023 07:37:59 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GP7-00GTRf-1Z
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 07:37:59 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685518675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crOpwvqDjgCv5Iq8u/sJqrtyV1k8VhIgkmZfw96TObI=;
	b=MHE4kD9uYhdo+tdxmqhAEUgebBeDxykmVLMZMpMzMKAU+RSHEtHsdEpyv8WH2nOfRbROJr
	Y4D0LRK6hgoph8i/s6COIQiPi9BJZnBikCP7W5/Z3YzLxkZ72N6SEo89gJ5UoVke215o4F
	X10/u/gr7XzzpzAMUaurHTFaYs+9d7guyErtIcig2Yw56lh42sZmsveZQbELzfbN4JtwUT
	GxK7Y6gzs+OsXhKLTjd5MhkXA1REa3dPnxNk9Oio55QARHSrAFJ+VGJrLIHuSsr1CaXsqT
	pv5qPw2364H8JKMvP07nzgesCjsZwf+KpmwQubOnFaWmr+e2LIifmQmTpQ48kA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88D6DFF808;
	Wed, 31 May 2023 07:37:52 +0000 (UTC)
Date: Wed, 31 May 2023 09:37:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, arnd@arndb.de,
 daniel.lezcano@linaro.org, neil.armstrong@linaro.org, f.fainelli@gmail.com,
 christophe.kerello@foss.st.com, liang.yang@amlogic.com, jdelvare@suse.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: rawnand: marvell: add support for AC5 SoC
Message-ID: <20230531093752.17fbeb1b@xps-13>
In-Reply-To: <20230531025847.1284862-3-chris.packham@alliedtelesis.co.nz>
References: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
	<20230531025847.1284862-3-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_003757_832404_53561D06 
X-CRM114-Status: GOOD (  23.15  )
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

SGkgQ2hyaXMsCgpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gV2Vk
LCAzMSBNYXkgMjAyMyAxNDo1ODo0NworMTIwMDoKCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBBQzUv
QUM1WCBTb0MgZnJvbSBNYXJ2ZWxsLiBUaGUgTkZDIG9uIHRoaXMgU29DIG9ubHkKPiBzdXBwb3J0
cyBTRFIgbW9kZXMgdXAgdG8gMy4KClN0cmFuZ2UhCgpCdXQgYWxyaWdodCwgSSdtIG9rYXkgd2l0
aCB0aGUgc2VyaWVzLgoKSSdsbCBwdXQgaXQgYXNpZGUgd2FpdGluZyBmb3IgYWxsIGJpbmRpbmcg
Y2hhbmdlcyB0byBiZSBhY2tlZCAoeWFtbApjb252ZXJzaW9uIHNlcmllcyArIHRoaXMgb25lKSBh
bmQgdGhlbiBJJ2xsIGFwcGx5IGV2ZXJ5dGhpbmcuCgo+IE1hcnZlbGwncyBTREsgaW5jbHVkZXMg
c29tZSBwcmVkZWZpbmVkIHZhbHVlcyBmb3IgdGhlIG5kdHIgcmVnaXN0ZXJzLgo+IFRoZXNlIGhh
dmVuJ3QgYmVlbiBpbmNvcnBvcmF0ZWQgYXMgdGhlIGV4aXN0aW5nIGNvZGUgc2VlbXMgdG8gZ2V0
IGdvb2QKPiB2YWx1ZXMgYmFzZWQgb24gbWVhc3VyZW1lbnRzIHRha2VuIHdpdGggYW4gb3NjaWxs
b3Njb3BlLgoKR29vZCA6KQoKQnkgdGhlIHdheSBkaWQgeW91IHNvcnQgdGhlIHRpbWluZ3MgcXVl
c3Rpb24gb24gOGs/Cgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2to
YW1AYWxsaWVkdGVsZXNpcy5jby5uej4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2Nv
bmZpZyAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQu
YyB8IDE2ICsrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L0tjb25maWcgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gaW5kZXggYjUyMzM1NGRm
YjAwLi4wZjRjYmI0OTcwMTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2Nv
bmZpZwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcKPiBAQCAtMTYwLDcgKzE2
MCw3IEBAIGNvbmZpZyBNVERfTkFORF9NQVJWRUxMCj4gIAkgIGluY2x1ZGluZzoKPiAgCSAgLSBQ
WEEzeHggcHJvY2Vzc29ycyAoTkZDdjEpCj4gIAkgIC0gMzItYml0IEFybWFkYSBwbGF0Zm9ybXMg
KFhQLCAzN3gsIDM4eCwgMzl4KSAoTkZDdjIpCj4gLQkgIC0gNjQtYml0IEFyYW1kYSBwbGF0Zm9y
bXMgKDdrLCA4aykgKE5GQ3YyKQo+ICsJICAtIDY0LWJpdCBBcmFtZGEgcGxhdGZvcm1zICg3aywg
OGssIGFjNSkgKE5GQ3YyKQo+ICAKPiAgY29uZmlnIE1URF9OQU5EX1NMQ19MUEMzMlhYCj4gIAl0
cmlzdGF0ZSAiTlhQIExQQzMyeHggU0xDIE5BTkQgY29udHJvbGxlciIKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tYXJ2ZWxsX25hbmQuYwo+IGluZGV4IDMwYzE1ZTRlMWNjMC4uYjlhOGRkMzI0MjExIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiBAQCAtMzc1LDYgKzM3NSw3IEBAIHN0
YXRpYyBpbmxpbmUgc3RydWN0IG1hcnZlbGxfbmFuZF9jaGlwX3NlbCAqdG9fbmFuZF9zZWwoc3Ry
dWN0IG1hcnZlbGxfbmFuZF9jaGlwCj4gICAqCQkJQkNIIGVycm9yIGRldGVjdGlvbiBhbmQgY29y
cmVjdGlvbiBhbGdvcml0aG0sCj4gICAqCQkJTkRDQjMgcmVnaXN0ZXIgaGFzIGJlZW4gYWRkZWQK
PiAgICogQHVzZV9kbWE6CQlVc2UgZG1hIGZvciBkYXRhIHRyYW5zZmVycwo+ICsgKiBAbWF4X21v
ZGVfbnVtYmVyOglNYXhpbXVtIHRpbWluZyBtb2RlIHN1cHBvcnRlZCBieSB0aGUgY29udHJvbGxl
cgo+ICAgKi8KPiAgc3RydWN0IG1hcnZlbGxfbmZjX2NhcHMgewo+ICAJdW5zaWduZWQgaW50IG1h
eF9jc19uYjsKPiBAQCAtMzgzLDYgKzM4NCw3IEBAIHN0cnVjdCBtYXJ2ZWxsX25mY19jYXBzIHsK
PiAgCWJvb2wgbGVnYWN5X29mX2JpbmRpbmdzOwo+ICAJYm9vbCBpc19uZmN2MjsKPiAgCWJvb2wg
dXNlX2RtYTsKPiArCXVuc2lnbmVkIGludCBtYXhfbW9kZV9udW1iZXI7Cj4gIH07Cj4gIAo+ICAv
KioKPiBAQCAtMjM3Niw2ICsyMzc4LDkgQEAgc3RhdGljIGludCBtYXJ2ZWxsX25mY19zZXR1cF9p
bnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPiAgCWlmIChJU19F
UlIoc2RyKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihzZHIpOwo+ICAKPiArCWlmIChuZmMtPmNhcHMt
Pm1heF9tb2RlX251bWJlciAmJiBuZmMtPmNhcHMtPm1heF9tb2RlX251bWJlciA8IGNvbmYtPnRp
bWluZ3MubW9kZSkKPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICAJLyoKPiAgCSAqIFNE
UiB0aW1pbmdzIGFyZSBnaXZlbiBpbiBwaWNvLXNlY29uZHMgd2hpbGUgTkZDIHRpbWluZ3MgbXVz
dCBiZQo+ICAJICogZXhwcmVzc2VkIGluIE5BTkQgY29udHJvbGxlciBjbG9jayBjeWNsZXMsIHdo
aWNoIGlzIGhhbGYgb2YgdGhlCj4gQEAgLTMwNzMsNiArMzA3OCwxMyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1hcnZlbGxfbmZjX2NhcHMgbWFydmVsbF9hcm1hZGFfOGtfbmZjX2NhcHMgPSB7Cj4g
IAkuaXNfbmZjdjIgPSB0cnVlLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtYXJ2
ZWxsX25mY19jYXBzIG1hcnZlbGxfYWM1X2NhcHMgPSB7Cj4gKwkubWF4X2NzX25iID0gMiwKPiAr
CS5tYXhfcmJfbmIgPSAxLAo+ICsJLmlzX25mY3YyID0gdHJ1ZSwKPiArCS5tYXhfbW9kZV9udW1i
ZXIgPSAzLAo+ICt9Owo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYXJ2ZWxsX25mY19jYXBz
IG1hcnZlbGxfYXJtYWRhMzcwX25mY19jYXBzID0gewo+ICAJLm1heF9jc19uYiA9IDQsCj4gIAku
bWF4X3JiX25iID0gMiwKPiBAQCAtMzEyMSw2ICszMTMzLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG1hcnZlbGxfbmZjX29mX2lkc1tdID0gewo+ICAJCS5jb21wYXRpYmxl
ID0gIm1hcnZlbGwsYXJtYWRhLThrLW5hbmQtY29udHJvbGxlciIsCj4gIAkJLmRhdGEgPSAmbWFy
dmVsbF9hcm1hZGFfOGtfbmZjX2NhcHMsCj4gIAl9LAo+ICsJewo+ICsJCS5jb21wYXRpYmxlID0g
Im1hcnZlbGwsYWM1LW5hbmQtY29udHJvbGxlciIsCj4gKwkJLmRhdGEgPSAmbWFydmVsbF9hYzVf
Y2FwcywKPiArCX0sCj4gIAl7Cj4gIAkJLmNvbXBhdGlibGUgPSAibWFydmVsbCxhcm1hZGEzNzAt
bmFuZC1jb250cm9sbGVyIiwKPiAgCQkuZGF0YSA9ICZtYXJ2ZWxsX2FybWFkYTM3MF9uZmNfY2Fw
cywKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
