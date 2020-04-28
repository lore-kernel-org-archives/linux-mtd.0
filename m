Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F01AC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:17:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A67206E2
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHMQJdF/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A67206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUJDXgrpBPHm1zE0r3zuhzCYEoXBfzcvg97sfJMO238=; b=jHMQJdF/VkMBTZ
	XpLSJ2i2Q3B9HF2qfuXS06tm1nfj+uG1lNZ3g2EV99J5seGn5SokbNqtyhhUQuie7J/88TtUerUKp
	Jn/vT8EuDnnGIG+Eo4um7EVIETzojAiza32svu0FJhnny+Xt0UbwWmrXour06n/obTzJSKmwsj/ft
	/w6f5KsqRPOrnnsTLyO135QpRRtL7m9cFox8yiuUMLMikR4GJRIKATCdQrg5a3HAbqzqclaxbZshA
	Iz3GK+EHSNC/J7ismEKUtcl+f/IS3XmpGHu+llDsywxSMTXDBjot+8x/axQVrCEfoIEAKu5K9qNsi
	NmPayv8gYBGbbbRrrxSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJYt-0002FM-0r; Tue, 28 Apr 2020 06:17:43 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJYq-0002EI-RN
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:17:42 +0000
IronPort-SDR: U0N6NPReCLJ/Z7ixsB5mtgMX2ReuZZoOYzrvbL2UlJdIh0VFxtt493w966ZPQ7RR+kmuOHuax0
 yGOV1bphOEBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 23:17:37 -0700
IronPort-SDR: mRAV00zSt3LyjUtwUnQBgVJYxZssHaTeZYd55g7dy7apgmpnumrhAXhHjflr8IZvS/GcJEj/DG
 fJ/ZM+6gzOrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,327,1583222400"; d="scan'208";a="257519578"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 27 Apr 2020 23:17:37 -0700
Received: from [10.214.149.60] (vramuthx-mobl1.gar.corp.intel.com
 [10.214.149.60])
 by linux.intel.com (Postfix) with ESMTP id 39A80580B9C;
 Mon, 27 Apr 2020 23:17:32 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200424183612.4cfdbb6a@collabora.com> <20200427175127.0518c193@xps13>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <cba30ccb-c190-d4d6-eab9-6083bd5d2aad@linux.intel.com>
Date: Tue, 28 Apr 2020 14:17:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427175127.0518c193@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_231740_900156_634BD185 
X-CRM114-Status: GOOD (  15.16  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, qi-ming.wu@intel.com, andriy.shevchenko@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKICAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSByZXZpZXcgY29tbWVu
dHMgYW5kIHlvdXIgdGltZS4uLgoKT24gMjcvNC8yMDIwIDExOjUxIHBtLCBNaXF1ZWwgUmF5bmFs
IHdyb3RlOgo+IEhpIFJhbXV0aGV2YXIsCj4gCj4+PiArc3RhdGljIGludCBlYnVfbmFuZF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4gK3sKPj4+ICsJc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4+ICsJc3RydWN0IGVidV9uYW5kX2NvbnRyb2xsZXIgKmVi
dV9ob3N0Owo+Pj4gKwlzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kOwo+Pj4gKwlwaHlzX2FkZHJfdCBu
YW5kYWRkcl9wYTsKPj4+ICsJc3RydWN0IG10ZF9pbmZvICptdGQ7Cj4+PiArCXN0cnVjdCByZXNv
dXJjZSAqcmVzOwo+Pj4gKwlpbnQgcmV0Owo+Pj4gKwl1MzIgY3M7Cj4+PiArCj4+PiArCWVidV9o
b3N0ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCplYnVfaG9zdCksIEdGUF9LRVJORUwpOwo+
Pj4gKwlpZiAoIWVidV9ob3N0KQo+Pj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+PiArCj4+PiArCWVi
dV9ob3N0LT5kZXYgPSBkZXY7Cj4+PiArCW5hbmRfY29udHJvbGxlcl9pbml0KCZlYnVfaG9zdC0+
Y29udHJvbGxlcik7Cj4+PiArCj4+PiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5h
bWUocGRldiwgSU9SRVNPVVJDRV9NRU0sICJlYnVuYW5kIik7Cj4+PiArCWVidV9ob3N0LT5lYnVf
YWRkciA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+Pj4gKwlpZiAo
SVNfRVJSKGVidV9ob3N0LT5lYnVfYWRkcikpCj4+PiArCQlyZXR1cm4gUFRSX0VSUihlYnVfaG9z
dC0+ZWJ1X2FkZHIpOwo+Pj4gKwo+Pj4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnlu
YW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiaHNuYW5kIik7Cj4+PiArCWVidV9ob3N0LT5uYW5k
X2FkZHIgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPj4+ICsJaWYg
KElTX0VSUihlYnVfaG9zdC0+bmFuZF9hZGRyKSkKPj4+ICsJCXJldHVybiBQVFJfRVJSKGVidV9o
b3N0LT5uYW5kX2FkZHIpOwo+Pj4gKwo+Pj4gKwlyZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91
MzIoZGV2LCAibmFuZCxjcyIsICZjcyk7Cj4+Cj4+IENTIGlkcyBzaG91bGQgYmUgZW5jb2RlZCBp
biB0aGUgcmVnIHByb3BlcnR5IChzZWUgWzFdKS4KPiAKPiBJcyBpdCB5b3VyIGNob2ljZSB0byBv
bmx5IHN1cHBvcnQgYSBzaW5nbGUgQ1Mgb3IgaXMgaXQgYWN0dWFsbHkgYQo+IGNvbnRyb2xsZXIg
bGltaXRhdGlvbj8KClllcyAsIGl0cyBjb250cm9sbGVyIGxpbWl0YXRpb24gdG8gc3VwcG9ydCBv
bmx5IG9uZSBDUwoKUmVnYXJkcwpWYWRpdmVsCiAgSWYgdGhlIGxhdHRlciwgaXQgd291bGQgYmUg
bXVjaCBiZXR0ZXIgSSB0aGluawo+IHRvIGFudGljaXBhdGUgdGhlIGFkZGl0aW9uIG9mIHRoZSBz
dXBwb3J0IGZvciBhbm90aGVyIENTLiBBbmQgaW4KPiB0aGlzIGNhc2UgdGhlcmUgYXJlIG1hbnkg
cGxhY2VzIGluIHRoaXMgZHJpdmVyIHRoYXQgc2hvdWxkIGJlCj4gbW9yZSBnZW5lcmljLgo+IAo+
Pj4gKwlpZiAocmV0KSB7Cj4+PiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgY2hpcCBz
ZWxlY3Q6ICVkXG4iLCByZXQpOwo+Pj4gKwkJcmV0dXJuIHJldDsKPj4+ICsJfQo+Pj4gKwo+Pj4g
KwllYnVfaG9zdC0+Y3MgPSBjczsKPj4+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5
bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwgIm5hbmRfY3MwIik7Cj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
