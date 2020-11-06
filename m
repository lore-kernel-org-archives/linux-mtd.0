Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BFEC4741F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 13:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19EEB2065D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 13:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NXjDoPny"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19EEB2065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=okK3bXwlGyoITVByBioIMfpoPydtsAzMxaProDY5KeM=; b=NXjDoPny0/3vrHS4a0JbGGTbS
	EUoriio2o6DmtWnzmSSl2xaxSQ5NKZJ0ER2MK2z5j0al8Onf+UkooEjcwlTpocBJ7Us/qXDboYket
	ko8C4U3IRw3v5om1gu59z+0hHHoMGPli2M86B/iWIa8m5aKy0fRa7Z+SkOa6thSFE+I3qCx/MC3Hy
	feBajRjVYkt4X6DyikuYSdfQOv1eylf5GZTrlKEp7y5VngWuFfQF33bZ3Z74PgKZW+n2NBQ5Yo+Ql
	5ULw86YDDOkUO0yQZwuZ1Pu82kYBHZG8tMi/B90k7N1maymS01SIgchsPds8oRcWYVqB9SUCxZdA8
	ga9dLwKyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb22X-0007iq-Vd; Fri, 06 Nov 2020 13:44:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb22V-0007hG-6p
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 13:44:28 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3FF1DFF803;
 Fri,  6 Nov 2020 13:44:22 +0000 (UTC)
Date: Fri, 6 Nov 2020 14:44:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/23] Rid W=1 warnings in MTD
Message-ID: <20201106144420.13c18b97@xps13>
In-Reply-To: <20201106133247.GI2063125@dell>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201106133247.GI2063125@dell>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_084427_352492_AB7039F0 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gRnJpLCA2
IE5vdiAyMDIwIDEzOjMyOjQ3CiswMDAwOgoKPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJn
ZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiBrZXJuZWwgYnVpbGRzLCB3
aGljaCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+ID4gbmlnZ2x5
IGxpdHRsZSB3YXJuaW5ncy4KPiA+IAo+ID4gTGVlIEpvbmVzICgyMyk6Cj4gPiAgIG10ZDogbXRk
cGFydDogRml4IG1pc2RvY3VtZW50ZWQgZnVuY3Rpb24gcGFyYW1ldGVyICdtdGQnCj4gPiAgIG10
ZDogZGV2aWNlczogcGhyYW06IEZpbGUgaGVhZGVycyBhcmUgbm90IGdvb2QgY2FuZGlkYXRlcyBm
b3IKPiA+ICAgICBrZXJuZWwtZG9jCj4gPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9i
YXNlOiBGaXggZXhwZWN0ZWQga2VybmVsLWRvYyBmb3JtYXR0aW5nCj4gPiAgIG10ZDogZGV2aWNl
czogZG9jZzM6IEZpeCBrZXJuZWwtZG9jICdiYWQgbGluZScgYW5kICdleGNlc3NpdmUgZG9jJwo+
ID4gICAgIGlzc3Vlcwo+ID4gICBtdGQ6IG10ZGNvcmU6IEZpeCBtaXNzcGVsbGVkIGZ1bmN0aW9u
IHBhcmFtZXRlciAnc2VjdGlvbicKPiA+ICAgbXRkOiBuYW5kOiBvbmVuYW5kOiBvbmVuYW5kX2Ji
dDogRml4IGV4cGVjdGVkIGtlcm5lbC1kb2MgZm9ybWF0dGluZwo+ID4gICBtdGQ6IHNwaS1ub3I6
IGNvbnRyb2xsZXJzOiBoaXNpLXNmYzogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MK
PiA+ICAgbXRkOiB1Ymk6IGJ1aWxkOiBEb2N1bWVudCAndWJpX251bScgaW4gc3RydWN0IG10ZF9k
ZXZfcGFyYW0KPiA+ICAgbXRkOiBuYW5kOiBzcGk6IHRvc2hpYmE6IERlbW90ZSBub24tY29uZm9y
bWFudCBrZXJuZWwtZG9jIGhlYWRlcgo+ID4gICBtdGQ6IHViaToga2FwaTogQ29ycmVjdCBkb2N1
bWVudGF0aW9uIGZvciAndWJpX2xlYl9yZWFkX3NnJ3MgJ3NnbCcKPiA+ICAgICBwYXJhbWV0ZXIK
PiA+ICAgbXRkOiB1Ymk6IGViYTogRml4IGEgY291cGxlIG9mIG1pc2RvY3VtZW50YXRpb24gaXNz
dWVzCj4gPiAgIG10ZDogdWJpOiB3bDogRml4IGEgY291cGxlIG9mIGtlcm5lbC1kb2MgaXNzdWVz
Cj4gPiAgIG10ZDogbmFuZDogcmF3OiBicmNtbmFuZDogYnJjbW5hbmQ6IERlbW90ZSBub24tY29u
Zm9ybWFudCBrZXJuZWwtZG9jCj4gPiAgICAgaGVhZGVycwo+ID4gICBtdGQ6IHViaTogZ2x1ZWJp
OiBGaXggbWlzbmFtZWQgZnVuY3Rpb24gcGFyYW1ldGVyIGRvY3VtZW50YXRpb24KPiA+ICAgbXRk
OiBuYW5kOiByYXc6IGRpc2tvbmNoaXA6IE1hcmtpbmcgdW51c2VkIHZhcmlhYmxlcyBhcwo+ID4g
ICAgIF9fYWx3YXlzX3VudXNlZAo+ID4gICBtdGQ6IG5hbmQ6IHJhdzogY2FmZV9uYW5kOiBSZW1v
dmUgc3VwZXJmbHVvdXMgcGFyYW0gZG9jIGFuZCBhZGQKPiA+ICAgICBhbm90aGVyCj4gPiAgIG10
ZDogbmFuZDogcmF3OiBzM2MyNDEwOiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgMiBtaXNzaW5nIHN0
cnVjdAo+ID4gICAgIG1lbWJlcnMKPiA+ICAgbXRkOiBuYW5kOiByYXc6IG9tYXBfZWxtOiBGaW5p
c2ggaGFsZiBwb3B1bGF0ZWQgZnVuY3Rpb24gaGVhZGVyLAo+ID4gICAgIGRlbW90ZSBlbXB0eSBv
bmVzCj4gPiAgIG10ZDogbmFuZDogcmF3OiBvbWFwMjogRml4IGEgYnVuY2ggb2Yga2VybmVsLWRv
YyBtaXNkZW1lYW5vdXJzCj4gPiAgIG10ZDogbmFuZDogcmF3OiBzdW54aV9uYW5kOiBEb2N1bWVu
dCAnc3VueGlfbmZjJ3MgJ2NhcHMnIG1lbWJlcgo+ID4gICBtdGQ6IG5hbmQ6IHJhdzogYXJhc2Fu
LW5hbmQtY29udHJvbGxlcjogRG9jdW1lbnQgJ2FuZmNfb3AncyAnYnVmJwo+ID4gICAgIG1lbWJl
cgo+ID4gICBtdGQ6IG5hbmQ6IG9uZW5hbmQ6IG9uZW5hbmRfYmFzZTogRml4IHNvbWUga2VybmVs
LWRvYyBtaXNkZW1lYW5vdXJzCj4gPiAgIG10ZDogZGV2aWNlczogcG93ZXJudl9mbGFzaDogQWRk
IGZ1bmN0aW9uIG5hbWVzIHRvIGhlYWRlcnMgYW5kIGZpeAo+ID4gICAgICdkZXYnICAKPiAKPiBN
YXkgSSBhc2s7IHdoYXQgaXMgdGhlIHBsYW4gZm9yIHRoZXNlIHBhdGNoZXMgcGxlYXNlPwo+IAo+
IERvIHlvdSBwbGFuIG9uIHRha2luZyB0aGUgb25lcyB0aGF0IGRvIG5vdCByZXF1aXJlIHJlLXdv
cmssIHJhdGhlcgo+IHRoYW4gZml4aW5nIHVwIGFuZCByZS1zdWJtaXR0aW5nIHRoZSB3aG9sZSBz
ZXQuICBJdCB3b3VsZCBjZXJ0YWlubHkKPiBzYXZlIGEgbG90IG9mIG1haWxpbmcgbGlzdCBjaHVy
biBpZiB0aGF0IHdlcmUgdGhlIGNhc2UuCj4gCj4gRWl0aGVyIHdheSwgbGV0IG1lIGtub3cgYW5k
IEkgd2lsbCBhYmlkZSBieSB5b3VyIGRlY2lzaW9uLgo+IAoKSSB3b3VsZCBwcmVmZXIgcmVjZWl2
aW5nIGEgdjIgd2l0aCBhbGwgdGhlIHBhdGNoZXMgaWYgeW91IGRvbid0IG1pbmQuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
