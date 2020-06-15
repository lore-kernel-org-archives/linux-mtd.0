Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED962C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 17:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A9220739
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 17:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SKv0oEvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A9220739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+LDJun7rwAr5FgjW+kjpo6lfluHU8JQIDLzdDWMA3E=; b=SKv0oEvYZmzi1t
	nxr3BVc2sRyHMn64Vl5DJkW5o15i7AQ6wGR+1z8l1D0mNkC0wIxpaQ3cUWPxo7JjScVU3NuVshiCm
	LCsPke1ilyBPnHOCO5Guhsxg+nVDdq8cY8xe4xP8gYcCiKGTD2wWdf7r3SjVqLct4zF00b7F1EpJ1
	ZyMUt6r5zvX40L7cuTbLYCCJHQHT46j0+k43Ek1YsO4eYmvS5Y/Blztusc3wwSSAtE8AE64LO1wUl
	Iyu6bPX73jKrtJJeO2rvH9WXIwlhqihUQKix5rkhv1mAj77U4ucNwAFK/oH2hGryGzPoDZhPAnORo
	bubgUgWL0oBSv9D9Khjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkt2v-0003Lo-Mf; Mon, 15 Jun 2020 17:37:21 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkt2s-0003LH-4G
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 17:37:20 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 30E6B100005;
 Mon, 15 Jun 2020 17:37:14 +0000 (UTC)
Date: Mon, 15 Jun 2020 19:37:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: Ecc error handling on EDU
 transfers
Message-ID: <20200615193712.487d1f85@xps13>
In-Reply-To: <CAC=U0a14R-ZFtwcjESLn67tOfM=DPtdm_Ljuu6Y6Xyx6mRS-Lw@mail.gmail.com>
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
 <20200611054454.2547-2-kdasu.kdev@gmail.com>
 <20200611092707.75da8c6a@xps13>
 <CAC=U0a3RXScu12LkU+hCv_5Lp_he92ExRFSgqLkwx40D6Xtrag@mail.gmail.com>
 <20200612090728.043b6baf@xps13>
 <CAC=U0a1oLPs_=SgUTxYPxiW8JpQXOpz-RbL2KrgzDjutt1v0mQ@mail.gmail.com>
 <20200615091923.0c3c7aa7@xps13>
 <CAC=U0a14R-ZFtwcjESLn67tOfM=DPtdm_Ljuu6Y6Xyx6mRS-Lw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_103718_443675_C28A8FEA 
X-CRM114-Status: GOOD (  31.56  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9u
LCAxNSBKdW4gMjAyMCAxMToxMTowMAotMDQwMDoKCj4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQg
MzoxOSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSBLYW1hbCwKPiA+Cj4gPiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNv
bT4gd3JvdGUgb24gRnJpLCAxMiBKdW4gMjAyMCAxMjozNDoyMgo+ID4gLTA0MDA6Cj4gPiAgCj4g
PiA+IE9uIEZyaSwgSnVuIDEyLCAyMDIwIGF0IDM6MDcgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAKPiA+ID4gPgo+ID4gPiA+IEhpIEthbWFsLAo+
ID4gPiA+Cj4gPiA+ID4gS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9u
IFRodSwgMTEgSnVuIDIwMjAgMTI6MDQ6MjkKPiA+ID4gPiAtMDQwMDoKPiA+ID4gPiAgCj4gPiA+
ID4gPiBPbiBUaHUsIEp1biAxMSwgMjAyMCBhdCAzOjI3IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhp
IEthbWFsLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdt
YWlsLmNvbT4gd3JvdGUgb24gVGh1LCAxMSBKdW4gMjAyMCAwMTo0NDo1NAo+ID4gPiA+ID4gPiAt
MDQwMDoKPiA+ID4gPiA+ID4gIAo+ID4gPiA+ID4gPiA+IEltcGxlbWVudGVkIEVDQyBjb3JyZWN0
YWJsZSBhbmQgdW5jb3JyZWN0YWJsZSBlcnJvciBoYW5kbGluZyBmb3IgRURVICAKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gSW1wbGVtZW50Pwo+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4gcmVh
ZHMuIElmIEVDQyBjb3JyZWN0YWJsZSBiaXRmbGlwcyBhcmUgZW5jb3VudGVyZWQgIG9uIEVEVSB0
cmFuc2ZlciwgIAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBleHRyYSBzcGFjZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+
ID4gcmVhZCBwYWdlIGFnYWluIHVzaW5nIHBpbywgVGhpcyBpcyBuZWVkZWQgZHVlIHRvIGEgY29u
dHJvbGxlciBsbWl0YXRpb24gIAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBzL3Bpby9QSU8vCj4g
PiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4gPiB3aGVyZSByZWFkIGFuZCBjb3JyZWN0ZWQgZGF0YSBp
cyBub3QgdHJhbnNmZXJyZWQgdG8gdGhlIERNQSBidWZmZXIgb24gRUNDCj4gPiA+ID4gPiA+ID4g
ZXJyb3JzLiBUaGlzIGhvbGRzIHRydWUgZm9yIEVDQyBjb3JyZWN0YWJsZSBlcnJvcnMgYmV5b25k
IHNldCB0aHJlc2hvbGQuICAKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZXJyb3IuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IE5vdCBzdXJlIHdoYXQgdGhlIGxhc3Qgc2VudGVuY2UgbWVhbnM/Cj4g
PiA+ID4gPiA+ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBOQU5EIGNvbnRyb2xsZXIgYWxsb3dzIGZv
ciBzZXR0aW5nIGEgY29ycmVjdGFibGUgIEVDQyB0aHJlc2hvbGQgbnVtYmVyCj4gPiA+ID4gPiBv
ZiBiaXRzIGJleW9uZCB3aGljaCBpdCB3aWxsIGFjdHVhbGx5IHJlcG9ydCB0aGUgZXJyb3IgdG8g
dGhlIGRyaXZlci4KPiA+ID4gPiA+IGUuZy4gZm9yIEJDSC00IHRoZSB0aHJlc2hvbGQgaXMgMywg
c28gMy1iaXQgYW5kIDQtYml0IGVycm9ycyB3aWxsCj4gPiA+ID4gPiBnZW5lcmF0ZSBjb3JyZWN0
YWJsZSBFQ0MgaW50ZXJydXB0IGhvd2V2ZXIgMS1iaXQgYW5kIDItYml0IGVycm9ycyB3aWxsCj4g
PiA+ID4gPiBiZSBjb3JyZWN0ZWQgc2lsZW50bHkuCj4gPiA+ID4gPiBGcm9tIHRoZSBhYm92ZSBl
eGFtcGxlIEVEVSBoYXJkd2FyZSB3aWxsIG5vdCB0cmFuc2ZlciBjb3JyZWN0ZWQgZGF0YQo+ID4g
PiA+ID4gdG8gdGhlIERNQSBidWZmZXIgZm9yIDMtYml0IGFuZCA0LWJpdCBlcnJvcnMgdGhhdCBn
ZXQgcmVwb3J0ZWQuIFNvCj4gPiA+ID4gPiBvbmNlIHdlIGRldGVjdAo+ID4gPiA+ID4gdGhlIGVy
cm9yIGR1aW5nIEVEVSB3ZSByZWFkIHRoZSBwYWdlIGFnYWluIHVzaW5nIHBpby4gIAo+ID4gPiA+
Cj4gPiA+ID4gT2sgSSBzZWUgd2hhdCB5b3UgbWVhbiwgY2FuJ3QgeW91IGZha2UgdGhlIHRocmVz
aG9sZCBpbnN0ZWFkPyBUaGUgTkFORAo+ID4gPiA+IGNvbnRyb2xsZXIgaW4gTGludXggaXMgbm90
IHN1cHBvc2VkIHRvIGhhbmRsZSB0aGlzIHRocmVzaG9sZCwgdGhlIE5BTkQKPiA+ID4gPiBjb3Jl
IGlzIGluIGNoYXJnZS4gU28gd2hhdCB0aGUgY29udHJvbGxlciBkcml2ZXIgc2hvdWxkIGRvIGlz
IGp1c3Q6Cj4gPiA+ID4gaW5jcmVhc2UgdGhlIG51bWJlciBvZiBiaXRmbGlwcyArIHJldHVybiB0
aGUgbWF4aW11bSBudW1iZXIgb3IgYml0ZmxpcAo+ID4gPiA+IG9yIGluY3JlYXNlIHRoZSBmYWls
dXJlIGNvdW50ZXIuIElzIHRoaXMgYWxyZWFkeSB0aGUgY2FzZT8KPiA+ID4gPiAgCj4gPiA+IC8q
IHRocmVzaG9sZCA9IGNlaWwoQkNILWxldmVsICogMC43NSkgKi8KPiA+ID4gYnJjbW5hbmRfd3Jf
Y29ycl90aHJlc2goaG9zdCwgRElWX1JPVU5EX1VQKGNoaXAtPmVjYy5zdHJlbmd0aCAqIDMsIDQp
KTsKPiA+ID4gVGhpcyBob3cgdGhlIHRocmVzaG9sZCBpcyBzZXQsIGFsbCBpdCBtZWFucyBpcyB0
aGF0IGZvciBoaWdoIEJDSAo+ID4gPiBsZXZlbHMgZG9uJ3QgaW50ZXJydXB0IG9uIGxvdyBudW1i
ZXIgKGxlc3MgdGhhbiB0aHJlc2hvbGQpIG9mCj4gPiA+IGJpdF9mbGlwcy4gWWVzIHRoZSBjb250
cm9sbGVyIGRyaXZlciBvbmx5IGluY3JlbWVudHMgY29ycmVjdGFibGUgRUNDCj4gPiA+IGNvdW50
LiBCdXQgZHVlIHRoZSBFRFUgZGVzaWduIGFuIEVEVSBvcGVyYXRpb24gaXMgZGlzcnVwdGVkIHdo
ZW4gdGhlCj4gPiA+IGNvbnRyb2xsZXIgaW50ZXJydXB0cyBvbiBjb3JyZWN0YWJsZSBFQ0MgZXJy
b3JzIGR1cmluZyBzdWJwYWdlIEVDQwo+ID4gPiBjYWxjdWxhdGlvbnMuIEhlbmNlIHRoZSBkcml2
ZXIgbmVlZHMgdG8gcmVhZCB0aGUgcGFnZSBhZ2FpbiB3aXRoIFBJTwo+ID4gPiB0byB0cmFuc2Zl
ciBjb3JyZWN0ZWQgZGF0YS4gIAo+ID4KPiA+IElJVUMsIHlvdSBhcmUgZG9pbmcgdGhlIGpvYiB0
d2ljZTogeW91IHNob3VsZCBqdXN0IHJldHVybiBhIG51bWJlciBvZgo+ID4gYml0ZmxpcHMgb3Ig
YW4gZXJyb3IgdG8gdGhlIE5BTkQgY29yZS4gU28gdGhhdCdzIHdoeSBJJ20gdGVsbGluZyB0aGF0
Cj4gPiB5b3Ugc2hvdWxkIGdldCByaWQgb2YgdGhpcyB0aHJlc2hvbGQuIEl0IHdvdWxkIGF2b2lk
IHRoZSBuZWVkIGZvciB0aGUKPiA+IFBJTyB0cmFuc2ZlciB0b28uICAKPiAKPiBJIHRoaW5rIHlv
dSBhcmUgcmVhZGluZyBzb21lIHN0YXRlbWVudHMgaW4gaXNvbGF0aW9uIHRoYXQgcHJvYmFibHkg
YXJlCj4gY2F1c2luZyBzb21lIGNvbmZ1c2lvbi4KPiBFRFUgZGVzaWduIGhhcyBhIGZsYXcgaW4g
Y2FzZSBvZiByZXBvcnRlZCAgRUNDIGVycm9yIGludGVycnVwdCBpbiB0aGF0Cj4gY29ycmVjdGVk
IGRhdGEgaXMgbm90IHRyYW5zZmVycmVkIHRvIHRoZSBETUEgYnVmZmVyLiBUaGUgUElPIGlzIG5l
ZWRlZAo+IHRvIHJlYWQgY29ycmVjdGVkIGRhdGEgaW50byB0aGUgTkFORCBkYXRhIGJ1ZmZlciBh
bmQgb25seSBmb3IgdGhlCj4gcmVwb3J0ZWQgZXJyb3JzLiBTbyB0aGVyZSBpcyBubyBuZWVkIHRv
IGNoYW5nZSB0aGUgdGhyZXNob2xkCj4gY2FsY3VsYXRpb24gbG9naWMsIGlmIHdlIGdldCByaWQg
b2YgdGhlIHRocmVzaG9sZCB0aGVuIHdlIHdpbGwgaGF2ZSB0bwo+IGRvIHRoZSBQSU8gcmVhZCBv
biBhbnkgY29ycmVjdGFibGUgYml0IGVycm9yIGlmIGl0IG9jY3VycyBkdXJpbmcgRURVCj4gcmVh
ZHMuCj4gCj4gPgo+ID4gWW91IGFsc28gc2F5IHRoYXQgdGhlIGNvbnRyb2xsZXIgIm9ubHkgaW5j
cmVtZW50cyBjb3JyZWN0YWJsZSBFQ0MKPiA+IGNvdW50Iiwgd2hhdCBkbyB5b3UgbWVhbiBleGFj
dGx5PyAgCj4gCj4gTWF5YmUgdGhhdCBzdGF0ZW1lbnQgd2FzIGEgYml0IG1pc2xlYWRpbmcuIFRv
IGJlIGNsZWFyIHdoZW4gYW4gRUNDCj4gZXJyb3IgaXMgcmVwb3J0ZWQgdGhlIGNvbnRyb2xsZXIg
Z2l2ZXMgdGhlIGJpdF9mbGlwcyBjb3VudCAgYXMgd2VsbCBhcwo+IHVwZGF0ZXMgdGhlIEVDQyBl
cnJvciBhZGRyZXNzIFJlZ2lzdGVyIGFuZCBlY2MgZXJyb3Igc3RhdHVzIHJlZ2lzdGVycy4KPiBU
aGlzIGxvZ2ljIHdvcmtzIGFzIGV4cGVjdGVkIGluIHRoZSBoYXJkd2FyZS4KPiAKPiA+VGhlIGNv
bnRyb2xsZXIgZG9lcyBub3QgcmVwb3J0IGVycm9ycwo+ID4gd2hlbiB0aGUgbnVtYmVyIG9mIGJp
dGZsaXBzIGhhcHBlbnMgdG8gYmUgYWJvdmUgdGhlIEJDSCB0aHJlc2hvbGQ/IFRoaXMKPiA+IHdv
dWxkIGJlIHRoZSBvbmx5IGNhc2Ugd2hlcmUgd2hhdCBpcyBjdXJyZW50bHkgZG9uZSB3b3VsZCBi
ZSBhY3R1YWxseQo+ID4gbmVlZGVkIHRob3VnaC4gIAo+IAo+ICBJdCdzIHRoZSBvdGhlciB3YXku
IFRoZSBjb250cm9sbGVyIG9ubHkgcmVwb3J0cyBiaXQgZXJyb3JzIGJleW9uZAo+ID49dGhyZXNo
b2xkIHZhbHVlLCB3aWxsIG5vdCByZXBvcnQgb3RoZXJ3aXNlIGFuZCBzaWxlbnRseSBjb3JyZWN0
IHRoZSAgCj4gZGF0YS4gVGhlcmUgaXMgbm8gcHJvYmxlbSBpbiAgY2FzZXMgd2hlcmUgZXJyb3Mg
YXJlIGNvcnJlY3RlZAo+IHNpbGVudGx5LiBOb3cgRUNDICh1biljb3JyZWN0YWJsZSBvbiBFRFUg
cmVhZHMgYXJlIGRldGVjdGVkIGJ5IHNpbXBseQo+IHJlYWRpbmcgYmFjayB0aGUgRUNDIEVycm9y
IGFkZHJlc3MgcmVnaXN0ZXIuIEFuZCBpbiBjYXNlIG9mIHJlcG9ydGVkCj4gdW5jb3JyZWN0YWJs
ZSBFQ0MgZXJyb3JzIGFyZSB0cmVhdGVkIGFzIHVzdWFsLiAgQW5kIGZvciByZXBvcnRlZAo+IGNv
cnJlY3RhYmxlIEVDQyBlcnJvcnMgd2UgbmVlZCB0byByZWFkIHRoZSBwYWdlIGFnYWluIHVzaW5n
IFBJTyBzbwo+IHRoYXQgdGhlIGNvcnJlY3RlZCBkYXRhIGlzIHByb3Blcmx5IHRyYW5zZmVycmVk
LiBBbGwgdGhpcyBhcHBsaWVzIHRvCj4gRURVIHRyYW5zZmVyIG9ubHkuCj4gCgpUaGFuayB5b3Ug
dmVyeSBtdWNoIGZvciB0aGUgZXhwbGFuYXRpb24sIEkgdW5kZXJzdGFuZCBiZXR0ZXIgaG93IHRo
aXMKY29udHJvbGxlciB3b3JrcyBub3cuCgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
