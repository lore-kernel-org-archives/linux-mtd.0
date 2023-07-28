Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E5DC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 07:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbdkZX7NczQjsjlUSzV/hYQ6Nl5zcQpKwtiNZQanpsc=; b=JyCMhjbxcaLYMM
	kq/LY+CIrD5oaKF0Z4M6uaZkCb2/xv471fELZzfIuKvevjMNh7ew5GnjKwzFNYObCvLt3taSJ+ZYv
	mpSp8fE/kJJwqt2GpTZvpxMMqmMPXPpDP/OvUaGCgECiBo7tcm/oLTeSeVoPLKCxi4CUwNmL23zuP
	Q4pgfLhl9ndl7Sv8FuSLXRRvHsj8CWaVqNlm+uxh1kGvuDKQzM48THBLn5TDiWZ7HCninDBkbDK47
	1LFvgBq2Zfbq7hofuw9kUMqDRyWRl2qQV5B8APz3Wj4mHyT2ftUydz153SbkLwcUTLsYaN7jAzYFy
	+QMsrgPZULKjQEE6/KeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIJz-002EOz-2r;
	Fri, 28 Jul 2023 07:55:35 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPIJu-002E8I-1g;
	Fri, 28 Jul 2023 07:55:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 250B6240010;
	Fri, 28 Jul 2023 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690530922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K96cGuEOY3+n2IOs44s3YjSv77vXKzK1nuGzDr3TBic=;
	b=AMohMjUKIqVuZzhoVOQK/Uqg4L7adwBmSgSzsx8Eeq8bXNU7hEI3srJFPjgKvZxxFMPWS1
	t+geZnu8JVyggna4ZagqPqgw0tGrMDjEpfhiwe5Rms0cNgU/vWEJWW8EuMYnxZSG1Qmeh/
	o3nbr9V7RnY6P11KE2RE2QAKcIlOqc5yw9hc6LRal+xWjhRs0X8MQeeTZC3ljdMXFLO0LR
	bOEReSSmWeGFma+1K6Vf1uM1gtkKRGKRwyAYTMd3k/PNxCVKTVvf8mjKEEjQndaBmspPu8
	FdTHCZx692Qjxmg61dPZ+8dv4D9avC5StowkYSwnbpYOCTHJ5aAFmaWglvdrXg==
Date: Fri, 28 Jul 2023 09:55:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, "Michael Walle" <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Message-ID: <20230728095518.1b93454f@xps-13>
In-Reply-To: <f022d84c-0fe1-7b21-eccf-bc0ba4fd871f@quicinc.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
	<20230716144612.32132-9-miquel.raynal@bootlin.com>
	<20230717063843.GA7062@thinkpad>
	<20230727165923.32488041@xps-13>
	<9d8296a4-8566-cc83-2ef8-3589afeb22f2@quicinc.com>
	<f022d84c-0fe1-7b21-eccf-bc0ba4fd871f@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_005530_865754_64046386 
X-CRM114-Status: GOOD (  17.46  )
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

SGkgU3JpY2hhcmFuLAoKcXVpY19zcmljaGFyYUBxdWljaW5jLmNvbSB3cm90ZSBvbiBGcmksIDI4
IEp1bCAyMDIzIDA5OjQ0OjM3ICswNTMwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gNy8yOC8yMDIz
IDg6MDMgQU0sIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3cm90ZToKPiA+IEhpIE1pcXVlbCwKPiA+
IAo+ID4gT24gNy8yNy8yMDIzIDg6MjkgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+PiBI
aSBTYWRyZSwKPiA+Pgo+ID4+IG1hbmlAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDE3IEp1bCAy
MDIzIDEyOjA4OjQzICswNTMwOgo+ID4+ICAKPiA+Pj4gT24gU3VuLCBKdWwgMTYsIDIwMjMgYXQg
MDQ6NDY6MTJQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+Pj4gVGhlIG5hZGRy
cyB2YXJpYWJsZSBpcyBpbml0aWFsaXplZCBidXQgbm90IHVzZWQuIEZpeGluZyB0aGlzIGNvdWxk
IGhhdmUKPiA+Pj4+IGJlZW4gYSBtYXR0ZXIgb2YgZHJvcHBpbmcgdGhlIHZhcmlhYmxlLCBidXQg
dGhlIHJpZ2h0IHdheSB0byBkbyBpdCA+Pj4+IGxvb2tzCj4gPj4+PiBhIGJpdCBtb3JlIGNvbXBs
ZXg6IHdlIGNhbiBhdm9pZCB1c2VsZXNzIHdyaXRlcyB0byB0aGUgcV9vcCA+Pj4+IHN0cnVjdHVy
ZSBieQo+ID4+Pj4gdXNpbmcgaXQuIEluIHByYWN0aWNlIHdlIGNvdWxkIGV2ZW4gaGF2ZSBwb3Nz
aWJsZSBvdXQtb2YtYm91bmQgYnVncyA+Pj4+IHdpdGgKPiA+Pj4+IHRoZSBleGlzdGluZyBpbXBs
ZW1lbnRhdGlvbi4gTGV0J3MgZml4IGFsbCB0aGF0IGJ5IGp1c3QgcGVyZm9ybWluZyB0aGUKPiA+
Pj4+IHJpZ2h0IG51bWJlciBvZiBhc3NpZ25tZW50cyBpbiB0aGUgYWRkcnsxLDJ9X3JlZyBmaWVs
ZHMuCj4gPj4+Pgo+ID4+Pj4gRml4ZXM6IDg5NTUwYmViMDk4ZSAoIm10ZDogcmF3bmFuZDogcWNv
bTogSW1wbGVtZW50IGV4ZWNfb3AoKSIpCj4gPj4+PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPj4+PiBDbG9zZXM6ID4+Pj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDcxMzE5NTkuUGRQU0M4NkstbGtwQGludGVsLmNv
bS8gPj4+Pgo+ID4+Pj4gQ2xvc2VzOiA+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyMzA3MTMxNzMwLk5PWWJjakJyLWxrcEBpbnRlbC5jb20vID4+Pj4KPiA+Pj4+
IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
ICAKPiA+Pj4KPiA+Pj4gTEdUTSEgQnV0IEknbSByZWx5aW5nIG9uIFNhZHJlIHRvIHRlc3QgaXQu
Cj4gPj4+Cj4gPj4+IEFja2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVs
Lm9yZz4gIAo+ID4+Cj4gPj4gSSBkb24ndCB0aGluayBJJ3ZlIHJlY2VpdmVkIGZlZWRiYWNrIGZy
b20gU2FkcmUsIEkgd291bGQgbGlrZSB0byBjbG9zZQo+ID4+IHRoZXNlIGlzc3VlcywgY2FuIHlv
dSBwbGVhc2UgdGVzdCBhbmQgZ2l2ZSB1cyBmZWVkYmFjaz8KPiA+PiAgCj4gPiAKPiA+ICDCoFNv
cnJ5IGZvciB0aGUgZGVsYXkgaW4gcmVzcG9uc2UuIFRlc3RpbmcgdGhpcywgd2lsbCByZXNwb25k
IGJhY2sKPiA+ICDCoHNob3J0bHkgdG9kYXkuICAKPiAKPiAgIFRlc3RlZCB0aGlzIHNlcmllcyBv
biBpcHE4MDc0LWhrMDEgYm9hcmQuCj4gICBUZXN0ZWQgYm9vdGNoZWNrLCBib3RoIC9kZXYvbXRk
IGFuZCAvZGV2L210ZGJsb2NrIGZvciBkYXRhIGludGVncml0eS4KPiAgIEFsbCBsb29rcyBmaW5l
LiBTbywKPiAKPiAgIFRlc3RlZC1ieTogU3JpY2hhcmFuIFJhbWFiYWRocmFuIDxxdWljX3NyaWNo
YXJhQHF1aWNpbmMuY29tPgoKVGhhbmtzIGZvciB0aGUgdGVzdCEgSSdsbCB0YWtlIHRoZSBzZXJp
ZXMgbm93IHRoZW4uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
