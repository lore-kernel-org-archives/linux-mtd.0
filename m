Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8EEC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 08:38:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C719860230
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 08:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C719860230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uqe9Ek7swHAiGYC2RsXcK8ctkHMKJ6FHUgfbZVaDCBM=; b=0AB6BAubNLXZvd8nxkXxF+CaX
	L5DeOxdOcnKrK5zKyn8juDNtGRyfwyzTSaCd0ww0a+oTVg1lthsZeVKF0itXhJQPOLY3OP1kKXKgp
	8z4mXz2C32rLeI7KwzDI5x58CajfPEcoShQfv6DPVH88JXUQ0yoZ2tgBt71yb3xgAVeGfrcKB9+Tl
	6f93JFRZ5xjflqhX2V/WTe0iETdcgPgAP9c/gjukuHRkgerwvluvs3M6KbWIz4wykJF5yFFd/v3mE
	KS1HCfmhxjCh+8XrgbofUJT5dUlXFkIoAwbP0vcjbHRLO1yovgWY5yxLVOMnPEnQPJrB+4w/iAJ4P
	dTM9bChlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBZNh-0004OQ-J0; Mon, 15 Feb 2021 08:37:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBZNe-0004O3-JY
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 08:37:19 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=puma.localnet)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1lBZNb-0000lv-9m; Mon, 15 Feb 2021 09:37:15 +0100
From: =?ISO-8859-1?Q?J=FCrgen?= Borleis <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] fs: ubifs: set s_uuid in super block to support ima/evm
 uuid options
Date: Mon, 15 Feb 2021 09:37:11 +0100
Message-ID: <11692601.O9o76ZdvQC@puma>
Organization: Pengutronix e. K.
In-Reply-To: <CAFLxGvw=5uK0AHmMq5vqOWiBzS68TBd-vU3G9mpWeTXeO5B47A@mail.gmail.com>
References: <20210202124838.30805-1-jbe@pengutronix.de>
 <CAFLxGvw=5uK0AHmMq5vqOWiBzS68TBd-vU3G9mpWeTXeO5B47A@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: jbe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_033718_670816_7CA32BD0 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKCkFtIEZyZWl0YWcsIDEyLiBGZWJydWFyIDIwMjEsIDIxOjU5OjUyIENFVCBz
Y2hyaWViIFJpY2hhcmQgV2VpbmJlcmdlcjoKPiBPbiBUdWUsIEZlYiAyLCAyMDIxIGF0IDE6NTUg
UE0gSnVlcmdlbiBCb3JsZWlzIDxqYmVAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gRnJvbTog
U3RlZmZlbiBUcnVtdHJhciA8cy50cnVtdHJhckBwZW5ndXRyb25peC5kZT4KPiA+IAo+ID4gVGhp
cyBpcyByZXF1aXJlZCB0byBwcm92aWRlIHV1aWQgYmFzZWQgaW50ZWdyaXR5IGZ1bmN0aW9uYWxp
dHkgZm9yOgo+ID4gaW1hX3BvbGljeSAoZnN1dWlkIG9wdGlvbikgYW5kIHRoZSAnZXZtY3RsJyBj
b21tYW5kICgnLS11dWlkJyBvcHRpb24pLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmZmVu
IFRydW10cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPgo+ID4gU2lnbmVkLW9mZi1ieTog
T2xla3NpaiBSZW1wZWwgPG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlPgo+ID4gQWNrZWQtYnk6IEp1
ZXJnZW4gQm9ybGVpcyA8amJlQHBlbmd1dHJvbml4LmRlPgo+IAo+IEkgdG9vayB0aGlzIHBhdGNo
LCB0aGFua3MgYSBsb3QgZm9yIHRoaXMgYnV0IEkgaGF2ZSBjaGFuZ2VkIHRoZSBzb2ItY2hhaW4K
PiB0bzoKPiAKPiAgICAgQ28tZGV2ZWxvcGVkLWJ5OiBPbGVrc2lqIFJlbXBlbCA8by5yZW1wZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gICAgIENvLWRldmVsb3BlZC1ieTogSnVlcmdlbiBCb3JsZWlzIDxq
YmVAcGVuZ3V0cm9uaXguZGU+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IFN0ZWZmZW4gVHJ1bXRyYXIg
PHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gTmFtZWx5LCAicGF0Y2ggd2FzIGNyZWF0
ZWQgYnkgU3RlZmZlbiBUcnVtdHJhciwgT2xla3NpaiBSZW1wZWwgYW5kCj4gSnVlcmdlbiBCb3Js
ZWlzLgo+IFN0ZWZmZW4gVHJ1bXRyYXIgY29tbWl0dGVkIGl0IGFuZCBKdWVyZ2VuIEJvcmxlaXMg
bGF0ZXIgc2VudCBpdCB0byB0aGUKPiBtYWlsaW5nIGxpc3QiLgo+IAo+IElzIHRoaXMgcmlnaHQ/
CgpZZXMuCgo+IE9rYXkuIEkndmUgZHJvcHBlZCB0aGUgcGF0Y2ggZnJvbSBsaW51eC1uZXh0Lgo+
IEp1ZXJnZW4sIHBsZWFzZSBhZGRyZXNzIEFuZHkncyBjb21tZW50cyBhbmQgcmVzZW5kLgoKSSB3
aWxsIHRhbGsgdG8gU3RlZmZlbiBhbmQgcmUtc2VuZCBhIFYyLgoKVGhhbmtzLApKw7xyZ2VuCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
