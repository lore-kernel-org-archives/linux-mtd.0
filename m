Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02411C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti78XjCtvCUVK5NRYPgGulyAbdYUgULajOpWf+/soCc=; b=a8rfoIquOPPdLYcNd7jmdbNIZY
	VzRC3WsSmT+HybuO+91J1BloCII/GiG2v2gN4FIgMxdLYYw75XtwSGqJ4pR+OpXd59kB3NM2QHUdr
	DpbYQjIIKNWWZ5UsthxBduBAohHeIjfmtPm1/iVhwpbb4FA67aR+l0cU6SfiaR5tu2iMBVyrxIPBV
	kw70TOF8mj9j5hBz+DMAprKnkl3hSNrw63Gk1yMirMwvjSJowSK4RexSj9GZjYY3dN5tplIHxahGu
	i2ERUy2Dd9cGYHIiHvNFlYJ7fPNdEqjP9vkDCpeAgSwgzLPjxTop8vgnk7coxywfQmuJrIK0zTfqx
	vSk+v5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCKlt-00BX1u-IE; Mon, 02 Jan 2023 13:22:33 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCKlW-00BWvR-IX; Mon, 02 Jan 2023 13:22:12 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D997D89;
	Mon,  2 Jan 2023 14:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1672665719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFvEm4TS0m0oMTUcPbTdYrNtVbBi+eT7RCIgcBGxXUk=;
	b=Q/IU0tbBUb3lVx+NKUnYufg7JfbR6kQfbqGofZoUs3fLrhEke7TsnNoS+yi/Yw/ONaYMC0
	+Uhg+eP9/g+OHogid2o1V+cRdwce5mB0TTOrLf1f1XbuSffbZH9gMXajbTPDILPivYAfUf
	2wBnuNuDueeqfFcX7BCTRLJIpCbcbWXYFVwEAbWzOaVtB3CiTxACymLERTnACkFM9J/6eo
	nLxHYQ/xR5czBH0h8FipaWYKpc6pt0P7iBKXlqU2vEftiYYpidFsZuMcPdctpagFFkg054
	K5gjlBhwiKRvUnlCCRoO+J2tm8eHHXezVOwK/ooDZHMfI1EGk2drC5Rj7nZDxw==
MIME-Version: 1.0
Date: Mon, 02 Jan 2023 14:21:59 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, tudor.ambarus@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 nicolas.ferre@microchip.com, robh+dt@kernel.org
Subject: Re: [PATCH 1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
In-Reply-To: <1ee9cf77-1ca0-6e4e-ba7d-896838bd71de@linaro.org>
References: <20221117105249.115649-2-tudor.ambarus@microchip.com>
 <20221118141458.954646-1-michael@walle.cc> <Y3elIdM3Xz1H4kKk@sirena.org.uk>
 <28da9e33-57e8-7ac1-7e6c-13c297a945d6@gmail.com>
 <a2f58ad34ba74ff135852bc1e24da4d6@walle.cc>
 <1ee9cf77-1ca0-6e4e-ba7d-896838bd71de@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5ed88e3c3c105fdce1bb16ff16cde32f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_052210_841617_C5AFE4E7 
X-CRM114-Status: GOOD (  19.83  )
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

Pj4+Pj4+ICvCoCBzcGktY3Mtc2V0dXAtbnM6Cj4+Pj4+PiArwqDCoMKgIGRlc2NyaXB0aW9uOgo+
Pj4+Pj4gK8KgwqDCoMKgwqAgRGVsYXkgaW4gbmFub3NlY29kcyB0byBiZSBpbnRyb2R1Y2VkIGJ5
IHRoZSBjb250cm9sbGVyIAo+Pj4+Pj4gYWZ0ZXIgQ1MgaXMKPj4+Pj4+ICvCoMKgwqDCoMKgIGFz
c2VydGVkLgo+Pj4+IAo+Pj4+PiBEb2VzIHRoaXMgbmVlZCBhIHR5cGUgYXMgdGhlIHNwaS1jcy1z
ZXR1cC1ucyBpcyBhcHBhcmVudGx5IGp1c3QgCj4+Pj4+IDE2Yml0PyBBdAo+Pj4+PiBsZWFzdCB0
aGUgZHJpdmVyIHVzZXMgaXQgdGhhdCB3YXkuCj4+Pj4gCj4+Pj4+IEJ1dCBJTUhPIHRoaXMgc2hv
dWxkIGp1c3QgYmUgYSBub3JtYWwgdWludDMyIHZhbHVlIHRvIGJlIGNvbnNpc3RlbnQgCj4+Pj4+
IHdpdGgKPj4+Pj4gYWxsIHRoZSBvdGhlciBwcm9wZXJ0aWVzLiBBbHNvIHRoZSBtYXggdmFsdWUg
d2l0aCAxNmJpdCB3aWxsIGJlIAo+Pj4+PiAnanVzdCcKPj4+Pj4gNjV1cy4KPj4+PiAKPj4+PiBN
YWtpbmcgaXQgMzIgYml0IGRvZXMgc2VlbSBzYWZlci7CoCBJJ3ZlIGFwcGxpZWQgdGhlIHNlcmll
cwo+Pj4gCj4+PiBUaGFua3MuIFRoZXJlIGFyZSBmZXcgaW1wbGljYXRpb25zIHRvIGNvbnNpZGVy
IGJlZm9yZSBtYWtpbmcgdGhpcyAKPj4+IHByb3AgYQo+Pj4gdTMyLCBhbmQgSSdkIGxpa2UgdG8g
Y2hlY2sgdGhlbSB3aXRoIHlvdS4KPj4+IAo+Pj4gc3RydWN0IHNwaV9kZWxheSB3aWxsIGhhdmUg
dG8gYmUgdXBkYXRlZCB0byBoYXZlIGEgdTMyIHZhbHVlLCBub3cgCj4+PiBpdCdzIGEKPj4+IHUx
Ni4gVGhpcyBtZWFucyB0aGF0IHdlJ2xsIGhhdmUgdG8gdXBkYXRlIHNwaV9kZWxheV90b19ucygp
IHRvIGVpdGhlcgo+Pj4gcmV0dXJuIGEgczY0IG9yIHRvIGFkZCBhIHU2NCAqZGVsYXkgcGFyYW1l
dGVyIHRvIHRoZSBmdW5jdGlvbiBzbyB0aGF0IAo+Pj4gd2UKPj4+IGNhbiBzdGlsbCBoYW5kbGUg
dGhlIGNvbnZlcnNpb25zIGZyb20gdXNlY3MgYW5kIHRoZSBlcnJvciBjb2RlcyBpbiAKPj4+IHRo
ZQo+Pj4gU1BJX0RFTEFZX1VOSVRfU0NLIGNhc2UuIFRoZW4gYWxsIGl0cyBjYWxsZXJzIGhhdmUg
dG8gYmUgdXBkYXRlZCB0bwo+Pj4gY29uc2lkZXIgdGhlIHU2NCBkZWxheS4KPj4gCj4+IEkgd2Fz
IHRhbGtpbmcgYWJvdXQgdGhlIGRldmljZSB0cmVlIHByb3BlcnR5LiBFdmVuIGlmIHRoZSBkcml2
ZXIgCj4+IGNvbnRpbnVlCj4+IHRvIHVzZSBqdXN0IDE2Yml0LCB0aGUgRFQgcHJvcGVydHkgY291
bGQgYmUgMzJiaXQgSU1ITy4KPiAKPiBidXQgdGhlbiB5b3UnbGwgaGF2ZSBhbiBpbXBsaWNpdCBj
YXN0IHRvIHUxNiBhdDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3NwaS9zcGkuYyNuMjMxNAo+
IHdoaWNoIHdpbGwgbWFrZSB0aGUgdTMyIGR0IHByb3AgbWlzbGVhZGluZy4KCk5vdGhpbmcgd2ls
bCBwcmV2ZW50IHlvdSBmcm9tIGNoZWNraW5nIGZvciBhIHZhbGlkIHJhbmdlIGFuZCByZXR1cm4g
YW4KZXJyb3IgOikKQnV0IEkgYWdyZWUsIHRoYXQgY29udmVydGluZyB0aGUgdTE2IHRvIHUzMiBp
biB0aGUgZHJpdmVyIGlzIHByb2JhYmx5CnRoZSBiZXR0ZXIgd2F5LgoKPj4gQXQgdGhlIG1vbWVu
dCwgdGhlIHNjaGVtYSBzYXlzIGl0cyAzMmJpdCAoaWYgSSdtIG5vdCBtaXN0YWtlbiwgYmVjYXVz
ZQo+PiBpdCBkb2Vzbid0IGhhdmUgYSB0eXBlKSwgYnV0IHRoZSBkcml2ZXIgd2lsbCBwYXJzZSB0
aGUgcHJvcGVydHkgYXMKPj4gMTZiaXQgYW5kIHlvdXIgZGV2aWNlIHRyZWUgYWxzbyBoYXMgdGhp
cyAvYml0cy8gdGhpbmd5LiBTbyByZWdhcmRsZXNzCj4+IGlmIHRoZSBkcml2ZXIgaXMgdXNpbmcg
MTZiaXQgb3IgMzJiaXQgZm9yIHRoZSB2YWx1ZSwgdGhlcmUgc2VlbXMgdG8gYmUKPj4gYSBkaXNj
cmVwYW5jeSBiZXR3ZWVuIHRoZSBzY2hlbWEgYW5kIHRoZSBkZXZpY2V0cmVlIChhbmQgZHJpdmVy
KS4KPiAKPiBva2F5LCB0aGFua3MgZm9yIHBvaW50aW5nIGl0IG91dC4gTGV0J3MgZGVjaWRlIGhv
dyB3ZSBmaXggdGhpcy4KPiAKPj4gCj4+IEFsbCBvdGhlciBwcm9wZXJ0aWVzIGFyZSBqdXN0IHRo
ZSByZWd1bGFyIDMyYml0IHZhbHVlcywgdGh1cyBJIHdhcwo+PiBzdWdnZXN0aW5nIHRvIGNoYW5n
ZSB0aGUgRFQgcHJvcGVydHkgdG8gMzJiaXQuCj4gCj4gSWYgd2Ugd2FudCB0byBjaGFuZ2UgdGhl
IGR0IHByb3AgdG8gMzJiaXQgSSB0aGluayB3ZSBzaG91bGQgYWxzbyBoYW5kbGUKPiB0aGUgcGFy
c2VkIHZhbHVlIGFzIHUzMiwgbm90IGFzIHUxNi4KClN0cmljdGx5IHNwZWFraW5nLCB5b3VyIGRl
dmljZSB0cmVlIGlzIHdyb25nLCBiZWNhdXNlIHRoZSBzY2hlbWEKYWxyZWFkeSBzYXlzIGl0J3Mg
MzJiaXQuCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
