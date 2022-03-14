Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5C1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJSapywnKQb4kHU7S4QY1D7MgH25RY/CTAqhmXOuu2I=; b=IQdJM2PoEoel4R
	9hz+S86H7HiD/IjCL0NwRQ2FfYR5CWNcFKarsiYuMkQ2PZzAya84DNt3QNigBzEI39xfa0omS/9Dh
	4pDBC5FiJbv/r8WN/WhXwZPcVFbjFkp+BXkGbdKYXB2E/Fbhd3oIUOmki1BR0fVFfGjSdNehOkogs
	xT48f1SOOQSLmkIkKoNSF6Tdl2qiYaifgrlBhE9gZoL8J80X88Rq764+zgkbkn56Aax0XCflcKg7G
	8jBAV6TZ2/ND5OI5M45g5jdkuI1Zcj6T2XJSIFNhqFBHgDqRGUG0Hp5ZGahfxLYJr5sMhiggU3PXL
	zEoUzXolkr/07PmH7Vvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmsi-005ry4-OI; Mon, 14 Mar 2022 15:45:12 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmse-005rvs-O1
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 15:45:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F69060009;
 Mon, 14 Mar 2022 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647272706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2ZdDV/3515aZu4xug8rvVqDw0nm/BSTwPXBDEPxvZw=;
 b=fuFJ7z2nc+yFmTBejxFMcOn+c0fhlysGrr5PQIsPvk+vWKuCnZGFOvx7tPmwdnW+BK/3fZ
 mOtWmyxsamviE5xE0g9QVffUIS53j/Uz6XTXD0BIPluHKCNafmE3xZCsH1GQdkuhrXdcoC
 qd2zd87mhJ+TF0gOMDGyEtdAuMwN4yJxnh3e1gbL16nPx/QHOxYktWQyjbXKCU2PTP+mqv
 H0F3Q84vP5qOtWYJDgtnIeUX4+srE3Nqvm/0HF8cYbrOOAw0x+shhkYECAJNdmwFW3DB+w
 ItN3EMWMVLS5k/iQ2uOhes97yaF9MD204Utbzdk+BtWh1FkAEKjUHx791e8iag==
Date: Mon, 14 Mar 2022 16:45:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel =?UTF-8?B?R2zDtmNrbmVy?= <dg@emlix.com>
Cc: Han Xu <han.xu@nxp.com>, linux-mtd@lists.infradead.org, Lothar
 =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: Make NAND_BBT_NO_OOB_BBM configurable or let the gpmi driver
 decide?
Message-ID: <20220314164505.3affb1c8@xps13>
In-Reply-To: <6ba60b49-1e12-01a3-842f-4f6c96998a04@emlix.com>
References: <79beb2ef-7336-f067-5418-3fe62aa928d2@emlix.com>
 <20220222220235.pyvhaiieimf7uv74@umbrella>
 <3b9d1eb5-1fd7-7aab-b2b9-7cbfda8831b8@emlix.com>
 <20220224162958.184079e4@xps13>
 <0a5497bf-7716-e8c8-7e79-7df6602d5104@emlix.com>
 <20220224170357.1f99a77a@xps13>
 <6ba60b49-1e12-01a3-842f-4f6c96998a04@emlix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_084509_097968_77565C07 
X-CRM114-Status: GOOD (  32.00  )
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

SGkgRGFuaWVsLAoKU29ycnkgZm9yIHRoZSBkZWxheS4KCmRnQGVtbGl4LmNvbSB3cm90ZSBvbiBU
aHUsIDI0IEZlYiAyMDIyIDE5OjE3OjQzICswMTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gQW0gMjQu
MDIuMjIgdW0gMTc6MDMgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+ID4gZGdAZW1saXguY29tIHdy
b3RlIG9uIFRodSwgMjQgRmViIDIwMjIgMTY6NTU6MjcgKzAxMDA6ICAKPiA+PiBBbSAyNC4wMi4y
MiB1bSAxNjoyOSBzY2hyaWViIE1pcXVlbCBSYXluYWw6ICAKPiA+Pj4gZGdAZW1saXguY29tIHdy
b3RlIG9uIFdlZCwgMjMgRmViIDIwMjIgMTE6NTk6MDIgKzAxMDA6ICAgIAo+ID4+Pj4gQW0gMjIu
MDIuMjIgdW0gMjM6MDIgc2NocmllYiBIYW4gWHU6Pj4+IENvdWxkIHlvdSBwbGVhc2UgZGVzY3Jp
YmUgbW9yZSBkZXRhaWxzIGFib3V0IHdoYXQga2luZCBvZiBlcnJvciwgaG93IHRvICAgIAo+ID4+
Pj4+IHJlcHJvZHVjZSBpdCBhbmQgb24gd2hpY2gga2VybmVsIHZlcnNpb24/ICAgICAgCj4gPj4+
Pgo+ID4+Pj4gWW91IG5lZWQgYSBmbGFzaCB0aGF0IGhhcyBvbmUgYmFkIGJsb2NrIHdoZXJlIHBy
b2dyYW1taW5nIHRoZSBCQk0gc2V0cwo+ID4+Pj4gTkFORF9TVEFUVVNfRkFJTCBpbiBpdHMgc3Rh
dHVzIHJlZ2lzdGVyLiBUaGUgbGF0ZXN0IGtlcm5lbHMgc2hvdWxkIHN0aWxsCj4gPj4+PiBoYXZl
IHByb2JsZW1zIHdoZW4gdGhpcyBoYXBwZW5zIGluIGEgVUJJLiAgICAKPiA+Pj4KPiA+Pj4gSSBi
ZWxpZXZlIHdlIHNob3VsZCB0cnkgdG8gdGFja2xlICJ3aHkiIHRoaXMgaGFwcGVucyBtb3JlIHRo
YW4gdHJ5IHRvCj4gPj4+IHdvcmthcm91bmQgaXRzIGNvbnNlcXVlbmNlcy4gQ2FuIHlvdSBnaXZl
IG1vcmUgZGV0YWlscyBhYm91dCB3aHkgd2UgZ2V0Cj4gPj4+IHRoaXMgc3RhdHVzPyAgICAKPiA+
Pgo+ID4+IFVobSwgdGhlIGJsb2NrIGlzIGJhZCwgYnJva2VuLiBJdCBzaG93cyB0aGUgc2FtZSBi
ZWhhdmlvciBldmVuIGFmdGVyCj4gPj4gcG93ZXIgY3ljbGluZy4gVGhlIG90aGVyIGJsb2NrcyBh
cmUgb2suIEkgZG9uJ3QgdGhpbmsgaXQgaXMgb3VyIGZhdWx0Cj4gPj4gdGhhdCBpdCBkaWVkIHNv
IGVhcmx5LiAgCj4gPiAKPiA+IEJ1dCB3aHkgYWZ0ZXIgYSBwb3dlciBjeWNsZSBhcmUgd2UgdHJ5
aW5nIHRvIHdyaXRlIHRoZSBCQk0/ICAKPiAKPiBJIGRpZCBub3Qgd2FudCB0byBpbXBseSB0aGF0
IExpbnV4IHRyaWVzIHRvIHdyaXRlIHRoZSBibG9jayBhZnRlciBldmVyeQo+IHBvd2VyIGN5Y2xl
LiBVQkkgbm90aWNlcyB0aGF0IHRoZSBibG9jayBpcyBicm9rZW4gb25jZSBhbmQgbWFuYWdlcyB0
bwo+IG1hcmsgaXQgYXMgYmFkIGluIHRoZSBCQlQsIHNvIGFmdGVyIHBvd2VyIGN5Y2xlIGl0IHdp
bGwgbm90IHRyeSB0byB3cml0ZQo+IHRvIHRoYXQgYmxvY2sgYWdhaW4uIFdoYXQgSSB3YW50ZWQg
dG8gc2F5IGlzIHRoYXQgbWFudWFsIHRlc3Rpbmcgb2YgdGhlCj4gYmxvY2sgYWZ0ZXIgcG93ZXIg
Y3ljbGluZyBzaG93cyB0aGF0IHRoZSBibG9jayByZW1haW5zIHVudXNhYmxlLgo+IAo+IFRoZSBw
cm9ibGVtIGlzIHRoYXQgVUJJIHN3aXRjaGVzIHRvIHJlYWQtb25seSBtb2RlIGFmdGVyIGl0IG1h
cmtlZCB0aGUKPiBibG9jayBhcyBiYWQgaW4gdGhlIEJCVCBiZWNhdXNlIHRoZSByZWR1bmRhbnQg
QkJNIGluIHRoZSBPT0Igb2YgdGhlCj4gYmxvY2sgY291bGQgbm90IGJlIHdyaXR0ZW4uCgpJIHRo
aW5rIEkgdW5kZXJzdGFuZCBiZXR0ZXIgeW91ciBzaXR1YXRpb24gbm93LgoKU28gaGVyZSBpcyBv
dXIgcHJvYmxlbSA6IHdoeSBjYW4ndCB3ZSB3cml0ZSB0aGUgT09CPyBJZiB0aGVyZSBpcyBhIGdv
b2QKcmVhc29uIHRoaXMgY2Fubm90IGhhcHBlbiwgdGhlbiB3ZSBjYW4gcHJvdmlkZSB0aGUgTkFO
RF9CQlRfTk9fT09CX0JCTQpmbGFnLiBPdGhlcndpc2Ugd2Ugc2hvdWxkIGZpbmQgdGhlIHJvb3Qg
Y2F1c2UuCgo+IEFuZCB3ZSBkb24ndCB3YW50IHRvIGdldCBpbnRvIGEgc2l0dWF0aW9uCj4gd2hl
cmUgd2UgaGF2ZSB0byByZWJvb3QgdGhlIHN5c3RlbSwgZXNwZWNpYWxseSBpZiBpdCBpcyBiZWNh
dXNlIG9mCj4gc29tZXRoaW5nIHdlIGRvbid0IG5lZWQuCj4gCj4gV2UgY291bGQgY2hhbmdlIG5h
bmRfYmxvY2tfbWFya2JhZF9sb3dsZXZlbCB0byByZXR1cm4gc3VjY2VzcyBhcyBsb25nCj4gYXMg
dXBkYXRpbmcgdGhlIEJCVCBzdWNjZWVkcywgaWYgeW91IHRoaW5rIHRoYXQgdGhpcyBpcyB0aGUg
Y29ycmVjdAo+IGFwcHJvYWNoLgoKVGhhdCBpcyBub3QgYSBjb3JyZWN0IGFwcHJvYWNoIGlmIHdl
IGRpZCBub3QgYXNrZWQgdG8gYnlwYXNzIHdyaXRpbmcKQkJNcyBleHBsaWNpdGx5LgoKPiA+IElz
IGl0IHRoYXQgdGhlcmUgYXJlIHRvbyBtYW55IEVDQyBlcnJvcnMgYW5kIHNvIHdoZW4gcmVhZGlu
ZyB0aGUgYmxvY2sgaXQKPiA+IGlzIGRlY2xhcmVkIGJhZCBhbmQgdGhlIHN5c3RlbSB0cmllcyB0
byBzZXQgdGhlIEJCTS9CQlQgYml0PyBPciBpcyBpdAo+ID4gYWxyZWFkeSBtYXJrZWQgYmFkIHNv
bWV3aGVyZSBhbmQgc29tZXRoaW5nIHNpbGx5IGhhcHBlbnMgd2hpY2ggYXQKPiA+IHNvbWUgcG9p
bnQgdHJpZXMgdG8gcmUtd3JpdGUgdGhlIEJCTT8gIAo+IAo+IEkgZ3Vlc3Mgd2hlbiBwcm9ncmFt
bWluZyB0aGUgQkJNIGZhaWxzIHdpdGggYW4gZXJyb3IgaW4gdGhlIHN0YXR1cwo+IHJlZ2lzdGVy
CgpXaHkgd291bGQgYSAod2l0aG91dC1FQ0MpIHByb2dyYW0gb3BlcmF0aW9uIGZhaWw/IEkgZ3Vl
c3MgdGhpcyBpcyB3aGF0CndlIHNob3VsZCB1bmRlcnN0YW5kIGZpcnN0LgoKPiB0aGUgc2FtZSBw
cm9iYWJseSBoYXBwZW5lZCB3aGVuIFVCSSB0cmllZCB0byB3cml0ZSBkYXRhIHRvIHRoZQo+IGJs
b2NrLgo+IAo+ID4gQXJlIHlvdSB1c2luZyBmYXN0bWFwPyBkbyB5b3UgdXNlIGEgQkJUPyAgCj4g
Cj4gWWVzIGFuZCB5ZXMuIFRoZSBmYWN0IHRoYXQgd2UgdXNlIGEgQkJUIGlzIHdoeSB3ZSB3YW50
IHRvIHNldAo+IE5BTkRfQkJUX05PX09PQl9CQk0uCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+ICAg
RGFuaWVsCj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
