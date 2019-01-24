Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D5FC282C5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 20:07:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0FC21855
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 20:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggjfr7uT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C0FC21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/I28j6WfoWB5/UocJK4w6LqrLdKyH9tXD/XGpD2Naw=; b=ggjfr7uT/BZzCk
	Pe4q9qnN+RasMHUdaAyuHfKqDsuft4xiPjxnz3epa0p1KlqVQoUPOkEZMkeUeTdoAfUD1iZEe8rLn
	RVG2VRlvJ56RS48CRgKwuODuES0k+SVlCI7KUfuVsrykaRJ6Ka/Tl2xkbitaa05xg2vh9TboGtWoN
	D7NRSi+id9/JNUY3RtE75D67/sCDseS8ep0xXDTTxQvkO1PiwIPQlUq+9iA4ilZ1jveJqhxGJZ6O6
	TsctS1tjONy6dSy2/UUzAkDfjnwvDtvvo2E0FezEybzfnCjWuuiTdqVKCF1swm5SGg0lHUrfWcaFi
	Zz9gOEs9RgmErVWKkuqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmlHC-000669-Sk; Thu, 24 Jan 2019 20:07:02 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmlH9-00065k-N5
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 20:07:01 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 75B502247E; Thu, 24 Jan 2019 21:06:56 +0100 (CET)
Received: from xps13 (unknown [91.224.148.103])
 by mail.bootlin.com (Postfix) with ESMTPSA id 403C02256F;
 Thu, 24 Jan 2019 21:02:35 +0100 (CET)
Date: Thu, 24 Jan 2019 21:02:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190124210234.29275239@xps13>
In-Reply-To: <BYASPR01MB003174C6FE221EE7CD5EA51BDB9A0@BYASPR01MB0031.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190120165911.2e42b1b5@xps13>
 <BYASPR01MB003174C6FE221EE7CD5EA51BDB9A0@BYASPR01MB0031.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_120659_885952_0EEBC4A4 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmVhbiwKCiJCZWFuIEh1byAoYmVhbmh1bykiIDxiZWFuaHVvQG1pY3Jvbi5jb20+IHdyb3Rl
IG9uIFRodSwgMjQgSmFuIDIwMTkKMTU6NDc6MjUgKzAwMDA6Cgo+IEhpLCBNaXF1ZWwKPiAKPiA+
ICAKPiA+PiBPbiBzb21lIGxlZ2FjeSBwbGFuYXIgMkQgTWljcm9uIE5BTkQgZGV2aWNlcyB3aGVu
IGEgYmxvY2sgZXJhc2UKPiA+PiBjb21tYW5kIGlzIGlzc3VlZCwgb2NjYXNpb25hbGx5IGV2ZW4g
dGhvdWdoIGEgYmxvY2sgZXJhc2Ugb3BlcmF0aW9uCj4gPj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRl
cyBhbmQgcmV0dXJucyBhIHBhc3Mgc3RhdHVzLCB0aGUgZmxhc2ggYmxvY2sgbWF5Cj4gPj4gbm90
IGJlIGNvbXBsZXRlbHkgZXJhc2VkLiBTdWJzZXF1ZW50IG9wZXJhdGlvbnMgdG8gdGhpcyBibG9j
ayBvbiB2ZXJ5Cj4gPj4gcmFyZSBjYXNlcyBjYW4gcmVzdWx0IGluIHN1YnRsZSBmYWlsdXJlcyBv
ciBjb3JydXB0aW9uLiBUaGVzZQo+ID4+IGV4dHJlbWVseSByYXJlIGNhc2VzIHNob3VsZCBuZXZl
cnRoZWxlc3MgYmUgY29uc2lkZXJlZC4KPiA+Pgo+ID4+IFRoZXNlIHJhcmUgb2NjdXJyZW5jZXMg
aGF2ZSBiZWVuIG9ic2VydmVkIG9uIHBhcnRpYWxseSB3cml0dGVuIGJsb2Nrcy4KPiA+PiBQYXJ0
aWFsbHkgd3JpdHRlbiBibG9ja3MgYXJlIG5vdCB1bmNvbW1vbiB3aXRoIFVCSS9VQklGUy4KPiA+
Pgo+ID4+IFRvIGF2b2lkIHRoaXMgcmFyZSBvY2N1cnJlbmNlLCB3ZSBtYWtlIHN1cmUgdGhhdCBh
dCBsZWFzdAo+ID4+IDE1IHBhZ2VzIGhhdmUgYmVlbiBwcm9ncmFtbWVkIHRvIGEgYmxvY2sgYmVm
b3JlIGl0IGlzIGVyYXNlZC4KPiA+PiBJbiBjYXNlIHdlIGZpbmQgdGhhdCBsZXNzIHRoYW4gMTUg
cGFnZXMgaGF2ZSBiZWVuIHByb2dyYW1tZWQsCj4gPj4gYWRkaXRpb25hbCBwYWdlcyBhcmUgcHJv
Z3JhbW1lZCBpbiB0aGUgYmxvY2suIFRoZSBvYnNlcnZhdGlvbiBpcyB0aGF0Cj4gPj4gYWRkaXRp
b25hbCBwYWdlcyByYXJlbHkgbmVlZCB0byBiZSB3cml0dGVuICAKPiA+Cj4gPkkgd291bGQgc3Rv
cCB0aGUgY29tbWl0IG1lc3NhZ2UgaGVyZSBhbmQgcmVtb3ZlIHRoZSBlbmQgb2YgdGhlIHNlbnRl
bmNlCj4gPndoaWNoLCBJIGJlbGlldmUsIGlzIGluYWNjdXJhdGUuCj4gPiAgCj4gSSBkb24ndCB1
bmRlcnN0YW5kIHdoZXJlIGlzIGluYWNjdXJhdGUuCj4gCj4gPj4gYW5kIG1vc3Qgb2YKPiA+PiB0
aGUgdGltZSBVQkkvVUJJRlMgZXJhc2VzIGJsb2NrcyB0aGF0IGNvbnRhaW4gbW9yZSBwcm9ncmFt
bWVkIHBhZ2VzLgoKQmVjYXVzZSBVQkkvVUJJRlMgaXMgKm9uZSogdXNlciBvZiBNVEQuIFRoaXMg
cGF0Y2ggaGFzIG5vdGhpbmcgdG8gZG8Kd2l0aCBVQkkvVUJJRlMuIFBsdXMsIHRoZSBzZW50ZW5j
ZSBpcyBub3QgdmVyeSBjbGVhciB0byBtZSBhbnl3YXkuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
