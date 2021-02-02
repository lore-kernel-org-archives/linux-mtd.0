Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B701C433E9
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 08:07:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAA264EBB
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 08:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CAA264EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=al+UslvM3bVO6LlBcSM/YnjzbhAibTAdfT3maBQ0f6E=; b=Ftmlc1c3AvisW2g0+dAI0YcAP
	QSKglv2r6oOVO8pKPSzVPSKjdL8JGZeurmLzf4EU/Odr5N4GPlLVSgZsPTgSFxNAK7VuI2rkqRSy/
	ITogee5Bb05J4sHaPEhKcR/Es5ofoO1sNJDaPVHAB+4WaXpkZ4uurZrRBq4voaeXtuO3QA7PavuKo
	E/qfKh5u6DNRAj9gfXb6SU4aJDfIqtfRHseT7sRsUIa2VMWUnNY5xdYny4RMODh4r4U23WW140Oxn
	MRcEx/dVXRl1Jyf/Wp9SGWvpJ5tR4AZo1q2N48x7N/xMGSucahWWKh8R4O74XuNB7DH4f06lEB1Zt
	GixWBjWFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6qhr-000889-PQ; Tue, 02 Feb 2021 08:06:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6qhp-00087L-4z
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 08:06:38 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C55FF1BF20A;
 Tue,  2 Feb 2021 08:06:31 +0000 (UTC)
Date: Tue, 2 Feb 2021 09:06:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zhengxunli@mxic.com.tw
Subject: Re: [PATCH 2/3] spi: mxic: patch for octal DTR mode support
Message-ID: <20210202090630.09e6ed31@xps13>
In-Reply-To: <OF6211E4EF.55839180-ON48258670.0011946B-48258670.001EE31F@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
 <1611908018-29937-3-git-send-email-zhengxunli@mxic.com.tw>
 <20210201154914.3ba94c9d@xps13>
 <OF6211E4EF.55839180-ON48258670.0011946B-48258670.001EE31F@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_030637_320577_89001093 
X-CRM114-Status: GOOD (  15.58  )
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

SGVsbG8sCgp6aGVuZ3h1bmxpQG14aWMuY29tLnR3IHdyb3RlIG9uIFR1ZSwgMiBGZWIgMjAyMSAx
MzozNzoyMiArMDgwMDoKCj4gSGksCj4gCj4gPiA+IERyaXZlciBwYXRjaCBmb3Igb2N0YWwgOEQt
OEQtOEQgbW9kZSBzdXBwb3J0Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogemhlbmd4dW5s
aSA8emhlbmd4dW5saUBteGljLmNvbS50dz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3NwaS9z
cGktbXhpYy5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gPiA+IAo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW14aWMuYyBiL2RyaXZlcnMvc3BpL3Nw
aS1teGljLmMKPiA+ID4gaW5kZXggOTZiNDE4Mi4uODIxMzI4YSAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9zcGkvc3BpLW14aWMuYwo+ID4gPiArKysgYi9kcml2ZXJzL3NwaS9zcGktbXhpYy5j
Cj4gPiA+IEBAIC0zMzUsOCArMzM1LDggQEAgc3RhdGljIGludCBteGljX3NwaV9kYXRhX3hmZXIo
c3RydWN0IG14aWNfc3BpICAgCj4gPiAqbXhpYywgY29uc3Qgdm9pZCAqdHhidWYsICAKPiA+ID4g
IHN0YXRpYyBib29sIG14aWNfc3BpX21lbV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVt
LAo+ID4gPiAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4g
PiA+ICB7Cj4gPiA+IC0gICBpZiAob3AtPmRhdGEuYnVzd2lkdGggPiA0IHx8IG9wLT5hZGRyLmJ1
c3dpZHRoID4gNCB8fAo+ID4gPiAtICAgICAgIG9wLT5kdW1teS5idXN3aWR0aCA+IDQgfHwgb3At
PmNtZC5idXN3aWR0aCA+IDQpCj4gPiA+ICsgICBpZiAob3AtPmRhdGEuYnVzd2lkdGggPiA4IHx8
IG9wLT5hZGRyLmJ1c3dpZHRoID4gOCB8fAo+ID4gPiArICAgICAgIG9wLT5kdW1teS5idXN3aWR0
aCA+IDggfHwgb3AtPmNtZC5idXN3aWR0aCA+IDgpCj4gPiA+ICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gPiA+IAo+ID4gPiAgICAgaWYgKG9wLT5kYXRhLm5ieXRlcyAmJiBvcC0+ZHVtbXkubmJ5dGVz
ICYmCj4gPiA+IEBAIC0zNDYsNyArMzQ2LDcgQEAgc3RhdGljIGJvb2wgbXhpY19zcGlfbWVtX3N1
cHBvcnRzX29wKHN0cnVjdCAgIAo+ID4gc3BpX21lbSAqbWVtLCAgCj4gPiA+ICAgICBpZiAob3At
PmFkZHIubmJ5dGVzID4gNykKPiA+ID4gICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gCj4gPiA+
IC0gICByZXR1cm4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKG1lbSwgb3ApOwo+ID4gPiAr
ICAgcmV0dXJuIHRydWU7ICAKPiA+IAo+ID4gRG9lcyBub3Qgc2VlbSBjb3JyZWN0LiBXaHkgd291
bGQgeW91IGRyb3AgdGhpcyBjaGVjaz8gIAo+IAo+IFNhbWUgYXMgUHJhdHl1c2gncyByZXBseS4g
c3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgZG9lcyBub3Qgc3VwcG9ydCAKPiBkdHIuCgpB
cyBJIHNhaWQ6IHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpIGRvIG1hbnkgY2hlY2tzLCBJ
IGRvbid0IHRoaW5rCml0J3Mgd29ydGggZ2l2aW5nIHVwIHRoZXNlIGNoZWNrcyBhbmQgaGF2aW5n
IGEgY29tcGxlbWVudGFyeSBoZWxwZXIgZm9yCkRUUiBvcGVyYXRpb25zIGlzIG5lZWRlZC4KCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
