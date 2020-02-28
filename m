Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D945C3F2CF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 07:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005252467B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 07:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfP2pFdh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005252467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/D08/992/Dbimz0J3hscutbIdFDoOL0ETby8nzgg4t4=; b=UfP2pFdhPFTARcoA6yV9+6mUu
	E4hnasmrSgDRs7VX47UUo+GFNol64m9fmHj7KxBqn/lhA5OOZ8CWFLNm6Ov9NVksiTcCjbj8UXY13
	PG/1ajxEUnWUjGRDzuk/OZ/v2U4DKZEQwVcKrS6yNB8s7hO5xFBfAGJ58hbc/0d2Ak7cRABpsDc16
	p4lYq6oDVheiHCxIqiyszwflpspOZ6ZLfRIPQ6+A1ZfVB1IF7ZD5YsSwb9LWfnV7zxKLSE6PTlr86
	n+44+4kNFJGxPxMytOFw8H4wmeqFPwsI+8njei8RfsM2dkPCYMQWZ9emodCEYkTbutSAhym1hgR+a
	Qmj+Epd5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7aSx-00029a-R9; Fri, 28 Feb 2020 07:53:47 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7aSv-00029A-Pk
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 07:53:47 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 23:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,495,1574150400"; d="scan'208";a="385431629"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 27 Feb 2020 23:53:44 -0800
Received: from [10.226.38.23] (unknown [10.226.38.23])
 by linux.intel.com (Postfix) with ESMTP id CE97A5805EF;
 Thu, 27 Feb 2020 23:53:38 -0800 (PST)
Subject: Re: [PATCH v11 2/2] spi: cadence-quadspi: Add support for the Cadence
 QSPI controller
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227062708.21544-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227183032.77ef0795@collabora.com>
 <f82e4964-f030-9aac-5895-a715921ed6db@linux.intel.com>
 <20200228084651.1ad0e334@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <10c5ec3f-8f1e-3f6f-a9cc-c8a3f8f2be75@linux.intel.com>
Date: Fri, 28 Feb 2020 15:53:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200228084651.1ad0e334@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_235345_882999_5962AC67 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: mark.rutland@arm.com, tudor.ambarus@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cyrille.pitchen@atmel.com, marex@denx.de, boris.brezillon@free-electrons.com,
 tien.fong.chee@intel.com, richard@nod.at, simon.k.r.goldschmidt@gmail.com,
 devicetree@vger.kernel.org, cheol.yong.kim@intel.com, robh+dt@kernel.org,
 qi-ming.wu@intel.com, david.oberhollenzer@sigma-star.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, dinguyen@kernel.org,
 broonie@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpPbiAyOC8yLzIwMjAgMzo0NiBQTSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+
IE9uIEZyaSwgMjggRmViIDIwMjAgMTI6MTE6MDkgKzA4MDAKPiAiUmFtdXRoZXZhciwgVmFkaXZl
bCBNdXJ1Z2FuWCIKPiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6Cj4KPj4gSGkgQm9yaXMsCj4+Cj4+ICAgwqDCoMKgwqAgVGhhbmsgeW91IHNvIG11
Y2ggZm9yIHRoZSByZXZpZXcgY29tbWVudHMuLi4KPj4KPj4gT24gMjgvMi8yMDIwIDE6MzAgQU0s
IEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPj4+IE9uIFRodSwgMjcgRmViIDIwMjAgMTQ6Mjc6MDgg
KzA4MDAKPj4+ICJSYW11dGhldmFyLCBWYWRpdmVsIE11cnVnYW5YIgo+Pj4gPHZhZGl2ZWwubXVy
dWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Pj4gICAKPj4+PiBGcm9t
OiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFy
QGxpbnV4LmludGVsLmNvbT4KPj4+Pgo+Pj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgQ2FkZW5jZSBR
U1BJIGNvbnRyb2xsZXIuIFRoaXMgY29udHJvbGxlciBpcwo+Pj4+IHByZXNlbnQgaW4gdGhlIElu
dGVsIExpZ2h0bmluZyBNb3VudGFpbihMR00pIFNvQ3MsIEFsdGVyYSBhbmQgVEkgU29Dcy4KPj4+
PiBUaGlzIGRyaXZlciBoYXMgYmVlbiB0ZXN0ZWQgb24gdGhlIEludGVsIExHTSBTb0NzLgo+Pj4+
Cj4+Pj4gVGhpcyBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBnZW5lcmljIFNQSSBhbmQgYWxzbyB0
aGUgaW1wbGVtZW50YXRpb24KPj4+PiBvbmx5IHN1cHBvcnRzIHNwaS1tZW0gaW50ZXJmYWNlIHRv
IHJlcGxhY2UgdGhlIGV4aXN0aW5nIGRyaXZlciBpbgo+Pj4+IG10ZC9zcGktbm9yL2NhZGVuY2Ut
cXVhZHNwaS5jLCB0aGUgZXhpc3RpbmcgZHJpdmVyIG9ubHkgc3VwcG9ydCBTUEktTk9SCj4+Pj4g
Zmxhc2ggbWVtb3J5Cj4+PiBJcyBpdCByZWFsbHkgc3VwcG9ydGluZyBTUEkgTk9ScyBvbmx5LCBv
ciBpcyBpdCBqdXN0IHRoYXQgeW91IG9ubHkKPj4+IHRlc3RlZCBpdCB3aXRoIGEgc3BpLW5vcj8K
Pj4gVGhlIGV4aXN0aW5nIGRyaXZlcnMvbXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMgc3Vw
cG9ydHMgU1BJLU5PUnMKPj4gb25seSwgYmVjYXVzZSB0aGUgZHJpdmVyIGlzIGRldmVsb3BlZAo+
Pgo+PiBzdWNoIGEgd2F5IHRoYXQgaXQgZG9lcyBub3Qgc3VwcG9ydCBvdGhlciBTUEkgYmFzZWQg
Zmxhc2ggbWVtb3JpZXMsIGFsc28KPj4gbmV2ZXIgdXNlcyBTUEkvU1BJLU1FTSBiYXNlZCBmcmFt
ZXdvcmsuCj4+Cj4+IFNvIHdlIFZpZ25lc2ggc3VnZ2VzdGVkIG1lIHRvwqAgZGV2ZWxvcCB0aGUg
bmV3IGRyaXZlciB3aGljaCBzdXBwb3J0cwo+PiBib3RoIFNQSS1OT1IgYW5kIFNQSS1OQU5EIGJh
c2VkIG9uIHRoZSBTUEktTUVNIGZyYW1ld29yay4KPiBIbSwgeW91ciBjb21taXQgbWVzc2FnZSBt
YWtlcyBpdCBzb3VuZCBsaWtlIGV2ZW4gdGhlIG5ldyBkcml2ZXIgaXNuJ3QKPiBnZW5lcmljIGVu
b3VnaCB0byBzdXBwb3J0IFNQSSBOQU5Ecy4gTWF5YmUgdGhlcmUncyBzb21ldGhpbmcgdG8gaW1w
cm92ZQo+IHRvIGNsYXJpZnkgdGhlIGZhY3QgdGhhdCB0aGlzIG5ldyB2ZXJzaW9uIGlzIG5vdCBs
aW1pdGVkIHRvIFNQSSBOT1JzLgoKVGhhbmtzISBmb3IgdGhlIHN1Z2dlc3Rpb25zIHRvIHJlbWlu
ZCBtZSB0byBhZGQuCgpzdXJlLCBJIHdpbGwgYWRkIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgc3Vw
cG9ydGluZyBTUEktTk9SIGFuZCBTUEktTkFORAoKUmVnYXJkcwpWYWRpdmVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
