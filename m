Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB15C2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 09:46:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6FE208E4
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 09:46:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtcMsl6c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6FE208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=caFjKXbRwSSkGV5WMVW7AsUKXs0me64wq/QQCgtftFg=; b=BtcMsl6ceABkK9onqz/GZQgbV
	mRZKdbHMbJB2cYFIuRfC3hodLjB3zyW/DMSrrNTslgX6e+HIX4n2D1ZPaTyfmNJb+jwh7UG13GWM3
	nvwY6m3VP7TfMXqopIIrpRPHdliNuAnN5xvzd32k6aXsSeqDbeOR7lVzI0cjj7MWsEmHkVZ1yGD3n
	EgPpb50Gz4tglLSUBDxAElM2A/wmhyD4QaQ+O3r7TKnPDdQSOlHu/gr51oXMma8j8KTD1ig5wa8wo
	zMuUDDw8qgc9fuvU+7t/VN03N32Pf4R4Vp3w6qQMWpj1HlXpYoqStdItBtvGdUVXnQ2RNhzU5F2pp
	VRhvm2O1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP15q-0004Es-Lg; Thu, 16 Apr 2020 09:45:58 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP15o-0004EI-D1
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 09:45:57 +0000
IronPort-SDR: BKnaCtz/SSYpDU4jKo4ByBOxmr297I47eLsHmZB/tRGh7aZ1fHUDC8xlXmaZbHzXKBmXz2QvAP
 XLMCgRpIH13w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 02:45:55 -0700
IronPort-SDR: uSQh+hX50YnRkloy/db7+gNn6Ed8ye9wELa15zrSDQYMwy8d+7rAXv/HmCEDBKA1fbb2S2kQ8l
 XXetNlZgM0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="288839657"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2020 02:45:55 -0700
Received: from [10.255.154.239] (vramuthx-MOBL1.gar.corp.intel.com
 [10.255.154.239])
 by linux.intel.com (Postfix) with ESMTP id 850725802A4;
 Thu, 16 Apr 2020 02:45:50 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
Date: Thu, 16 Apr 2020 17:45:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416113822.2ef326cb@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_024556_446257_3A21F0B0 
X-CRM114-Status: GOOD (  16.26  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, andriy.shevchenko@intel.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgogwqDCoMKgIFRoYW5rIHlvdSBmb3IgcHJvbXB0IHJlcGx5Li4uCgpPbiAxNi80
LzIwMjAgNTozOCBwbSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9uIFRodSwgMTYgQXByIDIw
MjAgMTc6MzU6MjYgKzA4MDAKPiAiUmFtdXRoZXZhciwgVmFkaXZlbCBNdXJ1Z2FuWCIKPiA8dmFk
aXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPj4gSGkg
TWFydGluLAo+Pgo+PiAgIMKgwqDCoCBUaGFuayB5b3Ugc28gbXVjaCBmb3IgcmV2aWV3IGNvbW1l
bnRzIGFuZCB5b3VyIHRpbWUuLi4KPj4KPj4gT24gMTYvNC8yMDIwIDY6MDUgYW0sIE1hcnRpbiBC
bHVtZW5zdGluZ2wgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBmaXJzdCBvZiBhbGw6IHRoYW5rIHlv
dSBmb3Igd29ya2luZyBvbiB1cHN0cmVhbWluZyB0aGlzLgo+Pj4gRXNwZWNpYWxseSBzaW5jZSB5
b3UgYXJlIGdvaW5nIHRvIHVzZSB0aGUgbmV3IGV4ZWNfb3Agc3R5bGUgaW4gdjIgYXMKPj4+IEJv
cmlzIHN1Z2dlc3RlZC4KPj4+ICAgCj4+Pj4gRnJvbTogUmFtdXRoZXZhciBWYWRpdmVsIE11cnVn
YW4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+Cj4+Pj4KPj4+
PiBUaGlzIHBhdGNoIGFkZHMgdGhlIG5ldyBJUCBvZiBOYW5kIEZsYXNoIENvbnRyb2xsZXIoTkZD
KSBzdXBwb3J0Cj4+Pj4gb24gSW50ZWwncyBMaWdodG5pbmcgTW91bnRhaW4oTEdNKSBTb0MuCj4+
Pj4KPj4+PiBETUEgaXMgdXNlZCBmb3IgYnVyc3QgZGF0YSB0cmFuc2ZlciBvcGVyYXRpb24sIGFs
c28gRE1BIEhXIHN1cHBvcnRzCj4+Pj4gYWxpZ25lZCAzMmJpdCBtZW1vcnkgYWRkcmVzcyBhbmQg
YWxpZ25lZCBkYXRhIGFjY2VzcyBieSBkZWZhdWx0Lgo+Pj4+IERNQSBidXJzdCBvZiA4IHN1cHBv
cnRlZC4gRGF0YSByZWdpc3RlciB1c2VkIHRvIHN1cHBvcnQgdGhlIHJlYWQvd3JpdGUKPj4+PiBv
cGVyYXRpb24gZnJvbS90byBkZXZpY2UuCj4+PiBJIGFtIHdvbmRlcmluZyBob3cgdGhpcyBuZXcg
aGFyZHdhcmUgaXMgZGlmZmVyZW50IGZyb20gdGhlIExhbnRpcSBOQU5ECj4+PiBjb250cm9sbGVy
IElQIC0gZm9yIHdoaWNoIHRoZXJlIGlzIGFscmVhZHkgYSBkcml2ZXIgaW4gbWFpbmxpbmUgKGl0
J3MKPj4+IGluIGRyaXZlcnMvbXRkL25hbmQvcmF3L3h3YXlfbmFuZC5jKS4KPj4+IFRoZSBDT04g
YW5kIFdBSVQgcmVnaXN0ZXJzIGxvb2sgc3VzcGljaW91c2x5IHNpbWlsYXIuCj4+Pgo+Pj4gQXMg
ZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGUgIm9sZCIgU29DcyAoVlJYMjAwIGFuZCBlYXJsaWVyKSBk
b24ndCBoYXZlCj4+PiBhIGJ1aWx0LWluIEVDQyBlbmdpbmUuIFRoaXMgc2VlbXMgdG8gaGF2ZSBj
aGFuZ2VkIHdpdGggQVJYMzAwIHRob3VnaAo+Pj4gKGFnYWluLCBBRkFJSykuCj4+Pgo+Pj4gQSBi
aXQgb2YgbGluZWFnZSBvbiB0aGVzZSBTb0NzIChpbml0aWFsbHkgdGhlc2Ugd2VyZSBkZXZlbG9w
ZWQgYnkKPj4+IEluZmluZW9uLiBMYW50aXEgdGhlbiBzdGFydGVkIGFzIGFuIEluZmluZW9uIHNw
aW4tb2ZmIGluIDIwMDkgYW5kCj4+PiB3YXMgdGhlbiBhY3F1aXJlZCBieSBJbnRlbCBpbiAyMDE1
KToKPj4+IC0gRGFudWJlCj4+PiAtIEFSWDEwMCBmcm9tIDIwMDgvMjAwOQo+Pj4gLSBWUlgyMDAg
ZnJvbSAyMDA5LzIwMTAKPj4+IC0gQVJYMzAwIGZyb20gMjAxNAo+Pj4gLSBHUlgzNTAgZnJvbSAy
MDE1LzIwMTYKPj4+IC0gR1JYNTUwIGZyb20gMjAxNwo+Pj4gLSBhbmQgbm93IGZpbmFsbHk6IExH
TSBmcm9tIDIwMjAgKGVzdC4pCj4+Pgo+Pj4gVGhlIGV4aXN0aW5nIHh3YXlfbmFuZCBkcml2ZXIg
c3VwcG9ydHMgdGhlIERhbnViZSwgQVJYMTAwIGFuZCBWUlgyMDAKPj4+IFNvQ3MuCj4+IExhbnRp
cSB1cHN0cmVhbWVkIGEgZHJpdmVyIGZvciBhbiBvbGRlciB2ZXJzaW9uIG9mIHRoaXMgSVAgY29y
ZSA4IHllYXJzCj4+IGFnbywgc2VlIGhlcmU6Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y1LjUuNi9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMKPj4g
SXQgZG9lcyBub3Qgc3VwcG9ydCBETUEgYW5kIEVDQy4KPiBUaGVuIGxldCdzIGp1c3QgZXh0ZW5k
IHRoaXMgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIG5ldyBmZWF0dXJlcy4gUGx1cywKV2UgZG8gbm90
IGhhdmUgdGhlIHBsYXRmb3JtIHRvIHRlc3QgYWxzbyBpdCdzIHZlcnkgb2xkIGxlZ2FjeSBkcml2
ZXIgLgo+IHdlJ2xsIGJlIGhhcHB5IHRvIGhhdmUgb25lIG1vcmUgb2YgdGhlIGV4aXN0aW5nIGRy
aXZlciBjb252ZXJ0ZWQgdG8KPiAtPmV4ZWNfb3AoKSA7LSkuCgpJIGhhdmUgY29tcGxldGVseSBh
ZGFwdGVkIHRvIC0+ZXhlY19vcCgpIGhvb2sgdXAgdG8gcmVwbGFjZSB0aGUgbGVnYWN5IApjYWxs
LWJhY2suCgpSZWdhcmRzClZhZGl2ZWwKPgo+PiBUaGlzIHVwc3RyZWFtIGRyaXZlciB3b3JrcyB3
aXRoIHRoZSB4cngyMDAsIEkgZG8gbm90IGtub3cgaG93IHdlbGwgaXQKPj4gd29ya3Mgd2l0aCBv
dGhlciBTb0NzLgo+Pgo+PiBSZWdhcmRzCj4+IFZhZGl2ZWwKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMs
Cj4+PiBNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
