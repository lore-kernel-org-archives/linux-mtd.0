Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB86EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 07:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619C661164
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 07:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 619C661164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWFEE2L1DYyTFq0RqVYdaWu93Gu3GKVoyc7lF8krsPQ=; b=TrLkv/2CY5LbKt
	e3O2ts/TiyCgqg6rvYnahLpavrFOWhTPwshTiRp1rFGRwCcSZQccGIeKFh3Cd/MZ1jOKsgvUT1VaN
	T2oGKKtGzR+exQDhRjxEAu/sFEptIE19vTsusfPy7DS9ZP0Fomk1YLuMlqwk4epwpJK7CILq5z7Hl
	BXa61nuN05tLVsMqT0lomH/4lXtlsvL7/nii39ZNsERGCkw1IBiceoR+pLasNMyZBFg5HM2otUh2D
	A91vbkfBESwPzXTD+ZdL7rtecYBuQoGe12xT76wsWpAu3eC3FE61OTglDRY1t8NSufLRbjT8Ci5YW
	I9kDj0waO80LtDjDlcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQP6h-008H8H-7d; Wed, 15 Sep 2021 07:13:23 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQP6d-008H7C-KD
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 07:13:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7E3842000E;
 Wed, 15 Sep 2021 07:13:16 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:13:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bert Vermeulen <bert@biot.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>,
 Alexander Lobakin <alobakin@pm.me>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spinand: Add support for Etron EM73D044VCx
Message-ID: <20210915091315.2768e9a3@xps13>
In-Reply-To: <927c7c75-c0d3-b3fb-6b85-13dbc3c6edbe@biot.com>
References: <20210908201624.237634-1-bert@biot.com>
 <20210914193108.78df5367@xps13>
 <1517789471.73175.1631641788145.JavaMail.zimbra@nod.at>
 <927c7c75-c0d3-b3fb-6b85-13dbc3c6edbe@biot.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_001319_843949_ACD32298 
X-CRM114-Status: GOOD (  21.96  )
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

SGkgQmVydCwKCmJlcnRAYmlvdC5jb20gd3JvdGUgb24gVHVlLCAxNCBTZXAgMjAyMSAyMjowMzo0
OSArMDIwMDoKCj4gT24gOS8xNC8yMSA3OjQ5IFBNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6
Cj4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAKPiA+PiBiZXJ0QGJpb3QuY29t
IHdyb3RlIG9uIFdlZCwgIDggU2VwIDIwMjEgMjI6MTY6MTkgKzAyMDA6Cj4gPj4gICAKPiA+Pj4g
VGhpcyBhZGRzIGEgbmV3IHZlbmRvciBFdHJvbiwgYW5kIHN1cHBvcnQgZm9yIGEgMkdiIGNoaXAu
Cj4gPj4+IAo+ID4+PiBUaGUgZGF0YXNoZWV0IGlzIGF2YWlsYWJsZSBhdAo+ID4+PiBodHRwczov
L3d3dy5ldHJvbi5jb20vY24vcHJvZHVjdHMvRU03MyU1QjglNURDJTVCRF9FX0YlNURWQyUyMFNQ
SSUyME5BTkQlMjBGbGFzaF9Qcm9tb3Rpb25fUmV2JTIwMV8wMEEucGRmCj4gPj4+IAo+ID4+PiBT
aWduZWQtb2ZmLWJ5OiBCZXJ0IFZlcm1ldWxlbiA8YmVydEBiaW90LmNvbT4KPiA+Pj4gLS0tCj4g
Pj4+IHYyOgo+ID4+PiAtIE1hZGUgb29ibGF5b3V0X2ZyZWUvX2VjYyBkZXBlbmQgb24gY2hpcC1z
cGVjaWZpYyBwYXJhbWV0ZXJzLCBpbnN0ZWFkIG9mCj4gPj4+ICAgaGFyZGNvZGVkIHRvIHRoaXMg
MkdiIGNoaXAgb25seQo+ID4+PiAtIEZpeGVkIG1hbnVmYWN0dXJlciBvcmRlcmluZwo+ID4+PiAt
IEZpeGVkIG1pbm9yIGZvcm1hdHRpbmcgaXNzdWVzIGFzIHJlcG9ydGVkCj4gPj4+IC0gUmVtb3Zl
ZCBkZWJ1ZyBjb21tZW50Cj4gPj4+IAo+ID4+PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZp
bGUgfCAgIDIgKy0KPiA+Pj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgIHwgICAxICsK
PiA+Pj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2V0cm9uLmMgIHwgMTA0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+Pj4gIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAg
IHwgICAxICsKPiA+Pj4gIDQgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3NwaS9l
dHJvbi5jICAKPiA+PiAKPiA+PiBbLi4uXQo+ID4+ICAgCj4gPj4+ICtzdGF0aWMgaW50IGV0cm9u
X2VjY19nZXRfc3RhdHVzKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTggc3RhdHVz
KQo+ID4+PiArewo+ID4+PiArCXN3aXRjaCAoc3RhdHVzICYgU1RBVFVTX0VDQ19NQVNLKSB7Cj4g
Pj4+ICsJY2FzZSBTVEFUVVNfRUNDX05PX0JJVEZMSVBTOgo+ID4+PiArCQlyZXR1cm4gMDsKPiA+
Pj4gKwo+ID4+PiArCWNhc2UgU1RBVFVTX0VDQ19IQVNfQklURkxJUFM6Cj4gPj4+ICsJCS8qIEJl
dHdlZW4gMS03IGJpdGZsaXBzIHdlcmUgY29ycmVjdGVkICovCj4gPj4+ICsJCXJldHVybiA3OyAg
Cj4gPj4gCj4gPj4gTW1taCB0aGlzIGlzIGEgYml0IHByb2JsZW1hdGljLCBoYXZpbmcgbm8gaW50
ZXJtZWRpYXRlIHZhbHVlIG1lYW5zIGEKPiA+PiBzaW5nbGUgYml0ZmxpcCB3aWxsIHRyaWdnZXIg
VUJJIHRvIG1vdmUgdGhlIGRhdGEgYXJvdW5kIGFzIGl0cwo+ID4+IHRocmVzaG9sZCB3aWxsIGJl
IHJlYWNoZWQuIFJpY2hhcmQsIGFueSBmZWVkYmFjayBvbiB0aGlzPyAgCj4gPiAKPiA+IFNvLCB0
aGUgTkFORCBjb250cm9sbGVyIGNhbiBvbmx5IHJlcG9ydCAibm8gYml0ZmxpcHMiLCAic29tZSBi
aXRmbGlwcyIsICJtYXhpbXVtIGJpZmxpcHMiIGFuZCAibm8gd2F5IHRvIGZpeCI/Cj4gPiBJZiBz
bywgeWVzLCB0aGlzIGlzIHByb2JsZW1hdGljIGZvciBVQkkgYmVjYXVzZSBpdCB3aWxsIHRyaWdn
ZXIgd2Vhci1sZXZlbGluZyB3YXkgdG9vIG9mdGVuLgo+ID4gT24gYSBtZWRpdW0gYWdlZCBOQU5E
IEknZCBleHBlY3QgdG8gc2VlIFNUQVRVU19FQ0NfSEFTX0JJVEZMSVBTIGFsbW9zdCBhbHdheXMg
c2V0LiA6LSggIAo+IAo+IFllcywgdGhhdCdzIGFsbCB0aGVyZSBpcyBhY2NvcmRpbmcgdG8gdGhl
IGRhdGFzaGVldC4gQ2FuJ3QgYmUgX3RoYXRfCj4gdW51c3VhbCwgc2luY2UgdGhhdCdzIGFsbCB0
aGUgU1RBVFVTX0VDQ18qIGZsYWdzIGNvdmVyLgoKSSBmb3Jnb3QgYWJvdXQgdGhhdCBwYXJ0IHdo
aWNoIHdhcyByZW1pbmRlZCB0byBtZSBieSBSaWNoYXJkOgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9tdGRjb3JlLmMjTDYyNwoJLyog
ZGVmYXVsdCB2YWx1ZSBpZiBub3Qgc2V0IGJ5IGRyaXZlciAqLwoJaWYgKG10ZC0+Yml0ZmxpcF90
aHJlc2hvbGQgPT0gMCkKCQltdGQtPmJpdGZsaXBfdGhyZXNob2xkID0gbXRkLT5lY2Nfc3RyZW5n
dGg7CgpTbyB0aGlzIGlzIGZpbmUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
