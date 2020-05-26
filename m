Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B453FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858762070A
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j42GUMwB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858762070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkAH2ERCNscn4ruKPQrdpHQArUrlDFfIEpZ73uv2FLw=; b=j42GUMwBCFvRWO
	3RZNCgpDdCdSzM/KTo0P3wrSd0Jy+fmL/GObHptzGu6XaD+AYUGTPApzaytJxONJ9mzbg1c1gOcvk
	HlLYv/Z4W/GjX2Y7MtIpChV5URYhkKmCxMmTfbVi/UFGi7RJPUD3h4ivHLJbhUvMq6/AYZvVN5Uyr
	j4fKuN5XGV6mJae7DddYS+u1f+3JHhUhwGi/Hxnw8rUmw8U/pc7rWIJ+gzrnbczZuszhUILqKrNBg
	KUfh8j+9+MTgtKdRSGDf24NL6aIsAbYdGRTzL0mVHyV4VEN122oKadgWtia6ze+LojF8kiO68G2lb
	kj4GZR4IYvJSLk2wiyOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdWAM-0004UX-JK; Tue, 26 May 2020 09:46:34 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdWAJ-0004Ts-HU
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:46:33 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9273E200011;
 Tue, 26 May 2020 09:46:16 +0000 (UTC)
Date: Tue, 26 May 2020 11:46:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard X Andersson <Rickard.Andersson@axis.com>
Subject: Re: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Message-ID: <20200526114615.287cba5d@xps13>
In-Reply-To: <1590485738758.69301@axis.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-18-miquel.raynal@bootlin.com>
 <20200525214530.16cd59c1@collabora.com>
 <1590485738758.69301@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_024631_850518_F2A07F64 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmlja2FyZCwKClJpY2thcmQgWCBBbmRlcnNzb24gPFJpY2thcmQuQW5kZXJzc29uQGF4aXMu
Y29tPiB3cm90ZSBvbiBUdWUsIDI2IE1heQoyMDIwIDA5OjM1OjM4ICswMDAwOgoKPiBPbiBNb24s
IE1heSAyNSwgMjAyMCBhdCA3OjQ3IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gKy8qKgo+ID4gKyAqIG5hbmRfY2hvb3NlX2Jlc3Rfc2Ry
X2lmYWNlIC0gZ2l2ZW4gYSBkYXRhIGludGVyZmFjZSwgZmluZCB0aGUgY2xvc2VzdAo+ID4gKyAq
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbW9kZS90aW1pbmdz
IHNldCBmb3IgdGhpcyBpbnRlcmZhY2Ugc3VwcG9ydGVkCj4gPiArICogwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBieSBib3RoIHRoZSBOQU5EIGNvbnRyb2xsZXIg
YW5kIHRoZSBOQU5EIGNoaXAKPiA+ICsgKiBAY2hpcDogdGhlIE5BTkQgY2hpcAo+ID4gKyAqIEBi
ZXN0X2lmYWNlOiB0aGUgYmVzdCBkYXRhIGludGVyZmFjZSAoY2FuIGV2ZW50dWFsbHkgYmUgdXBk
YXRlZCkKPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW50IG5hbmRfY2hvb3NlX2Jlc3Rfc2RyX2lmYWNl
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVjdCBuYW5kX2RhdGFfaW50ZXJmYWNlICpi
ZXN0X2lmYWNlKQo+ID4gK3sKPiA+ICsgwqAgwqAgwqAgY29uc3Qgc3RydWN0IG5hbmRfY29udHJv
bGxlcl9vcHMgKm9wcyA9IGNoaXAtPmNvbnRyb2xsZXItPm9wczsKPiA+ICsgwqAgwqAgwqAgaW50
IG1vZGUsIHJldDsKPiA+ICsKPiA+ICsgwqAgwqAgwqAgLyogVmVyaWZ5IHRoZSBjb250cm9sbGVy
IHN1cHBvcnRzIHRoZSByZXF1ZXN0ZWQgaW50ZXJmYWNlICovCj4gPiArIMKgIMKgIMKgIHJldCA9
IG9wcy0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoY2hpcCwgTkFORF9EQVRBX0lGQUNFX0NIRUNLX09O
TFksCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGJlc3RfaWZhY2UpOwo+ID4gKyDCoCDCoCDCoCBpZiAoIXJldCkKPiA+ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsgwqAgwqAgwqAgLyogRmFs
bGJhY2sgdG8gc2xvd2VyIG1vZGVzICovCj4gPiArIMKgIMKgIMKgIGZvciAobW9kZSA9IGJlc3Rf
aWZhY2UtPnRpbWluZ3MubW9kZSAtIDE7IG1vZGUgPj0gMDsgbW9kZS0tKSB7Cj4gPiArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJldCA9IG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZShjaGlwLCBiZXN0
X2lmYWNlLAo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE5BTkRfU0RSX0lGQUNFLCBtb2RlKTsKPiA+ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYgKHJldCkKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgY29udGludWU7Cj4gPiArCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9
IG9wcy0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoY2hpcCwKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgTkFORF9E
QVRBX0lGQUNFX0NIRUNLX09OTFksCj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJlc3RfaWZhY2UpOwo+ID4g
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIXJldCkKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgYnJlYWs7Cj4gPiArIMKgIMKgIMKgIH0KPiA+ICsKPiA+ICsgwqAgwqAg
wqAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKyAgCj4gCj4gU2hvdWxkIHdlIG5vdCBzdGFydCBsb29w
aW5nIGZyb20gIm1vZGUgPSBiZXN0X2lmYWNlLT50aW1pbmdzLm1vZGUiID8gVGhlIGZpcnN0IHNl
dHVwX2RhdGFfaW50ZXJmYWNlIGNhbGwgaW4gdGhlIGFib3ZlIGZ1bmN0aW9uIHRlc3RzIHRoZSBz
cGVjaWZpYyB0aW1pbmdzIG9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/CgpJbmRlZWQsIHdlIGFz
c3VtZSB0aGF0IHRoZSBjb250cm9sbGVyIGRyaXZlciB3aWxsIG5vdCBzdXBwb3J0IHRoZQoib2Zm
aWNpYWwiIE9ORkkgdGltaW5ncyBtb2RlIFggaWYgaXQgZGlkIG5vdCBzdXBwb3J0IHRoZSBzcGVj
aWZpYwp0aW1pbmdzIGNsb3NlIHRvIG1vZGUgWC4KClRoaXMgaXMgYW4gYXNzdW1wdGlvbiwgYnV0
IEkgZG9uJ3QgdGhpbmsgd2UgYXJlIGZhciBmcm9tIHRoZSByZWFsaXR5CmhlcmUuCgpNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
