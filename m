Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41039C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 08:05:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F4664EE4
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 08:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F4664EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3ubKBSAvfQVb3XdkH0/QIZhUb/p5gHSE8/Afae8x8WU=; b=iDVvZgF77oafzSKbrbPx1ZQLv
	hZ2EcJKSqTOPN1tdsIIFTwoVYs5Zy3MELu6bLAiYV101ZX39MmX6SFzVvLzC9bI5r05JbMQPkt5X2
	xPTOJh112WKgQDLQpMz+L+C1oyM2yWfrbLT9SGaiai7JLpeFukuwNPJTzHqzpZe4N4yxZztz3kQao
	8cCIEMagMwQL4QSpfC2gyEP1iSbTqKX1TRxUhp2GqJ3UKJOg6qK9GUzUBhH5ANV1pkbc/wfWRomZF
	jAI/UE/hOuUY6SOjPi4d2nLRRbX/f5gHyaBKfEzy85hwS7RN+Dvgw21b/eGYKT//2YWUrKfpdd5cl
	2jGe/0ODA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qft-0007p9-43; Tue, 02 Feb 2021 08:04:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qfn-0007o7-NU
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 08:04:36 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2F38CFF80B;
 Tue,  2 Feb 2021 08:04:26 +0000 (UTC)
Date: Tue, 2 Feb 2021 09:04:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zhengxunli@mxic.com.tw
Subject: Re: [PATCH 3/3] spi: mxic: add maximum speed of spi host
Message-ID: <20210202090424.710e015a@xps13>
In-Reply-To: <OFCBF59ED0.4C198CA3-ON48258670.00236718-48258670.0026E452@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
 <1611908018-29937-4-git-send-email-zhengxunli@mxic.com.tw>
 <20210201160247.1c83719c@xps13>
 <OFCBF59ED0.4C198CA3-ON48258670.00236718-48258670.0026E452@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_030431_863784_2D24EDFD 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgo+ID4gPiBAQCAtNTM2LDcgKzUzNyw5IEBAIHN0YXRpYyBpbnQgbXhpY19zcGlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAgIAo+ICpwZGV2KQo+ID4gPiAgewo+ID4gPiAgICAg
c3RydWN0IHNwaV9tYXN0ZXIgKm1hc3RlcjsKPiA+ID4gICAgIHN0cnVjdCByZXNvdXJjZSAqcmVz
Owo+ID4gPiArICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwo+
ID4gPiAgICAgc3RydWN0IG14aWNfc3BpICpteGljOwo+ID4gPiArICAgdTMyIG1heF9mcmVxOwo+
ID4gPiAgICAgaW50IHJldDsKPiA+ID4gCj4gPiA+ICAgICBtYXN0ZXIgPSBkZXZtX3NwaV9hbGxv
Y19tYXN0ZXIoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCAgIAo+IG14aWNfc3BpKSk7Cj4gPiA+
IEBAIC01ODAsNiArNTgzLDEwIEBAIHN0YXRpYyBpbnQgbXhpY19zcGlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAgIAo+ICpwZGV2KQo+ID4gPiAgICAgICAgICAgU1BJX1JYX1FVQUQgfCBT
UElfVFhfUVVBRCB8Cj4gPiA+ICAgICAgICAgICBTUElfUlhfT0NUQUwgfCBTUElfVFhfT0NUQUw7
Cj4gPiA+IAo+ID4gPiArICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAic3BpLW1heC1m
cmVxdWVuY3kiLAo+ID4gPiArICAgICAgICAgICAgICZtYXN0ZXItPm1heF9zcGVlZF9oeikpCj4g
PiA+ICsgICAgICBtYXN0ZXItPm1heF9zcGVlZF9oeiA9IDI1MDAwMDAwOyAvKiAyNU1IeiAqLyAg
Cj4gPiAKPiA+IEFzIHNhaWQgYmVmb3JlLCB0aGVyZSBhcmUgdHdvIGxpbWl0YXRpb25zIHRvIHRh
a2UgaW50byBhY2NvdW50Ogo+ID4gMS0geW91ciBjb250cm9sbGVyIG1heGltdW0gc3BlZWQKPiA+
IDItIHlvdXIgZmxhc2ggbWF4aW11bSBzcGVlZAo+ID4gCj4gPiAoMSkgSSBkb24ndCB0aGluayB0
aGlzIG5lZWRzIHRvIGJlIGV4cG9ydGVkIHRocm91Z2ggdGhlIERULCB0aGUgZHJpdmVyCj4gPiAg
ICAga25vd3MgaGlzIG93biBsaW1pdGF0aW9ucyBhbmQgZW5mb3JjZXMgdGhlbS4gIAo+IAo+IElu
IGZhY3QsIGlmIG1hc3Rlci0+bWF4X3NwZWVkX2h6IGlzIG5vdCBzZXQsIHNwaS0+bWF4X3NwZWVk
X2h6IHdpbGwgYmUgMCAKPiBhbmQgdGhlCj4gaG9zdCBmcmVxdWVuY3kgY2Fubm90IGJlIHNldCBj
b3JyZWN0bHkuCgpZb3Ugc2hvdWxkIHNldCBtYXN0ZXItPm1heF9zcGVlZF9oeiBpbiB0aGUgcHJv
YmUuIFRoaXMgaXMgdGhlIG1heGltdW0Kc3BlZWQgeW91ciBob3N0IGNhbiBydW4gYXQgYW5kIGhh
cyAqbm90aGluZyB0byBkbyogd2l0aCB3aGF0ZXZlciBkZXZpY2UKaXMgYXR0YWNoZWQgb24gdGhl
IGJ1cy4KCkluIHRoZSBEVCwgdXNlIHRoZSBzcGktbWF4LWZyZXF1ZW5jeSBwcm9wZXJ0eSB0byBp
bmZvcm0gdGhlIGNvbnRyb2xsZXIKYWJvdXQgdGhlIG1heGltdW0gc3BlZWQgdGhlIGRldmljZSBz
dXBwb3J0cy4KClRoZW4gdGhlIGNvbnRyb2xsZXIgc2hvdWxkIHJlY2VpdmUgcmVxdWVzdHMgYXQg
dGhlIGZyZXF1ZW5jeSBjaG9zZW4Kd2l0aDogbWluKG1hc3Rlcl9tYXhfZnJlcSwgZGV2aWNlX21h
eF9mcmVxKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
