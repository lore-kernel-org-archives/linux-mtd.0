Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A49C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 21:55:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBED22225
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 21:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBED22225
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dW226BtrAbKXyWvK82qcAp2JI+IgrKAKJBoTQ3uJh5w=; b=RaHidWxlW1KSIRh9Tcyjwno0a
	B52wXsLg4+tBbtg9GUV2liCYvD/rbrJPzqBIZ9Q7AoDwn+YHHLrui2qtrrpA0d4+9sSHNvQKYE8pj
	ZikjeIXnHXiG8tuXYDXd7kbAI6kfUPcchkib9M57GR1wy7IHxMhl4/HkCLuNQspkfPP4kppGjbNfC
	CCONTPZnHJKsL9bE+ZvCd9XCvpqMINjh2YUaCKB5PowSKAiGzq1rR53KTzULZxA8pOm5dQAwXSRIZ
	mOszcGYLw4vMyMDgr+akyc0MG/xSt9zhXpTivVCwU9nPoXv16r8obF4jBnjSHE4qML/WhJ3R7q6q9
	Ay8nanWHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmkvw-0000sm-UW; Tue, 08 Dec 2020 21:54:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmkvu-0000sI-5g
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 21:54:07 +0000
X-Originating-IP: 109.220.208.103
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A9AE51BF209;
 Tue,  8 Dec 2020 21:53:58 +0000 (UTC)
Date: Tue, 8 Dec 2020 22:53:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only
 sense CS0 R/B issue
Message-ID: <20201208225357.68583f27@xps13>
In-Reply-To: <20201207164346.GO3977@pengutronix.de>
References: <20201205063004.3099-1-han.xu@nxp.com>
 <20201207095006.GK3977@pengutronix.de>
 <AM6PR0402MB37012F0C151E42C690EF935E97CE0@AM6PR0402MB3701.eurprd04.prod.outlook.com>
 <20201207164346.GO3977@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_165406_327085_F56F09B3 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: Han Xu <han.xu@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9uIE1v
biwgNyBEZWMgMjAyMCAxNzo0Mzo0NgorMDEwMDoKCj4gT24gTW9uLCBEZWMgMDcsIDIwMjAgYXQg
MDQ6MTQ6MDBQTSArMDAwMCwgSGFuIFh1IHdyb3RlOgo+ID4gCj4gPiAgIAo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU+Cj4gPiA+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgNywgMjAyMCAzOjUwIEFN
Cj4gPiA+IFRvOiBIYW4gWHUgPGhhbi54dUBueHAuY29tPgo+ID4gPiBDYzogbWlxdWVsLnJheW5h
bEBib290bGluLmNvbTsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gU3ViamVj
dDogW0VYVF0gUmU6IFtQQVRDSCAxLzJdIG10ZDogcmF3bmFuZDogZ3BtaTogRml4IHRoZSBkcml2
ZXIgb25seSBzZW5zZQo+ID4gPiBDUzAgUi9CIGlzc3VlCj4gPiA+IAo+ID4gPiBDYXV0aW9uOiBF
WFQgRW1haWwKPiA+ID4gCj4gPiA+IE9uIFNhdCwgRGVjIDA1LCAyMDIwIGF0IDEyOjMwOjAzQU0g
LTA2MDAsIEhhbiBYdSB3cm90ZTogIAo+ID4gPiA+IHNldCB0aGUgR1BNSSBDVFJMMSBHQU5HRURf
UkRZQlVTWSBiaXQgc28gZGlydmVyIGNhbiBzZW5zZSB0aGUgUi9CCj4gPiA+ID4gc2lnbmFsIGZy
b20gYWxsIENTLgo+ID4gPiA+Cj4gPiA+ID4gRm9yIHRoZSBOQU5EIGNoaXAgTVQyOUY2NEcwOEFG
QUFBV1AsIG9ubHkgdGhlIGZpcnN0IGNoaXAgZGV0ZWN0ZWQKPiA+ID4gPiB3aXRob3V0IHRoZSBw
YXRjaC4KPiA+ID4gPgo+ID4gPiA+IFsgICAgMy43NjQxMThdIG5hbmQ6IGRldmljZSBmb3VuZCwg
TWFudWZhY3R1cmVyIElEOiAweDJjLCBDaGlwIElEOiAweDY4Cj4gPiA+ID4gWyAgICAzLjc3MDYx
M10gbmFuZDogTWljcm9uIE1UMjlGNjRHMDhBRkFBQVdQCj4gPiA+ID4gWyAgICAzLjc3NDc1Ml0g
bmFuZDogNDA5NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTAyNCBLaUIsIHBhZ2Ugc2l6ZTogODE5
MiwgT09CICAKPiA+ID4gc2l6ZTogNDQ4ICAKPiA+ID4gPiBbICAgIDMuNzg2NDIxXSBCYWQgYmxv
Y2sgdGFibGUgZm91bmQgYXQgcGFnZSA1MjQxNjAsIHZlcnNpb24gMHgwMQo+ID4gPiA+IFsgICAg
My43OTI3MzBdIEJhZCBibG9jayB0YWJsZSBmb3VuZCBhdCBwYWdlIDUyNDAzMiwgdmVyc2lvbiAw
eDAxCj4gPiA+ID4KPiA+ID4gPiBBZnRlciBhcHBseWluZyB0aGUgcGF0Y2gKPiA+ID4gPgo+ID4g
PiA+IFsgICAgMy43NjQ0NDVdIG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAw
eDJjLCBDaGlwIElEOiAweDY4Cj4gPiA+ID4gWyAgICAzLjc3MDk0MV0gbmFuZDogTWljcm9uIE1U
MjlGNjRHMDhBRkFBQVdQCj4gPiA+ID4gWyAgICAzLjc3NTA4MF0gbmFuZDogNDA5NiBNaUIsIFNM
QywgZXJhc2Ugc2l6ZTogMTAyNCBLaUIsIHBhZ2Ugc2l6ZTogODE5MiwgT09CICAKPiA+ID4gc2l6
ZTogNDQ4ICAKPiA+ID4gPiBbICAgIDMuNzg0MzkwXSBuYW5kOiAyIGNoaXBzIGRldGVjdGVkCj4g
PiA+ID4gWyAgICAzLjc5MDkwMF0gQmFkIGJsb2NrIHRhYmxlIGZvdW5kIGF0IHBhZ2UgNTI0MTYw
LCB2ZXJzaW9uIDB4MDEKPiA+ID4gPiBbICAgIDMuNzk2Nzc2XSBCYWQgYmxvY2sgdGFibGUgZm91
bmQgYXQgcGFnZSAxMDQ4NDQ4LCB2ZXJzaW9uIDB4MDEKPiA+ID4gPgo+ID4gPiA+IEZpeGVzOiAz
MDQ1ZjhlMzY5NjMgKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IG1vdmUgYWxsIGRyaXZlciBjb2RlIGlu
dG8KPiA+ID4gPiBzaW5nbGUgZmlsZSIpICAKPiA+ID4gCj4gPiA+IEkgZG9uJ3Qgc2VlIGhvdyAz
MDQ1ZjhlMzY5NjMgY2hhbmdlcyBoaXMgYmVoYXZpb3VyLiBBcmUgeW91IHN1cmUgaXQgd29ya2Vk
Cj4gPiA+IHdpdGhvdXQgdGhpcyBwYXRjaD8gIAo+ID4gCj4gPiBBZnRlciBzZXZlcmFsIHJvdW5k
cyBmaWxlcyBtZXJnZSBhbmQgY29kZSBtb3ZlLCBpdCdzIGhhcmQgdG8gZmluZCB3aGVuCj4gPiB0
aGlzIGlzc3VlIGZpcnN0IGludm9sdmVkLCB0aGUgZHJpdmVyIHN0aWxsIHdvcmtzIGZvciBzaW5n
bGUgQ1MgTkFORAo+ID4gYnV0IENUUkwxIEdBTkdFRF9SRFlCVVNZIG11c3QgYmUgc2V0IGZvciBt
dWx0aS1DUyBOQU5EIGNoaXBzLiAgCj4gCj4gMzA0NWY4ZTM2OTYzIG9ubHkgcmUtYXJyYW5nZXMg
dGhlIGNvZGUgd2l0aG91dCBhbnkgZnVuY3Rpb25hbCBjaGFuZ2UsIHNvCj4gSSBzdHJvbmdseSBk
b3VidCB0aGF0IGEgY29tbWl0IHdyaXRpbmcgYSByZWdpc3RlciB3aXRoIGEgbmV3bHkKPiBpbnRy
b2R1Y2VkIHJlZ2lzdGVyIGJpdCBpeGVzIGl0Lgo+IAo+IFBsZWFzZSBkcm9wIHRoaXMgIkZpeGVz
OiIgdGFnLgoKSSB3aWxsIGRyb3AgdGhlIHRhZyB3aGVuIGFwcGx5aW5nLgoKPiAKPiBTYXNjaGEK
PiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
