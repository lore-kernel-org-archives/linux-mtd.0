Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04136C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 07:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1EB2068E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 07:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWRmh9WF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF1EB2068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dc8Xpu/lsIihTtRq98jbLVjQnHVBfddwOJJJ7VMKKc4=; b=IWRmh9WF6c3OmY
	iD7qk6tw0E6QBmRf8ET9TaUR4cOb/uAjKlpR6QpcQWC0BnyRsv/ykXA4TIg+UoQHHKXuhxvNHo3cW
	rJXXif3ZiHesBnIA7WemoMHGWNacnvM9Co8JHVclnNLdIC2chLvax85kUc/tTLieNy7ix06orkCxF
	B64AukjcUhCtz6yU4H7nUaHnaLkg4O0zTUlYaCk8nnlpxChSrUvdhDwhmTjjPuIygYVbwE7BVmYkp
	vC7vwQQ3jOKAAN2RKuDeVymJAo6pdvv3h9xj9/UdxTj1IHWv5ybQcSAj6ErSHVK0Ubp8iD9gNNnYf
	oZcrO3nNkSZm5oNYe/Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkjUI-0004wa-0W; Mon, 15 Jun 2020 07:24:58 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjUE-0004uZ-C5
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 07:24:55 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 470A3200014;
 Mon, 15 Jun 2020 07:24:44 +0000 (UTC)
Date: Mon, 15 Jun 2020 09:24:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aditya Pakki <pakki001@umn.edu>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix reference count leak due to
 pm_runtime_get_sync
Message-ID: <20200615092443.1e76169d@xps13>
In-Reply-To: <20200614034300.130385-1-pakki001@umn.edu>
References: <20200614034300.130385-1-pakki001@umn.edu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_002454_547007_5F681D7C 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 wu000273@umn.edu, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRpdHlhLAoKQWRpdHlhIFBha2tpIDxwYWtraTAwMUB1bW4uZWR1PiB3cm90ZSBvbiBTYXQs
IDEzIEp1biAyMDIwIDIyOjQzOjAwCi0wNTAwOgoKPiBPbiBjYWxsaW5nIHBtX3J1bnRpbWVfZ2V0
X3N5bmMoKSB0aGUgcmVmZXJlbmNlIGNvdW50IG9mIHRoZSBkZXZpY2UKPiBpcyBpbmNyZW1lbnRl
ZC4gSW4gY2FzZSBvZiBmYWlsdXJlLCBkZWNyZW1lbnQgdGhlCj4gcmVmZXJlbmNlIGNvdW50IGJl
Zm9yZSByZXR1cm5pbmcgdGhlIGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkaXR5YSBQYWtr
aSA8cGFra2kwMDFAdW1uLmVkdT4KCk1pc3NpbmcgRml4ZXMvU3RhYmxlIHRhZ3MgaGVyZSBJIGd1
ZXNzPwoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5j
IHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQv
Z3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMK
PiBpbmRleCAwNjFhOGRkZGEyNzUuLjY1N2MwYmU1YzAzOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKPiBAQCAtMTQ5LDggKzE0OSwxMCBAQCBzdGF0
aWMgaW50IGdwbWlfaW5pdChzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gIAlpbnQgcmV0
Owo+ICAKPiAgCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmModGhpcy0+ZGV2KTsKPiAtCWlmIChy
ZXQgPCAwKQo+ICsJaWYgKHJldCA8IDApIHsKPiArCQlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVu
ZCh0aGlzLT5kZXYpOwo+ICAJCXJldHVybiByZXQ7Cj4gKwl9Cj4gIAo+ICAJcmV0ID0gZ3BtaV9y
ZXNldF9ibG9jayhyLT5ncG1pX3JlZ3MsIGZhbHNlKTsKPiAgCWlmIChyZXQpCj4gQEAgLTIyNjQs
OCArMjI2NiwxMCBAQCBzdGF0aWMgaW50IGdwbWlfbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwKPiAgCQl0aGlzLT50cmFuc2ZlcnNbaV0uZGlyZWN0aW9uID0gRE1BX05PTkU7Cj4g
IAo+ICAJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyh0aGlzLT5kZXYpOwo+IC0JaWYgKHJldCA8
IDApCj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKHRo
aXMtPmRldik7Cj4gIAkJcmV0dXJuIHJldDsKPiArCX0KPiAgCj4gIAkvKgo+ICAJICogVGhpcyBk
cml2ZXIgY3VycmVudGx5IHN1cHBvcnRzIG9ubHkgb25lIE5BTkQgY2hpcC4gUGx1cywgZGllcyBz
aGFyZQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
