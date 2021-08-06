Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E64C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:13:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826F560F70
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 826F560F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odE6FvAOwgkPdmWogy7OB988Vw3vKWoWuMwp4+N48Js=; b=Ql7/ylPXqJWM1q
	20uXUq3tVfx8YWusZp5TuvZ7B3JnAoYd09baP/VNyNX/mwWjV1YWMdJH3xyGQ0ynfXZkBpjb/eog9
	QijwAYeexfnD6ILiOP1sRD4v6BmMMmXfvq1dXpBObFo1hyFjhOSpJeOTFSdx3oxzkAFyEFQjBK8NA
	0O/it0mSOIHZDnUUf4jR1FoTUVN2PMvwFD5GyhU+uLrvn+s21b4vMuc9vLN2xs8yqn5rVqSd41JCG
	7gfv3HoYHZ6zEF6jlOw0ZJEHbCQEBpePcIjxRGzYRVqM7IyByGBVq/oOuAtUCAiFQE6pkT+lZYOEc
	L7gHul3v48S/zhBcWC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC5Gq-00DGNF-Kf; Fri, 06 Aug 2021 19:12:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC5Gn-00DGM8-6T
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:12:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BA6AF1C0005;
 Fri,  6 Aug 2021 19:12:32 +0000 (UTC)
Date: Fri, 6 Aug 2021 21:12:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 12/13] mtd: spinand: Perform Power-on-Reset when
 runtime_pm suspend is issued
Message-ID: <20210806211231.5c569939@xps13>
In-Reply-To: <20210713130538.646-13-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-13-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_121237_413950_840458FC 
X-CRM114-Status: GOOD (  23.76  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjM3CiswMDAwOgoKPiBBIHNvZnQgcmVzZXQgdXNpbmcgRkZoIGNv
bW1hbmQgZG9lc24ndCBlcmFzZSB0aGUgZmxhc2gncyBjb25maWd1cmF0aW9uCj4gYW5kIGRvZXNu
J3QgcmVzZXQgdGhlIFNQSSBJTyBtb2RlIGFsc28uIFRoaXMgY2FuIHJlc3VsdCBpbiB0aGUgZmxh
c2gKPiBiZWluZyBpbiBhIGRpZmZlcmVudCBTUEkgSU8gbW9kZSwgZS5nLiBPY3RhbCBEVFIsIHdo
ZW4gcmVzdW1pbmcgZnJvbQo+IHNsZWVwLiBUaGlzIHdvdWxkIHJlbmRlciB0aGUgZmxhc2ggaW4g
YW4gdW51c2FibGUgc3RhdGUuCgogICAgICAgICAgICAgIGNvdWxkIHB1dCB0aGUgZmFsc2ggaW4/
Cgo+IFBlcmZvcm0gYSBQb3dlci1vbi1SZXNldCAoUG9SKSwgaWYgYXZhaWxhYmxlIGluIHRoZSBm
bGFzaCwgd2hlbgo+IHN1c3BlbmRpbmcgdGhlIGRldmljZSBieSBydW50aW1lX3BtLiBUaGlzIHdv
dWxkIHNldCB0aGUgZmxhc2ggdG8gY2xlYW4KCkkgdGhpbmsgcnVudGltZV9wbSBpcyBzb21ldGhp
bmcgZWxzZS4KCj4gc3RhdGUgZm9yIHJlaW5pdGlhbGl6YXRpb24gZHVyaW5nIHJlc3VtZSBhbmQg
d291bGQgYWxzbyBlbnN1cmUgdGhhdCBpdAo+IGlzIGluIHN0YW5kYXJkIFNQSSBJTyBtb2RlICgx
Uy0xUy0xUykgYmVmb3JlIHRoZSByZXN1bWUgYmVnaW5zLgoKUGxlYXNlIGFkZCBhIGNvbW1lbnQg
YWJvdXQgdGhpcyB0byBleHBsYWluIHdoeSB3ZSBkb24ndCBkbyB0aGlzIHJlc2V0CmF0IHJlc3Vt
ZSB0aW1lLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDE2ICsrKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29y
ZS5jCj4gaW5kZXggNjA4ZjRlYjg1YjBhLi42ZmIzYWE2YWY1NDAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29y
ZS5jCj4gQEAgLTEzMjksNiArMTMyOSwyMSBAQCBzdGF0aWMgdm9pZCBzcGluYW5kX210ZF9yZXN1
bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAlzcGluYW5kX2VjY19lbmFibGUoc3BpbmFuZCwg
ZmFsc2UpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHNwaW5hbmRfbXRkX3N1c3BlbmQoc3RydWN0
IG10ZF9pbmZvICptdGQpCj4gK3sKPiArCXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCA9
IG10ZF90b19zcGluYW5kKG10ZCk7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCWlmICghKHNwaW5hbmQt
PmZsYWdzICYgU1BJTkFORF9IQVNfUE9SX0NNRF9CSVQpKQo+ICsJCXJldHVybiAwOwo+ICsKPiAr
CXJldCA9IHNwaW5hbmRfcG93ZXJfb25fcnN0X29wKHNwaW5hbmQpOwo+ICsJaWYgKHJldCkKPiAr
CQlkZXZfZXJyKCZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2LCAic3VzcGVuZCgpIGZhaWxlZFxu
Iik7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBzcGluYW5kX2lu
aXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICB7Cj4gIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmc3BpbmFuZC0+c3BpbWVtLT5zcGktPmRldjsKPiBAQCAtMTQwMSw2ICsxNDE2LDcg
QEAgc3RhdGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
KQo+ICAJbXRkLT5fZXJhc2UgPSBzcGluYW5kX210ZF9lcmFzZTsKPiAgCW10ZC0+X21heF9iYWRf
YmxvY2tzID0gbmFuZGRldl9tdGRfbWF4X2JhZF9ibG9ja3M7Cj4gIAltdGQtPl9yZXN1bWUgPSBz
cGluYW5kX210ZF9yZXN1bWU7Cj4gKwltdGQtPl9zdXNwZW5kID0gc3BpbmFuZF9tdGRfc3VzcGVu
ZDsKPiAgCj4gIAlpZiAobmFuZC0+ZWNjLmVuZ2luZSkgewo+ICAJCXJldCA9IG10ZF9vb2JsYXlv
dXRfY291bnRfZnJlZWJ5dGVzKG10ZCk7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
