Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C665C25B48
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 11:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EFqod3EHrduz1x9IcGKIOzlB2tzde2jkq+54h3343M=; b=2MpcdcVoVSapom
	8qJr+IfUSSDnB2brITn9u8+SQymGXzk8lDDlKcLURPE9eKiyEw/vFuiWhBhr3aZ64FcGUZtViZidR
	/PV/950SJSdL1dNvk6P20N2OfJ9fxpx1/GK2DhI3/TiCWNGSC/8nf8Y+d29E/aHqMV9AWPB3FAxCR
	40WvZW3rnE8OLWhbMzykPbgHq9J0Wf9lL+Uqcw/q2uOJDT7zwZylSFInf1oy1aCQmQMpDo5MYJbqZ
	uP/7/VE857O4Xk+HCk7MdmRPvaB1/+wRjIG/JOPtEXb83cEByJbdNThtuYr0+gF8V9bCr6X3OdyFT
	3wh36d8/KjQ9huuoejqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvybE-00EMtZ-2G;
	Thu, 26 Oct 2023 11:32:28 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvybB-00EMs5-0l;
	Thu, 26 Oct 2023 11:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698319945; x=1729855945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h5ApP6E4jqcaA/SORBcECnrNuDYb/izJkywcCwQJGys=;
  b=UBSXVdECvikjuGsW8B0j1eqJc+QyssieDLmRbs6GCkk3a8CZKIUvwUEw
   u3VuyBhQ/HOe2AsBoyNnEbhi575d6/lrd8vUNvYETW7he70zl+3xbR9uS
   lEMiofFekn/t1Vu+Yto/83BjvnwP4ElMTYbZtZjWTilRPhdsyuG6aZTIz
   WT+bci2hoPasdumdyGmTpJFkPOLA7u7ognNFXtrHxBj8OqUMNOpbQ1L4I
   szxP3j8wHgAsPzciheqlMgJmbU1a4aXS9XwVqXiGgU5cienfHv15y3/D2
   zvBzWTM3nCiqpOdYCR5535k6SzaUNL4Z35GvPIt0URa+BSQnc26vQRnnL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="332034"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="332034"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 04:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="7244087"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2023 04:32:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvyb2-0009kA-0q;
	Thu, 26 Oct 2023 11:32:16 +0000
Date: Thu, 26 Oct 2023 19:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH V2] nvmem: brcm_nvram: store a copy of NVRAM content
Message-ID: <202310261904.cWDKcVh8-lkp@intel.com>
References: <20231026073440.6724-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026073440.6724-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_043225_318680_7F8B783A 
X-CRM114-Status: GOOD (  11.97  )
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

SGkgUmFmYcWCLAoKa2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxk
IHdhcm5pbmdzOgoKW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHNvYy9mb3ItbmV4dF0KW2Fs
c28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGxpbnVzL21hc3RlciB2Ni42LXJjNyBuZXh0LTIwMjMx
MDI2XQpbSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwga2lu
ZGx5IGRyb3AgdXMgYSBub3RlLgpBbmQgd2hlbiBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0
IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGluCmh0dHBzOi8vZ2l0LXNjbS5jb20vZG9j
cy9naXQtZm9ybWF0LXBhdGNoI19iYXNlX3RyZWVfaW5mb3JtYXRpb25dCgp1cmw6ICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvUmFmYS1NaS1lY2tpL252
bWVtLWJyY21fbnZyYW0tc3RvcmUtYS1jb3B5LW9mLU5WUkFNLWNvbnRlbnQvMjAyMzEwMjYtMTUz
NjMwCmJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvc29jL3NvYy5naXQgZm9yLW5leHQKcGF0Y2ggbGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIzMTAyNjA3MzQ0MC42NzI0LTEtemFqZWM1JTQwZ21haWwuY29tCnBhdGNoIHN1
YmplY3Q6IFtQQVRDSCBWMl0gbnZtZW06IGJyY21fbnZyYW06IHN0b3JlIGEgY29weSBvZiBOVlJB
TSBjb250ZW50CmNvbmZpZzogbTY4ay1hbGx5ZXNjb25maWcgKGh0dHBzOi8vZG93bmxvYWQuMDEu
b3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMTAyNi8yMDIzMTAyNjE5MDQuY1dES2NWaDgtbGtwQGlu
dGVsLmNvbS9jb25maWcpCmNvbXBpbGVyOiBtNjhrLWxpbnV4LWdjYyAoR0NDKSAxMy4yLjAKcmVw
cm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBk
YXktY2kvYXJjaGl2ZS8yMDIzMTAyNi8yMDIzMTAyNjE5MDQuY1dES2NWaDgtbGtwQGludGVsLmNv
bS9yZXByb2R1Y2UpCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2Nv
bW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mCnRoZSBzYW1lIHBhdGNoL2NvbW1p
dCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+CnwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9v
ZS1rYnVpbGQtYWxsLzIwMjMxMDI2MTkwNC5jV0RLY1ZoOC1sa3BAaW50ZWwuY29tLwoKQWxsIHdh
cm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cgo+PiBkcml2ZXJzL252bWVtL2JyY21f
bnZyYW0uYzozNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGV2JyBu
b3QgZGVzY3JpYmVkIGluICdicmNtX252cmFtJwo+PiBkcml2ZXJzL252bWVtL2JyY21fbnZyYW0u
YzozNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnY2VsbHMnIG5vdCBk
ZXNjcmliZWQgaW4gJ2JyY21fbnZyYW0nCj4+IGRyaXZlcnMvbnZtZW0vYnJjbV9udnJhbS5jOjM2
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICduY2VsbHMnIG5vdCBkZXNj
cmliZWQgaW4gJ2JyY21fbnZyYW0nCgoKdmltICszNiBkcml2ZXJzL252bWVtL2JyY21fbnZyYW0u
YwoKM2ZlZjllZDA2MjdhZjMgUmFmYcWCIE1pxYJlY2tpIDIwMjEtMDMtMzAgIDE5ICAKNmJiNmM5
MGM3YmM1YmIgUmFmYcWCIE1pxYJlY2tpIDIwMjMtMTAtMjYgIDIwICAvKioKNmJiNmM5MGM3YmM1
YmIgUmFmYcWCIE1pxYJlY2tpIDIwMjMtMTAtMjYgIDIxICAgKiBzdHJ1Y3QgYnJjbV9udnJhbSAt
IGRyaXZlciBzdGF0ZSBpbnRlcm5hbCBzdHJ1Y3QKNmJiNmM5MGM3YmM1YmIgUmFmYcWCIE1pxYJl
Y2tpIDIwMjMtMTAtMjYgIDIyICAgKgo2YmI2YzkwYzdiYzViYiBSYWZhxYIgTWnFgmVja2kgMjAy
My0xMC0yNiAgMjMgICAqIEBudm1lbV9zaXplOgkJU2l6ZSBvZiB0aGUgd2hvbGUgc3BhY2UgYXZh
aWxhYmxlIGZvciBOVlJBTQo2YmI2YzkwYzdiYzViYiBSYWZhxYIgTWnFgmVja2kgMjAyMy0xMC0y
NiAgMjQgICAqIEBkYXRhOgkJTlZSQU0gZGF0YSBjb3B5IHN0b3JlZCB0byBhdm9pZCBwb2tpbmcg
dW5kZXJsYXlpbmcgZmxhc2ggY29udHJvbGxlcgo2YmI2YzkwYzdiYzViYiBSYWZhxYIgTWnFgmVj
a2kgMjAyMy0xMC0yNiAgMjUgICAqIEBkYXRhX2xlbjoJCU5WUkFNIGRhdGEgc2l6ZQo2YmI2Yzkw
YzdiYzViYiBSYWZhxYIgTWnFgmVja2kgMjAyMy0xMC0yNiAgMjYgICAqIEBwYWRkaW5nX2J5dGU6
CVBhZGRpbmcgdmFsdWUgdXNlZCB0byBmaWxsIHJlbWFpbmluZyBzcGFjZQo2YmI2YzkwYzdiYzVi
YiBSYWZhxYIgTWnFgmVja2kgMjAyMy0xMC0yNiAgMjcgICAqLwozZmVmOWVkMDYyN2FmMyBSYWZh
xYIgTWnFgmVja2kgMjAyMS0wMy0zMCAgMjggIHN0cnVjdCBicmNtX252cmFtIHsKM2ZlZjllZDA2
MjdhZjMgUmFmYcWCIE1pxYJlY2tpIDIwMjEtMDMtMzAgIDI5ICAJc3RydWN0IGRldmljZSAqZGV2
Owo2YmI2YzkwYzdiYzViYiBSYWZhxYIgTWnFgmVja2kgMjAyMy0xMC0yNiAgMzAgIAlzaXplX3Qg
bnZtZW1fc2l6ZTsKNmJiNmM5MGM3YmM1YmIgUmFmYcWCIE1pxYJlY2tpIDIwMjMtMTAtMjYgIDMx
ICAJdWludDhfdCAqZGF0YTsKNmJiNmM5MGM3YmM1YmIgUmFmYcWCIE1pxYJlY2tpIDIwMjMtMTAt
MjYgIDMyICAJc2l6ZV90IGRhdGFfbGVuOwo2YmI2YzkwYzdiYzViYiBSYWZhxYIgTWnFgmVja2kg
MjAyMy0xMC0yNiAgMzMgIAl1aW50OF90IHBhZGRpbmdfYnl0ZTsKNmU5NzdlYWE4MjgwZTkgUmFm
YcWCIE1pxYJlY2tpIDIwMjItMDItMjUgIDM0ICAJc3RydWN0IG52bWVtX2NlbGxfaW5mbyAqY2Vs
bHM7CjZlOTc3ZWFhODI4MGU5IFJhZmHFgiBNacWCZWNraSAyMDIyLTAyLTI1ICAzNSAgCWludCBu
Y2VsbHM7CjZlOTc3ZWFhODI4MGU5IFJhZmHFgiBNacWCZWNraSAyMDIyLTAyLTI1IEAzNiAgfTsK
NmU5NzdlYWE4MjgwZTkgUmFmYcWCIE1pxYJlY2tpIDIwMjItMDItMjUgIDM3ICAKCi0tIAowLURB
WSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlCmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVz
dHMvd2lraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
