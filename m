Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD9C28B28
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze+8Y7eeLy+TtCZn0+zmYEWGDhH9MpdQAHmmry3v2TY=; b=qLdZcn9jNQ7wJd
	ZLkFoCQHQLlO2cpfBOSUfeTOoDXQHwEdusj1J/ZLrUcRm3zduQHBr3t79GDeCa7o5NPVf0XIL2iIJ
	IgC/fNWKv/mY2PYvZPJYFX0DI+23UeNIM24eK21HXYjVd6VpUmTyKFmQqL04gaMFF5P6X//sJ6Aff
	OV/NwVSMJkAV2aPsDqgrlwGnBuKW0g+UbgQBrdfOJpGqEdtHJ5hFKOGD5JD/TjD+1V5knsjo18zB7
	uTy/mu9EqEgc5VVjvK2Z0aIkyfCz77j6AibFnkB7jkfjbdAJEADaCY0uQf6Ij+P/ct/kxe55cAKp/
	pPMBf0zsmIVssY92hs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsecx-0000000Agl1-21rv;
	Thu, 13 Mar 2025 09:13:19 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseZJ-0000000Ag6L-0hgN
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 09:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741856973; x=1773392973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/aT4jDWdbe0H5Pu8MMORdbKh4I8XNsP23yL2mQme8R4=;
  b=Fu56VvqewFJMUt2jY/R1u1gLBwRSbhFH4YtHCzXH/j60/MUTv/kBje7s
   yejLJ+X0zdl8kZM6FAj5yuSfEtc41GFS2VnjwodY5MGGeT8QnG/GjEekH
   Jb7t9vVbXrEFtX0fkqpEmQoEcSWsqNZ3QI7GLlr/79g9LsQC9EQwsPwUn
   NzwmyFmfUA63XLEjNMyG47dXFpRhJM3kPFFe3lPmiDfokrVNIU6QuQvk+
   xL9gBpZnnbNL1s+fWpRlvRn0wVmoCWkAdHzY7CMa1BStT0kZr6HCzDW2y
   H/gOWiaAuyHQpgteMWsMMwxF3+fxve7/K5d43EYLWzxVkmyMYpnm+2Api
   w==;
X-CSE-ConnectionGUID: O0Zzu6IfRuCPWTeEpJwLWQ==
X-CSE-MsgGUID: OxIoquWoT4yDC70stKVDlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60505172"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="60505172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:09:28 -0700
X-CSE-ConnectionGUID: XvxnbidaTfy56Rd+EVZS8Q==
X-CSE-MsgGUID: SxWlc2/4TmCBoCJckr014w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="120695199"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:09:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tseZA-000000027t4-17w1;
	Thu, 13 Mar 2025 11:09:24 +0200
Date: Thu, 13 Mar 2025 11:09:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: mtdpart: Do not supply NULL to printf()
Message-ID: <Z9KgxKocER3R1aPN@smile.fi.intel.com>
References: <20250312201649.217555-1-andriy.shevchenko@linux.intel.com>
 <e6616c70-7579-6114-95b0-3c4a94f98aa0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6616c70-7579-6114-95b0-3c4a94f98aa0@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_020933_214836_7A68C487 
X-CRM114-Status: GOOD (  11.71  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDk6MjQ6MjFBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI1LzMvMTMgNDoxNiwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPiA+IENv
bXBpbGVyIGlzIG5vdCBoYXBweSBhYm91dCBOVUxMIGJlaW5nIHN1cHBsaWVkIGFzIHByaW50Zigp
IHBhcmFtZXRlcjoKPiAKPiBwcmludGYgLT4gcHJpbnRrPyBUaGUgdGl0bGUgaGFzIHRoZSBzYW1l
IGlzc3VlLgo+ID4gCj4gPiBkcml2ZXJzL210ZC9tdGRwYXJ0LmM6NjkzOjM0OiBlcnJvcjog4oCY
JXPigJkgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG51bGwgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93
PV0KPiA+IAo+ID4gUmVwbGFjZSB0aGF0IHdpdGggIihudWxsKSIgdG8gZml4IGNvbXBpbGF0aW9u
IGVycm9yLgoKPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KClRoYW5rIHlvdSEKCkJ1dCBJIHRoaW5rIG15IGFwcHJvYWNoIGlzIGEgaGFjaywgdGhl
IGJlc3QgaXMgdG8gbW92ZSB0aGlzIG1lc3NhZ2UgdG8gdGhlCmFmdGVyIHRoZSBmb2xsb3cgdXAg
Y29uZGl0aW9uYWwgYW5kIGRyb3AgdGhhdCB0ZXJuYXJ5IGNvbXBsZXRlbHkgYXMgd2UgaGF2ZQph
bHJlYWR5IGFub3RoZXIgZGVidWcgbWVzc2FnZSBiZWZvcmUgdGhhdC4gU28sIHRoZSBwYXJzZXIg
PT0gTlVMTCBjYW4gYmUKZGVkdWN0ZWQgZnJvbSB0aGUgYXBwZWFyYW5jZSBvZiB0aGUgb25lIGFu
ZCBub3QgdGhlIG90aGVyIG9uZS4KCkknbGwgc2VuZCBhIHYyLgoKPiA+ICAgCQkJaWYgKCFwYXJz
ZXIgJiYgIXJlcXVlc3RfbW9kdWxlKCIlcyIsICp0eXBlcykpCj4gPiAgIAkJCQlwYXJzZXIgPSBt
dGRfcGFydF9wYXJzZXJfZ2V0KCp0eXBlcyk7Cj4gPiAgIAkJCXByX2RlYnVnKCIlczogZ290IHBh
cnNlciAlc1xuIiwgbWFzdGVyLT5uYW1lLAo+ID4gLQkJCQlwYXJzZXIgPyBwYXJzZXItPm5hbWUg
OiBOVUxMKTsKPiA+ICsJCQkJcGFyc2VyID8gcGFyc2VyLT5uYW1lIDogIihudWxsKSIpOwo+ID4g
ICAJCQlpZiAoIXBhcnNlcikKPiA+ICAgCQkJCWNvbnRpbnVlOwoKKG1vdmUgaXQgaGVyZSkKCj4g
PiAgIAkJCXJldCA9IG10ZF9wYXJ0X2RvX3BhcnNlKHBhcnNlciwgbWFzdGVyLCAmcHBhcnRzLCBk
YXRhKTsKCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
