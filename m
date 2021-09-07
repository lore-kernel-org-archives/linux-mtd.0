Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8340C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 06:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F591610FF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 06:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F591610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKi72MxtIOIIAAhcCXpJmP70fxQ7c/imEnkpXjtFNdw=; b=VmJ35L4+OMs4f5
	fRS6m7e3L0cSWF+2SZmSyZxr5+z2bi3T6+0uYklv+vyhXPWdfs2wM1ceg8GgUe0EMfzko185Gd9Pg
	dSJDjju9zoGSDr7VLHQgnKKz+JtKgLRImcKbuqUTJOr9QNHpWhPBNPyetza0nssJgsb5qzsLhxsjY
	yAGnGJp9J8cvsXi4i+KFm6TzAADYMN/5KJawyFQIWsO01ZOxCvv6X+WNfpQhPdaCl3IT/kP14pu3x
	1ighNnisLkOnZuoK5P0f+8JjB61d9IljUiXc4EvtGITPaZEVEnm8piYk8nnyoZlNL0cSOYmAqX23Z
	+ptaHhF0LgsszSmFz0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNUud-002bE4-3u; Tue, 07 Sep 2021 06:48:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNUuZ-002bDk-AP
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 06:48:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D7FCF60007;
 Tue,  7 Sep 2021 06:48:45 +0000 (UTC)
Date: Tue, 7 Sep 2021 08:48:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V5] mtd: rawnand: qcom: Update code word value for raw read
Message-ID: <20210907084844.1ad92ef1@xps13>
In-Reply-To: <1630996771-29866-1-git-send-email-mdalam@codeaurora.org>
References: <1630996771-29866-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_234851_541930_93E0C7D8 
X-CRM114-Status: GOOD (  19.24  )
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

Cm1kYWxhbUBjb2RlYXVyb3JhLm9yZyB3cm90ZSBvbiBUdWUsICA3IFNlcCAyMDIxIDEyOjA5OjMx
ICswNTMwOgoKPiBGcm9tIFFQSUMgVjIgb253YXJkcyB0aGVyZSBpcyBhIHNlcGFyYXRlIHJlZ2lz
dGVyIHRvIHJlYWQKPiBsYXN0IGNvZGUgd29yZCAiUVBJQ19OQU5EX1JFQURfTE9DQVRJT05fTEFT
VF9DV19uIi4KPiAKPiBxY29tX25hbmRjX3JlYWRfY3dfcmF3KCkgaXMgdXNlZCB0byByZWFkIG9u
bHkgb25lIGNvZGUgd29yZAo+IGF0IGEgdGltZS4gSWYgd2Ugd2lsbCBjb25maWd1cmUgbnVtYmVy
IG9mIGNvZGUgd29yZHMgdG8gMSBpbgo+IGluIFFQSUNfTkFORF9ERVYwX0NGRzAgcmVnaXN0ZXIg
dGhlbiBRUElDIGNvbnRyb2xsZXIgdGhpbmtzCj4gaXRzIHJlYWRpbmcgdGhlIGxhc3QgY29kZSB3
b3JkLCBzaW5jZSBmcm9tIFFQSUMgVjIgb253YXJkcwo+IHdlIGFyZSBoYXZpbmcgc2VwYXJhdGUg
cmVnaXN0ZXIgdG8gcmVhZCB0aGUgbGFzdCBjb2RlIHdvcmQsCj4gd2UgaGF2ZSB0byBjb25maWd1
cmUgIlFQSUNfTkFORF9SRUFEX0xPQ0FUSU9OX0xBU1RfQ1dfbiIKPiByZWdpc3RlciB0byBmZXRj
aCBkYXRhIGZyb20gY29udHJvbGxlciBidWZmZXIgdG8gc3lzdGVtCj4gbWVtb3J5Lgo+IAo+IEZp
eGVzOiA1MDNlZTVhYWQ0MzA1NGEyNmNmZDVjYzU5MmEzMTI3MGMwNTUzOWNkICgibXRkOiByYXdu
YW5kOiBxY29tOiB1cGRhdGUgbGFzdCBjb2RlIHdvcmQgcmVnaXN0ZXIiKQoKU3RpbGwgd3Jvbmcu
IEl0J3MgMTIgZGlnaXRzLCBhcyByZXBvcnRlZCBieSBNYW5pdmFubmFuLgoKPiBDYzogc3RhYmxl
QGtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1
cm9yYS5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiBWNToKPiAKPiAgKiBJbmNvcnBvcmF0ZWQgImhh
c2ggY29tbWl0IiBjb21tZW50IGZyb20gTWFuaS4KPiAgKiBVcGRhdGVkIGNvbW1pdCBoYXNoCj4g
Cj4gQ2hhbmdlcyBpbiBWNDoKPiAKPiAgKiBJbmNvcnBvcmF0ZWQgIkNoYW5nZSBsb2ciIGNvbW1l
bnQgZnJvbSBNaXF1w6hsCj4gICogVXBkYXRlZCBjaGFuZ2UgbG9nCj4gCj4gQ2hhbmdlcyBpbiBW
MzoKPiAgCj4gICogSW5jb3Jwb3JhdGVkICJGaXhlcyB0YWdzIGFyZSBtaXNzaW5nIiBjb21tZW50
IGZyb20gTWlxdcOobAo+ICAqIEFkZGVkIEZpeGVzIHRhZyBGaXhlczo1MDNlZTVhYSAoIm10ZDog
cmF3bmFuZDogcWNvbTogdXBkYXRlIGxhc3QgY29kZSB3b3JkIHJlZ2lzdGVyIikKPiAKPiAKPiBD
aGFuZ2VzIGluIFYyOgo+IAo+ICAqIEluY29ycG9yYXRlZCAic3RhYmxlIHRhZ3MgYXJlIG1pc3Np
bmciIGNvbW1lbnQgZnJvbSBNaXF1w6hsCj4gICogQWRkZWQgc3RhYmxlIHRhZ3MgQ2M6c3RhYmxl
QGtlcm5lbC5vcmcKPiAKPiAgIAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IGVmMGJhZGUu
LjA0ZTZmN2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTE2NzYsMTMg
KzE2NzYsMTcgQEAgcWNvbV9uYW5kY19yZWFkX2N3X3JhdyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCXN0cnVjdCBuYW5kX2VjY19jdHJsICplY2MgPSAm
Y2hpcC0+ZWNjOwo+ICAJaW50IGRhdGFfc2l6ZTEsIGRhdGFfc2l6ZTIsIG9vYl9zaXplMSwgb29i
X3NpemUyOwo+ICAJaW50IHJldCwgcmVnX29mZiA9IEZMQVNIX0JVRl9BQ0MsIHJlYWRfbG9jID0g
MDsKPiArCWludCByYXdfY3cgPSBjdzsKPiAgCj4gIAluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBw
YWdlLCAwLCBOVUxMLCAwKTsKPiAgCWhvc3QtPnVzZV9lY2MgPSBmYWxzZTsKPiAgCj4gKwlpZiAo
bmFuZGMtPnByb3BzLT5xcGljX3YyKQo+ICsJCXJhd19jdyA9IGVjYy0+c3RlcHMgLSAxOwo+ICsK
PiAgCWNsZWFyX2JhbV90cmFuc2FjdGlvbihuYW5kYyk7Cj4gIAlzZXRfYWRkcmVzcyhob3N0LCBo
b3N0LT5jd19zaXplICogY3csIHBhZ2UpOwo+IC0JdXBkYXRlX3J3X3JlZ3MoaG9zdCwgMSwgdHJ1
ZSwgY3cpOwo+ICsJdXBkYXRlX3J3X3JlZ3MoaG9zdCwgMSwgdHJ1ZSwgcmF3X2N3KTsKPiAgCWNv
bmZpZ19uYW5kX3BhZ2VfcmVhZChjaGlwKTsKPiAgCj4gIAlkYXRhX3NpemUxID0gbXRkLT53cml0
ZXNpemUgLSBob3N0LT5jd19zaXplICogKGVjYy0+c3RlcHMgLSAxKTsKPiBAQCAtMTcxMSw3ICsx
NzE1LDcgQEAgcWNvbV9uYW5kY19yZWFkX2N3X3JhdyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgCQluYW5kY19zZXRfcmVhZF9sb2MoY2hpcCwgY3csIDMs
IHJlYWRfbG9jLCBvb2Jfc2l6ZTIsIDEpOwo+ICAJfQo+ICAKPiAtCWNvbmZpZ19uYW5kX2N3X3Jl
YWQoY2hpcCwgZmFsc2UsIGN3KTsKPiArCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwgZmFsc2Us
IHJhd19jdyk7Cj4gIAo+ICAJcmVhZF9kYXRhX2RtYShuYW5kYywgcmVnX29mZiwgZGF0YV9idWYs
IGRhdGFfc2l6ZTEsIDApOwo+ICAJcmVnX29mZiArPSBkYXRhX3NpemUxOwoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
