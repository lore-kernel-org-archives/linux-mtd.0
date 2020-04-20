Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE54C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C272920CC7
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TD3Bj3aH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C272920CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3tALxzUXNxOzhN0rtt9+FMGKpL7xvf84Lav3qrzCG+o=; b=TD3Bj3aHw3yW/6Tg9IUMfwm5C
	FH1T5zVEnPrJO6Tc2t7gLsdXJAULpN1RdxkrQpoegebHzFksqCUpDjmZhIbWSx1GrnFpdxfs8I7Vt
	qZnyp6r52Z0L9ntWO6RxElxYF7sSwGpXzcY+8FXO09i0kJWD9WnDwYLY/IbA4ccxrmDPHArBKQUl9
	hlxvJhwVPgdjlpgBNdvbYSfJ6YwS5T+NrdwkveKZg/uAtidk9qWeZc87XBpHbVtUCdDarp9nUeOyG
	1XHoAPYQEAdV2mOMkqvKdHBf6jDqM+P9Y0KDzLIDFcTicvLNzav0Jyd0jKUrdRZ1p1mLeIj8o6pAA
	d9dYs3Qwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQSWY-0003uZ-Mo; Mon, 20 Apr 2020 09:15:30 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQSWS-0003oO-Eb
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 09:15:25 +0000
IronPort-SDR: 1bdJeCPzAIy/LKBTkOgRlJA2zpIEFK7QroR0JIYtfUGLqHV2RIpJ921SymFdFdKu9eFjDKWW1r
 Jlx8/OawnZjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 02:15:23 -0700
IronPort-SDR: isaKgCpWgOqEpkT9mN/xaHP6Fa/X+Nj6YLMccDHBdtzjyTO8/Hx3QWzI7ibS+5geRDhK3kscXa
 Q0+sNtjD0C5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="258285784"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 20 Apr 2020 02:15:23 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com
 [10.249.68.96])
 by linux.intel.com (Postfix) with ESMTP id 3106C580479;
 Mon, 20 Apr 2020 02:15:17 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200420102959.2659774d@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <85f510a8-59a8-0ac4-23bf-86c5c2b85a96@linux.intel.com>
Date: Mon, 20 Apr 2020 17:15:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420102959.2659774d@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_021524_511456_2EF7671A 
X-CRM114-Status: GOOD (  13.48  )
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
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at, qi-ming.wu@intel.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCiDCoMKgwqAgVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHJldmlldyBjb21t
ZW50cyBhbmQgeW91ciB0aW1lLi4uCgpPbiAyMC80LzIwMjAgNDoyOSBwbSwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+IE9uIEZyaSwgMTcgQXByIDIwMjAgMTY6MjE6NDcgKzA4MDAKPiAiUmFtdXRo
ZXZhcixWYWRpdmVsIE11cnVnYW5YIgo+IDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPgo+PiArCj4+ICsJcmVzID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCBsZ21faG9zdC0+Y3NfbmFtZSk7Cj4+ICsJbGdtX2hv
c3QtPm5hbmRhZGRyX3ZhID0gcmVzOwo+PiArCW5hbmRhZGRyX3BhID0gcmVzLT5zdGFydDsKPj4g
KwlpZiAoSVNfRVJSKGxnbV9ob3N0LT5uYW5kYWRkcl92YSkpCj4+ICsJCXJldHVybiBQVFJfRVJS
KGxnbV9ob3N0LT5uYW5kYWRkcl92YSk7Cj4gSG0sIEkgZGlkbid0IHJlYWxpemUgeW91IG5lZWRl
ZCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBmb3IgRE1BIHRyYW5zZmVycy4KPiBKdXN0IHVzZSBwbGF0
Zm9ybV9nZXRfcmVzb3VyY2VfYnlfbmFtZSgpK2Rldm1faW9yZW1hcF9yZXNvdXJjZSgpIGluCj4g
dGhhdCBjYXNlLgo+ClllcywgeW91IGFyZSByaWdodCwgbmVlZGVkIHRoZSBwaHlzaWNhbCBhZGRy
ZXNzIGZvciBETUEgdHJhbnNmZXJzLgo+PiArCj4+ICsJd3JpdGVsKExHTV9CVVNDT05fQ01VTFRf
VjQgfCBMR01fQlVTQ09OX1JFQ09WQygxKSB8Cj4+ICsJICAgICAgIExHTV9CVVNDT05fSE9MREMo
MSkgfCBMR01fQlVTQ09OX1dBSVRSREMoMikgfAo+PiArCSAgICAgICBMR01fQlVTQ09OX1dBSVRX
UkMoMikgfCBMR01fQlVTQ09OX0JDR0VOX0NTIHwgTEdNX0JVU0NPTl9BTEVDIHwKPj4gKwkgICAg
ICAgTEdNX0JVU0NPTl9TRVRVUF9FTiwgbGdtX2hvc3QtPmxnbV92YSArIExHTV9CVVNDT04oY3Mp
KTsKPiBJJ20gc3VyZSBzb21lIHRoZSB0aW1pbmdzIHlvdSBoYXJkY29kZSBoZXJlIGNhbiBiZSBl
eHRyYWN0ZWQgZnJvbSB0aGUKPiBOQU5EIHRpbWluZ3MuIENhbiB5b3Ugc2VlIGlmIHlvdSBjYW4g
aW1wbGVtZW50IC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKQo+IGluc3RlYWQuCgpZZXMsIEkgaGF2
ZSBzZWVuIGZldyBvZiB0aGUgZHJpdmVycyBpbXBsZW1lbnRlZCAKLT5zZXR1cF9kYXRhX2ludGVy
ZmFjZSgpLCBOb3RlZC4KClJlZ2FyZHMKVmFkaXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
