Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3182C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+BRRZmSKmk7ms8WvKkpYUZI9Y1b+1Z+eeXjJNLvuK0=; b=v3lTKvECSznG2g
	Ib64G5gosSlUykjbxhH5wLFRLnmP8ltUUsqqkidZPhwDZ+tTVG8xHXpgwOSvjVzBUUTN/KXNj7+NH
	8F17z4ojxLSbd9rPKYcYiEqmeEdlEa2jTp4evNPvv0gRH5Gi+ET5WDqVIPj7T9aqdykE6d7etz06R
	nYebe+s3BH8p1cXPVYufO8GwI3a9oOUm6cUm/2B0ebqm4F9BaFyAThc3X3IWjntGnX5kBtMFn1Ue7
	rvj16daYFLpBWdLYhlNdJWJl/YTgiz/9390jhyBR0ZvGQjbqTFXlpTRkPOvWALnAo3SABBeeA6t2K
	C0jVGIqblr+U3Yd0U7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxnY-00EB0C-3z; Tue, 17 May 2022 14:03:40 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxmT-00EAQQ-2u; Tue, 17 May 2022 14:02:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A6B9C000A;
 Tue, 17 May 2022 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652796149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFYtPsh6s9dzHCZdoQzXiCPCMhM47AP7OmBzXLX/B4I=;
 b=HX3COE9t4BRjmNMfjKgyvM1XLP0ODDvStZTU9hi+qbFefEzb79wkyXSKSQ0swG9xtgopkp
 kb7BtpESwuOEj9NiHLMXQh7vzERBwIDFqVsEXb2o5tUrd/4HAhgCi9d/tPP+WsuM9+ADvb
 pXz+EhPuk8RNXC4x4/Pz7cJ1/lsu/BuoJvQOHeCWerF4kvc3BcLs0XV18/B/N3F/nHNlqo
 aKdG+rRP5Q6cwMAcSeS3UXQszTUk+Hj4MNKBWgsbFp+fqlESJEqFbmwzM2AOcPMUcSVwVz
 mL6e0HBgioq6t9FeejYiruQ6+O6DUlqHUkC8kWqR+koXOTxDkmfWo/xFvbmFBw==
Date: Tue, 17 May 2022 16:02:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Michael
 Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 3/6] mtd: spi-nor: core: run calibration when
 initialization is done
Message-ID: <20220517160226.4107f282@xps-13>
In-Reply-To: <20210311191216.7363-4-p.yadav@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-4-p.yadav@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_070233_320109_05F080AD 
X-CRM114-Status: GOOD (  18.54  )
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

SGkgUHJhdHl1c2gsCgpwLnlhZGF2QHRpLmNvbSB3cm90ZSBvbiBGcmksIDEyIE1hciAyMDIxIDAw
OjQyOjEzICswNTMwOgoKPiBPbmNlIHRoZSBmbGFzaCBpcyBpbml0aWFsaXplZCB0ZWxsIHRoZSBj
b250cm9sbGVyIGl0IGNhbiBydW4KPiBjYWxpYnJhdGlvbiBwcm9jZWR1cmVzIGlmIG5lZWRlZC4g
VGhpcyBjYW4gYmUgdXNlZnVsIHdoZW4gY2FsaWJyYXRpb24gaXMKPiBuZWVkZWQgdG8gcnVuIGF0
IGhpZ2hlciBjbG9jayBzcGVlZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUHJhdHl1c2ggWWFkYXYg
PHAueWFkYXZAdGkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDEy
ICsrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IGluZGV4IDg4ODg4ZGYwMDlmMC4uZTBjYmNhZjFi
ZTg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBAQCAtMzY1MCw2ICszNjUwLDcgQEAgc3RhdGljIGlu
dCBzcGlfbm9yX3Byb2JlKHN0cnVjdCBzcGlfbWVtICpzcGltZW0pCj4gIAkgKiBjaGVja2luZyB3
aGF0J3MgcmVhbGx5IHN1cHBvcnRlZCB1c2luZyBzcGlfbWVtX3N1cHBvcnRzX29wKCkuCj4gIAkg
Ki8KPiAgCWNvbnN0IHN0cnVjdCBzcGlfbm9yX2h3Y2FwcyBod2NhcHMgPSB7IC5tYXNrID0gU05P
Ul9IV0NBUFNfQUxMIH07Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBvcDsKPiAgCWNoYXIgKmZsYXNo
X25hbWU7Cj4gIAlpbnQgcmV0Owo+ICAKPiBAQCAtMzcwOSw4ICszNzEwLDE1IEBAIHN0YXRpYyBp
bnQgc3BpX25vcl9wcm9iZShzdHJ1Y3Qgc3BpX21lbSAqc3BpbWVtKQo+ICAJaWYgKHJldCkKPiAg
CQlyZXR1cm4gcmV0Owo+ICAKPiAtCXJldHVybiBtdGRfZGV2aWNlX3JlZ2lzdGVyKCZub3ItPm10
ZCwgZGF0YSA/IGRhdGEtPnBhcnRzIDogTlVMTCwKPiAtCQkJCSAgIGRhdGEgPyBkYXRhLT5ucl9w
YXJ0cyA6IDApOwo+ICsJcmV0ID0gbXRkX2RldmljZV9yZWdpc3Rlcigmbm9yLT5tdGQsIGRhdGEg
PyBkYXRhLT5wYXJ0cyA6IE5VTEwsCj4gKwkJCQkgIGRhdGEgPyBkYXRhLT5ucl9wYXJ0cyA6IDAp
Owo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCW9wID0gc3BpX25vcl9zcGlt
ZW1fZ2V0X3JlYWRfb3Aobm9yKTsKCklzbid0IHRoaXMgdG9vIHNwZWNpZmljPyBJIHJlYWxseSBk
b24ndCBrbm93IG11Y2ggYWJvdXQgc3BpLW5vcnMsIGJ1dCBJCmZpbmQgb2RkIHRvIGhhdmUgdGhp
cyBvcCBiZWluZyBjcmVhdGVkIGhlcmUsIHdoeSBub3QgbW92aW5nIHRoaXMgaW50bwp0aGUgX2Rv
X2NhbGlicmF0aW9uKCkgaGVscGVyPwoKPiArCXNwaV9tZW1fZG9fY2FsaWJyYXRpb24obm9yLT5z
cGltZW0sICZvcCk7CgpBIHdhcm5pbmcvaW5mbyB1cG9uIGNhbGlicmF0aW9uIGVycm9yIChub3Qg
b24gdGhlIGFic2VuY2Ugb2YgdGhlIGhvb2spCndvdWxkIGJlIG5pY2U/Cgo+ICsKPiArCXJldHVy
biAwOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IHNwaV9ub3JfcmVtb3ZlKHN0cnVjdCBzcGlfbWVt
ICpzcGltZW0pCgpPdGhlcndpc2UgSSBsaWtlIHRoZSBvdmVyYWxsIGlkZWEuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
