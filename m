Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DCEC43461
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 09:23:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00502078D
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 09:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmoSMD9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00502078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yJlbsGFRyVGYwN1JYUbiQ1ThR3J9CY9+5rq1qP4Coi0=; b=LmoSMD9Ko80JM6MAJIhdtCYHj
	bx1fnaJ5lUsjgsUTW6BXtqiLyCWVrAhSFlRvLzLGQENMKkgtgpcuuP6wO5NKRq+smgIeLijz/Z2nW
	rMnvFAAF09jqqghgKnHmdkipC8g+CgLklPFA3thpQBqe1grXeaeaWnnm3idzba0Jx/65D+wnZwbFC
	F7B9W2YlTQshtfVncFs4HG9fwsPAmHhoiKND47vnTeJtuQ8eMQyhd7QuX6g3pSovTzkW2O23VrlaI
	H3HHNlUbaTsi21evnS9oz7Jx8OJEYlg+Ke1kIkRIF43JacyL5HopYb3RW4qPsZ5z7tf+m7BjkyPiG
	xqUXfpFKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI7BN-0006bZ-8j; Tue, 15 Sep 2020 09:23:25 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI7BI-0006aT-S1; Tue, 15 Sep 2020 09:23:21 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0895B2000C;
 Tue, 15 Sep 2020 09:23:16 +0000 (UTC)
Date: Tue, 15 Sep 2020 11:23:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v8 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
Message-ID: <20200915112315.310d89c8@xps13>
In-Reply-To: <20200915100728.5c866f89@xps13>
References: <20200717092420.19798-1-yifeng.zhao@rock-chips.com>
 <20200717092420.19798-3-yifeng.zhao@rock-chips.com>
 <20200915100728.5c866f89@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_052321_050212_7506DE3D 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFR1ZSwg
MTUgU2VwIDIwMjAKMTA6MDc6MjggKzAyMDA6Cgo+IEhpIFlpZmVuZywKPiAKPiBJIGFtIHZlcnkg
c29ycnkgZm9yIHRoZSBkZWxheSBpdCB0b29rIG1lIHRvIHJldmlldyB0aGlzIGRyaXZlciwgYnV0
Cj4gdGhlcmUgYXJlIHN0aWxsIHNvbWUgc21hbGwgaW5jb2hlcmVuY2VzIElNSE8sIHNlZSBiZWxv
dy4KCk9uZSBsYXN0IGltcG9ydGFudCBjb21tZW50IGJlbG93Cgo+ID4gK3N0YXRpYyBpbnQgcmtf
bmZjX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiArewo+ID4gKwlzdHJ1
Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+ID4gKwlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBtdGQtPmRldi5wYXJlbnQ7Cj4gPiArCXN0cnVjdCBya19uZmMgKm5mYyA9IG5hbmRf
Z2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKPiA+ICsJc3RydWN0IHJrX25mY19uYW5kX2NoaXAg
KnJrbmFuZCA9IHRvX3JrbmFuZChjaGlwKTsKPiA+ICsJc3RydWN0IG5hbmRfZWNjX2N0cmwgKmVj
YyA9ICZjaGlwLT5lY2M7Cj4gPiArCWludCBsZW47Cj4gPiArCWludCByZXQ7Cj4gPiArCj4gPiAr
CWlmIChjaGlwLT5vcHRpb25zICYgTkFORF9CVVNXSURUSF8xNikgewo+ID4gKwkJZGV2X2Vycihk
ZXYsICIxNiBiaXRzIGJ1cyB3aWR0aCBub3Qgc3VwcG9ydGVkIik7Cj4gPiArCQlyZXR1cm4gLUVJ
TlZBTDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlpZiAoZWNjLT5tb2RlICE9IE5BTkRfRUNDX0hXKQo+
ID4gKwkJcmV0dXJuIDA7Cj4gPiArCj4gPiArCXJldCA9IHJrX25mY19lY2NfaW5pdChkZXYsIG10
ZCk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlyZXR1cm4gcmV0Owo+ID4gKwlya25hbmQtPnNwYXJl
X3Blcl9zZWN0b3IgPSBlY2MtPmJ5dGVzICsgTkZDX1NZU19EQVRBX1NJWkU7Cj4gPiArCXJrbmFu
ZC0+bWV0YWRhdGFfc2l6ZSA9IE5GQ19TWVNfREFUQV9TSVpFICogZWNjLT5zdGVwczsKPiA+ICsK
PiA+ICsJaWYgKHJrbmFuZC0+bWV0YWRhdGFfc2l6ZSA8IE5GQ19TWVNfREFUQV9TSVpFICsgMikg
ewo+ID4gKwkJZGV2X2VycihkZXYsCj4gPiArCQkJIkRyaXZlciBuZWVkcyBhdCBsZWFzdCAlZCBi
eXRlcyBvZiBtZXRhIGRhdGFcbiIsCj4gPiArCQkJTkZDX1NZU19EQVRBX1NJWkUgKyAyKTsKPiA+
ICsJCXJldHVybiAtRUlPOwo+ID4gKwl9Cj4gPiArCS8qIENoZWNrIGJ1ZmZlciBmaXJzdCwgYXZv
aWQgZHVwbGljYXRlIGFsbG9jIGJ1ZmZlci4gKi8KPiA+ICsJaWYgKG5mYy0+YnVmZmVyKQo+ID4g
KwkJcmV0dXJuIDA7ICAKPiAKPiBZb3UgY2FuJ3QgZG8gdGhhdCB0aGlzIHdheTogd2hhdCBpZiB0
aGUgZmlyc3QgbXRkIHRvIGJlIHJlZ2lzdGVyZWQgdXNlcwo+IGEgc21hbGxlciBwYWdlIHNpemUg
dGhhbiB0aGUgc2Vjb25kPwo+IAo+ID4gKwo+ID4gKwlsZW4gPSBtdGQtPndyaXRlc2l6ZSArIG10
ZC0+b29ic2l6ZTsKPiA+ICsJbmZjLT5idWZmZXIgPSBkZXZtX2t6YWxsb2MoZGV2LCBsZW4sIEdG
UF9LRVJORUwgfCBHRlBfRE1BKTsKCkkgZG9uJ3QgdGhpbmsgdGhpcyBmaXRzIHlvdXIgcHVycG9z
ZS4gWW91IHNob3VsZCBwcm9iYWJseSBhbGxvY2F0ZSB3aXRoCmt6YWxsb2Mgb3IgcGVyaGFwcyBk
bWFfYWxsb2MqLgoKVGhlbiwgeW91J2xsIGFsc28gaGF2ZSB0byBmcmVlIHRoaXMgbWVtb3J5LgoK
PiA+ICsJaWYgKCFuZmMtPmJ1ZmZlcikKPiA+ICsJCXJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4g
KwluZmMtPnBhZ2VfYnVmID0gbmZjLT5idWZmZXI7Cj4gPiArCWxlbiA9IGVjYy0+c3RlcHMgKiBO
RkNfTUFYX09PQl9QRVJfU1RFUDsKPiA+ICsJbmZjLT5vb2JfYnVmID0gZGV2bV9remFsbG9jKGRl
diwgbGVuLCBHRlBfS0VSTkVMIHwgR0ZQX0RNQSk7Cj4gPiArCWlmICghbmZjLT5vb2JfYnVmKSB7
Cj4gPiArCQluZmMtPmJ1ZmZlciA9IE5VTEw7Cj4gPiArCQluZmMtPm9vYl9idWYgPSBOVUxMOyAg
Cj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIG5lZWRlZAo+IAo+ID4gKwkJcmV0dXJuIC1FTk9N
RU07Cj4gPiArCX0KPiA+ICsKPiA+ICsJY2hpcC0+ZWNjLndyaXRlX3BhZ2VfcmF3ID0gcmtfbmZj
X3dyaXRlX3BhZ2VfcmF3Owo+ID4gKwljaGlwLT5lY2Mud3JpdGVfcGFnZSA9IHJrX25mY193cml0
ZV9wYWdlX2h3ZWNjOwo+ID4gKwljaGlwLT5lY2Mud3JpdGVfb29iX3JhdyA9IHJrX25mY193cml0
ZV9vb2Jfc3RkOwo+ID4gKwljaGlwLT5lY2Mud3JpdGVfb29iID0gcmtfbmZjX3dyaXRlX29vYl9z
dGQ7Cj4gPiArCj4gPiArCWNoaXAtPmVjYy5yZWFkX3BhZ2VfcmF3ID0gcmtfbmZjX3JlYWRfcGFn
ZV9yYXc7Cj4gPiArCWNoaXAtPmVjYy5yZWFkX3BhZ2UgPSBya19uZmNfcmVhZF9wYWdlX2h3ZWNj
Owo+ID4gKwljaGlwLT5lY2MucmVhZF9vb2JfcmF3ID0gcmtfbmZjX3JlYWRfb29iX3N0ZDsKPiA+
ICsJY2hpcC0+ZWNjLnJlYWRfb29iID0gcmtfbmZjX3JlYWRfb29iX3N0ZDsgIAo+IAo+IEkgZG9u
J3QgbGlrZSB0aGUgX3N0ZCBwcmVmaXgsIGJ1dCBpdCBzaG91bGQgYmUgZ29uZSB3aGVuIHNwbGl0
dGluZyB0aGUKPiBmdW5jdGlvbnMgYXMgYWR2aXNlZC4KPiAKPiA+ICsKPiA+ICsJcmV0dXJuIDA7
Cj4gPiArfQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
