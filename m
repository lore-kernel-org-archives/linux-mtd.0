Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19F8C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 09:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B12764F55
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 09:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B12764F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DRK1YXhUhybgGE7+oxBiWsch9iSy7TFyhyWDYNf6sS4=; b=f5j1mOC72DANDm0ppdK1oCQKs
	BxKSBmylD8ofrwlPChhncGY7RuR0BbhfzBfmIJhRxiTIbAGZe/OIWhkL2aXzYElPu2zvfJv2QxZ2v
	jj+fe0KhKQtDY4newdY8NlB7vswZw/YAyy7mG+zTh9j6AkQA7HNFNpwn/ZGK1DNQzWbeN4Ju2uPOA
	PXxdrCTUFbvaH502Qo5u0ORduC4NGuh/NfzVPkXUWVE3v0+J1w4emHQ/jdnIhTWOLL/Q+Po2Y/VVx
	6zLT2f80C08oJMD3MjO24g6EIKJ9TTih5LrxUs2zpUI1kVKXMSwjkQgKTpsnhtxCXApj+e4AjtILX
	F73yOoZ3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7azZ-0000pT-9H; Thu, 04 Feb 2021 09:32:01 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7azW-0000oj-Rq
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 09:31:59 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 16E051BF212;
 Thu,  4 Feb 2021 09:31:52 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:31:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204103152.5d086525@xps13>
In-Reply-To: <20210204102738.3ea8393e@collabora.com>
References: <20210202041614.GA840@work> <20210202091459.0c41a769@xps13>
 <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
 <20210203110522.12f2b326@xps13>
 <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
 <20210203111914.1c2f68f6@collabora.com>
 <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
 <20210203122422.6963b0ed@collabora.com>
 <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
 <20210204091336.1406ca3b@xps13> <20210204085221.GB8235@thinkpad>
 <20210204095945.51ef0c33@collabora.com>
 <20210204100408.6eb053d8@xps13>
 <20210204102738.3ea8393e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_043159_107157_3A9BABBA 
X-CRM114-Status: GOOD (  32.76  )
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
Cc: vigneshr@ti.com, richard@nod.at,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBUaHUsIDQgRmViCjIwMjEgMTA6Mjc6MzggKzAxMDA6Cgo+IE9uIFRodSwgNCBG
ZWIgMjAyMSAxMDowNDowOCArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gSGkgQm9yaXMsCj4gPiAKPiA+IEJvcmlzIEJyZXppbGxv
biA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlIG9uIFRodSwgNCBGZWIKPiA+
IDIwMjEgMDk6NTk6NDUgKzAxMDA6Cj4gPiAgIAo+ID4gPiBPbiBUaHUsIDQgRmViIDIwMjEgMTQ6
MjI6MjEgKzA1MzAKPiA+ID4gTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhh
c2l2YW1AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ICAgICAKPiA+ID4gPiBPbiBUaHUsIEZlYiAw
NCwgMjAyMSBhdCAwOToxMzozNkFNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgICAgIAo+
ID4gPiA+ID4gSGkgTWFuaXZhbm5hbiwKPiA+ID4gPiA+IAo+ID4gPiA+ID4gTWFuaXZhbm5hbiBT
YWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4gd3JvdGUgb24gV2Vk
LAo+ID4gPiA+ID4gMDMgRmViIDIwMjEgMTc6MTE6MzEgKzA1MzA6Cj4gPiA+ID4gPiAgICAgICAg
IAo+ID4gPiA+ID4gPiBPbiAzIEZlYnJ1YXJ5IDIwMjEgNDo1NDoyMiBQTSBJU1QsIEJvcmlzIEJy
ZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOiAgICAgICAgCj4g
PiA+ID4gPiA+ID5PbiBXZWQsIDAzIEZlYiAyMDIxIDE2OjIyOjQyICswNTMwCj4gPiA+ID4gPiA+
ID5NYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3Jn
PiB3cm90ZToKPiA+ID4gPiA+ID4gPiAgICAgICAgICAKPiA+ID4gPiA+ID4gPj4gT24gMyBGZWJy
dWFyeSAyMDIxIDM6NDk6MTQgUE0gSVNULCBCb3JpcyBCcmV6aWxsb24gICAgICAgICAgCj4gPiA+
ID4gPiA+ID48Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOiAgICAgICAgICAK
PiA+ID4gPiA+ID4gPj4gPk9uIFdlZCwgMDMgRmViIDIwMjEgMTU6NDI6MDIgKzA1MzAKPiA+ID4g
PiA+ID4gPj4gPk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxp
bmFyby5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiA+PiA+ICAgICAgICAgICAgCj4gPiA+ID4gPiA+
ID4+ID4+ID4+IAo+ID4gPiA+ID4gPiA+PiA+PiA+PiBJIGdvdCBtb3JlIGluZm9ybWF0aW9uIGZy
b20gdGhlIHZlbmRvciwgVGVsaXQuIFRoZSBhY2Nlc3MgdG8gICAgICAgICAgCj4gPiA+ID4gPiA+
ID50aGUgICAgICAgICAgICAKPiA+ID4gPiA+ID4gPj4gPjNyZCAgICAgICAgICAgICAgCj4gPiA+
ID4gPiA+ID4+ID4+ID5wYXJ0aXRpb24gaXMgcHJvdGVjdGVkIGJ5IFRydXN0em9uZSBhbmQgYW55
IGFjY2VzcyBpbiBub24gICAgICAgICAgCj4gPiA+ID4gPiA+ID5wcml2aWxlZ2VkICAgICAgICAg
IAo+ID4gPiA+ID4gPiA+PiA+PiA+bW9kZSAod2hlcmUgTGludXgga2VybmVsIHJ1bnMpIGNhdXNl
cyBrZXJuZWwgcGFuaWMgYW5kIHRoZSBkZXZpY2UKPiA+ID4gPiA+ID4gPj4gPj4gPnJlYm9vdHMu
ICAgICAgICAgICAgIAo+ID4gPiA+ID4gPiA+PiA+Cj4gPiA+ID4gPiA+ID4+ID5PdXQgb2YgY3Vy
aW9zaXR5LCBpcyBpdCBhIHBlci1DUy1saW5lIHRoaW5nIG9yIGlzIHRoaXMgc2VjdGlvbgo+ID4g
PiA+ID4gPiA+PiA+cHJvdGVjdGVkIG9uIGFsbCBDUz8KPiA+ID4gPiA+ID4gPj4gPiAgICAgICAg
ICAgIAo+ID4gPiA+ID4gPiA+PiAKPiA+ID4gPiA+ID4gPj4gU29ycnksIEkgZGlkbid0IGdldCB5
b3VyIHF1ZXN0aW9uLiAgICAgICAgICAgCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPlRoZSBx
Y29tIGNvbnRyb2xsZXIgY2FuIGhhbmRsZSBzZXZlcmFsIGNoaXBzLCBlYWNoIGNvbm5lY3RlZCB0
aHJvdWdoIGEKPiA+ID4gPiA+ID4gPmRpZmZlcmVudCBDUyAoY2hpcC1zZWxlY3QpIGxpbmUsIHJp
Z2h0PyBJJ20gd29uZGVyaW5nIGlmIHRoZSBmaXJtd2FyZQo+ID4gPiA+ID4gPiA+cnVubmluZyBp
biBzZWN1cmUgbW9kZSBoYXMgdGhlIGFiaWxpdHkgdG8gYmxvY2sgYWNjZXNzIGZvciBhIHNwZWNp
ZmljCj4gPiA+ID4gPiA+ID5DUyBsaW5lIG9yIGlmIGFsbCBDUyBsaW5lcyBoYXZlIHRoZSBzYW1l
IGNvbnN0cmFpbnQuIFRoYXQgd2lsbCBpbXBhY3QKPiA+ID4gPiA+ID4gPnRoZSB3YXkgeW91IGRl
c2NyaWJlIGl0IGluIHlvdXIgRFQgKGluIG9uZSBjYXNlIHRoZSBzZWN1cmUtcmVnaW9uCj4gPiA+
ID4gPiA+ID5wcm9wZXJ0eSBzaG91bGQgYmUgdW5kZXIgdGhlIGNvbnRyb2xsZXIgbm9kZSwgaW4g
dGhlIG90aGVyIGNhc2UgaXQKPiA+ID4gPiA+ID4gPnNob3VsZCBiZSB1bmRlciB0aGUgTkFORCBj
aGlwIG5vZGUpLiAgICAgICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFJpZ2h0LiBJIGJl
bGlldmUgdGhlIGltcGxlbWVudGF0aW9uIGlzIGNvbW1vbiB0byBhbGwgTkFORCBjaGlwcyBzbyB0
aGUgcHJvcGVydHkgc2hvdWxkIGJlIGluIHRoZSBjb250cm9sbGVyIG5vZGUuICAgICAgICAgCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IExvb2tzIHdlaXJkOiBkbyB5b3UgbWVhbiB0aGF0IGVhY2ggb2Yg
dGhlIGNoaXBzIHdpbGwgaGF2ZSBhIHNlY3VyZSBhcmVhPyAgICAgICAgCj4gPiA+ID4gCj4gPiA+
ID4gSSB3YXkgSSBzYWlkIGlzLCB0aGUgInNlY3VyZS1yZWdpb24iIHByb3BlcnR5IHdpbGwgYmUg
cHJlc2VudCBpbiB0aGUgY29udHJvbGxlcgo+ID4gPiA+IG5vZGUgYW5kIG5vdCBpbiB0aGUgTkFO
RCBjaGlwIG5vZGUgc2luY2UgdGhpcyBpcyBub3QgcmVsYXRlZCB0byB0aGUgZGV2aWNlCj4gPiA+
ID4gZnVuY3Rpb25hbGl0eS4KPiA+ID4gPiAKPiA+ID4gPiBCdXQgZm9yIHJlZmVyZW5jaW5nIHRo
ZSBOQU5EIGRldmljZSwgdGhlIHByb3BlcnR5IGNhbiBoYXZlIHRoZSBwaGFuZGxlIGFzIGJlbG93
Ogo+ID4gPiA+IAo+ID4gPiA+IHNlY3VyZS1yZWdpb24gPSA8Jm5hbmQwIDB4ZmZmZj47ICAgICAg
Cj4gPiA+IAo+ID4gPiBNeSBxdWVzdGlvbiB3YXMgcmVhbGx5IHdoYXQgaGFwcGVucyBmcm9tIGEg
ZnVuY3Rpb25hbCBQb1YuIElmIHlvdSBoYXZlCj4gPiA+IHBlci1jaGlwIHByb3RlY3Rpb24gYXQg
dGhlIEZXIGxldmVsLCB0aGlzIHByb3BlcnR5IHNob3VsZCBiZSB1bmRlciB0aGUKPiA+ID4gTkFO
RCBub2RlLiBPVEgsIGlmIHRoZSBGVyBkb2Vzbid0IGxvb2sgYXQgdGhlIHNlbGVjdGVkIGNoaXAg
YmVmb3JlCj4gPiA+IGJsb2NraW5nIHRoZSBhY2Nlc3MsIGl0IHNob3VsZCBiZSBhdCB0aGUgY29u
dHJvbGxlciBsZXZlbC4gU28sIHlvdQo+ID4gPiByZWFsbHkgaGF2ZSB0byB1bmRlcnN0YW5kIHdo
YXQgdGhlIHNlY3VyZSBGVyBkb2VzLiAgICAKPiA+IAo+ID4gSSdtIG5vdCBzbyBzdXJlIGFjdHVh
bGx5LCB0aGF0J3Mgd2h5IEkgbGlrZSB0aGUgcGhhbmRsZSB0byBuYW5kMCAtPiBpbgo+ID4gYW55
IGNhc2UgaXQncyBub3QgYSBwcm9wZXJ0eSBvZiB0aGUgTkFORCBjaGlwIGl0c2VsZiwgaXQncyBr
aW5kIG9mIGEKPiA+IGhvc3QgY29uc3RyYWludCwgc28gSSBkb24ndCBnZXQgd2h5IHRoZSBwcm9w
ZXJ0eSBzaG91bGQgYmUgYXQgdGhlCj4gPiBOQU5EIG5vZGUgbGV2ZWw/ICAKPiAKPiBJIHdvdWxk
IGFyZ3VlIHRoYXQgd2UgYWxyZWFkeSBoYXZlIHBsZW50eSBvZiBOQU5EIHByb3BlcnRpZXMgdGhh
dAo+IGVuY29kZSB0aGluZ3MgY29udHJvbGxlZCBieSB0aGUgaG9zdCAoRUNDLCBwYXJ0aXRpb25z
LCBIVyByYW5kb21pemVyLAo+IGJvb3QgZGV2aWNlLCBhbmQgYWxsIGtpbmQgb2YgY29udHJvbGxl
ciBzcGVjaWZpYyBzdHVmZikgOlAuIEhhdmluZwo+IHRoZSBwcm9wcyB1bmRlciB0aGUgTkFORCBu
b2RlIG1ha2VzIGl0IGNsZWFyIHdoYXQgdGhvc2UgdGhpbmdzIGFyZQo+IGFwcGxpZWQgdG8sIGFu
ZCBpdCdzIGFsc28gZWFzaWVyIHRvIHBhcnNlIGZvciB0aGUgZHJpdmVyICh5b3UgYWxyZWFkeQo+
IGhhdmUgdG8gcGFyc2UgZWFjaCBub2RlIHRvIGdldCB0aGUgcmVnIHByb3BlcnR5IGFueXdheSku
CgpGYWlyIHBvaW50cy4KCj4gPiBBbHNvLCB3ZSBzaG91bGQgcHJvYmFibHkgc3VwcG9ydCBzZXZl
cmFsIHNlY3VyZSByZWdpb25zICh3aGljaCBjb3VsZCBiZQo+ID4gYSB3YXkgdG8gZXhwcmVzcyB0
aGUgZmFjdCB0aGF0IHRoZSBGVyBkb2VzIG5vdCBsb29rIGF0IHRoZSBDUyk/ICAKPiAKPiBTdXJl
LCB0aGUgc2VjdXJlLXJlZ2lvbiBzaG91bGQgcHJvYmFibHkgYmUgcmVuYW1lZCBzZWN1cmUtcmVn
aW9ucywgZXZlbgo+IGlmIGl0J3MgZGVmaW5lZCBhdCB0aGUgTkFORCBjaGlwIGxldmVsLgoKQWJz
b2x1dGVseS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
