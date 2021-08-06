Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12257C4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:30:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A391260ED6
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 18:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A391260ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5/Zk22e3/8/0ZnRZeTyPtzO/mhHEg1dbr4bSA7cZ5g=; b=CZ4Ew/GuohPOpt
	hPOB0amZRfHR2sC0t++2rEtfJ7i8SttZzDOjWql8Zujf1Q5F4iKkxgI3O69Fupo8cGMyuFLpxQSrq
	LMdBjTNsq4AY68cfXgPVQIu9HMo0l1g1AT9sSwBp+ZAB8IcWbPfW25qqsyufottY9NRoLMVRsRdOa
	rr/fca1y4R78UXM8v7Ox7OdrP4o3nY4hPho7AyD3elE1xvibqd59WfuVOfzZAaThiuWTAfiLbO/NT
	+QV4yteKcluWkc1JYUosJ1GQQXLE2Vi8DBEMoZCUrq3u7kEVVCggPxlmrX1QCixQ+s0GhGpjK+1VD
	E+O+xYInusZckS4GkA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC4bs-00D95p-Tb; Fri, 06 Aug 2021 18:30:20 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC4bq-00D95N-27
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 18:30:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id BD8EB100002;
 Fri,  6 Aug 2021 18:30:14 +0000 (UTC)
Date: Fri, 6 Aug 2021 20:30:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 03/13] mtd: spinand: Setup spi_mem_op for the SPI IO
 protocol using reg_proto
Message-ID: <20210806203013.30a41fd5@xps13>
In-Reply-To: <20210713130538.646-4-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-4-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_113018_283199_D0B65A20 
X-CRM114-Status: GOOD (  11.96  )
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
IDEzIEp1bCAyMDIxIDEzOjA1OjI4CiswMDAwOgoKPiBDdXJyZW50bHksIHRoZSBvcCBtYWNyb3Mg
aW4gc3BpbmFuZC5oIGRvbid0IGdpdmUgdGhlIG9wdGlvbiB0byBzZXR1cAo+IGFueSBub24tYXJy
YXkgYWNjZXNzIGluc3RydWN0aW9ucyBmb3IgRHVhbC9RdWFkL09jdGFsIERUUiBTUEkgYnVzLgo+
IEhhdmluZyBhIGZ1bmN0aW9uIHRoYXQgc2V0dXBzIHRoZSBvcCBiYXNlZCBvbiByZWdfcHJvdG8g
d291bGQgYmUKPiBiZXR0ZXIgdGhhbiB0cnlpbmcgdG8gd3JpdGUgYWxsIHRoZSBzZXR1cCBsb2dp
YyBpbiBvcCBtYWNyb3MuCj4gCj4gQ3JlYXRlIGEgc3BpbWVtX3NldHVwX29wKCkgdGhhdCB3b3Vs
ZCBzZXR1cCBjbWQsIGFkZHIsIGR1bW15IGFuZCBkYXRhCj4gcGhhc2Ugb2YgdGhlIHNwaV9tZW0g
b3AsIGZvciB0aGUgZ2l2ZW4gc3BpbmFuZC0+cmVnX3Byb3RvLiBBbmQgaGVuY2UsCj4gY2FsbCB0
aGUgc3BpbWVtX3NldHVwX29wKCkgYmVmb3JlIGV4ZWN1dGluZyBhbnkgc3BpX21lbSBvcC4KPiAK
PiBOb3RlOiBJbiB0aGlzIGNvbW1pdCwgc3BpbWVtX3NldHVwX29wKCkgaXNuJ3QgY2FsbGVkIGlu
IHRoZQo+IHJlYWRfcmVnX29wKCksIHdyaXRlX3JlZ19vcCgpIGFuZCB3YWl0KCkgZnVuY3Rpb25z
LCBhcyB0aGV5IG5lZWQKPiBtb2RpZmljYXRpb25zIGluIGFkZHJlc3MgdmFsdWUgYW5kIGRhdGEg
bmJ5dGVzIHdoZW4gaW4gT2N0YWwgRFRSIG1vZGUuCj4gVGhpcyB3aWxsIGJlIGZpeGVkIGluIGEg
bGF0ZXIgY29tbWl0LgoKVGhhbmtzIGZvciB0aGlzIHNlcmllcyEKClNvIGZhciBJIGFtIGZpbmUg
d2l0aCB5b3VyIGNoYW5nZXMsIGJ1dCBJIGRvbid0IGxpa2UgdGhlIHNldHVwX29wKCkKbmFtaW5n
IG11Y2guIEkgZG9uJ3QgeWV0IGhhdmUgYSBiZXR0ZXIgaWRlYSwgY291bGQgeW91IHByb3Bvc2UK
c29tZXRoaW5nIG1vcmUgbWVhbmluZ2Z1bD8KCj4gU2lnbmVkLW9mZi1ieTogQXB1cnZhIE5hbmRh
biA8YS1uYW5kYW5AdGkuY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
