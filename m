Return-Path: <SRS0=i2dy=LC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7C6C47082
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 06:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4161360FF4
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 06:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4161360FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DHR1H0PUGgjmo3dBSYmEWoRSS9XdrO+55Q2ch7oPKc=; b=ErklN3dOjXQst33z5tRRUtdMVO
	Lp2K0gB0xEq5qJF0BmtTMpFZzKKh8OSNkvU2fxWQIfixKCPYAmKSS8se04T+SeYmregmFuIbiO9Mt
	dc5gBPIHiqCEgxNd0uupJV0FoWeQT15nIW2FG2s/AsXU0I8mKNxEQ7xuNeOH4+/kKgrtbmaXpJ4zb
	BqVl/zQcVntEwzzneJQZUJPC7pmLeIOznFH+mWY+X8JUPdByzeDETl+rFmnxJuURrNvj+AVuqUaAg
	wnwSwk6Hos5xvxnQBNMTCoEodwGnDs6i+1brkbxwYnF1pRcwL7vi/AKiHvsz95tG94Z+v0JASkIdB
	uJUi1z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqVZt-006lXj-Qt; Tue, 08 Jun 2021 06:51:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqVZn-006lV4-HA
 for linux-mtd@lists.infradead.org; Tue, 08 Jun 2021 06:51:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623135065; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=n87uwvqbLJztRaQiw/G8q/CEOFnnS1bJEZqwQkh7Nbw=;
 b=boqtzbmNcsZYZoVpiEUVdyphQITIj8tC3kwy0TN8qii/UhY4nzDL/L3x8cQJQDye/Gt5YU1T
 JignQowu7esP6XXEdlfdGbWnldkUPkKztiuF4v/okcK7744cUJlKgVWPhIkYnhBkKi7yYsKN
 +HDbXyLt99qPwNWvOBMgkpvNw5U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60bf1341abfd22a3dc97be21 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 06:50:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2368BC433F1; Tue,  8 Jun 2021 06:50:41 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A9D16C433D3;
 Tue,  8 Jun 2021 06:50:40 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 12:20:40 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH V3] mtd: rawnand: qcom: avoid writing to obsolete register
In-Reply-To: <20210607115041.21e21e19@xps13>
References: <1623059017-5058-1-git-send-email-mdalam@codeaurora.org>
 <20210607115041.21e21e19@xps13>
Message-ID: <f30e4b983e92dd474a208039bcfdf0ad@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_235105_171184_0F3CD274 
X-CRM114-Status: GOOD (  17.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wNi0wNyAxNToyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBN
ZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1vbiwgIDcgSnVu
IDIwMjEKPiAxNToxMzozNyArMDUzMDoKPiAKPj4gUVBJQ19FQkkyX0VDQ19CVUZfQ0ZHIHJlZ2lz
dGVyIGdvdCBvYnNvbGV0ZSBmcm9tIFFQSUMgVjIuMCBvbndhcmRzLgo+PiBBdm9pZCB3cml0aW5n
IHRoaXMgcmVnaXN0ZXIgaWYgUVBJQyB2ZXJzaW9uIGlzIFYyLjAgb3IgbmV3ZXIuCj4+IAo+PiBB
bHNvIGZpeGVkIG5hbmRjIHVuZGVjbGFyZWQgaXNzdWUgcmVwb3J0ZWQgYnksCj4+IAo+PiBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gCj4gVGhpcyB0YWcg
c2hvdWxkIG9ubHkgYmUgYWRkZWQgd2hlbiB5b3UgZml4IHNvbWV0aGluZyB0aGF0IGlzIGFscmVh
ZHkgaW4KPiBtYWlubGluZS4gVGhlIFJlcG9ydGVkLWJ5IGhlcmUgcG9pbnRzIHRvIHYyLCB3aGlj
aCBtYWtlcyBubyBzZW5zZS4KPiBQbGVhc2UgZHJvcCBpdC4KCiAgdXBkYXRlZCB0aGlzIFY0IHBh
dGNoLgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9y
YS5vcmc+Cj4+IC0tLQo+PiBbVjNdCj4+ICAqIEZpeGVkIG5hbmRjIHVuZGVjbGFyZWQgaXNzdWUu
Cj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAxOCArKysrKysrKysrKyst
LS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+PiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyAK
Pj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4gaW5kZXggYTY0ZmI2Yy4u
ZWU1OTg1ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+PiBAQCAtNzM0LDYg
KzczNCw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yd19yZWdzKHN0cnVjdCBxY29tX25hbmRfaG9z
dCAKPj4gKmhvc3QsIGludCBudW1fY3csIGJvb2wgcmVhZCwgaQo+PiAgewo+PiAgCXN0cnVjdCBu
YW5kX2NoaXAgKmNoaXAgPSAmaG9zdC0+Y2hpcDsKPj4gIAl1MzIgY21kLCBjZmcwLCBjZmcxLCBl
Y2NfYmNoX2NmZzsKPj4gKwlzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjID0gZ2V0
X3Fjb21fbmFuZF9jb250cm9sbGVyKGNoaXApOwo+PiAKPj4gIAlpZiAocmVhZCkgewo+PiAgCQlp
ZiAoaG9zdC0+dXNlX2VjYykKPj4gQEAgLTc2Miw3ICs3NjMsOCBAQCBzdGF0aWMgdm9pZCB1cGRh
dGVfcndfcmVncyhzdHJ1Y3QgcWNvbV9uYW5kX2hvc3QgCj4+ICpob3N0LCBpbnQgbnVtX2N3LCBi
b29sIHJlYWQsIGkKPj4gIAluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfREVWMF9DRkcwLCBjZmcw
KTsKPj4gIAluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfREVWMF9DRkcxLCBjZmcxKTsKPj4gIAlu
YW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfREVWMF9FQ0NfQ0ZHLCBlY2NfYmNoX2NmZyk7Cj4+IC0J
bmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIGhvc3QtPmVjY19idWZf
Y2ZnKTsKPj4gKwlpZiAoIW5hbmRjLT5wcm9wcy0+cXBpY192MikKPj4gKwkJbmFuZGNfc2V0X3Jl
ZyhjaGlwLCBOQU5EX0VCSTJfRUNDX0JVRl9DRkcsIGhvc3QtPmVjY19idWZfY2ZnKTsKPj4gIAlu
YW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfRkxBU0hfU1RBVFVTLCBob3N0LT5jbHJmbGFzaHN0YXR1
cyk7Cj4+ICAJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX1JFQURfU1RBVFVTLCBob3N0LT5jbHJy
ZWFkc3RhdHVzKTsKPj4gIAluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfRVhFQ19DTUQsIDEpOwo+
PiBAQCAtMTEzMyw3ICsxMTM1LDggQEAgc3RhdGljIHZvaWQgY29uZmlnX25hbmRfcGFnZV9yZWFk
KHN0cnVjdCAKPj4gbmFuZF9jaGlwICpjaGlwKQo+PiAKPj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRj
LCBOQU5EX0FERFIwLCAyLCAwKTsKPj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVjBf
Q0ZHMCwgMywgMCk7Cj4+IC0Jd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9FQkkyX0VDQ19CVUZf
Q0ZHLCAxLCAwKTsKPj4gKwlpZiAoIW5hbmRjLT5wcm9wcy0+cXBpY192MikKPj4gKwkJd3JpdGVf
cmVnX2RtYShuYW5kYywgTkFORF9FQkkyX0VDQ19CVUZfQ0ZHLCAxLCAwKTsKPj4gIAl3cml0ZV9y
ZWdfZG1hKG5hbmRjLCBOQU5EX0VSQVNFRF9DV19ERVRFQ1RfQ0ZHLCAxLCAwKTsKPj4gIAl3cml0
ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0VSQVNFRF9DV19ERVRFQ1RfQ0ZHLCAxLAo+PiAgCQkgICAg
ICBOQU5EX0VSQVNFRF9DV19TRVQgfCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+IEBAIC0xMTkxLDgg
KzExOTQsOSBAQCBzdGF0aWMgdm9pZCBjb25maWdfbmFuZF9wYWdlX3dyaXRlKHN0cnVjdCAKPj4g
bmFuZF9jaGlwICpjaGlwKQo+PiAKPj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0FERFIw
LCAyLCAwKTsKPj4gIAl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVjBfQ0ZHMCwgMywgMCk7
Cj4+IC0Jd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9FQkkyX0VDQ19CVUZfQ0ZHLCAxLAo+PiAt
CQkgICAgICBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+ICsJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNf
djIpCj4+ICsJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfRUJJMl9FQ0NfQlVGX0NGRywgMSwK
Pj4gKwkJCSAgICAgIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4gIH0KPj4gCj4+ICAvKgo+PiBAQCAt
MTI0OCw3ICsxMjUyLDggQEAgc3RhdGljIGludCBuYW5kY19wYXJhbShzdHJ1Y3QgcWNvbV9uYW5k
X2hvc3QgCj4+ICpob3N0KQo+PiAgCQkJCQl8IDIgPDwgV1JfUkRfQlNZX0dBUAo+PiAgCQkJCQl8
IDAgPDwgV0lERV9GTEFTSAo+PiAgCQkJCQl8IDEgPDwgREVWMF9DRkcxX0VDQ19ESVNBQkxFKTsK
Pj4gLQluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfRUJJMl9FQ0NfQlVGX0NGRywgMSA8PCAKPj4g
RUNDX0NGR19FQ0NfRElTQUJMRSk7Cj4+ICsJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNfdjIpCj4+
ICsJCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9FQkkyX0VDQ19CVUZfQ0ZHLCAxIDw8IAo+PiBF
Q0NfQ0ZHX0VDQ19ESVNBQkxFKTsKPj4gCj4+ICAJLyogY29uZmlndXJlIENNRDEgYW5kIFZMRCBm
b3IgT05GSSBwYXJhbSBwcm9iaW5nIGluIFFQSUMgdjEgKi8KPj4gIAlpZiAoIW5hbmRjLT5wcm9w
cy0+cXBpY192Mikgewo+PiBAQCAtMjY4OSw3ICsyNjk0LDggQEAgc3RhdGljIGludCBxY29tX25h
bmRfYXR0YWNoX2NoaXAoc3RydWN0IAo+PiBuYW5kX2NoaXAgKmNoaXApCj4+ICAJCQkJfCBlY2Nf
bW9kZSA8PCBFQ0NfTU9ERQo+PiAgCQkJCXwgaG9zdC0+ZWNjX2J5dGVzX2h3IDw8IEVDQ19QQVJJ
VFlfU0laRV9CWVRFU19CQ0g7Cj4+IAo+PiAtCWhvc3QtPmVjY19idWZfY2ZnID0gMHgyMDMgPDwg
TlVNX1NURVBTOwo+PiArCWlmICghbmFuZGMtPnByb3BzLT5xcGljX3YyKQo+PiArCQlob3N0LT5l
Y2NfYnVmX2NmZyA9IDB4MjAzIDw8IE5VTV9TVEVQUzsKPj4gCj4+ICAJaG9zdC0+Y2xyZmxhc2hz
dGF0dXMgPSBGU19SRUFEWV9CU1lfTjsKPj4gIAlob3N0LT5jbHJyZWFkc3RhdHVzID0gMHhjMDsK
PiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
