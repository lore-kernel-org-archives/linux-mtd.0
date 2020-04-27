Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BDAC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398512064C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlB49T0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398512064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COrPiqFIP5ZIkDXxBlCYwU1H6DpshaDJXedaDbGTx5A=; b=FlB49T0SKL1xoa
	a6q7qK1p3h2J6V4Q+XyulRaW36Fmvx/qpgHG0/LVox1N6F2ic/IN5V5RDD49BJhv6C1FG7Gc0AQ0s
	0EKS3Petgq9uJvVH2UZMuEdhgKfK5xPp/x7B+a/IEtmO8YS+JLu6Is65hD/u4i2HRc74vRLggwyCr
	84LzVDd4j4QY4ssdiMOnuSojbrHkc5A1uG9/B24yDUpQFOqiiHgZsJupRMOdv8t5lO7SQgBxHQq5V
	1IkNkg1v5m7BAru9+6cmuRGN+xTLz0Y5ADYi3P35lWL4nGMwK5RHtVRNHoPE6kf3HowbALwOiuCU3
	YDw/tP4uoqiezFdzgvMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT62k-0003PK-Sq; Mon, 27 Apr 2020 15:51:38 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT62i-0003Og-14
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 15:51:37 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 43A08200005;
 Mon, 27 Apr 2020 15:51:29 +0000 (UTC)
Date: Mon, 27 Apr 2020 17:51:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200427175127.0518c193@xps13>
In-Reply-To: <20200424183612.4cfdbb6a@collabora.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_085136_202076_A091FED8 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, masonccyang@mxic.com.tw,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 devicetree@vger.kernel.org, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFtdXRoZXZhciwKCj4gPiArc3RhdGljIGludCBlYnVfbmFuZF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsKPiA+ICsJc3RydWN0IGVidV9uYW5kX2NvbnRyb2xsZXIgKmVidV9ob3N0Owo+ID4g
KwlzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kOwo+ID4gKwlwaHlzX2FkZHJfdCBuYW5kYWRkcl9wYTsK
PiA+ICsJc3RydWN0IG10ZF9pbmZvICptdGQ7Cj4gPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+
ID4gKwlpbnQgcmV0Owo+ID4gKwl1MzIgY3M7Cj4gPiArCj4gPiArCWVidV9ob3N0ID0gZGV2bV9r
emFsbG9jKGRldiwgc2l6ZW9mKCplYnVfaG9zdCksIEdGUF9LRVJORUwpOwo+ID4gKwlpZiAoIWVi
dV9ob3N0KQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArCWVidV9ob3N0LT5kZXYg
PSBkZXY7Cj4gPiArCW5hbmRfY29udHJvbGxlcl9pbml0KCZlYnVfaG9zdC0+Y29udHJvbGxlcik7
Cj4gPiArCj4gPiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9S
RVNPVVJDRV9NRU0sICJlYnVuYW5kIik7Cj4gPiArCWVidV9ob3N0LT5lYnVfYWRkciA9IGRldm1f
aW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+ID4gKwlpZiAoSVNfRVJSKGVidV9o
b3N0LT5lYnVfYWRkcikpCj4gPiArCQlyZXR1cm4gUFRSX0VSUihlYnVfaG9zdC0+ZWJ1X2FkZHIp
Owo+ID4gKwo+ID4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElP
UkVTT1VSQ0VfTUVNLCAiaHNuYW5kIik7Cj4gPiArCWVidV9ob3N0LT5uYW5kX2FkZHIgPSBkZXZt
X2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPiA+ICsJaWYgKElTX0VSUihlYnVf
aG9zdC0+bmFuZF9hZGRyKSkKPiA+ICsJCXJldHVybiBQVFJfRVJSKGVidV9ob3N0LT5uYW5kX2Fk
ZHIpOwo+ID4gKwo+ID4gKwlyZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAibmFu
ZCxjcyIsICZjcyk7ICAKPiAKPiBDUyBpZHMgc2hvdWxkIGJlIGVuY29kZWQgaW4gdGhlIHJlZyBw
cm9wZXJ0eSAoc2VlIFsxXSkuCgpJcyBpdCB5b3VyIGNob2ljZSB0byBvbmx5IHN1cHBvcnQgYSBz
aW5nbGUgQ1Mgb3IgaXMgaXQgYWN0dWFsbHkgYQpjb250cm9sbGVyIGxpbWl0YXRpb24/IElmIHRo
ZSBsYXR0ZXIsIGl0IHdvdWxkIGJlIG11Y2ggYmV0dGVyIEkgdGhpbmsKdG8gYW50aWNpcGF0ZSB0
aGUgYWRkaXRpb24gb2YgdGhlIHN1cHBvcnQgZm9yIGFub3RoZXIgQ1MuIEFuZCBpbgp0aGlzIGNh
c2UgdGhlcmUgYXJlIG1hbnkgcGxhY2VzIGluIHRoaXMgZHJpdmVyIHRoYXQgc2hvdWxkIGJlCm1v
cmUgZ2VuZXJpYy4KCj4gPiArCWlmIChyZXQpIHsKPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVk
IHRvIGdldCBjaGlwIHNlbGVjdDogJWRcbiIsIHJldCk7Cj4gPiArCQlyZXR1cm4gcmV0Owo+ID4g
Kwl9Cj4gPiArCj4gPiArCWVidV9ob3N0LT5jcyA9IGNzOwo+ID4gKwlyZXMgPSBwbGF0Zm9ybV9n
ZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAibmFuZF9jczAiKTsgIAoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
