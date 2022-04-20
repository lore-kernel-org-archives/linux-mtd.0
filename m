Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80131C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 06:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8w9nNi1XAlsliYUbneVBPVBizCqggVUoqbbndc1P+o=; b=R3GAcjqAwBQQnl
	mccayhERcHj1sH7lfcaLLBOqa7KChg6CoIvqvUXEm8tZetkzvaP4XBtex3c956clYxlllZaXf3a95
	678mx+fpdKbCfM+DVJE8a+A7n/qMND1IyxlFnvZ4L/R0MurzGWLaBtVo87y/m9ucfF+Y+Yz1gnlhO
	oRmTUXJu405/GSsFyxB5MYkcXRGcbAlHJdHr9GjqRwyOmQvxhjI25S72ULlFgORjKL8r8dpMwxiL2
	bRNu/uNMEPpP9gqb7Rc1LcSHE1aFViUAgZfIwVFBa55aaoQdnNekeZBFv9WqygP0EAFQOChkwxHL1
	SA5k3iio31FED27N+nlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3ny-007YhE-NC; Wed, 20 Apr 2022 06:27:10 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3nv-007YgK-6l
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 06:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650436027; x=1681972027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hfwbe9msN9hFNQGBoKCNDDtBbbvKTG5hJQ92VxaPBBY=;
 b=GZi1LaIBMb5NPtv64vk0HYwbBBeDrHx/76spYdmnQigbDybR3sQHR7xp
 uS/xZ+dM13gGmsgfjJuI6Wj6WTiTTwljpqo/591LeVO7LgRTxgAvOJ94H
 jdROv4G7VYVsSWiLHf5HPnqVetnY3tCuNK0yxkj9LgmqVm5/PH9LtAWTl
 hCMEvi+FsZDGj+BTgWV5IBzxSbeO7B5hpk+JKzNfyXaRCP6R2huQMMoPg
 Qym+l2TAR1J/E7KBVOMrDZh1pWZiSeU1mpVabpb7UZbnxMr3DY8KPNeJM
 MgCsR8XOSZSpq3nCkcLPRQ/dAKAalR8uLzL7l80bALRiCUwIo9rJA4yAl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="264123514"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="264123514"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:27:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="593063703"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:27:01 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Apr 2022 09:25:48 +0300
Date: Wed, 20 Apr 2022 09:25:48 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Hongli Li <hongli.li@intel.com>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] spi: intel: Implement dirmap hooks
Message-ID: <Yl+nbNCj5l7uDgH0@lahna>
References: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
 <20220411113158.2037-2-mika.westerberg@linux.intel.com>
 <Yl6nS0kSdSGOCYM3@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yl6nS0kSdSGOCYM3@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_232707_303299_03273077 
X-CRM114-Status: GOOD (  17.01  )
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

SGkgTWFyaywKCk9uIFR1ZSwgQXByIDE5LCAyMDIyIGF0IDAxOjEyOjU5UE0gKzAxMDAsIE1hcmsg
QnJvd24gd3JvdGU6Cj4gT24gTW9uLCBBcHIgMTEsIDIwMjIgYXQgMDI6MzE6NThQTSArMDMwMCwg
TWlrYSBXZXN0ZXJiZXJnIHdyb3RlOgo+ID4gQ3VycmVudGx5IHRoZSBkcml2ZXIgZ29lcyBvdmVy
IHRoZSBzdXBwb3J0ZWQgb3Bjb2RlcyBsaXN0IGVhY2ggdGltZQo+ID4gLT5leGVjX29wKCkgaXMg
Y2FsbGVkIGFuZCBmaW5kcyB0aGUgc3VpdGFibGUgZm9yIHRoZSBnaXZlbiBvcGVyYXRpb24uCj4g
PiBUaGlzIGNvbnN1bWVzIHVubmVjZXNzYXJ5IGFtb3VudCBvZiBDUFUgY3ljbGVzIGJlY2F1c2Ug
dGhlIG9wZXJhdGlvbiBpcwo+ID4gYWx3YXlzIHRoZSBzYW1lLiBGb3IgdGhpcyByZWFzb24gcG9w
dWxhdGUgZGlybWFwIGhvb2tzIGZvciB0aGUgZHJpdmVyIHNvCj4gPiB0aGF0IHdlIGNhY2hlIHRo
ZSBzZWxlY3RlZCBvcGVyYXRpb24gYW5kIHRoZW4gc2ltcGx5IGNhbGwgaXQgb24gZWFjaAo+ID4g
cmVhZC93cml0ZS4KPiAKPiBUaGlzIGJyZWFrcyBhbiB4ODYgYWxsbW9kY29uZmlnIGJ1aWxkOgo+
IAo+IC9idWlsZC9zdGFnZS9saW51eC9kcml2ZXJzL3NwaS9zcGktaW50ZWwuYzogSW4gZnVuY3Rp
b24g4oCYaW50ZWxfc3BpX2Rpcm1hcF9yZWFk4oCZOgo+IC9idWlsZC9zdGFnZS9saW51eC9kcml2
ZXJzL3NwaS9zcGktaW50ZWwuYzo4MDg6Mzg6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDIgb2Yg
4oCYaW9wLT5leGVjX29w4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJv
cj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KPiAgIDgwOCB8ICAgICAgICAgcmV0ID0gaW9w
LT5leGVjX29wKGlzcGksIGRlc2MtPm1lbSwgaW9wLCAmb3ApOwo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfn5+fl5+fn5+Cj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBzcGlfbWVtICoKCk9oLCBpbmRlZWQgOiggSSBoYXZlIGFu
b3RoZXIgcGF0Y2ggYWRkaW5nIHNlY29uZCBjaGlwIHNlbGVjdCBzdXBwb3J0CnRoYXQgYWRkcyB0
aGUgcGFyYW1ldGVyIGFuZCB0aGVuIEkgY2hhbmdlZCB0aGUgb3JkZXJpbmcsIGFuZCBvZiBjb3Vy
c2UKZm9yZ290IHRvIHJlZmxlY3QgdGhhdCB0byB0aGlzIHBhdGNoLiBJIHdpbGwgZml4IHRoaXMg
dXAgYW5kIHJlLXNlbmQuClNvcnJ5IGFib3V0IHRoaXMuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
