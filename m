Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C256C352BE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 09:35:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C75F21BE5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 09:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fQOywyGI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C75F21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OfhaHyZL8kJm8emi2SQoFg6fhN4C9HgNk8gZ5jKXqQE=; b=fQOywyGIDMsZkKdd4m+z3FE9o
	XPP6/i62zCVN7zZiGkU5D2lfSVoMTypf+zQEbQCH0tX0LtR/4O9cE/bxZmxyPo9MmVcrw3JVnTtAO
	AAYMmAuD7koOdAZ9Xp0jV5Nrc8ej6hh96u6lM98mieaXeb4V09lCpDJcVvMUxb2wCQ0RMJf1MMf8y
	kS+ImM2abF2mZ3aknkziwBGShhpYTuJJzI/5toU9bA1ei2At5eYoFEo6YPigMHaVS900Sy6HrD65V
	K40eCkjmyGt1dkctErlHxKNluzVfue9b+Hq6SbWwmruLBOKpfKEdjpyI3BQWODt99lgmr0yoX2v7v
	7LlUzDKBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP0vr-0003W5-Sz; Thu, 16 Apr 2020 09:35:39 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP0vo-0003Ut-95
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 09:35:37 +0000
IronPort-SDR: D57FNaGEF6n2no377Doq1kZsjGFyS1l/rjRLV/1mufXUAztbmIKYxsYirF89mqWPkkmoV4nX6B
 9xDi+XQx51Lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 02:35:32 -0700
IronPort-SDR: xTBdCFZ+AyNj7x+sI6oWf2cORZqbOuteXGFH1D7+A8fhQKnjpK5phcfYqEG1bS0ATPkjdpf+ub
 aTAjF3ZJiA6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="242595587"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 16 Apr 2020 02:35:32 -0700
Received: from [10.255.154.239] (vramuthx-MOBL1.gar.corp.intel.com
 [10.255.154.239])
 by linux.intel.com (Postfix) with ESMTP id 3F5C05803E3;
 Thu, 16 Apr 2020 02:35:28 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
Date: Thu, 16 Apr 2020 17:35:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_023536_367231_9C2A8145 
X-CRM114-Status: GOOD (  16.44  )
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
 vigneshr@ti.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKIMKgwqDCoCBUaGFuayB5b3Ugc28gbXVjaCBmb3IgcmV2aWV3IGNvbW1lbnRz
IGFuZCB5b3VyIHRpbWUuLi4KCk9uIDE2LzQvMjAyMCA2OjA1IGFtLCBNYXJ0aW4gQmx1bWVuc3Rp
bmdsIHdyb3RlOgo+IEhpLAo+Cj4gZmlyc3Qgb2YgYWxsOiB0aGFuayB5b3UgZm9yIHdvcmtpbmcg
b24gdXBzdHJlYW1pbmcgdGhpcy4KPiBFc3BlY2lhbGx5IHNpbmNlIHlvdSBhcmUgZ29pbmcgdG8g
dXNlIHRoZSBuZXcgZXhlY19vcCBzdHlsZSBpbiB2MiBhcwo+IEJvcmlzIHN1Z2dlc3RlZC4KPgo+
PiBGcm9tOiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11
dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgSVAg
b2YgTmFuZCBGbGFzaCBDb250cm9sbGVyKE5GQykgc3VwcG9ydAo+PiBvbiBJbnRlbCdzIExpZ2h0
bmluZyBNb3VudGFpbihMR00pIFNvQy4KPj4KPj4gRE1BIGlzIHVzZWQgZm9yIGJ1cnN0IGRhdGEg
dHJhbnNmZXIgb3BlcmF0aW9uLCBhbHNvIERNQSBIVyBzdXBwb3J0cwo+PiBhbGlnbmVkIDMyYml0
IG1lbW9yeSBhZGRyZXNzIGFuZCBhbGlnbmVkIGRhdGEgYWNjZXNzIGJ5IGRlZmF1bHQuCj4+IERN
QSBidXJzdCBvZiA4IHN1cHBvcnRlZC4gRGF0YSByZWdpc3RlciB1c2VkIHRvIHN1cHBvcnQgdGhl
IHJlYWQvd3JpdGUKPj4gb3BlcmF0aW9uIGZyb20vdG8gZGV2aWNlLgo+IEkgYW0gd29uZGVyaW5n
IGhvdyB0aGlzIG5ldyBoYXJkd2FyZSBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgTGFudGlxIE5BTkQK
PiBjb250cm9sbGVyIElQIC0gZm9yIHdoaWNoIHRoZXJlIGlzIGFscmVhZHkgYSBkcml2ZXIgaW4g
bWFpbmxpbmUgKGl0J3MKPiBpbiBkcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYykuCj4g
VGhlIENPTiBhbmQgV0FJVCByZWdpc3RlcnMgbG9vayBzdXNwaWNpb3VzbHkgc2ltaWxhci4KPgo+
IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgdGhlICJvbGQiIFNvQ3MgKFZSWDIwMCBhbmQgZWFybGll
cikgZG9uJ3QgaGF2ZQo+IGEgYnVpbHQtaW4gRUNDIGVuZ2luZS4gVGhpcyBzZWVtcyB0byBoYXZl
IGNoYW5nZWQgd2l0aCBBUlgzMDAgdGhvdWdoCj4gKGFnYWluLCBBRkFJSykuCj4KPiBBIGJpdCBv
ZiBsaW5lYWdlIG9uIHRoZXNlIFNvQ3MgKGluaXRpYWxseSB0aGVzZSB3ZXJlIGRldmVsb3BlZCBi
eQo+IEluZmluZW9uLiBMYW50aXEgdGhlbiBzdGFydGVkIGFzIGFuIEluZmluZW9uIHNwaW4tb2Zm
IGluIDIwMDkgYW5kCj4gd2FzIHRoZW4gYWNxdWlyZWQgYnkgSW50ZWwgaW4gMjAxNSk6Cj4gLSBE
YW51YmUKPiAtIEFSWDEwMCBmcm9tIDIwMDgvMjAwOQo+IC0gVlJYMjAwIGZyb20gMjAwOS8yMDEw
Cj4gLSBBUlgzMDAgZnJvbSAyMDE0Cj4gLSBHUlgzNTAgZnJvbSAyMDE1LzIwMTYKPiAtIEdSWDU1
MCBmcm9tIDIwMTcKPiAtIGFuZCBub3cgZmluYWxseTogTEdNIGZyb20gMjAyMCAoZXN0LikKPgo+
IFRoZSBleGlzdGluZyB4d2F5X25hbmQgZHJpdmVyIHN1cHBvcnRzIHRoZSBEYW51YmUsIEFSWDEw
MCBhbmQgVlJYMjAwCj4gU29Dcy4KTGFudGlxIHVwc3RyZWFtZWQgYSBkcml2ZXIgZm9yIGFuIG9s
ZGVyIHZlcnNpb24gb2YgdGhpcyBJUCBjb3JlIDggeWVhcnMgCmFnbywgc2VlIGhlcmU6Cmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjUuNi9zb3VyY2UvZHJpdmVycy9tdGQvbmFu
ZC9yYXcveHdheV9uYW5kLmMgCkl0IGRvZXMgbm90IHN1cHBvcnQgRE1BIGFuZCBFQ0MuClRoaXMg
dXBzdHJlYW0gZHJpdmVyIHdvcmtzIHdpdGggdGhlIHhyeDIwMCwgSSBkbyBub3Qga25vdyBob3cg
d2VsbCBpdCAKd29ya3Mgd2l0aCBvdGhlciBTb0NzLgoKUmVnYXJkcwpWYWRpdmVsCj4KPgo+IEJl
c3QgcmVnYXJkcywKPiBNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
