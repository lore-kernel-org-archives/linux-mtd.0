Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E85EC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 10:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 163442073B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 10:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hkZfEJCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 163442073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxh1EroeJeuQkT+Z6fnkdNOJa6uSLnP4uqAual5aDMA=; b=hkZfEJCHsYpuAF
	2pSonA4PbM7YaRHPW756PUvn/35M/a7qwo1hXXmK5iQY6TOXvheEQ3EFsbIlR2chyNzZl+IQdEMSm
	biHAWj8LuK9cU3QGz+Pipex+dj4onztPXNMtb3Y1ty1w1alQDwyS/ZgV4+p21HyBCCCQ/dyFHK9oJ
	ROuqRUWjKQGdd6Gf4lkW5+dU5hmdW/GNglq7OgvZCHupBk8nZp2Npp6586fg9ZVMbkgaYvgMe9+nV
	1e7eODLquvSSBB42DB7eercEzP2DfDDn/cU3wQHmXvXEH1TNs7U3qS+Al+3bmfKNCGMWASoe3CFKB
	FZdi4/VEYYbU+e7qinJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdX3m-0006jg-7G; Tue, 26 May 2020 10:43:50 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdX3c-0006cS-NB
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 10:43:42 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B1E5A2000B;
 Tue, 26 May 2020 10:43:36 +0000 (UTC)
Date: Tue, 26 May 2020 12:43:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard X Andersson <Rickard.Andersson@axis.com>
Subject: Re: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Message-ID: <20200526124335.7f1ad8c4@xps13>
In-Reply-To: <1590487858465.24768@axis.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-18-miquel.raynal@bootlin.com>
 <20200525214530.16cd59c1@collabora.com>
 <1590485738758.69301@axis.com> <20200526114615.287cba5d@xps13>
 <1590487858465.24768@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_034341_047325_6148EA57 
X-CRM114-Status: GOOD (  19.30  )
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
Y29tPiB3cm90ZSBvbiBUdWUsIDI2IE1heQoyMDIwIDEwOjEwOjU4ICswMDAwOgoKPiBPbiBUdWUs
IE1heSAyNiwgMjAyMCBhdCAxMTo0NiBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZToKPiAKPiA+ID4gPiArLyoqCj4gPiA+ID4gKyAqIG5hbmRfY2hvb3Nl
X2Jlc3Rfc2RyX2lmYWNlIC0gZ2l2ZW4gYSBkYXRhIGludGVyZmFjZSwgZmluZCB0aGUgY2xvc2Vz
dAo+ID4gPiA+ICsgKiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG1vZGUvdGltaW5ncyBzZXQgZm9yIHRoaXMgaW50ZXJmYWNlIHN1cHBvcnRlZAo+ID4gPiA+ICsg
KiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJ5IGJvdGggdGhl
IE5BTkQgY29udHJvbGxlciBhbmQgdGhlIE5BTkQgY2hpcAo+ID4gPiA+ICsgKiBAY2hpcDogdGhl
IE5BTkQgY2hpcAo+ID4gPiA+ICsgKiBAYmVzdF9pZmFjZTogdGhlIGJlc3QgZGF0YSBpbnRlcmZh
Y2UgKGNhbiBldmVudHVhbGx5IGJlIHVwZGF0ZWQpCj4gPiA+ID4gKyAqLwo+ID4gPiA+ICtzdGF0
aWMgaW50IG5hbmRfY2hvb3NlX2Jlc3Rfc2RyX2lmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
Cj4gPiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBzdHJ1Y3QgbmFuZF9kYXRhX2ludGVyZmFjZSAqYmVzdF9pZmFjZSkKPiA+ID4gPiAr
ewo+ID4gPiA+ICsgwqAgwqAgwqAgY29uc3Qgc3RydWN0IG5hbmRfY29udHJvbGxlcl9vcHMgKm9w
cyA9IGNoaXAtPmNvbnRyb2xsZXItPm9wczsKPiA+ID4gPiArIMKgIMKgIMKgIGludCBtb2RlLCBy
ZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgwqAgwqAgwqAgLyogVmVyaWZ5IHRoZSBjb250cm9sbGVy
IHN1cHBvcnRzIHRoZSByZXF1ZXN0ZWQgaW50ZXJmYWNlICovCj4gPiA+ID4gKyDCoCDCoCDCoCBy
ZXQgPSBvcHMtPnNldHVwX2RhdGFfaW50ZXJmYWNlKGNoaXAsIE5BTkRfREFUQV9JRkFDRV9DSEVD
S19PTkxZLAo+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgYmVzdF9pZmFjZSk7Cj4gPiA+ID4gKyDCoCDCoCDCoCBpZiAoIXJl
dCkKPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiByZXQ7Cj4gPiA+ID4gKwo+
ID4gPiA+ICsgwqAgwqAgwqAgLyogRmFsbGJhY2sgdG8gc2xvd2VyIG1vZGVzICovCj4gPiA+ID4g
KyDCoCDCoCDCoCBmb3IgKG1vZGUgPSBiZXN0X2lmYWNlLT50aW1pbmdzLm1vZGUgLSAxOyBtb2Rl
ID49IDA7IG1vZGUtLSkgewo+ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gb25m
aV9maWxsX2RhdGFfaW50ZXJmYWNlKGNoaXAsIGJlc3RfaWZhY2UsCj4gPiA+ID4gKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoE5BTkRfU0RSX0lGQUNFLCBtb2RlKTsKPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGlmIChyZXQpCj4gPiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb250
aW51ZTsKPiA+ID4gPiArCj4gPiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXQgPSBvcHMt
PnNldHVwX2RhdGFfaW50ZXJmYWNlKGNoaXAsCj4gPiA+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBOQU5EX0RB
VEFfSUZBQ0VfQ0hFQ0tfT05MWSwKPiA+ID4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJlc3RfaWZhY2UpOwo+
ID4gPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKCFyZXQpCj4gPiA+ID4gKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazsKPiA+ID4gPiArIMKgIMKgIMKgIH0KPiA+
ID4gPiArCj4gPiA+ID4gKyDCoCDCoCDCoCByZXR1cm4gMDsKPiA+ID4gPiArfQo+ID4gPiA+ICsg
ICAKPiA+ID4KPiA+ID4gU2hvdWxkIHdlIG5vdCBzdGFydCBsb29waW5nIGZyb20gIm1vZGUgPSBi
ZXN0X2lmYWNlLT50aW1pbmdzLm1vZGUiID8gVGhlIGZpcnN0IHNldHVwX2RhdGFfaW50ZXJmYWNl
IGNhbGwgaW4gdGhlIGFib3ZlIGZ1bmN0aW9uIHRlc3RzIHRoZSBzcGVjaWZpYyB0aW1pbmdzIG9y
IGFtIEkgbWlzc2luZyBzb21ldGhpbmc/ICAKPiA+Cj4gPiBJbmRlZWQsIHdlIGFzc3VtZSB0aGF0
IHRoZSBjb250cm9sbGVyIGRyaXZlciB3aWxsIG5vdCBzdXBwb3J0IHRoZQo+ID4gIm9mZmljaWFs
IiBPTkZJIHRpbWluZ3MgbW9kZSBYIGlmIGl0IGRpZCBub3Qgc3VwcG9ydCB0aGUgc3BlY2lmaWMK
PiA+IHRpbWluZ3MgY2xvc2UgdG8gbW9kZSBYLgo+ID4KPiA+IFRoaXMgaXMgYW4gYXNzdW1wdGlv
biwgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgYXJlIGZhciBmcm9tIHRoZSByZWFsaXR5Cj4gPiBoZXJl
Lgo+ID4KPiA+IE1pcXXDqGwgIAo+IAo+IEl0IGNvdWxkIGJlIHRoYXQgdGhlICJjb3JyZXNwb25k
aW5nIG9uZmkgbW9kZSIgaXMgcXVpdGUgbG93IGR1ZSB0byBkZXZpYXRpb24gb2Ygc29tZSBwYXJh
bWV0ZXIgdGhhdCBhcmUgYWN0dWFsbHkgbm90IGNoZWNrZWQvdXNlZCBieSB0aGUgY29udHJvbGxl
ciBkcml2ZXJzLgoKVGhhdCBtaWdodCBoYXBwZW4uIEknbGwgY2hhbmdlIGl0LgoKPiBBbm90aGVy
IHRoaW5nLCBzaG91bGQgd2Ugbm90IGNoZWNrIGluIG9yZGVyIHRvIGJlIHN1cmUgdGhhdCBtb2Rl
IGRvZXMgbm90IGJlY29tZSBuZWdhdGl2ZT8gSS5lIGlmIGJlc3RfaWZhY2UtPnRpbWluZ3MubW9k
ZSBpcyB6ZXJvIGJlZm9yZSBleGVjdXRpbmcgdGhlIGxvb3AuCgpJIHRoaW5rIHRoZSBmb3ItbG9v
cCAibW9kZSA+PSAwIiBjb25kaXRpb24gZW5zdXJlcyB0aGlzIHdpbGwgbmV2ZXIKaGFwcGVuLCBy
aWdodD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
