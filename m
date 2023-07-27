Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12730C04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTfM/rkpFKP8hH1NoItlBiVVTd2++CuPly8LbNmdyAE=; b=CfOX6BUH0qnJ1b
	a1VlQwuve6yFkHbjF/WKG9jf/4rbSJAQ4/9HoR77SJo4YIPJN0jczfC7GLQ9w/Eqv2xkz72qTQota
	NhXwQKYLykBzEpv1LiQ/3qWBQfiNr4euqp98z3U+Jy8NW7vdG06Un/GyO1CVjRnShcBfDZpCWTabK
	Yial7LtQ7i8y6dlsvY9TGhoLh+qDy6htnrE/SAiIU7znvkABZ6pGztwnG6nE91C0IIByM2TuKsqT+
	+Ge5LbbrQfWfkZWGoEI2bvDT26OXlG58UYRq0S9fSE0ki0Iji6iWuIddMtyYBvCrxQ+mrpP2oH4ht
	2vPJF9XoR7/GLPMxKppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2mr-00FnWl-19;
	Thu, 27 Jul 2023 15:20:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2mo-00FnSk-1a
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:20:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA7F1E0006;
	Thu, 27 Jul 2023 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+tYkLqI/WHrzy+gF3ZWvjwYtLENNnrtaJxq1JAle3Y=;
	b=HLUlE8oW95FKHARC7HKx6eY3PtnWvzRFtTOmg8SgLOq64ABxby+KSfWbA+NhcJUVlyiHSZ
	Vl+FJqjQvGqeRNKNMeZk16JYDW0TF3y4mAzrZvA7fRXDW8BOCJdV0b4H2/al9pS5NnAtPX
	cvWHou+1dyV3AR8zbnoiTIBrZBTrYW74jqJD8XIGJiPaINvohZ5yQaRvaLwLEKYESWgOmL
	j19gfF1nWf5alNn/8r135+OE9Jpfol33imFbIengD0pojeZRVN5H0ROnePihUCD+BLNb/w
	Myz32U2fUNjWBDqn5lJnbp38lR07GbEjrjXunsw7UgawWPFXcRhj9GPbQc8Pcg==
Date: Thu, 27 Jul 2023 17:20:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tomas Winkler
 <tomas.winkler@intel.com>, Vitaly Lubart <vitaly.lubart@intel.com>, Zhang
 Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
Message-ID: <20230727172013.7c85c05d@xps-13>
In-Reply-To: <ZMKJRNDoQV8p0DH4@smile.fi.intel.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
	<ZMKJRNDoQV8p0DH4@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_082018_669396_DC596FC6 
X-CRM114-Status: GOOD (  16.74  )
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

SGkgQW5keSwKCmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZSBvbiBUaHUs
IDI3IEp1bCAyMDIzIDE4OjEyOjA0CiswMzAwOgoKPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAw
NTo1Nzo1OFBNICswMzAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToKPiA+IEkgY2FzZSBvZiBw
YXJ0aXRpb24gZGV2aWNlX3VucmVnaXN0ZXIgaW4gbXRkX2RldmljZV9yZWxlYXNlICAKPiAKPiBJ
bgo+IAo+IGRldmljZV91bnJlZ2lzdGVyKCkKPiBtdGRfZGV2aWNlX3JlbGVhc2UoKQo+IAo+ID4g
Y2FsbHMgbXRkX3JlbGVhc2Ugd2hpY2ggZnJlZXMgbXRkX2luZm8gc3RydWN0dXJlIGZvciBwYXJ0
aXRpb24uICAKPiAKPiBtdGRfcmVsZWFzZSgpCj4gCj4gPiBBbGwgY29kZSBhZnRlciBkZXZpY2Vf
dW5yZWdpc3RlciBpbiBtdGRfZGV2aWNlX3JlbGVhc2UgdGh1cyAgCj4gCj4gZGV2aWNlX3VucmVn
aXN0ZXIoKQo+IG10ZF9kZXZpY2VfcmVsZWFzZSgpCj4gCj4gPiB3b3JrcyBhbHJlYWR5IGZyZWVk
IG1lbW9yeS4gIAo+IAo+IHVzZXM/Cj4gCj4gPiBNb3ZlIHBhcnQgb2YgY29kZSB0byBtdGRfcmVs
ZWFzZSBhbmQgcmVzdGljdCBtdGQtPmRldiBjbGVhbnVwICAKPiAKPiBtdGRfcmVsZWFzZSgpCgpZ
dXAsIHRoYW5rcyBmb3IgYWxsIHRoZXNlIHN1Z2dlc3Rpb25zLCBJIGFncmVlIHdpdGggdGhlbS4K
Cj4gPiB0byBub24tcGFydGlvbiBvYmplY3QuCj4gPiBGb3IgcGFydGl0aW9uIG9iamVjdCBzdWNo
IGNsZWFudXAgaGF2ZSBubyBzZW5zZSBhcyBwYXJ0aXRpb24KPiA+IG10ZF9pbmZvIGlzIHJlbW92
ZWQuCj4gPiAKPiA+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gQ2M6IFpoYW5nIFhpYW94dSA8emhhbmd4aWFveHU1QGh1YXdlaS5jb20+Cj4gPiBGaXhl
czogMTliZmE5ZWJlYmI1ICgibXRkOiB1c2UgcmVmY291bnQgdG8gcHJldmVudCBjb3JydXB0aW9u
IikgIAo+IAo+IENsb3NlczogPwoKRGlkIEkgbWlzcyBhIHJlY2VudCB1cGRhdGUgb24gdGhlIHVz
ZSBvZiBGaXhlcz8gSSB0aG91Z2h0IENsb3NlcyB3YXMKc3VwcG9zZWQgdG8gcG9pbnQgYXQgYSBi
dWcgcmVwb3J0IHdoaWxlIEZpeGVzIHdvdWxkIHBvaW50IHRvIHRoZSBmYXVsdHkKY29tbWl0LiBS
aWdodCBub3cgSSBmZWVsIGxpa2UgRml4ZXMgaXMgdGhlIHJpZ2h0IHRhZywgYnV0IGlmIHlvdSBo
YXZlIGEKc291cmNlIGV4cGxhaW5pbmcgd2h5IHdlIHNob3VsZCBub3QgbG9uZ2VyIGRvIGl0IGxp
a2UgSSBhbSB1c2VkIHRvLApJIHdvdWxkIGFwcHJlY2lhdGUgYSBsaW5rLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
