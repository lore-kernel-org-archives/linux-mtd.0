Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE85C33CAE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 08:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50B22075B
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 08:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2p/u/rr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50B22075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PORuEW8jn7vc2IxNrhEc57+6VX6w6eyyIvNI9Eyi9VE=; b=O2p/u/rrDC3HJs
	GGbFpKwMvDc31xC89oyiE5Y02LoPzhZ4MUwhU0laW6qlrP9EregIJ94m6n26A5sFejdg4zRo75xdl
	u4RSyhLb21awVbqabwQqpYEJ7b7LOeh8iF4lTvdG+QhG/LJUoSn7xOy6wNvgqiYdhJnSZoEGBUFnT
	ZHeNTYfRtKhC+lju90sHLV51f0ezPEqZgzziMYi84E5QGWd8XEYyg1vpRsicC68uadCaS/ol+z5YO
	pqF1+8x7cl3XfNqQdRqVmmzRhs4EuuiMilSPcyCbMFDlcyNrI0kV5T1y2fY+cnk0ZRzmToCj0uF8D
	cGad5bvWB7uXkJoS50dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqusq-0000Aw-JN; Mon, 13 Jan 2020 08:15:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqusf-0008TD-Pi; Mon, 13 Jan 2020 08:15:27 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1ED34100013;
 Mon, 13 Jan 2020 08:15:16 +0000 (UTC)
Date: Mon, 13 Jan 2020 09:15:15 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] mtd: onenand: Enable compile testing of OMAP and
 Samsung drivers
Message-ID: <20200113091515.4404dbb6@xps13>
In-Reply-To: <20200113074632.GA1187@pi3>
References: <20191229183612.22133-3-krzk@kernel.org>
 <201912310904.9iM6MaFr%lkp@intel.com> <20191231073339.GA6747@pi3>
 <20200109161826.7fda02a4@xps13> <20200113074632.GA1187@pi3>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_001525_973235_C9B00888 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: linux-samsung-soc@vger.kernel.org, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90
ZSBvbiBNb24sIDEzIEphbiAyMDIwCjA4OjQ2OjMyICswMTAwOgoKPiBPbiBUaHUsIEphbiAwOSwg
MjAyMCBhdCAwNDoxODoyNlBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgS3J6
eXN6dG9mLAo+ID4gCj4gPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdy
b3RlIG9uIFR1ZSwgMzEgRGVjIDIwMTkKPiA+IDA4OjMzOjM5ICswMTAwOgo+ID4gICAKPiA+ID4g
T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMTA6MDA6NDhBTSArMDgwMCwga2J1aWxkIHRlc3Qgcm9i
b3Qgd3JvdGU6ICAKPiA+ID4gPiBIaSBLcnp5c3p0b2YsCj4gPiA+ID4gCj4gPiA+ID4gSSBsb3Zl
IHlvdXIgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5nIHRvIGltcHJvdmU6Cj4gPiA+ID4gCj4gPiA+
ID4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGxpbnVzL21hc3Rlcl0KPiA+ID4gPiBbYWxz
byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gdjUuNS1yYzQgbmV4dC0yMDE5MTIyMF0KPiA+ID4gPiBb
aWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRy
b3AgdXMgYSBub3RlIHRvIGhlbHAKPiA+ID4gPiBpbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2Ug
YWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPiA+ID4g
PiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNlZSBodHRwczovL3N0YWNr
b3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCj4gPiA+ID4gCj4gPiA+ID4gdXJsOiAgICBodHRwczov
L2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0tyenlzenRvZi1Lb3psb3dza2kvbXRk
LW9uZW5hbmQtc2Ftc3VuZy1GaXgtcG9pbnRlci1jYXN0LVdwb2ludGVyLXRvLWludC1jYXN0LXdh
cm5pbmdzLW9uLTY0LWJpdC8yMDE5MTIzMC0wMzA4MzgKPiA+ID4gPiBiYXNlOiAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dCBiZjhkMWNkNDM4NjUzNTAwNGM0YWZlN2YwM2QzN2Y5ODY0Yzk5NDBlCj4gPiA+ID4gcmVwcm9k
dWNlOgo+ID4gPiA+ICAgICAgICAgIyBhcHQtZ2V0IGluc3RhbGwgc3BhcnNlCj4gPiA+ID4gICAg
ICAgICAjIHNwYXJzZSB2ZXJzaW9uOiB2MC42LjEtMTI5LWczNDFkYWYyMC1kaXJ0eQo+ID4gPiA+
ICAgICAgICAgbWFrZSBBUkNIPXg4Nl82NCBhbGxtb2Rjb25maWcKPiA+ID4gPiAgICAgICAgIG1h
a2UgQz0xIENGPSctZmRpYWdub3N0aWMtcHJlZml4IC1EX19DSEVDS19FTkRJQU5fXycKPiA+ID4g
PiAKPiA+ID4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFn
Cj4gPiA+ID4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
ID4gPiA+ICAgICAKPiA+ID4gCj4gPiA+IEl0IGlzIG5vdCByZWxhdGVkIHRvIG15IHBhdGNoLiBJ
J2xsIGZpeCBpdCB1cCBzb29uLiAgCj4gPiAKPiA+IEkgd291bGQgbGlrZSB0aGlzIHRvIGJlIGZp
eGVkIGJlZm9yZSBlbmFibGluZyBjb21waWxlIHRlc3RpbmcsIGlzIHlvdXIKPiA+IGZpeCByZWFk
PyAgCj4gCj4gWWVzLCB5b3UgcGlja2VkIHVwIHRoZSBmaXggaGVyZToKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9sa21sLzIwMjAwMTAzMTY0MTU4LjQyNjUtMS1rcnprQGtlcm5lbC5vcmcvCgpQ
ZXJmZWN0LCBJIGRpZCBub3QgZXZlbiBsaW5rZWQgdGhlc2UgaXNzdWVzIHRvZ2V0aGVyLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
