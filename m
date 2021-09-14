Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEF3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 20:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B856112D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 20:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32B856112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/dkkJ1ykZZC15j3mSzebfoJPOWGN1pzNHZ2IXUWGw88=; b=F8IsbpOA19yAakqY5G9peAaqlQ
	Q48QnUC9EVhjB1NVkfTHNBuBn9MeHtlAtZ5XAIumkTsKcGqkwYsVo+zj75rx6kzxPqORdQfKtr5ma
	oCIIgQIM0hkYqZFyM09zJZF1qTZ4u2fL2ESUKJURhAJe5L+Bui75busvZJr4umS7G/HEb5j7aaw80
	zHXeidKbVF6WY3S3k6STMmcFnOEhAYJtPZMxwAI7osDaDQ5EGShOWUNqtF70dn6y6fWH+tdRZD/ih
	dacn8mpDcFWqSe6axuQp6OgwNVWNuvyDeqW+nbnQKVS7P0u01XcuRNAT4Z4iSWHkSeRID5u74H773
	T8UuLUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQEer-006y6c-GV; Tue, 14 Sep 2021 20:03:57 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQEeo-006y5B-Fa
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 20:03:56 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1mQEej-00DMlH-W6
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 22:03:50 +0200
Received: from [2a02:578:460c:1:9c5a:5ed4:98b1:9c44]
 by yawp.biot.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1mQEej-00DMlD-Qt; Tue, 14 Sep 2021 22:03:49 +0200
Subject: Re: [PATCH v2] mtd: spinand: Add support for Etron EM73D044VCx
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Alexander Lobakin <alobakin@pm.me>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <20210908201624.237634-1-bert@biot.com>
 <20210914193108.78df5367@xps13>
 <1517789471.73175.1631641788145.JavaMail.zimbra@nod.at>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <927c7c75-c0d3-b3fb-6b85-13dbc3c6edbe@biot.com>
Date: Tue, 14 Sep 2021 22:03:49 +0200
MIME-Version: 1.0
In-Reply-To: <1517789471.73175.1631641788145.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_130354_561186_E64A1E10 
X-CRM114-Status: GOOD (  17.29  )
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

T24gOS8xNC8yMSA3OjQ5IFBNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBiZXJ0QGJpb3QuY29tIHdyb3RlIG9uIFdlZCwgIDgg
U2VwIDIwMjEgMjI6MTY6MTkgKzAyMDA6Cj4+IAo+Pj4gVGhpcyBhZGRzIGEgbmV3IHZlbmRvciBF
dHJvbiwgYW5kIHN1cHBvcnQgZm9yIGEgMkdiIGNoaXAuCj4+PiAKPj4+IFRoZSBkYXRhc2hlZXQg
aXMgYXZhaWxhYmxlIGF0Cj4+PiBodHRwczovL3d3dy5ldHJvbi5jb20vY24vcHJvZHVjdHMvRU03
MyU1QjglNURDJTVCRF9FX0YlNURWQyUyMFNQSSUyME5BTkQlMjBGbGFzaF9Qcm9tb3Rpb25fUmV2
JTIwMV8wMEEucGRmCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEJlcnQgVmVybWV1bGVuIDxiZXJ0
QGJpb3QuY29tPgo+Pj4gLS0tCj4+PiB2MjoKPj4+IC0gTWFkZSBvb2JsYXlvdXRfZnJlZS9fZWNj
IGRlcGVuZCBvbiBjaGlwLXNwZWNpZmljIHBhcmFtZXRlcnMsIGluc3RlYWQgb2YKPj4+ICAgaGFy
ZGNvZGVkIHRvIHRoaXMgMkdiIGNoaXAgb25seQo+Pj4gLSBGaXhlZCBtYW51ZmFjdHVyZXIgb3Jk
ZXJpbmcKPj4+IC0gRml4ZWQgbWlub3IgZm9ybWF0dGluZyBpc3N1ZXMgYXMgcmVwb3J0ZWQKPj4+
IC0gUmVtb3ZlZCBkZWJ1ZyBjb21tZW50Cj4+PiAKPj4+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9N
YWtlZmlsZSB8ICAgMiArLQo+Pj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgIHwgICAx
ICsKPj4+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9ldHJvbi5jICB8IDEwNCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+PiAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oICAg
fCAgIDEgKwo+Pj4gIDQgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9zcGkvZXRyb24u
Ywo+PiAKPj4gWy4uLl0KPj4gCj4+PiArc3RhdGljIGludCBldHJvbl9lY2NfZ2V0X3N0YXR1cyhz
dHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIHU4IHN0YXR1cykKPj4+ICt7Cj4+PiArCXN3
aXRjaCAoc3RhdHVzICYgU1RBVFVTX0VDQ19NQVNLKSB7Cj4+PiArCWNhc2UgU1RBVFVTX0VDQ19O
T19CSVRGTElQUzoKPj4+ICsJCXJldHVybiAwOwo+Pj4gKwo+Pj4gKwljYXNlIFNUQVRVU19FQ0Nf
SEFTX0JJVEZMSVBTOgo+Pj4gKwkJLyogQmV0d2VlbiAxLTcgYml0ZmxpcHMgd2VyZSBjb3JyZWN0
ZWQgKi8KPj4+ICsJCXJldHVybiA3Owo+PiAKPj4gTW1taCB0aGlzIGlzIGEgYml0IHByb2JsZW1h
dGljLCBoYXZpbmcgbm8gaW50ZXJtZWRpYXRlIHZhbHVlIG1lYW5zIGEKPj4gc2luZ2xlIGJpdGZs
aXAgd2lsbCB0cmlnZ2VyIFVCSSB0byBtb3ZlIHRoZSBkYXRhIGFyb3VuZCBhcyBpdHMKPj4gdGhy
ZXNob2xkIHdpbGwgYmUgcmVhY2hlZC4gUmljaGFyZCwgYW55IGZlZWRiYWNrIG9uIHRoaXM/Cj4g
Cj4gU28sIHRoZSBOQU5EIGNvbnRyb2xsZXIgY2FuIG9ubHkgcmVwb3J0ICJubyBiaXRmbGlwcyIs
ICJzb21lIGJpdGZsaXBzIiwgIm1heGltdW0gYmlmbGlwcyIgYW5kICJubyB3YXkgdG8gZml4Ij8K
PiBJZiBzbywgeWVzLCB0aGlzIGlzIHByb2JsZW1hdGljIGZvciBVQkkgYmVjYXVzZSBpdCB3aWxs
IHRyaWdnZXIgd2Vhci1sZXZlbGluZyB3YXkgdG9vIG9mdGVuLgo+IE9uIGEgbWVkaXVtIGFnZWQg
TkFORCBJJ2QgZXhwZWN0IHRvIHNlZSBTVEFUVVNfRUNDX0hBU19CSVRGTElQUyBhbG1vc3QgYWx3
YXlzIHNldC4gOi0oCgpZZXMsIHRoYXQncyBhbGwgdGhlcmUgaXMgYWNjb3JkaW5nIHRvIHRoZSBk
YXRhc2hlZXQuIENhbid0IGJlIF90aGF0Xwp1bnVzdWFsLCBzaW5jZSB0aGF0J3MgYWxsIHRoZSBT
VEFUVVNfRUNDXyogZmxhZ3MgY292ZXIuCgpJbmNpZGVudGFsbHkgSSdtIGFidXNpbmcgU1RBVFVT
X0VDQ19NQVNLIGhlcmUsIHNpbmNlIHRoZSAwYjExIHBhdHRlcm4gaXMKbWlzc2luZyBmcm9tIHRo
b3NlIGZsYWdzLgoKCi0tIApCZXJ0IFZlcm1ldWxlbgpiZXJ0QGJpb3QuY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
