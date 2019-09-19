Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C0AC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 09:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74EBC218AF
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 09:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZq9Y/pa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74EBC218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eq1GkawiMSLxuEqtTXmxOiEs4nfokI9IFbPw/K2I8Vw=; b=dZq9Y/paXxKs7I
	RcI0lzMkmUPJX+69T9aLM7nSZVyD8C2PK4/7v5QDP77geYWJ1YUyNIncWQ529F1D78ije3Ag4reao
	ir50eimY0xYKkm27xyGiLPB2TkHXmoFCfMTUXnQwu/S1YG+sUZKDzhPbY1zd6Fs5/vW20bp8REh1H
	npJQVNMCjex1fRwAhgSnriKk1G8SeVKd8TXK3zbwWL0wp6eviwpQZ1wrBQ/SxnqD+kJ/ZxvtAVnMA
	gv8dFbLgQ12RZkoQqH4TZT4/I7GYkFNMM8LLW4vHLE8Rvlscu+FnURQGu5RSJFgezCetSXnabQCOy
	X9lHcjO2Z9XVmezGPHfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAsSO-0006hy-Pe; Thu, 19 Sep 2019 09:10:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAsSJ-0006gq-KK
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 09:10:29 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4FE741C0016;
 Thu, 19 Sep 2019 09:10:15 +0000 (UTC)
Date: Thu, 19 Sep 2019 11:10:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource()
 in stfsm_probe()
Message-ID: <20190919111014.6c569cf3@xps13>
In-Reply-To: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_021027_819786_DF703A00 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Armijn Hemel <armijn@tjaldur.nl>,
 linux-mtd@lists.infradead.org, Himanshu Jha <himanshujha199640@gmail.com>,
 Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFya3VzLAoKTWFya3VzIEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGUg
b24gV2VkLCAxOCBTZXAgMjAxOQoxNDo1MDoyNyArMDIwMDoKCj4gRnJvbTogTWFya3VzIEVsZnJp
bmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+IERhdGU6IFdlZCwgMTggU2VwIDIw
MTkgMTQ6Mzc6MzQgKzAyMDAKPiAKPiBTaW1wbGlmeSB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0
aW9uIGJ5IHVzaW5nIGEga25vd24gd3JhcHBlciBmdW5jdGlvbi4KPiAKPiBUaGlzIGlzc3VlIHdh
cyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4g
LS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIHwgOCArLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIvZHJpdmVycy9tdGQvZGV2
aWNlcy9zdF9zcGlfZnNtLmMKPiBpbmRleCBmNGQxNjY3ZGFhZjkuLjViZDFjNDRhZTUyOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4gQEAgLTIwMzQsMTMgKzIwMzQsNyBAQCBzdGF0
aWMgaW50IHN0ZnNtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gCj4gIAlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBmc20pOwo+IAo+IC0JcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiAtCWlmICghcmVzKSB7Cj4gLQkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiUmVzb3VyY2Ugbm90IGZvdW5kXG4iKTsKPiAtCQlyZXR1cm4g
LUVOT0RFVjsKPiAtCX0KPiAtCj4gLQlmc20tPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2Uo
JnBkZXYtPmRldiwgcmVzKTsKPiArCWZzbS0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZShwZGV2LCAwKTsKPiAgCWlmIChJU19FUlIoZnNtLT5iYXNlKSkgewo+ICAJCWRldl9l
cnIoJnBkZXYtPmRldiwKPiAgCQkJIkZhaWxlZCB0byByZXNlcnZlIG1lbW9yeSByZWdpb24gJXBS
XG4iLCByZXMpOwo+IC0tCj4gMi4yMy4wCj4gCgoKSXMgdGhpcyBldmVuIGNvbXBpbGVkIHRlc3Rl
ZD8gJ3JlcycgaXMgbm90IGluaXRpYWxpemVkIGFueW1vcmUgc28geW91CmNhbid0IHVzZSBpdCBp
biB0aGUgZXJyb3IgdHJhY2UuIEkgc3VwcG9zZSB5b3Ugc2hvdWxkIGV2ZW4gZHJvcCBpdCBmcm9t
CnRoZSBzdGFjayBwYXJhbWV0ZXJzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
