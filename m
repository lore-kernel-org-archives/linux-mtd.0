Return-Path: <SRS0=tJq/=TF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95590C004C9
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAE72082F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1EDuvr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AAE72082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvDkVB/4+6tGSZWyJsl5h7xYqq0062FMFJJ+2TkV6No=; b=d1EDuvr+CFOiWb
	axVPqg0ysnGPOMAFYSdS1wnlMQz0SnrbFIrFmyX8gZtMLDL2Pbjn7EeDbxNLNPPNLOkamJurIfMeL
	XK/FUCk8ierZ00FDbvD9cUjKzO9B3388EjAoWkFGaAZSlCIU/sw1A46UskC8myvoCwjrRJbVx/cLl
	z8Da7wS2IvCN6Cb/UOiFqiiBEHO8KJjcdE4/eSlYPaLCtA7gN83Y6rXdvf3HpLOaF+AsM8CBEiXpk
	JClNaiq22/tT1136oquOeTXPsJ6KMNWuegyk1zDfzd6Jtgvtcr2HSevjatY4c7zlBH2r753A74j5n
	g6WDcmNR4q6HF3x89+Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNBvN-0004TP-4j; Sun, 05 May 2019 07:51:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNBvJ-0004Sb-Dm; Sun, 05 May 2019 07:51:03 +0000
X-UUID: f10db15c3c624903afe816caedb8b2a5-20190504
X-UUID: f10db15c3c624903afe816caedb8b2a5-20190504
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 902378861; Sat, 04 May 2019 23:50:57 -0800
Received: from mtkmbs03n1.mediatek.inc (172.21.101.181) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 May 2019 00:50:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs03n1.mediatek.inc
 (172.21.101.181) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 5 May 2019 15:50:54 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 May 2019 15:50:53 +0800
Message-ID: <1557042653.26455.71.camel@mhfsdcap03>
Subject: Re: [PATCH v2 5/5] mtd: rawnand: mtk: Setup empty page threshold
 correctly
From: xiaolei li <xiaolei.li@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 5 May 2019 15:50:53 +0800
In-Reply-To: <20190430141723.3b775a53@xps13>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
 <20190430100250.28083-6-xiaolei.li@mediatek.com>
 <20190430141723.3b775a53@xps13>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_005101_469539_8FD33BD3 
X-CRM114-Status: GOOD (  16.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gVHVlLCAyMDE5LTA0LTMwIGF0IDE0OjE3ICswMjAwLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IEhpIFhpYW9sZWksCj4gCj4gWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRp
YXRlay5jb20+IHdyb3RlIG9uIFR1ZSwgMzAgQXByIDIwMTkgMTg6MDI6NTAKPiArMDgwMDoKPiAK
PiA+IE1USyBOQU5EIENvbnRyb2xsZXIgaGFzIHRoZSBhYmlsaXR5IHRvIGNoZWNrIHdoZXRoZXIg
cmVhZCBkYXRhIGFyZQo+ID4gbW9zdGx5IDB4ZmYgYnkgY29tcGFyaW5nIHplcm8gYml0IGNvdW50
IG9mIHJlYWQgZGF0YSB3aXRoIGVtcHR5Cj4gPiB0aHJlc2hvbGQgYXV0b21hdGljYWxseS4KPiA+
IAo+ID4gQnV0IG5vdyB3ZSBuZXZlciBzZXQgdGhpcyB0aHJlc2hvbGQgYW5kIGFsd2F5cyBtYWtl
IGl0IGJlIGRlZmF1bHQgdmFsdWUKPiA+IHdoaWNoIGlzIDEwLgo+ID4gCj4gPiBUaGlzIHBhdGNo
IGZpeGVzIHRoaXMgcHJvYmxlbSBieSBzZXR0aW5nIGVtcHR5IHRocmVzaG9sZCBhcyB0aGUgcHJv
ZHVjdAo+ID4gb2YgcmVhZCBzZWN0b3IgY291bnQgYW5kIEVDQyBzdHJlbmd0aC4KPiAKPiBBcmUg
eW91IHN1cmUgaXQgaXMgbm90IGEgcGVyLXNlY3RvciB2YWx1ZT8KRnJhbmtseSwgSSBhbHNvIHRo
aW5rIGl0IHNob3VsZCBiZSBhIHBlci1zZWN0b3IgdmFsdWUuCgpCdXQgTVRLIE5BTkQgQ29udHJv
bGxlciBjYW5ub3QgY2hlY2sgMHhmZiBieSBzZWN0b3IuIEl0IGNvdW50cyB6ZXJvIGJpdAp0aHJv
dWdoIGFsbCByZWFkIGRhdGEuIFNvLCBJIHNldCB0aGUgZW1wdHkgdGhyZXNob2xkIGFzIHRoZSBw
cm9kdWN0IG9mCnJlYWQgc2VjdG9yIGNvdW50IGFuZCBFQ0Mgc3RyZW5ndGguCgo+IAo+IERpZCB5
b3UgdXNlIG5hbmRiaXRlcnJzIHRvIHZhbGlkYXRlPwpZZXMuIEkgZXZlciBkaWQgbmFuZGJpdGVy
cnMgdGVzdCwgYW5kIGl0IHBhc3NlZC4KCj4gCj4gPiAKPiA+IEZpeGVzOiAxZDZiMWU0NjQ5NTAg
KCJtdGQ6IG1lZGlhdGVrOiBkcml2ZXIgZm9yIE1USyBTbWFydCBEZXZpY2UiKQo+ID4gU2lnbmVk
LW9mZi1ieTogWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIHwgOSArKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQu
Ywo+ID4gaW5kZXggNDg3NTlhZjVjMDU4Li5iNTY5NjUzMjg3NzEgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9tdGtfbmFuZC5jCj4gPiBAQCAtOTQsNiArOTQsNyBAQAo+ID4gICNkZWZpbmUgTkZJX01B
U1RFUl9TVEEJCSgweDIyNCkKPiA+ICAjZGVmaW5lCQlNQVNURVJfU1RBX01BU0sJCSgweDBGRkYp
Cj4gPiAgI2RlZmluZSBORklfRU1QVFlfVEhSRVNICSgweDIzQykKPiA+ICsjZGVmaW5lCQlFTVBU
WV9USFJFU0hfTUFTSwlHRU5NQVNLKDcsIDApCj4gPiAgCj4gPiAgI2RlZmluZSBNVEtfTkFNRQkJ
Im10ay1uYW5kIgo+ID4gICNkZWZpbmUgS0IoeCkJCQkoKHgpICogMTAyNFVMKQo+ID4gQEAgLTk0
Nyw2ICs5NDgsMTQgQEAgc3RhdGljIGludCBtdGtfbmZjX3JlYWRfc3VicGFnZShzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiA+ICAJCXJldHVybiAtRUlOVkFM
Owo+ID4gIAl9Cj4gPiAgCj4gPiArCS8qKgo+IAo+ICAgICAgICAgLyoKPiAKPiA+ICsJICogU2V0
dXAgZW1wdHkgdGhyZXNob2xkIGFzIHRoZSBwcm9kdWN0IG9mIHNlY3RvciBjb3VudAo+ID4gKwkg
KiBhbmQgRUNDIHN0cmVuZ3RoCj4gPiArCSAqLwo+ID4gKwlyZWcgPSBzZWN0b3JzICogY2hpcC0+
ZWNjLnN0cmVuZ3RoOwo+ID4gKwlyZWcgPSBtaW5fdCh1bnNpZ25lZCBpbnQsIHJlZywgRU1QVFlf
VEhSRVNIX01BU0spOwo+ID4gKwluZmlfd3JpdGVsKG5mYywgcmVnLCBORklfRU1QVFlfVEhSRVNI
KTsKPiA+ICsKPiA+ICAJcmVnID0gbmZpX3JlYWR3KG5mYywgTkZJX0NORkcpOwo+ID4gIAlyZWcg
fD0gQ05GR19SRUFEX0VOIHwgQ05GR19ETUFfQlVSU1RfRU4gfCBDTkZHX0FIQjsKPiA+ICAJaWYg
KCFyYXcpIHsKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApYaWFvbGVpCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
