Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89040C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 18:17:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E1A60184
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 18:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50E1A60184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Woc3xoEBCniSIZZp3Y9K19DU1H1+BWhld7UgKmiuwoQ=; b=rJis237KTEh38K25+MnoLZHGeh
	bEaKw7QWuhA42Lki1exqszzgPbfQXHwEAU8CfdNUWHzxC+flQ8AfnBvmG8CpUu9QdE5EM/QRo5QEb
	ScY+WvGfraxV0V2GbW3iiYanT4T2lsdIkGLBfEf2j3c+NWgZni5bAJNRFpmfHnDAJqHgJTzScC+me
	qYay/EwZbcP4o0NTL9q0OPtsCD5kxNo1hi1UkehGgtFbNf+Uq5s56hU7cb0cJzPqFgOmCb+9PpjpB
	Gahsc8kBlDkuXf4g91YxTprjoCYXTY+bVR+eZykfYvCTAwCQGb9qcd2bUdXcVYWnUvDKoR8yscf7g
	MVmTstkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQCyZ-006iLc-D6; Tue, 14 Sep 2021 18:16:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCZE-006ceS-DI
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 17:50:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5C1986171AF2;
 Tue, 14 Sep 2021 19:49:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Zkvx2aJaA6pc; Tue, 14 Sep 2021 19:49:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 85FA16171AF9;
 Tue, 14 Sep 2021 19:49:48 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3WI4YRxwFkYj; Tue, 14 Sep 2021 19:49:48 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 571C96171AF2;
 Tue, 14 Sep 2021 19:49:48 +0200 (CEST)
Date: Tue, 14 Sep 2021 19:49:48 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Bert Vermeulen <bert@biot.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Mark Brown <broonie@kernel.org>, Alexander Lobakin <alobakin@pm.me>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1517789471.73175.1631641788145.JavaMail.zimbra@nod.at>
In-Reply-To: <20210914193108.78df5367@xps13>
References: <20210908201624.237634-1-bert@biot.com>
 <20210914193108.78df5367@xps13>
Subject: Re: [PATCH v2] mtd: spinand: Add support for Etron EM73D044VCx
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: spinand: Add support for Etron EM73D044VCx
Thread-Index: uDL3zzNaZeNLZi7f2ywi+WlYy888Ew==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_105000_829399_62142760 
X-CRM114-Status: GOOD (  14.15  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENDOiAiQmVydCBWZXJtZXVsZW4iIDxiZXJ0QGJpb3QuY29tPiwgIlZpZ25lc2ggUmFnaGF2
ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAiUGF0cmljZSBDaG90YXJkIgo+IDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+LCAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20+LCAiQ2hyaXN0b3BoZSBLZXJlbGxvIgo+IDxjaHJpc3RvcGhlLmtlcmVsbG9A
Zm9zcy5zdC5jb20+LCAiTWFyayBCcm93biIgPGJyb29uaWVAa2VybmVsLm9yZz4sICJBbGV4YW5k
ZXIgTG9iYWtpbiIgPGFsb2Jha2luQHBtLm1lPiwKPiAibGludXgta2VybmVsIiA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4KPiBHZXNlbmRldDogRGllbnN0YWcsIDE0LiBTZXB0ZW1iZXIgMjAyMSAxOTozMTow
OAo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjJdIG10ZDogc3BpbmFuZDogQWRkIHN1cHBvcnQgZm9y
IEV0cm9uIEVNNzNEMDQ0VkN4Cgo+IEhpIEJlcnQsCj4gCj4gUmljaGFyZCwgYSBxdWVzdGlvbiBm
b3IgeW91IGJlbG93IQoKOikKIAo+IGJlcnRAYmlvdC5jb20gd3JvdGUgb24gV2VkLCAgOCBTZXAg
MjAyMSAyMjoxNjoxOSArMDIwMDoKPiAKPj4gVGhpcyBhZGRzIGEgbmV3IHZlbmRvciBFdHJvbiwg
YW5kIHN1cHBvcnQgZm9yIGEgMkdiIGNoaXAuCj4+IAo+PiBUaGUgZGF0YXNoZWV0IGlzIGF2YWls
YWJsZSBhdAo+PiBodHRwczovL3d3dy5ldHJvbi5jb20vY24vcHJvZHVjdHMvRU03MyU1QjglNURD
JTVCRF9FX0YlNURWQyUyMFNQSSUyME5BTkQlMjBGbGFzaF9Qcm9tb3Rpb25fUmV2JTIwMV8wMEEu
cGRmCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0IFZlcm1ldWxlbiA8YmVydEBiaW90LmNvbT4K
Pj4gLS0tCj4+IHYyOgo+PiAtIE1hZGUgb29ibGF5b3V0X2ZyZWUvX2VjYyBkZXBlbmQgb24gY2hp
cC1zcGVjaWZpYyBwYXJhbWV0ZXJzLCBpbnN0ZWFkIG9mCj4+ICAgaGFyZGNvZGVkIHRvIHRoaXMg
MkdiIGNoaXAgb25seQo+PiAtIEZpeGVkIG1hbnVmYWN0dXJlciBvcmRlcmluZwo+PiAtIEZpeGVk
IG1pbm9yIGZvcm1hdHRpbmcgaXNzdWVzIGFzIHJlcG9ydGVkCj4+IC0gUmVtb3ZlZCBkZWJ1ZyBj
b21tZW50Cj4+IAo+PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUgfCAgIDIgKy0KPj4g
IGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgIHwgICAxICsKPj4gIGRyaXZlcnMvbXRkL25h
bmQvc3BpL2V0cm9uLmMgIHwgMTA0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgIHwgICAxICsKPj4gIDQgZmlsZXMgY2hh
bmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL210ZC9uYW5kL3NwaS9ldHJvbi5jCj4gCj4gWy4uLl0KPiAKPj4gK3N0YXRp
YyBpbnQgZXRyb25fZWNjX2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
LCB1OCBzdGF0dXMpCj4+ICt7Cj4+ICsJc3dpdGNoIChzdGF0dXMgJiBTVEFUVVNfRUNDX01BU0sp
IHsKPj4gKwljYXNlIFNUQVRVU19FQ0NfTk9fQklURkxJUFM6Cj4+ICsJCXJldHVybiAwOwo+PiAr
Cj4+ICsJY2FzZSBTVEFUVVNfRUNDX0hBU19CSVRGTElQUzoKPj4gKwkJLyogQmV0d2VlbiAxLTcg
Yml0ZmxpcHMgd2VyZSBjb3JyZWN0ZWQgKi8KPj4gKwkJcmV0dXJuIDc7Cj4gCj4gTW1taCB0aGlz
IGlzIGEgYml0IHByb2JsZW1hdGljLCBoYXZpbmcgbm8gaW50ZXJtZWRpYXRlIHZhbHVlIG1lYW5z
IGEKPiBzaW5nbGUgYml0ZmxpcCB3aWxsIHRyaWdnZXIgVUJJIHRvIG1vdmUgdGhlIGRhdGEgYXJv
dW5kIGFzIGl0cwo+IHRocmVzaG9sZCB3aWxsIGJlIHJlYWNoZWQuIFJpY2hhcmQsIGFueSBmZWVk
YmFjayBvbiB0aGlzPwoKU28sIHRoZSBOQU5EIGNvbnRyb2xsZXIgY2FuIG9ubHkgcmVwb3J0ICJu
byBiaXRmbGlwcyIsICJzb21lIGJpdGZsaXBzIiwgIm1heGltdW0gYmlmbGlwcyIgYW5kICJubyB3
YXkgdG8gZml4Ij8KSWYgc28sIHllcywgdGhpcyBpcyBwcm9ibGVtYXRpYyBmb3IgVUJJIGJlY2F1
c2UgaXQgd2lsbCB0cmlnZ2VyIHdlYXItbGV2ZWxpbmcgd2F5IHRvbyBvZnRlbi4KT24gYSBtZWRp
dW0gYWdlZCBOQU5EIEknZCBleHBlY3QgdG8gc2VlIFNUQVRVU19FQ0NfSEFTX0JJVEZMSVBTIGFs
bW9zdCBhbHdheXMgc2V0LiA6LSgKClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
