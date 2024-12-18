Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54525E7718C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LLcmN8IJa3xqN68ff3/fqckCkuUXfLE9pwzAiFUC5M=; b=J5/lLyG2uWsMO+
	YGJiQSHrqDa1y0UQFIkYMEpYz1XJVnEjdG+OBCCREf71QGsSo/6mHJqzFgmPsd3s7LYHETpF2ZRvd
	wiAdUNBLAkmrU4nrybvlJHoLQtaTSuxCManJlGG11NgKI4FOqSrQCLV+uTkWED4ysJcf0+40FSxXG
	HSUsr8vaDGiDmEzWl2Mdlw77+KHI6HPUTpSjVq9ji/nrIkohbqRdrAzyeltQLuJyHJMICIz4Uwywn
	RlSLdl8bIMOQxBq32Z62ZBgOLaGytIZRKSaXjkivYVopEBplQ7HitCxinpjin4G5ZG0SCcHkWZ1Wf
	Sd1Pfim7ALj86DIl8xFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhv-0000000GLXz-118p;
	Wed, 18 Dec 2024 10:55:11 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqRH-0000000G7h7-2kzz
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 09:33:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87FF760004;
	Wed, 18 Dec 2024 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734514431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqsSdcFY6IXV3OPCcBjCkZfAG7HDf4rwQ4pK04TCYsw=;
	b=ljKA7q9wvwJ/MFe13vh9Pb3DhgR8oAH7Liz2i4z7txpkWRHhfZSNSlLWl/r/lX5bC0iV05
	NG68ce8EcWtAN3YzIyAvIJ3ZyyhYpL1LUzfHtthD/2t8iXftNPvIT8hC3iBkBLhHT64urv
	FM0VHvRNPzq02AMDdbDOEeK42i4CDH/0rNK8Uk552igcz4Anf3qb3V1JRFgvzfzW2G14g+
	A2kss3vzjRGozq2aF/NlvUyXWY8JVq2RwqZMfDVDjVeC4taPi/E8CtlhQH//nLmJAiMzA0
	3Ta40e+YiJMT9dwpkSGZjiiH9ijVhCRbAO2CJx3qif664MOAgdOH5maYmiiWpg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 23/24] mtd: spinand: winbond: Add comment about naming
In-Reply-To: <e2fcc787-8fb3-4023-af76-c0db3f4b40d6@linaro.org> (Tudor
	Ambarus's message of "Wed, 18 Dec 2024 08:14:36 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-24-miquel.raynal@bootlin.com>
	<71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org>
	<87wmg3kbxa.fsf@bootlin.com>
	<e2fcc787-8fb3-4023-af76-c0db3f4b40d6@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:33:50 +0100
Message-ID: <87pllpe3nl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_013355_960985_B6E6163C 
X-CRM114-Status: GOOD (  16.95  )
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

T24gMTgvMTIvMjAyNCBhdCAwODoxNDozNiBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDEyLzEzLzI0IDEyOjI1IFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+PiBPbiAxMS8xMS8yMDI0IGF0IDE0OjM4OjUzIEdNVCwgVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPj4gCj4+PiBPbiAxMC8yNS8yNCA1
OjE1IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4+IE1ha2UgdGhlIGxpbmsgYmV0d2VlbiB0
aGUgY29yZSBtYWNyb3MgYW5kIHRoZSBkYXRhc2hlZXQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Pj4+IC0tLQo+Pj4+
ICBkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgfCA1ICsrKysrCj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3NwaS93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4+
PiBpbmRleCA2ODZlODcyZmUwZmYuLjllMjU2MjgwNWQyMyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2
ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS93aW5ib25kLmMKPj4+PiBAQCAtMTgsNiArMTgsMTEgQEAKPj4+PiAgCj4+Pj4gICNkZWZpbmUg
VzI1TjA0S1ZfU1RBVFVTX0VDQ181XzhfQklURkxJUFMJKDMgPDwgNCkKPj4+PiAgCj4+Pj4gKy8q
Cj4+Pj4gKyAqICJYMiIgaW4gdGhlIGNvcmUgaXMgZXF1aXZhbGVudCB0byAiZHVhbCBvdXRwdXQi
IGluIHRoZSBkYXRhc2hlZXRzLAo+Pj4+ICsgKiAiWDQiIGluIHRoZSBjb3JlIGlzIGVxdWl2YWxl
bnQgdG8gInF1YWQgb3V0cHV0IiBpbiB0aGUgZGF0YXNoZWV0cy4KPj4+PiArICovCj4+Pgo+Pj4g
ZG9lc24ndCBoZWxwIGdyZWF0IGZvciBhbiBvdXRzaWRlciBsaWtlIG1lLiBJcyBxdWFkIHJlZmVy
cmluZyB0byBjbWQsCj4+PiBhZGRyIG9yIGRhdGE/IE9yIG1heWJlIG9mIGFsbD8gSSBuZWVkIHRv
IHJlYWQgdGhlIGNvZGUgYW55d2F5Lgo+PiAKPj4gSSBhbHNvIGRvbid0IGxpa2UgdGhlc2UgdGVy
bXMuIElJUkMgIm91dHB1dCIgaXMgcmVmZXJyaW5nIHRvIHRoZSBkYXRhIGN5Y2xlcywKPj4gb3Ro
ZXJ3aXNlIGl0IG1lYW5zIGFkZHJlc3MgKGR1bW15KSBhbmQgZGF0YSBjeWNsZXMuCj4+IAo+PiBJ
biBzaW5nbGUsIGR1YWwgb3IgcXVhZCBtb2RlIHRoZSBuYW1pbmcgaXMgdW5jbGVhciBidXQgIm9r
YXkiLiBCdXQgb2N0YWwKPj4gRERSIG1vZGVzIGNhbiByZXF1aXJlIHRoZSBvcGNvZGUgdG8gYmUg
c2VudCBpbiBvY3RhbCBtb2RlIGFzIHdlbGwsIHdoaWNoCj4+IGlzIG5ldy4gSWYgd2Ugc3VwcG9y
dCB0aGF0LCBJJ2xsIHRha2UgY2FyZSBvZiB1c2luZyBhIG1vcmUKPj4gdW5kZXJzdGFuZGFibGUg
bmFtaW5nIGZvciBhbGwgbWFjcm9zIGxpa2UgWHktWHktWHksIFggYmVpbmcgdGhlCj4+IGJ1c3dp
ZHRoLCB5IGJlaW5nIFMgKHNkcikgb3IgRCAoZGRyKSBhbmQgdGhlIHRocmVlIG1lbWJlcnMgYmVp
bmcKPgo+IDhkLThkLThkIGlzIGNvbW1vbiBhbmQgY292ZXJlZCBieSBmZXcgc3RhbmRhcmRzLCB5
ZXMuCj4KPj4gQ29tbWFuZC1BZGRyZXNzLURhdGEuIEkgbWlnaHQgZXZlbiBiZSB0ZW1wdGVkIHRv
IGluY2x1ZGUgZHVtbXkgY3ljbGVzIGFzCj4+IHdlbGwsIGJlY2F1c2UgaXQgaXMgaW1wb3J0YW50
IHRvIGJlIGNsZWFyIGlmIGVnLiBpbiBvY3RhbCBtb2RlICIxIiBtZWFucwo+PiAiMSBjeWNsZSIg
b3IgIjggY3ljbGVzIi4KPiBJIGZpbmQgdGhlIGluZm8gYWJvdXQgZHVtbXkgY3ljbGVzIHVzZWZ1
bC4gSSB3b25kZXIgaWYgc3VjaCB0ZXJtaW5vbG9neQo+IGlzIGFscmVhZHkgc3BlY2lmaWVkIGlu
IGEgc3RhbmRhcmQuIElmIG5vdCwgbWF5YmUgd2UgY2FuIHB1dCB0aGUgZHVtbXkKPiBjeWNsZXMg
YWZ0ZXIgdGhlIG1vZGUsIGluIHBhcmVudGhlc2lzPyBJIHdvdWxkIHJlZnJhaW4gY3VzdG9tIHRl
cm1pbm9sb2d5LgoKSSBzZWUgeW91IGNvbmNlcm4sIGJ1dCB3b3VsZCB5b3UgbWluZCBnaXZpbmcg
YW4gZXhhbXBsZSBvZiB3aGF0IHlvdSBoYXZlCmluIG1pbmQ/CgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
