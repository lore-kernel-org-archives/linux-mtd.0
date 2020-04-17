Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E893C2BB1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 05:11:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28BA2223C
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 05:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwRriccV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28BA2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TjdjPl/OZtkHAy6Ebppfql8gZ1R/bhzdwHBogHb6Xpk=; b=EwRriccVDwlAtBcxL8ITIJnk9
	cqH4x0omd5aAOCz6Iz5bJda4kT3mXXNLwhjU1OMtIdvSrDZvewbPXSpvTkN6ALwQTt4D//Ip0CjoT
	L+vztCm327IZSB/X2NbQt3QZfP6SDTHiBpUCwZ0UfdfcTLkfChCPOUvzEKvYoOLNvQ0m6B4S+Gxtx
	x73+/0CtXLscscdXxES+GqMA6RkQ96G7aKDLR6GLYXAHoQFwAcqPM72zV3dgjqzvL6N9QPRQhS7+s
	BumyMPUnFjcOR9C+Viqn/mCaGrHTC0CFUBoBVd9+hI13UaVmoviq79w5wq/O9HGV+yky/fhY+jyLw
	57LIazS9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPJHE-0003wT-59; Fri, 17 Apr 2020 05:10:56 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPJHA-0003vf-29
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 05:10:54 +0000
IronPort-SDR: ZdsePnCuS3pR2G73fxOc5Msp45v0ISe1nLdgfjrpLaXj6cWyW+J53T65PTIqAgS/C5KDKG8vkL
 uoZYK0EDeMFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 22:10:49 -0700
IronPort-SDR: Ru+AzaksJhRHLDZOjcFgQYBfOUAcETbupMhsMVFpsNC8dGKJHTKDJbEIdtNPHMYgY9m8+OdLLs
 jUukL2Thokdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; d="scan'208";a="244610530"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2020 22:10:49 -0700
Received: from [10.255.156.142] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.156.142])
 by linux.intel.com (Postfix) with ESMTP id 592125802C9;
 Thu, 16 Apr 2020 22:10:44 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
 <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
 <20200416131725.51259573@collabora.com>
 <20200416113250.GA185537@smile.fi.intel.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <c8611110-d2ce-7d16-3acc-974d37ab116a@linux.intel.com>
Date: Fri, 17 Apr 2020 13:10:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416113250.GA185537@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_221052_924805_BEA04C8E 
X-CRM114-Status: GOOD (  12.93  )
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
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKCk9uIDE2LzQvMjAyMCA3OjMyIHBtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMTYsIDIwMjAgYXQgMDE6MTc6MjVQTSArMDIwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+PiBPbiBUaHUsIDE2IEFwciAyMDIwIDE4OjQwOjUzICswODAwCj4+ICJSYW11dGhl
dmFyLCBWYWRpdmVsIE11cnVnYW5YIgo+PiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+Cj4+Pj4+PiB3ZSdsbCBiZSBoYXBweSB0byBoYXZlIG9u
ZSBtb3JlIG9mIHRoZSBleGlzdGluZyBkcml2ZXIgY29udmVydGVkIHRvCj4+Pj4+PiAtPmV4ZWNf
b3AoKSA7LSkuCj4+Pj4+IEkgaGF2ZSBjb21wbGV0ZWx5IGFkYXB0ZWQgdG8gLT5leGVjX29wKCkg
aG9vayB1cCB0byByZXBsYWNlIHRoZSBsZWdhY3kKPj4+Pj4gY2FsbC1iYWNrLgo+Pj4+IEkgc3Vz
cGVjdCBwb3J0aW5nIHdoYXQgeW91J3ZlIGRvbmUgdG8gdGhlIHh3YXkgZHJpdmVyIHNob3VsZG4n
dCBiZSB0b28KPj4+PiBjb21wbGljYXRlZC4KPj4+IE5vdCBwb3J0ZWQgZnJvbSB4d2F5X25hbmQu
YyBkcml2ZXIgLCB3ZSBoYXZlIGRldmVsb3BlZCBmcm9tIHRoZSBzY3JhdGNoCj4+PiB0byBtYWtl
IGl0IHdvcmsgb24KPj4+IEludGVsIExHTSBTb0MgLCBpdCdzIG5ldyB4ODYgQVRPTSBiYXNlZCBT
b0MsIElQIGl0c2VsZiBjb21wbGV0ZWx5Cj4+PiBkaWZmZXJlbnQgYW5kIG1vc3Qgb2YgdGhlIHJl
Z2lzdGVycyB3b24ndCBtYXRjaC4KPj4+IGlmIHdlIHBvcnQgdGhlbiBpdCB3b3VsZCBiZSB1Z2x5
IGFuZCBhbHNvIHdoYXQgYXJlIHRoZSBwcm9ibGVtIG1heSBvY2N1cgo+Pj4gd2UgZG8gbm90IGtu
b3cuCj4+IFNvcnJ5IGJ1dCBJTU8gdGhleSBsb29rIHNpbWlsYXIgZW5vdWdoIHRvIHRyeSB0byBt
ZXJnZSB0aGVtLgo+IEkgYWdyZWUuIEkgdHJpZWQgdG8gY29udmluY2UgdGhlbSBpbnRlcm5hbGx5
Li4uIGJ1dCBoZXJlIHdlIGFyZS4KCkFncmVlZCzCoCB3aWxsIGRvIHRoZSBjaGFuZ2VzIGFzIEJv
cmlzIGFuZCBNYXJ0aW4gc3VnZ2VzdGVkLCBUaGFua3MhCgpSZWdhcmRzClZhZGl2ZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
