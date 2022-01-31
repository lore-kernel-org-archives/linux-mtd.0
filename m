Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5FDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khuzrF8mil1V5DPqY251zQHBkj2id6aqM373AhzRN0Y=; b=Gxe4F2MXxN+vqg
	dYMPMfSIDSJTVH1pOkxcOg+vXbwhcMN+a8oI+3eCdOS2HBlC/2hM9i9J4H+Vw6OsnqqikhB9pnvQF
	1+hB2w4pWAQ+Ay1S6fU2mhTCteZqoB1IFHQmR6RrXm1fY66qnBV5m7FR08oVgI+xF9AEsgLKGt7FP
	bwiPU6D5NgbaO2eT3bGNftG5o5o1awbHGgJciUuSmrGr3WQsBCqHDFC3uW23cWzGyb3YB7H5UqN22
	oPv6HX7GlQAeN81NlxWYk6gEzcxowiCqdEcxFZc9dzICUNeS8SaGkV1+npeXzgCXyfJwoIERMDpbT
	cv3mPvNVL5RTAL2D61hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nETMP-008j9m-5h; Mon, 31 Jan 2022 09:52:33 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nETML-008j80-BR
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 09:52:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6669B100005;
 Mon, 31 Jan 2022 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643622744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HR7lv1T/atYm0h435spzd7hIdETqddhxHf3ercKSY/E=;
 b=DzNdOWCmYphISup4FHoUxnP+Y0rM3AcJduH72xPTeetXuaDyW6CpnnOy2gWw7jwNSnwhDw
 hmmE6rrLvNVmSmIAWvJpuMoHM9tQNpLb+zNxxqdqMSkgRozdXHmWHHL4ErZGqgWomZf3Eb
 c1/R0olzTVt7FqaHwo6yyB00Wa4Ixm2rSx9wNhn4ozVAZYkRNqlSav/9dwmVLDDV4rnE0T
 1Tm+ij2vAbmdcsKHSHI+Arh5YZ3I4jbxvXrCEQT/NeAQbMDppHzeT1+wAxVM3v9GPgmMnj
 JvlMkvH7l/KS8coCouqQCZ8dbjNK6DMuhfho1FBn5+AT8m0VgadRosascbuzVw==
Date: Mon, 31 Jan 2022 10:52:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sricharan Ramabadhran <sricharan@codeaurora.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, ~postmarketos/upstreaming@lists.sr.ht,
 martin.botka@somainline.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, jamipkettunen@somainline.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mdalam@codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Message-ID: <20220131105220.167bacaf@xps13>
In-Reply-To: <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
 <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
 <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_015229_830392_581E7EC4 
X-CRM114-Status: GOOD (  26.44  )
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

SGkgU3JpY2hhcmFuLAoKc3JpY2hhcmFuQGNvZGVhdXJvcmEub3JnIHdyb3RlIG9uIEZyaSwgMjgg
SmFuIDIwMjIgMjM6MjA6MDQgKzA1MzA6Cgo+IEhpIEtvbnJhZCwKPiAKPiBPbiAxLzI4LzIwMjIg
OTo1NSBBTSwgU3JpY2hhcmFuIFJhbWFiYWRocmFuIHdyb3RlOgo+ID4gSGkgTWlxdWVsLAo+ID4K
PiA+IE9uIDEvMjYvMjAyMiA0OjEyIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4gSGkg
TWFuaSwKPiA+Pgo+ID4+IG1hbmlAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIy
IDE2OjAzOjE2ICswNTMwOgo+ID4+ICAKPiA+Pj4gT24gV2VkLCBKYW4gMjYsIDIwMjIgYXQgMTE6
MTY6MTNBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+Pj4gSGVsbG8sCj4gPj4+
Pgo+ID4+Pj4gbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBGcmksIDE0IEphbiAy
MDIyIDA4OjI3OjE4ICswMTAwOiAgCj4gPj4+Pj4gSGkgS29ucmFkLAo+ID4+Pj4+Cj4gPj4+Pj4g
a29ucmFkLmR5YmNpb0Bzb21haW5saW5lLm9yZyB3cm90ZSBvbiBUaHUsIDEzIEphbiAyMDIyIDE5
OjQ0OjI2ID4+Pj4+ICswMTAwOiAgCj4gPj4+Pj4+IFdoaWxlIEkgaGF2ZSBhYnNvbHV0ZWx5IDAg
aWRlYSB3aHkgYW5kIGhvdywgcnVubmluZyA+Pj4+Pj4gY2xlYXJfYmFtX3RyYW5zYWN0aW9uCj4g
Pj4+Pj4+IHdoZW4gUkVBRElEIGlzIGlzc3VlZCBtYWtlcyB0aGUgRE1BIHRvdGFsbHkgY2xvZyB1
cCBhbmQgcmVmdXNlIHRvID4+Pj4+PiBmdW5jdGlvbgo+ID4+Pj4+PiBhdCBhbGwgb24gbWRtOTYw
Ny4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQgYWxsIHRoZSBkYXRhIGdldHMgPj4+Pj4+IGdh
cmJsZWQKPiA+Pj4+Pj4gYW5kIGFmdGVyIGEgc2hvcnQgd2hpbGUgaW4gdGhlIG5hbmQgcHJvYmUg
ZmxvdywgdGhlIENQVSBkZWNpZGVzIHRoYXQKPiA+Pj4+Pj4gc2VwdWt1IGlzIHRoZSBvbmx5IG9w
dGlvbi4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gUmVtb3ZpbmcgX1JFQURJRCBmcm9tIHRoZSBpZiBjb25k
aXRpb24gbWFrZXMgaXQgd29yayBsaWtlIGEgPj4+Pj4+IGNoYXJtLCBJIGNhbgo+ID4+Pj4+PiBy
ZWFkIGRhdGEgYW5kIG1vdW50IHBhcnRpdGlvbnMgd2l0aG91dCBhIHByb2JsZW0uCj4gPj4+Pj4+
Cj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ac29t
YWlubGluZS5vcmc+Cj4gPj4+Pj4+IC0tLQo+ID4+Pj4+PiBUaGlzIGlzIHRvdGFsbHkganVzdCBh
biBvYnNlcnZhdGlvbiB3aGljaCB0b29rIG1lIGFuIGluaHVtYW5lID4+Pj4+PiBhbW91bnQgb2YK
PiA+Pj4+Pj4gZGVidWcgcHJpbnRzIHRvIGZpbmQuLiBwZXJoYXBzIHRoZXJlJ3MgYSBiZXR0ZXIg
cmVhc29uIGJlaGluZCA+Pj4+Pj4gdGhpcywgYnV0Cj4gPj4+Pj4+IEkgY2FuJ3Qgc2VlbSB0byBm
aW5kIGFueSBhbnN3ZXJzLi4gVGhlcmVmb3JlLCB0aGlzIGlzIGEgQklHIFJGQyEgIAo+ID4+Pj4+
IEknbSBhZGRpbmcgdHdvIHBlb3BsZSBmcm9tIGNvZGVhdXJvcmEgd2hvIHdvcmtlZCBhIGxvdCBv
biB0aGlzID4+Pj4+IGRyaXZlci4KPiA+Pj4+PiBIb3BlZnVsbHkgdGhleSB3aWxsIGhhdmUgYW4g
aWRlYSA6KSAgCj4gPj4+PiBTYWRyZSwgSSd2ZSBzcGVudCBhIHNpZ25pZmljYW50IGFtb3VudCBv
ZiB0aW1lIHJldmlld2luZyB5b3VyIHBhdGNoZXMsCj4gPj4+PiBub3cgaXQncyB5b3VyIHR1cm4g
dG8gbm90IHRha2UgYSBtb250aCB0byBhbnN3ZXIgdG8geW91ciBwZWVycwo+ID4+Pj4gcHJvcG9z
YWxzLgo+ID4+Pj4KPiA+Pj4+IFBsZWFzZSBoZWxwIHJldmlld2luZyB0aGlzIHBhdGNoLiAgCj4g
Pj4+IFNvcnJ5LiBJIHdhcyBob3BpbmcgdGhhdCBRY29tIGZvbGtzIHdvdWxkIGNoaW1lIGluIGFz
IEkgZG9uJ3QgaGF2ZSA+Pj4gYW55IGlkZWEKPiA+Pj4gYWJvdXQgdGhlIG1kbTk2MDcgcGxhdGZv
cm0uIEl0IGNvdWxkIGJlIHRoYXQgdGhlIG1haWwgc2VydmVyID4+PiBtaWdyYXRpb24gZnJvbQo+
ID4+PiBjb2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFycmllciBoZXJlLgo+ID4+Pgo+ID4+
PiBMZXQgbWUgcGluZyB0aGVtIGludGVybmFsbHkuICAKPiA+PiBPaCwgb2ssIEkgZGlkbid0IGtu
b3cuIFRoYW5rcyEgIAo+ID4KPiA+IMKgwqAgU29ycnkgTWlxdWVsLCBzb21laG93IHdlIGRpZCBu
b3QgZ2V0IHRoaXMgZW1haWwgaW4gb3VyIGluYm94Lgo+ID4gwqDCoCBUaGFua3MgdG8gTWFuaSBm
b3IgcGluZ2luZyB1cywgd2Ugd2lsbCB0ZXN0IHRoaXMgdXAgdG9kYXkgYW5kIGdldCA+IGJhY2su
Cj4gPiAgCj4gIMKgIMKgIMKgIFdoaWxlIHdlIGNvdWxkIG5vdCByZXByb2R1Y2UgdGhpcyBpc3N1
ZSBvbiBvdXIgaXBxIGJvYXJkcyAoZG8gbm90IGhhdmUgYSBtZG05NjA3IHJpZ2h0IG5vdykgYW5k
Cj4gIMKgwqDCoMKgwqDCoCBpc3N1ZSBkb2VzIG5vdCBsb29rIGFueSBvYnZpb3VzLgo+ICDCoCDC
oCDCoCBjYW4geW91IHBsZWFzZSBnaXZlIHRoZSBkZWJ1ZyBsb2dzIHRoYXQgeW91IGRpZCBmb3Ig
dGhlIGFib3ZlIHN0YWdlIGJ5IHN0YWdlID8KClRoYW5rcyBmb3Igc3RlcHBpbmcgdXAsIGl0IGlz
IHJlYWxseSBhcHByZWNpYXRlZCwgZ29vZCBsdWNrIGJvdGggZm9yCnRoZSBkZWJ1Z2dpbmcuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
