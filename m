Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E22EC35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xc58PoHQpCL2JErJGQMB90Q8K5M8ItEbVBwJwCyUftc=; b=1rWcNxNcGjmfJU
	Rfg/j3JqFuqvUMub4XJQuupdoyeVukYWH6nQ54HZq+FhxMaN5f0SKDR1FKCajh47C9ur9LZUrEjsh
	AL3Uvgo0DLBpc+He65SX+JWH1DZvQZSyoSJfpEbi296fC8JDCewQwxgqfRK7HZlFUpZdFvb4ciWHB
	zk2Cy2ixSqMrYV3RZ8VtaCMRGo8ur5ukjk6VHFqf+dib4usMunXFTVjG7mn30MuefP63eQaR5H8jl
	O0xbKCrN4mpXq21KqcDwIWP0S3d68HaH3kDIdzrZQLQ2koK/O7oLTiymXHInzgtmWSxGIB8uacFVj
	mZ32E1MBYgtHhxvILD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFx4-002NPC-1X;
	Thu, 21 Dec 2023 10:06:50 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFx1-002NNk-21
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 10:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DpBX+raE1XqeTwUx85sv4ai1/YB2y/QrBejcthyvF/U=; b=A3tdXLaM/A/lcPnUVvQba/tSkN
	Wkg5ItOzDGQ3CfAiw7/Zekzrwac2liFPVG+ydudDzAzK4lSYrll/tiLCS47OOJ2IT9aiNya+5xe+g
	68TDcWKtd6OOCaz0XSVT1it1MDv95QBqEahbxoovy28B2qRTK2dPl21BI0bXbMZanERZi4KB7zvJ4
	a1ztaA69AIBqltXBQABjRNYkMezazDqlxizYcxeu2vT5p3V3FiXE6HXH/6/ukeoF3gl8xQs7CiBT2
	CHV2qiTs6c9n+Av6mK2WZ9YHzwQSS8gdmh8K/yZnEe79OeA5eh1VyZYIK5G9j7IK25jRcy5wNbIhS
	+mK5nbhg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rGFwi-00038B-T5; Thu, 21 Dec 2023 11:06:28 +0100
Received: from [185.17.218.86] (helo=[192.168.64.76])
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1rGFwi-000IQ0-3Q; Thu, 21 Dec 2023 11:06:28 +0100
Message-ID: <4f99408e8331e719b245e29f88bccbb8259b9f4c.camel@geanix.com>
Subject: Re: [PATCH 0/4] mtd: rawnand: Fix sequential reads
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Jaime Liao
 <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>, 
 eagle.alexander923@gmail.com, mans@mansr.com, Sean
 =?ISO-8859-1?Q?Nyekj=E6r?= <sean@geanix.com>
Date: Thu, 21 Dec 2023 11:06:27 +0100
In-Reply-To: <20231215123208.516590-1-miquel.raynal@bootlin.com>
References: <20231215123208.516590-1-miquel.raynal@bootlin.com>
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27129/Wed Dec 20 10:38:37 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_020647_988315_A7B7123A 
X-CRM114-Status: GOOD (  12.98  )
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

SGkgTWlxdWVsLAoKT24gRnJpLCAyMDIzLTEyLTE1IGF0IDEzOjMyICswMTAwLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+IEFmdGVyIGEgbnVtYmVyIG9mIHJlcG9ydHMgYW5kIGhvdXJzIG9mIGludmVz
dGlnYXRpb24sIEkgY291bGQgZmluYWxseQo+IGlkZW50aWZ5IHRoZSBtYWluIGlzc3VlIHRoYXQg
bGlrZWx5IGxlYWQgdG8gYWxsIHRoZXNlIGlzc3Vlcywgd2hpY2gKPiBpcwo+IGFkZHJlc3NlZCBp
biB0aGUgc2Vjb25kIHBhdGNoLiBUaGUgdGhyZWUgb3RoZXIgcGF0Y2hlcyBhcmUgYWxzbwo+IGZs
YWdnZWQKPiBmb3IgYmFja3BvcnRpbmcgYmVjYXVzZSBJIHRoaW5rIGl0IGlzIGJlc3QgdG8gYXBw
bHkgdGhlbSBhcyB3ZWxsIGFzCj4gdGhleQo+IGFyZSBzdXBwb3NlZCB0byBwcmV2ZW50IGEgZmV3
IGNvcm5lciBjYXNlcyBmcm9tIGhhcHBlbmluZy4KPiAKPiBQbGVhc2UgdGVzdCB0aGlzIHNlcmll
cyBhbmQgbGV0IG1lIGtub3cgaWYgeW91IGVuY291bnRlciBvdGhlcgo+IGVycm9ycy4KPiAKPiBU
aGFua3MsCj4gTWlxdcOobAo+IAo+IE1pcXVlbCBSYXluYWwgKDQpOgo+IMKgIG10ZDogcmF3bmFu
ZDogUHJldmVudCBjcm9zc2luZyBMVU4gYm91bmRhcmllcyBkdXJpbmcgc2VxdWVudGlhbAo+IHJl
YWRzCj4gwqAgbXRkOiByYXduYW5kOiBGaXggY29yZSBpbnRlcmZlcmVuY2Ugd2l0aCBzZXF1ZW50
aWFsIHJlYWRzCj4gwqAgbXRkOiByYXduYW5kOiBQcmV2ZW50IHNlcXVlbnRpYWwgcmVhZHMgd2l0
aCBvbi1kaWUgRUNDIGVuZ2luZXMKPiDCoCBtdGQ6IHJhd25hbmQ6IENsYXJpZnkgY29uZGl0aW9u
cyB0byBlbmFibGUgY29udGludW91cyByZWFkcwo+IAo+IMKgZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMgfCA4OSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAtLQo+IMKg
aW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5owqDCoMKgwqDCoCB8wqAgMiArCj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAoKVGhhbmsgeW91
IGZvciBsb29raW5nIGludG8gdGhpcyEKClRoaXMgc2VyaWVzIGZpeGVzIHRoZSBpc3N1ZSBvbiBv
dXIgaS5NWDZVTEwgZXF1aXBwZWQgd2l0aCBhIE1pY3JvbgpNVDI5RjRHMDhBQkFGQVdQIG5hbmQg
Zmxhc2gsIHNvIGZvciBhbGwgZm91ciBwYXRjaGVzOgoKVGVzdGVkLWJ5OiBNYXJ0aW4gSHVuZGVi
w7hsbCA8bWFydGluQGdlYW5peC5jb20+CgovLyBNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
