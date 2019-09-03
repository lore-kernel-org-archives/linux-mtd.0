Return-Path: <SRS0=qtYn=W6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCBFC3A59E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2019 02:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBD121897
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2019 02:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OSgRjwvv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DBD121897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcFBKXu7HYr7iSDjT7jhQghQf6FGPlC74Ka1cvjtB3I=; b=OSgRjwvvTa2FonBU3dMPZTmvD
	UqxB1t3TIcnFHtCD7bmq4TI4yfv5+g/bf1z47GrYjEIEyw/3nM6i7WcPrX901+uZTy7t/y5PoaAgZ
	lcMgXqhbjVqhe30vsLs+yHk9qGyQfSsOgRLYU5ZCNv3+Vyk26ExHtv9+B6uoexKZfhuXQt64yt2sm
	0jzDVQhLQ8M3MImQ2CWQOtXD3PPtkURRkoho/piHlm55Blb5fWM5bUmZbUQi67WBIoYPAlvO9nyQj
	k1Xw/uZAuB1YTodF93doJNtpUBLm4xKknEpYldJqo+hYro/t67CZJ9G6hhbqBWhrJfOYk+OpnkYAg
	VCJ8pbULg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4yAZ-0001QA-GA; Tue, 03 Sep 2019 02:03:43 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4yAU-0001PK-KM
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2019 02:03:39 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 19:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,461,1559545200"; d="scan'208";a="198669637"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2019 19:03:32 -0700
Received: from [10.226.38.16] (vramuthx-mobl1.gar.corp.intel.com
 [10.226.38.16])
 by linux.intel.com (Postfix) with ESMTP id D6FDA58040E;
 Mon,  2 Sep 2019 19:03:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: cadence-qspi:add support for
 Intel lgm-qspi
To: Rob Herring <robh@kernel.org>
References: <20190827035827.21024-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190827035827.21024-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <5d6d1b85.1c69fb81.96938.0315@mx.google.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <c2f2dd6f-9553-c9c0-94bf-200684c5597b@linux.intel.com>
Date: Tue, 3 Sep 2019 10:03:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d6d1b85.1c69fb81.96938.0315@mx.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_190338_682748_8FA9138D 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, vigneshr@ti.com, boris.brezillon@free-electrons.com,
 richard@nod.at, qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com, andriy.shevchenko@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKIMKgVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IGFuZCBBY2tlZC1ieS4KCk9uIDIv
OS8yMDE5IDk6MzkgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFR1ZSwgMjcgQXVnIDIwMTkg
MTE6NTg6MjUgKzA4MDAsICJSYW11dGhldmFyLFZhZGl2ZWwgTXVydWdhblgiICAgICAgICAgIHdy
b3RlOgo+PiBGcm9tOiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2Fu
eC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4KPj4gQWRkIG5ldyB2ZW5kb3Igc3BlY2lm
aWMgY29tcGF0aWJsZSBzdHJpbmcgdG8gY2hlY2sgSW50ZWwncyBMaWdodG5pbmcKPj4gTW91bnRh
aW4oTEdNKSBRU1BJIGZlYXR1cmVzIGVuYWJsZW1lbnQgaW4gY2FkZW5jZS1xdWFkc3BpIGRyaXZl
ci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFtdXRoZXZhciBWYWRpdmVsIE11cnVnYW4gPHZhZGl2
ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiAgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY2FkZW5jZS1xdWFkc3BpLnR4dCB8IDEg
Kwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+IEFja2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQWNrZWQtYnkgdGFnIHdpbGwgYmUgdXBkYXRlZCBp
biBuZXh0IHBhdGNoLXNldC4KCkJlc3QgUmVnYXJkcwpWYWRpdmVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
