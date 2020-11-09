Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85315C4741F
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 08:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A682084C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 08:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VuslZdBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A682084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUfZg6zNrRS4+IV6eB3pVpF90WKkaHQHvPPIuePSAdY=; b=VuslZdBsaT4PWRaCL+Z4tfL+M
	ejHa3fki0Lc/bWWn3JbLgCNgp70aeBkeUqETrDAq2O0EH2e5pqwQ/qAQHB6plMxtXvhMb8ErNnbwk
	/oMyh4MIh9lYyyGhIJW4uuH2eie3vjY6/YbJfWJ0/c9TaAgyxz2Fm3d7O1t5u4iLpmQldyXcNHFOS
	NAd4ERkjcBJ+ghnFM6DSrilXRjrGZ5nfpnOFLcgdg3t52m9xgdt3IsPo2fKlWogrrM9Ps2ljvxMek
	fxq/Ehrd//6rmCoZ2j18yusAgp+JQHyhL9bEY6RTpkK4/w8rBXdEdoyYONplTxQavtHtLE8eALTQY
	1aMPmaq3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc2YA-0006Jq-Ht; Mon, 09 Nov 2020 08:29:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc2Y7-0006Ih-TM
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 08:29:17 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3DCAD6000C;
 Mon,  9 Nov 2020 08:28:57 +0000 (UTC)
Date: Mon, 9 Nov 2020 09:28:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 00/23] Rid W=1 warnings in MTD
Message-ID: <20201109092855.495174dc@xps13>
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_032916_260337_1B0437BC 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sergey Lapin <slapin@ossfans.org>, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Choudary Kalluri <punnaia@xilinx.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Sumit Semwal <sumit.semwal@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Dan Brown <dan_brown@ieee.org>, linux-samsung-soc@vger.kernel.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Gleixner <gleixner@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Dmitriy B <rzk333@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jochen =?UTF-8?B?U2Now6R1Ymxl?= <psionic@psionic.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Nicolas Pitre <nico@fluxnic.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 Jian Zhang <jzhang@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gRnJpLCAg
NiBOb3YgMjAyMCAyMTozNjozMgorMDAwMDoKCj4gVGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdl
ciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11cCBXPTEKPiBrZXJuZWwgYnVpbGRzLCB3aGlj
aCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRsZWQgd2l0aAo+IG5pZ2dseSBsaXR0
bGUgd2FybmluZ3MuCj4gCj4gdjEgPT4gdjI6Cj4gICAtIEFkZGVkIHRhZ3MKPiAgIC0gU2F0aXNm
aWVkIE1pcXVlbCdzIHJldmlldyBjb21tZW50cwo+IAoKWW91IHByb2JhYmx5IG1pc3NlZCBteSBy
ZXF1ZXN0IHRvIHVwZGF0ZSB0aGUgdGl0bGVzLiBUaGF0J3Mgd2h5IEkKd2FudGVkIHRoZSBlbnRp
cmUgc2VyaWVzIHRvIGJlIHJlc2VudC4gQW55d2F5LCBhcyBJIGZvcmdvdCBhIGZldywKcGxlYXNl
IGZpbmQgYmVsb3cgdGhlIHByZWZpeGVzIHRoYXQgc2hvdWxkIGJlIHVzZWQ6Cgo+IExlZSBKb25l
cyAoMjMpOgo+ICAgbXRkOiBtdGRwYXJ0OiBGaXggbWlzZG9jdW1lbnRlZCBmdW5jdGlvbiBwYXJh
bWV0ZXIgJ210ZCcKPiAgIG10ZDogZGV2aWNlczogcGhyYW06IEZpbGUgaGVhZGVycyBhcmUgbm90
IGdvb2QgY2FuZGlkYXRlcyBmb3IKPiAgICAga2VybmVsLWRvYwo+ICAgbXRkOiBuYW5kOiBvbmVu
YW5kOiBvbmVuYW5kX2Jhc2U6IEZpeCBleHBlY3RlZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKCm10
ZDogb25lbmFuZDogRml4Li4uCgo+ICAgbXRkOiBkZXZpY2VzOiBkb2NnMzogRml4IGtlcm5lbC1k
b2MgJ2JhZCBsaW5lJyBhbmQgJ2V4Y2Vzc2l2ZSBkb2MnCj4gICAgIGlzc3Vlcwo+ICAgbXRkOiBt
dGRjb3JlOiBGaXggbWlzc3BlbGxlZCBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3NlY3Rpb24nCgptdGQ6
IEZpeC4uLgoKPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYnQ6IEZpeCBleHBlY3Rl
ZCBrZXJuZWwtZG9jIGZvcm1hdHRpbmcKCm10ZDogb25lbmFuZDogRml4Li4uCgo+ICAgbXRkOiBz
cGktbm9yOiBjb250cm9sbGVyczogaGlzaS1zZmM6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJu
ZWwtZG9jCgptdGQ6IHNwaS1ub3I6IGhpc2ktc2ZjOiBEZW1vdGUuLi4KCj4gICBtdGQ6IHViaTog
YnVpbGQ6IERvY3VtZW50ICd1YmlfbnVtJyBpbiBzdHJ1Y3QgbXRkX2Rldl9wYXJhbQo+ICAgbXRk
OiBuYW5kOiBzcGk6IHRvc2hpYmE6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhl
YWRlcgoKbXRkOiBzcGluYW5kOiB0b3NoaWJhOiBEZW1vdGUuLi4KCj4gICBtdGQ6IHViaToga2Fw
aTogQ29ycmVjdCBkb2N1bWVudGF0aW9uIGZvciAndWJpX2xlYl9yZWFkX3NnJ3MgJ3NnbCcKPiAg
ICAgcGFyYW1ldGVyCj4gICBtdGQ6IHViaTogZWJhOiBGaXggYSBjb3VwbGUgb2YgbWlzZG9jdW1l
bnRhdGlvbiBpc3N1ZXMKPiAgIG10ZDogdWJpOiB3bDogRml4IGEgY291cGxlIG9mIGtlcm5lbC1k
b2MgaXNzdWVzCj4gICBtdGQ6IG5hbmQ6IHJhdzogYnJjbW5hbmQ6IGJyY21uYW5kOiBEZW1vdGUg
bm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwo+ICAgICBoZWFkZXJzCgptdGQ6IHJhd25hbmQ6IGJy
Y21uYW5kOiBEZW1vdGUuLi4KCj4gICBtdGQ6IHViaTogZ2x1ZWJpOiBGaXggbWlzbmFtZWQgZnVu
Y3Rpb24gcGFyYW1ldGVyIGRvY3VtZW50YXRpb24KPiAgIG10ZDogbmFuZDogcmF3OiBkaXNrb25j
aGlwOiBNYXJraW5nIHVudXNlZCB2YXJpYWJsZXMgYXMKPiAgICAgX19hbHdheXNfdW51c2VkCgpt
dGQ6IHJhd25hbmQ6IGRpc2tvbmNoaXA6IE1hcmtpbmcuLi4KCj4gICBtdGQ6IG5hbmQ6IHJhdzog
Y2FmZV9uYW5kOiBSZW1vdmUgc3VwZXJmbHVvdXMgcGFyYW0gZG9jIGFuZCBhZGQKPiAgICAgYW5v
dGhlcgoKbXRkOiByYXduYW5kOiBjYWZlOiBSZW1vdmUKCj4gICBtdGQ6IG5hbmQ6IHJhdzogczNj
MjQxMDogQWRkIGRvY3VtZW50YXRpb24gZm9yIDIgbWlzc2luZyBzdHJ1Y3QKPiAgICAgbWVtYmVy
cwoKbXRkOiByYXduYW5kOiBzM2MyNDEwOiBBZGQuLi4KCj4gICBtdGQ6IG5hbmQ6IHJhdzogb21h
cF9lbG06IEZpbmlzaCBoYWxmIHBvcHVsYXRlZCBmdW5jdGlvbiBoZWFkZXIsCj4gICAgIGRlbW90
ZSBlbXB0eSBvbmVzCgptdGQ6IHJhd25hbmQ6IG9tYXBfZWxtOiBGaW5pc2gKCj4gICBtdGQ6IG5h
bmQ6IHJhdzogb21hcDI6IEZpeCBhIGJ1bmNoIG9mIGtlcm5lbC1kb2MgbWlzZGVtZWFub3VycwoK
bXRkOnIgcmF3bmFuZDogb21hcDI6IEZpeAoKPiAgIG10ZDogbmFuZDogcmF3OiBzdW54aV9uYW5k
OiBEb2N1bWVudCAnc3VueGlfbmZjJ3MgJ2NhcHMnIG1lbWJlcgoKbXRkOiByYXduYW5kOiBzdW54
aTogRG9jdW1lbnQKCj4gICBtdGQ6IG5hbmQ6IHJhdzogYXJhc2FuLW5hbmQtY29udHJvbGxlcjog
RG9jdW1lbnQgJ2FuZmNfb3AncyAnYnVmJwo+ICAgICBtZW1iZXIKCm10ZDogcmF3bmFuZDogYXJh
c2FuOiBEb2N1bWVudAoKPiAgIG10ZDogbmFuZDogb25lbmFuZDogb25lbmFuZF9iYXNlOiBGaXgg
c29tZSBrZXJuZWwtZG9jIG1pc2RlbWVhbm91cnMKCm10ZDogb25lbmFuZDogRml4Cgo+ICAgbXRk
OiBkZXZpY2VzOiBwb3dlcm52X2ZsYXNoOiBBZGQgZnVuY3Rpb24gbmFtZXMgdG8gaGVhZGVycyBh
bmQgZml4Cj4gICAgICdkZXYnCgpPdGhlcndpc2UgdGhlIGNvbnRlbnQgb2YgdGhlIHNlcmllcyBs
b29rcyBnb29kIHRvIG1lLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
