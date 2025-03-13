Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E58C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLOqlqfxyce/g7+ZLM6JtEDUAKsqpWembBDRM5TiH5E=; b=dYcxqmsyXwtEeo
	GA4NafmZzNC5zb1/P/gDmowUHQ6Y0kJUjRhw1CpEj9ava82ewNrnDnxJkg6BUna7juWfnW4k9J/yJ
	g6HZw/bLNqGCk8gynbMgtu3OIBExRH2SRuprQN7CcTZZX+xjqNTxNeEYHgS6bTSB1vBsHoRZv2uHA
	QIzN4fUtnihmc5WWOIqbhOARjzp61RWoA1uQuxL5TmLxNekrfp/5PtpkcabbPe8qNKcb1bK6bBLuV
	ZEfiMvTGtMcphx6u0naG4YFYg9b7bZmFI6jwd43aRa6aZCaBllEcbCGw1VQc1cig747tQ2LO8y6Rs
	/CUNHCvxXPiY1Ec5xJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshZ4-0000000BDt2-28qm;
	Thu, 13 Mar 2025 12:21:30 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshOZ-0000000BC5t-180C
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 12:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741867839; x=1773403839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GyXIuBWGwxiTj76FQXVod3bhrQqXHfw/uGSzUCIShy4=;
  b=hISbuJqLzBYifT0AQZeliXf0Bkhro1hjXHpDjIDiBreGPfMGaq2p+gf/
   0xghTvjL4WpYWDbp2thaBRFQ2VASroLI9zJ5Bst/zv1bHPlqky3VqopkP
   hIKrVZQN/pkp3s3uDEv1NzmZbmm+tx4HnZTQfjloMRMLsvaFo5Tz7+0p0
   /U2DNTMuhT1snC8UeVDEuIttr6pPksdezFuS64Qve6HU2R/jyM+laFoP4
   uNGhgJt8H/PzkM7Y7/uRQco6yo93GwjS4mcyF+GgdRDhJl8+zJkR0lHTi
   Dz58xE0Br/gWRq7aS5C9eJXk7GNK2lwBeDZ+m8SndxvFJI7bJqAHetJg1
   w==;
X-CSE-ConnectionGUID: jhEUI1SaR7CaGlbch1fKrA==
X-CSE-MsgGUID: /dRbN8ARRNWvMcgygoCCfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53617731"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="53617731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:10:39 -0700
X-CSE-ConnectionGUID: MqQtqtljTYKZX0drLigzmg==
X-CSE-MsgGUID: pa1+gZoQTYixoBcJEPkr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121635190"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:10:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tshOU-00000002AMK-2Kf9;
	Thu, 13 Mar 2025 14:10:34 +0200
Date: Thu, 13 Mar 2025 14:10:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: mtdpart: Do not supply NULL to printf()
Message-ID: <Z9LLOthvgonKIc6U@smile.fi.intel.com>
References: <20250312201649.217555-1-andriy.shevchenko@linux.intel.com>
 <e6616c70-7579-6114-95b0-3c4a94f98aa0@huawei.com>
 <Z9KgxKocER3R1aPN@smile.fi.intel.com>
 <a5d38df2-4679-9bb9-4b01-2cfa184cd1be@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5d38df2-4679-9bb9-4b01-2cfa184cd1be@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_051039_319396_B5FEFC4B 
X-CRM114-Status: GOOD (  19.09  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDY6NTQ6NDBQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI1LzMvMTMgMTc6MDksIEFuZHkgU2hldmNoZW5rbyDlhpnpgZM6Cj4gPiBP
biBUaHUsIE1hciAxMywgMjAyNSBhdCAwOToyNDoyMUFNICswODAwLCBaaGloYW8gQ2hlbmcgd3Jv
dGU6Cj4gPiA+IOWcqCAyMDI1LzMvMTMgNDoxNiwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPiA+
ID4gPiBDb21waWxlciBpcyBub3QgaGFwcHkgYWJvdXQgTlVMTCBiZWluZyBzdXBwbGllZCBhcyBw
cmludGYoKSBwYXJhbWV0ZXI6Cj4gPiA+IAo+ID4gPiBwcmludGYgLT4gcHJpbnRrPyBUaGUgdGl0
bGUgaGFzIHRoZSBzYW1lIGlzc3VlLgo+ID4gPiA+IAo+ID4gPiA+IGRyaXZlcnMvbXRkL210ZHBh
cnQuYzo2OTM6MzQ6IGVycm9yOiDigJglc+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBb
LVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQo+ID4gPiA+IAo+ID4gPiA+IFJlcGxhY2UgdGhhdCB3
aXRoICIobnVsbCkiIHRvIGZpeCBjb21waWxhdGlvbiBlcnJvci4KPiA+IAo+ID4gPiBSZXZpZXdl
ZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiA+IAo+ID4gVGhh
bmsgeW91IQo+ID4gCj4gPiBCdXQgSSB0aGluayBteSBhcHByb2FjaCBpcyBhIGhhY2ssIHRoZSBi
ZXN0IGlzIHRvIG1vdmUgdGhpcyBtZXNzYWdlIHRvIHRoZQo+ID4gYWZ0ZXIgdGhlIGZvbGxvdyB1
cCBjb25kaXRpb25hbCBhbmQgZHJvcCB0aGF0IHRlcm5hcnkgY29tcGxldGVseSBhcyB3ZSBoYXZl
Cj4gPiBhbHJlYWR5IGFub3RoZXIgZGVidWcgbWVzc2FnZSBiZWZvcmUgdGhhdC4gU28sIHRoZSBw
YXJzZXIgPT0gTlVMTCBjYW4gYmUKPiA+IGRlZHVjdGVkIGZyb20gdGhlIGFwcGVhcmFuY2Ugb2Yg
dGhlIG9uZSBhbmQgbm90IHRoZSBvdGhlciBvbmUuCj4gPiAKPiA+IEknbGwgc2VuZCBhIHYyLgo+
ID4gCj4gPiA+ID4gICAgCQkJaWYgKCFwYXJzZXIgJiYgIXJlcXVlc3RfbW9kdWxlKCIlcyIsICp0
eXBlcykpCj4gPiA+ID4gICAgCQkJCXBhcnNlciA9IG10ZF9wYXJ0X3BhcnNlcl9nZXQoKnR5cGVz
KTsKPiA+ID4gPiAgICAJCQlwcl9kZWJ1ZygiJXM6IGdvdCBwYXJzZXIgJXNcbiIsIG1hc3Rlci0+
bmFtZSwKPiA+ID4gPiAtCQkJCXBhcnNlciA/IHBhcnNlci0+bmFtZSA6IE5VTEwpOwo+ID4gPiA+
ICsJCQkJcGFyc2VyID8gcGFyc2VyLT5uYW1lIDogIihudWxsKSIpOwo+ID4gPiA+ICAgIAkJCWlm
ICghcGFyc2VyKQo+ID4gPiA+ICAgIAkJCQljb250aW51ZTsKPiA+IAo+ID4gKG1vdmUgaXQgaGVy
ZSkKPiAKPiBBZnRlciBsb29raW5nIHRocm91Z2ggOGUyYzk5MmI1OWZjKCJtdGQ6IG10ZHBhcnQ6
IGFkZCBkZWJ1ZyBwcmludHMgdG8KPiBwYXJ0aXRpb24gcGFyc2VyLiIpIGFuZCAwMWY5YzcyNDBh
OTAoIm10ZDogcGFydGl0aW9uczogZmFjdG9yIG91dCBjb2RlCj4gY2FsbGluZyBwYXJzZXIiKSwg
SSB0aGluayB3ZSdkIGJldHRlciBrZWVwIHRoZSBkZWJ1ZyBtZXNzYWdlIGJlZm9yZSB0aGUKPiBj
b25kaXRpb24gJ2lmICghcGFyc2VyKScsIGl0IGlzIHVzZWQgdG8gaW5mb3JtIHVzIHdoZXRoZXIg
d2UgZ2V0IGEgcGFyc2VyCj4gYW5kIHdoaWNoIG5hbWUgaXQgaXMuIEFuZCB0aGUgZGVidWcgbWVz
c2FnZSBpbiBtdGRfcGFydF9kb19wYXJzZSBpbmZvcm1zIHVzCj4gdGhlIHJlc3VsdCBvZiB0aGUg
J3BhcnNlci0+cGFyc2VfZm4nLgoKU2VlIHYyLCBwbGVhc2UuIEZyb20gaW5mb3JtYXRpb24gcG9p
bnQgb2YgdmlldyBubyBwaWVjZSB3b3VsZCBiZSBsb3N0LgoKPiA+ID4gPiAgICAJCQlyZXQgPSBt
dGRfcGFydF9kb19wYXJzZShwYXJzZXIsIG1hc3RlciwgJnBwYXJ0cywgZGF0YSk7CgotLSAKV2l0
aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
