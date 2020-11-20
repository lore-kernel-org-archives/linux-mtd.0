Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12538C63777
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 07:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81AE4222BA
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 07:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zSAk5s79";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1mwo+EC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81AE4222BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nrc9sfU81sOSMfdAdNRGPbnT03CBXOBt3/BlaJQbH2g=; b=zSAk5s791647UgUqdccg/+cDx
	9ES4i8G3CY0FyfH+sOZMinVip0o8W2hVi9LP3f/r3z1OBSYx9j/PZnF9nL99zjxi1rNv+oU/UrOn+
	KEeUTvaxWBYyaoc/Ho3wtTI4qAyLZ5eZlnL12hzeQZehDQscsP70m8Q+iwiZpuOv0bxwbtVcG13J/
	NcpVf6xrbUkD841vCuxlW2Y1rEi7f+NxcPe/SA2MuE0I3muHLYCqAJWR8pYGrovXMU3duC846c+ur
	7M3YfMl5m1eibsRQlsbsHHiS6qWqiE9u13Pb/QmI4XUay8voOHPe7xUh5Exs9sL8QgNyuhNrOtbdD
	iyNfAaQlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg1BH-0000tE-Gm; Fri, 20 Nov 2020 07:50:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg1BE-0000sp-LT
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 07:50:05 +0000
Received: by mail-wm1-x342.google.com with SMTP id w24so8948879wmi.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2020 23:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ebx5P9t5H+MiQQTlLfM0hkZw/MTzmtdqFls14AM1z/M=;
 b=e1mwo+ECalTd3S98s5Ektjznx93/PmbMRwHlKHMiD8na32C42TLPqJljO3cb1++GrV
 XbnjjRsDxXrnJuu//pgdIiiKhC0vACcmUHFq7Fg2IkM453kGb9jhMeVMJV1hOQWPb7XG
 X2z+sg0YTSqBEmNQ5Q+SMQ2VqUq66zaSsoKEo7Yx6iSIIHR8ou3N2cOeU0luTK4Pq0A4
 TekOE63Co03VRv5c6F18ey/D3z7/3oWE5A5odAixoxpsHpkwQ3hnFwWoH4cTKZKibOqS
 g1wyVQpH2YqyNL0PovbKe9CQeiFXsekdAFfP9bdfOMeA88XQ0weuxDMsnPoctKGeX2QA
 gG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ebx5P9t5H+MiQQTlLfM0hkZw/MTzmtdqFls14AM1z/M=;
 b=Bu6tLoqiHWX1smHHT6sXjE0Nfrx+pjzzAVIAH2TMlkMd0S7jlf1Yk4CFHQPDpFPlZd
 quHKk+GTVYTAiQOKsy5fhWfDp1rRjG9fqOOJ6SMjIc5XRuuOYlZ9f872jkPkSxy/YDIq
 v5LfudFWqeAYreABw4V0eKVnTsux5R/jSCDbQFLrL2utTaRYnb1fQ87i99oO6F0GIocd
 S34Ye+8IVJwyZZkB1M7RCjMSnxdFG2zgcVYsGhSHic4Qju2NajRcRyv7nJ6qL0ZTfGn8
 w37BD1IdEl2jfrRJAbhDSHh0h4eX+/7MskXEkRTb7Mu71wy2hfAfjhDljJ6ZB5zWcnjK
 3sPw==
X-Gm-Message-State: AOAM533vJcF1g/TWCtMGeScUbOJkEazUS4YmJS1qnI1/RDvFsMU+B3SZ
 DPHz7xLYldVC/tuZ8Kkgnho98Q==
X-Google-Smtp-Source: ABdhPJx4fGTY2rHUzVNZxl2TJRKDria44u2mMJodTpI8NFP2+B0rLTwEJhgPV9+TxdAoNSy5h1Qd8A==
X-Received: by 2002:a1c:1bcb:: with SMTP id b194mr8420302wmb.139.1605858603401; 
 Thu, 19 Nov 2020 23:50:03 -0800 (PST)
Received: from dell ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id u23sm3555393wmc.32.2020.11.19.23.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 23:50:02 -0800 (PST)
Date: Fri, 20 Nov 2020 07:50:00 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 23/23] mtd: devices: powernv_flash: Add function names
 to headers and fix 'dev'
Message-ID: <20201120075000.GA1869941@dell>
References: <20201109182206.3037326-24-lee.jones@linaro.org>
 <20201119210716.25046-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119210716.25046-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_025005_036914_DFC97480 
X-CRM114-Status: GOOD (  13.97  )
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
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxOSBOb3YgMjAyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gT24gTW9uLCAyMDIw
LTExLTA5IGF0IDE4OjIyOjA2IFVUQywgTGVlIEpvbmVzIHdyb3RlOgo+ID4gRml4ZXMgdGhlIGZv
bGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gPiAKPiA+ICBkcml2ZXJzL210
ZC9kZXZpY2VzL3Bvd2VybnZfZmxhc2guYzoxMjk6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0YW5k
ICAqIEBtdGQ6IHRoZSBkZXZpY2UKPiA+ICBkcml2ZXJzL210ZC9kZXZpY2VzL3Bvd2VybnZfZmxh
c2guYzoxNDU6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0YW5kICAqIEBtdGQ6IHRoZSBkZXZpY2UK
PiA+ICBkcml2ZXJzL210ZC9kZXZpY2VzL3Bvd2VybnZfZmxhc2guYzoxNjE6IHdhcm5pbmc6IENh
bm5vdCB1bmRlcnN0YW5kICAqIEBtdGQ6IHRoZSBkZXZpY2UKPiA+ICBkcml2ZXJzL210ZC9kZXZp
Y2VzL3Bvd2VybnZfZmxhc2guYzoxODQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBt
ZW1iZXIgJ2Rldicgbm90IGRlc2NyaWJlZCBpbiAncG93ZXJudl9mbGFzaF9zZXRfZHJpdmVyX2lu
Zm8nCj4gPiAKPiA+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gPiBDYzogVmln
bmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+ID4gQ2M6IE1pY2hhZWwgRWxsZXJt
YW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiA+IENjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxi
ZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4gPiBDYzogUGF1bCBNYWNrZXJyYXMgPHBhdWx1c0Bz
YW1iYS5vcmc+Cj4gPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IENjOiBs
aW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAKPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0
aGFua3MuCgpTdXBlcnN0YXIuICBUaGFua3MgZm9yIHlvdXIgaGVscCBNaXF1ZWwuCgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2
aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
