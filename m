Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F557C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 23:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30025206DA
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 23:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9YI6V9h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30025206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzUr3bozWmkNcA1ElUGNVgwlcTi28EYX1QRiKzEOGsE=; b=h9YI6V9hCNHgre
	mSoh5rv9LBEHWyR45XbLjFtIXiO7NGJnmK6a2Aw+eQPrB+6Kq4az2aGPOQ5FN8x4wWAzRHjBBw91H
	XESCsL4loxDsr0569v1uIKskILVLMLG4qyNrvYV2EIC3rg5PUMVf33XfY/fjvgdGOi7GMwWdsCEGh
	zy3NG6UJsTyfZqTGBacdsC0ikc1NcIbhcQ1vTl/SLhgXHb8HoV/JMZniDRmBNUgKsqfAyh8yybk+0
	uXo7qcFCo+dASTjS91Rsy3TQn/s/v1NQFN8RqTKDE4RxAusbxjlZ0lHVLM8jAPVTHJJ0bXEspY6bE
	rn64qkBu5PLaaWm6rV6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipL60-0008RS-H6; Wed, 08 Jan 2020 23:50:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipL5w-00084I-PA
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 23:50:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 93A916088971;
 Thu,  9 Jan 2020 00:50:35 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gdyLshkT9wEh; Thu,  9 Jan 2020 00:50:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DC7626088973;
 Thu,  9 Jan 2020 00:50:33 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Qq_ie6w3oA8L; Thu,  9 Jan 2020 00:50:33 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id BB2F96088971;
 Thu,  9 Jan 2020 00:50:33 +0100 (CET)
Date: Thu, 9 Jan 2020 00:50:33 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <21178102.16973.1578527433685.JavaMail.zimbra@nod.at>
In-Reply-To: <20191230165129.11925-9-miquel.raynal@bootlin.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
 <20191230165129.11925-9-miquel.raynal@bootlin.com>
Subject: Re: [PATCH 8/8] ubi: Relax the 'no MLC' rule and allow MLCs
 operating in SLC mode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: Relax the 'no MLC' rule and allow MLCs operating in SLC mode
Thread-Index: L5TrnikyX9ZbBethLmHlczmwZ/q3ug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_155037_132722_E9F316FE 
X-CRM114-Status: GOOD (  11.91  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0
PiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LCAiVHVkb3IgQW1iYXJ1
cyIgPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4sCj4gImxpbnV4LW10ZCIgPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+LCAiVGhvbWFzIFBldGF6em9uaSIgPHRob21hcy5wZXRhenpv
bmlAYm9vdGxpbi5jb20+LCAiQm9yaXMKPiBCcmV6aWxsb24iIDxib3Jpcy5icmV6aWxsb25AYm9v
dGxpbi5jb20+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4g
R2VzZW5kZXQ6IE1vbnRhZywgMzAuIERlemVtYmVyIDIwMTkgMTc6NTE6MjkKPiBCZXRyZWZmOiBb
UEFUQ0ggOC84XSB1Ymk6IFJlbGF4IHRoZSAnbm8gTUxDJyBydWxlIGFuZCBhbGxvdyBNTENzIG9w
ZXJhdGluZyBpbiBTTEMgbW9kZQoKPiBGcm9tOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBib290bGluLmNvbT4KPiAKPiBUaGUgTVREIGxheWVyIHByb3ZpZGVzIGFuIFNMQyBtb2Rl
IChwdXJlbHkgc29mdHdhcmUgZW11bGF0aW9uIG9mIFNMQwo+IGJlaGF2aW9yKSBhZGRyZXNzaW5n
IHRoZSBwYWlyZWQtcGFnZXMgY29ycnVwdGlvbiBpc3N1ZSwgd2hpY2ggd2FzIHRoZQo+IG1haW4g
cmVhc29uIGZvciByZWZ1c2luZyBhdHRhY2hpbmcgTUxDIE5BTkRzIHRvIFVCSS4KPiAKPiBSZWxh
eCB0aGlzIHJ1bGUgYW5kIGFsbG93IHBhcnRpdGlvbnMgdGhhdCBoYXZlIHRoZSBNVERfTUxDX0lO
X1NMQ19NT0RFCj4gZmxhZyBzZXQgdG8gYmUgYXR0YWNoZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Qm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KPiBk
cml2ZXJzL210ZC91YmkvYnVpbGQuYyB8IDUgKysrKy0KPiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Vi
aS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCBkNjM2YmJlMjE0Y2Iu
LmQ5MTdjYzRjZDkzNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gQEAgLTg0Niw4ICs4NDYsMTEgQEAgaW50IHVi
aV9hdHRhY2hfbXRkX2RldihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHViaV9udW0sCj4gCSAq
IEJvdGggVUJJIGFuZCBVQklGUyBoYXZlIGJlZW4gZGVzaWduZWQgZm9yIFNMQyBOQU5EIGFuZCBO
T1IgZmxhc2hlcy4KPiAJICogTUxDIE5BTkQgaXMgZGlmZmVyZW50IGFuZCBuZWVkcyBzcGVjaWFs
IGNhcmUsIG90aGVyd2lzZSBVQkkgb3IgVUJJRlMKPiAJICogd2lsbCBkaWUgc29vbiBhbmQgeW91
IHdpbGwgbG9zZSBhbGwgeW91ciBkYXRhLgo+ICsJICogUmVsYXggdGhpcyBydWxlIGlmIHRoZSBw
YXJ0aXRpb24gd2UncmUgYXR0YWNoaW5nIHRvIG9wZXJhdGVzIGluIFNMQwo+ICsJICogbW9kZS4K
PiAJICovCj4gLQlpZiAobXRkLT50eXBlID09IE1URF9NTENOQU5ERkxBU0gpIHsKPiArCWlmICht
dGQtPnR5cGUgPT0gTVREX01MQ05BTkRGTEFTSCAmJgo+ICsJICAgICEobXRkLT5mbGFncyAmIE1U
RF9NTENfSU5fU0xDX01PREUpKSB7Cj4gCQlwcl9lcnIoInViaTogcmVmdXNlIGF0dGFjaGluZyBt
dGQlZCAtIE1MQyBOQU5EIGlzIG5vdCBzdXBwb3J0ZWRcbiIsCj4gCQkJbXRkLT5pbmRleCk7Cj4g
CQlyZXR1cm4gLUVJTlZBTDsKCkFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
