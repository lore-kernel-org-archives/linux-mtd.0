Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D4CC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV1+nd9FI91IqXtF/c7T5YiJsofZ+WV4t7SKS7seRGE=; b=kpUMry7U4Y0P5lj+rDsKWVWe7C
	cQt4MoteQ7+8MwTgn4gVLkwnVbwplrhNjLLgoXlkTV3/vG5H1mUq2ZYq/sVFvA7VY5xDyKiJJG/rU
	4K+WK/pDYczo1f4YvxDQgX/yKKDM0+nAH8Xx/AXsAbl2n3Gl3vGkolZ7UrWZqAQGYeTOpbrmsbqdo
	O3/nZ2QWEBx1oKGIggp4gFMLJot0aTiFAt7cBY7pz33T1Qjr1wwhwBU3rR1cmRoTuZDlLnvf8CAbz
	OwkMM8FfQo5HRKyrZW9FnxS8+Bc0OIh5NT99g4zM269fQC35c7FUjItiMt5K8v5CEcBGpLdZrVZvz
	pCK0Xwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7dX9-002o14-2w;
	Mon, 27 Nov 2023 15:28:27 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7dX6-002o0i-2s
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 15:28:26 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 419179E2;
	Mon, 27 Nov 2023 16:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701098902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1z4tcdraE2S0uiA58SznRzZmul5Yx7+C2Me9P+RO/8=;
	b=PCqHNc2ztEri50P2Pl37VgelYvGVi4GPwg7R+10njxaW1/ekxhV2AKjqIC7j7/chs9WJ0c
	lNjqyn1yJHog1xBkrYjUfR7F9KCyfKILYYMdXlrpPASZMPpmMHDdoDyEQ2Kamk5yOXoh77
	Blwz2StEz1iTcNj3VRR6Y95HnIAHg2ptEnX4BZudyfDhWGB6HrAz81OzjGZWVPOtW/w5lX
	XVXaDZODyUPaIBFcVJ5dGOpc0i/uB7G5FJdAiB34xXBDqWDc3f1/+mvdQLi6hkXRoPGbFe
	6a9lWnBdUAlQe+7op8npNUSLQw4iVinfuq1Bi9+TmF5+qrAsartcoc9bGjv3OQ==
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 16:28:21 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Jaime Liao
 <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash name
 does not exist
In-Reply-To: <e34cc75e-3060-459f-bf09-2f2b3d99678d@linaro.org>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127100756.41605-3-jaimeliao.tw@gmail.com>
 <6d362dd698095b04dd895019d3af26d0@walle.cc> <20231127154737.534db375@xps-13>
 <848f3b2e83d363fd69adfc947b197011@walle.cc>
 <e34cc75e-3060-459f-bf09-2f2b3d99678d@linaro.org>
Message-ID: <63508eaccc1dcddf1deb1245ef39f00c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_072825_081587_CC33B33D 
X-CRM114-Status: GOOD (  17.16  )
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

SGksCgo+Pj4+ID4gKG51bGwpIHdpbGwgcHJpbnQgd2hlbiBmbGFzaCBJRCBmb3VuZGVkIGluIElE
IHRhYmxlIGJ1dAo+Pj4+ID4gdGhlIGZsYXNoIG5hbWUgZGlkbid0IGluY2x1ZGUgaW4gaXQuCj4+
Pj4gPgo+Pj4+ID4gTWFrZSBpbmZvLT5uYW1lIG9wdGlvbmFsIGluIHRoZSBwcmludCBmb3Igc2hv
d2luZyBmbGFzaCBuYW1lCj4+Pj4gPiBhbmQgZmxhc2ggc2l6ZS4KPj4+PiA+Cj4+Pj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWltZUxpYW8gPGphaW1lbGlhb0BteGljLmNvbS50dz4KPj4+PiA+IC0tLQo+
Pj4+ID7CoCBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDIgKy0KPj4+PiA+wqAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4gPgo+Pj4+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMKPj4+PiA+IGluZGV4IDFjNDQzZmU1NjhjZi4uNzM0MDViZWQyYTVhIDEwMDY0NAo+
Pj4+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4+PiA+ICsrKyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+Pj4gPiBAQCAtMzUxOCw3ICszNTE4LDcgQEAgaW50IHNw
aV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25zdAo+Pj4+IGNoYXIgPiAqbmFtZSwK
Pj4+PiA+wqDCoMKgwqDCoCAvKiBObyBtdGRfaW5mbyBmaWVsZHMgc2hvdWxkIGJlIHVzZWQgdXAg
dG8gdGhpcyBwb2ludC4gKi8KPj4+PiA+wqDCoMKgwqDCoCBzcGlfbm9yX3NldF9tdGRfaW5mbyhu
b3IpOwo+Pj4+ID4KPj4+PiA+IC3CoMKgwqAgZGV2X2luZm8oZGV2LCAiJXMgKCVsbGQgS2J5dGVz
KVxuIiwgaW5mby0+bmFtZSwKPj4+PiA+ICvCoMKgwqAgZGV2X2luZm8oZGV2LCAiJXMgKCVsbGQg
S2J5dGVzKVxuIiwgaW5mby0+bmFtZSA/OiAiIiwKPj4+PiAKPj4+PiBNYXliZSBwcmludCB0aGUg
amVkZWMgaWQgaWYgdGhlIG5hbWUgaXMgZW1wdHkuCj4+PiAKPj4+IFdoYXQgYWJvdXQgYWx3YXlz
IHByaW50aW5nIHRoZSBqZWRlYyBpZCBpZiBuYW1lcyBhcmVuJ3QgcmVsaWFibGUKPj4+IGVub3Vn
aD8KPj4gCj4+IEknbSBmaW5lIHdpdGggdGhhdCwgdG9vLiBBY3R1YWxseSBJJ3ZlIGNvbnNpZGVy
ZWQgdGhhdCBteXNlbGYsIGJ1dAo+PiBtYXliZSBUdWRvciBvciBQcmF0eXVzaCB3YW50IHRvIGtl
ZXAgdGhlIG91dHB1dCBiYWNrd2FyZHMgY29tcGF0aWJsZS4KPj4gCj4gCj4gV2Ugd29uJ3QgcmVt
b3ZlIHRoZSBuYW1lcyBmb3IgZmxhc2hlcyB0aGF0IGFscmVhZHkgaGF2ZSBhIG5hbWUgZGVmaW5l
ZCwKPiB3b24ndCB3ZT8KCk5vLgoKPiBXZSBqdXN0IGRlcHJlY2F0ZSB0aGUgbmFtZSBmaWVsZCBh
bmQgbm90IHVzZSBpdCBhbnltb3JlIHdpdGgKPiBuZXcgZmxhc2ggYWRkaXRpb25zLiBObyBiYWNr
d2FyZCBjb21wYXRpYmlsaXR5IHByb2JsZW0uCgpJIG1lYW4gaW4gdGhlIGtlcm5lbCBjb25zb2xl
IG91dHB1dC4gU29tZW9uZSBvdXQgdGhlcmUgbWlnaHQgcGFyc2UgaXQuCgpJZiB5b3Ugc3dpdGNo
IGZyb20KICAgZGV2X2luZm8oZGV2LCAiJXMgKCVsbGQgS2J5dGVzKVxuIiwgaW5mby0+bmFtZSwg
Li4uKQp0bwogICBkZXZfaW5mbyhkZXYsICIiJSpwaE4gKCVsbGQgS2J5dGVzKVxuIiwgaWRfbGVu
LCBpZCwgLi4uKQoKPiBCVFcsIHRoYXQgcHJpbnQgc2hvdWxkIGJlIGxvd2VyZWQgdG8gZGV2X2Ri
ZywgbGV0J3Mgbm8gbG9uZ2VyIHBvbGx1dGUKPiB0aGUga2VybmVsIGxvZy4gRHJpdmVycyBzaG91
bGQgYmUgcXVpZXQgaWYgYWxsIGdvZXMgd2VsbC4KCldlbGwsIG9rLCB0aGF0IHdpbGwgYWxzbyBh
bnN3ZXIgbXkgcXVlc3Rpb24gOikgU28gbGV0J3MgZ28Kd2l0aCB0aGUgZGV2X2RiZygpIGFuZCBp
ZCBvbmx5LgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
