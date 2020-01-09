Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD99C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007A0206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/+Gj3yH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007A0206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/VEQHKjxuOXsVmuzn/S5H3VWmN8IFoYHsAeCo+gPq8=; b=K/+Gj3yHvrDzYO
	R1lptxI5WMFqqVyS80sGNgzDcEHLruD0B4H7GC92Fma9fOHaUFyrxkZfHSWpcYdEyBmR9VcrbqBHG
	pEV7O+EL7K9YnqnOxe2CcYICuqlqN6Qyb8Hr1ACCUoZM6DTLgC4wCSob1vxhy5MJqIrw3xIq4MYqx
	r55eVtIiItoSkLjxcC58iwl8IP7p0S1s75uV1towgbAj8iZFkQ1g7ank5n5+A8GzoNW9Bz9YdUr9l
	izsH/2MyJey5Y4/sp0RMMESqm/hiSfuscMxsOEjT7Jn8RBdPVSMI7wvaSvLFG8jzYDU9is5kaTkPH
	lzi2fAUi8DMAEPSDH9vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipZaE-0000lL-5f; Thu, 09 Jan 2020 15:18:50 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipZa3-0000cF-IK; Thu, 09 Jan 2020 15:18:41 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AA51DE0009;
 Thu,  9 Jan 2020 15:18:27 +0000 (UTC)
Date: Thu, 9 Jan 2020 16:18:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/3] mtd: onenand: Enable compile testing of OMAP and
 Samsung drivers
Message-ID: <20200109161826.7fda02a4@xps13>
In-Reply-To: <20191231073339.GA6747@pi3>
References: <20191229183612.22133-3-krzk@kernel.org>
 <201912310904.9iM6MaFr%lkp@intel.com> <20191231073339.GA6747@pi3>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_071839_738655_D509E640 
X-CRM114-Status: GOOD (  12.76  )
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
ZSBvbiBUdWUsIDMxIERlYyAyMDE5CjA4OjMzOjM5ICswMTAwOgoKPiBPbiBUdWUsIERlYyAzMSwg
MjAxOSBhdCAxMDowMDo0OEFNICswODAwLCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToKPiA+IEhp
IEtyenlzenRvZiwKPiA+IAo+ID4gSSBsb3ZlIHlvdXIgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5n
IHRvIGltcHJvdmU6Cj4gPiAKPiA+IFthdXRvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBsaW51cy9t
YXN0ZXJdCj4gPiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gdjUuNS1yYzQgbmV4dC0yMDE5
MTIyMF0KPiA+IFtpZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVl
LCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscAo+ID4gaW1wcm92ZSB0aGUgc3lzdGVtLiBC
VFcsIHdlIGFsc28gc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhl
Cj4gPiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwgcGxlYXNlIHNlZSBodHRwczovL3N0
YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCj4gPiAKPiA+IHVybDogICAgaHR0cHM6Ly9naXRo
dWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9Lcnp5c3p0b2YtS296bG93c2tpL210ZC1vbmVu
YW5kLXNhbXN1bmctRml4LXBvaW50ZXItY2FzdC1XcG9pbnRlci10by1pbnQtY2FzdC13YXJuaW5n
cy1vbi02NC1iaXQvMjAxOTEyMzAtMDMwODM4Cj4gPiBiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBiZjhkMWNk
NDM4NjUzNTAwNGM0YWZlN2YwM2QzN2Y5ODY0Yzk5NDBlCj4gPiByZXByb2R1Y2U6Cj4gPiAgICAg
ICAgICMgYXB0LWdldCBpbnN0YWxsIHNwYXJzZQo+ID4gICAgICAgICAjIHNwYXJzZSB2ZXJzaW9u
OiB2MC42LjEtMTI5LWczNDFkYWYyMC1kaXJ0eQo+ID4gICAgICAgICBtYWtlIEFSQ0g9eDg2XzY0
IGFsbG1vZGNvbmZpZwo+ID4gICAgICAgICBtYWtlIEM9MSBDRj0nLWZkaWFnbm9zdGljLXByZWZp
eCAtRF9fQ0hFQ0tfRU5ESUFOX18nCj4gPiAKPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5k
bHkgYWRkIGZvbGxvd2luZyB0YWcKPiA+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4KPiA+ICAgCj4gCj4gSXQgaXMgbm90IHJlbGF0ZWQgdG8gbXkgcGF0Y2gu
IEknbGwgZml4IGl0IHVwIHNvb24uCgpJIHdvdWxkIGxpa2UgdGhpcyB0byBiZSBmaXhlZCBiZWZv
cmUgZW5hYmxpbmcgY29tcGlsZSB0ZXN0aW5nLCBpcyB5b3VyCmZpeCByZWFkPwoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
