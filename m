Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1660AC43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 10:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAFE205ED
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 10:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYz96VGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBAFE205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NV9gx81Bd3dswnWHoafh3eX0PU6PD4jegkMLGIgTcg=; b=DYz96VGGLq9RNq
	RoNMRPpIm+jwTsCJgKserSxMimHjSlWhCLd3CMiWPbekrkzaEeDzB4aV7DQIW9PerpHCcQvmNx+g1
	wA6d92QDMMN82o2cjX+71o+aUHrXMEsLiscl9T/uoO2GaGEB1LJ8r/e0qvVxkROmEWBxTQLtC3k2Z
	lsPKrISrUWXj+i1XSCMEInb8+7UsiZjBlt2mIqdq6LcgcmVfuzAYr/jRUQs0OCIaEwO/zrudi1+i3
	0aHKC7DRtLfsCDi5iBP7aETOwx67zvos5eL2N2RQYBGbzyjfltPhWy33Qxp4GUBVLan5fnXu4rvEV
	QUerG/ph5Q2igUI0umEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ignKD-00054d-HP; Mon, 16 Dec 2019 10:10:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ignK9-00053d-T0
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 10:09:59 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D9EAE20001D;
 Mon, 16 Dec 2019 10:09:48 +0000 (UTC)
Date: Mon, 16 Dec 2019 11:09:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vasyl Gomonovych <gomonovych@gmail.com>
Subject: Re: [PATCH] git commit --signoff -m "mtd: cadence: Fix cast to
 pointer from integer of different size warning
Message-ID: <20191216110947.6fb2423a@xps13>
In-Reply-To: <20191214210946.29922-1-gomonovych@gmail.com>
References: <20191214210946.29922-1-gomonovych@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_020958_076103_12FEE6E2 
X-CRM114-Status: GOOD (  13.09  )
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
 linux-kernel@vger.kernel.org, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmFzeWwsCgpWYXN5bCBHb21vbm92eWNoIDxnb21vbm92eWNoQGdtYWlsLmNvbT4gd3JvdGUg
b24gU2F0LCAxNCBEZWMgMjAxOQoyMjowOTo0NSArMDEwMDoKCj4gVXNlIGEgY2FzdCB0byB1aW50
cHRyX3QgYW5kIG5leHQgdG8gYSBwb2ludGVyCj4gSW4gdGhlIGZpbmFsIGFzc2lnbm1lbnQgdGhl
IHNhbWUgY2FzdGluZyBpbiBwbGFjZQo+IG1lbW9yeV9wb2ludGVyID0gKHVpbnRwdHJfdCltZW1f
cHRyOwo+IEZpeCB3YXJuaW5nOiBjYXN0IHRvIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIG9mIGRpZmZl
cmVudCBzaXplCgpJdCBzZWVtcyBsaWtlIHlvdSdyZSAnZ2l0IHNlbmQnIHNjcmlwdCBpcyBtZXNz
eSA6KSAoc2VlIHRoZSB0aXRsZSkuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZhc3lsIEdvbW9ub3Z5
Y2ggPGdvbW9ub3Z5Y2hAZ21haWwuY29tPgo+IC0tLQo+IFRoaXMgY29tbWl0IGZpeGVzIGEgbWlu
b3IgaXNzdWUgd2l0aCBhIHdhcm5pbmcKPiBOb3Qgc3VyZSBpZiB3ZSB3aWxsIGhhdmUgcHJvYmxl
bSBoZXJlIGluIGNhc2Ugb2YKPiBkbWFfYWRkcl90IHdoaWNoIGNhbiBiZSA2NC1iaXQgd2lkZSBv
biAzMi1iaXQgYXJjaAoKV2h5IG5vdCBtYW5pcHVsYXRpbmcgZG1hX2FkZHJfdCBldmVyeXdoZXJl
IGluc3RlYWQ/Cgo+IAo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQt
Y29udHJvbGxlci5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Nh
ZGVuY2UtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5h
bmQtY29udHJvbGxlci5jCj4gaW5kZXggM2EzNjI4NWE4ZDhhLi45NjBjM2EwYmU2OWMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMKPiBA
QCAtMTI4MCw4ICsxMjgwLDggQEAgY2FkZW5jZV9uYW5kX2NkbWFfdHJhbnNmZXIoc3RydWN0IGNk
bnNfbmFuZF9jdHJsICpjZG5zX2N0cmwsIHU4IGNoaXBfbnIsCj4gIAl9Cj4gIAo+ICAJY2FkZW5j
ZV9uYW5kX2NkbWFfZGVzY19wcmVwYXJlKGNkbnNfY3RybCwgY2hpcF9uciwgcGFnZSwKPiAtCQkJ
CSAgICAgICAodm9pZCAqKWRtYV9idWYsICh2b2lkICopZG1hX2N0cmxfZGF0LAo+IC0JCQkJICAg
ICAgIGN0eXBlKTsKPiArCQkJCSAgICAgICAodm9pZCAqKSh1aW50cHRyX3QpZG1hX2J1ZiwKPiAr
CQkJCSAgICAgICAodm9pZCAqKSh1aW50cHRyX3QpZG1hX2N0cmxfZGF0LCBjdHlwZSk7Cj4gIAo+
ICAJc3RhdHVzID0gY2FkZW5jZV9uYW5kX2NkbWFfc2VuZF9hbmRfd2FpdChjZG5zX2N0cmwsIHRo
cmVhZF9ucik7Cj4gIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
