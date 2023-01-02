Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32853C3DA7A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyWEKIgYx1HLagYU+l2nM5ml1zztboo6XKP/pcx2OQU=; b=OvFzMXqArS8dit
	XmMuX8uBBpCkMitrX9xIpGt+fRfiKRS9EAKboJnFsvPG+412iLiE6c78wOPypuBEsGhmntswCI6I2
	UuHA3hjqRGmo9L0DtzD3FXcku5Rs5ZoEvHkL80y8bgemqa2gwGlr3Wp8j3JL9O8hYO2uaeKU5mwHJ
	1u8z0BJvXd4fd7LotzBjOTduJCMBDbYuOgJNdEBeC4o7MPlduMy5Ughnp9KaGuyV+JMiIQch2I4Hl
	t7R4nOGqaLw7vYXgcH4kGlK7l7Mp4/KFRnvzsS8yhwAY5o5nbr0d8leMFEx1U/Kjm/+C5ypf3D+fe
	v8KBr6fi4ROtr2sne62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCOCJ-00CwGI-Lk; Mon, 02 Jan 2023 17:02:03 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCO9z-00CvEr-5E
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 16:59:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B167F60010;
	Mon,  2 Jan 2023 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672678775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Z5MR9iz9Yx0iHP13yYVBZ29GGmpwoAi3yeHPvOv4+k=;
	b=k42m/bPtNxAsLfJnaGfEWuWEzjVbdVgc6kYHDHMotj3cT1J4D2r56SaYKPPuReCQex4qVS
	Zof5Z0YEfRxNs2IbbIxfk2gqJzqYa/+zHiqwaPvQs0zGlgjtTCX978Xzl0e8tgAxzHjMjF
	ARp54pTq5pzInxAWmcRZp8PxyWVmclivlhW8tk5FSQPm4b6UJU68sOD7SDO2WcDMf/MpGt
	ekv3/b6o1ESdz/M/9TPoVvQiwZOa42NZz9CfjGzYWVUsvNjCFgXtLe9VkP91v3BTXZ/Kya
	uzGLxiIehDmkIWQz7Pl2XyyKs6zCQvyKs5xu1HAnZgJVueWlE7gucth/8zHvRA==
Date: Mon, 2 Jan 2023 17:59:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: hynix: Add support for
 H27UCG8T2FTR-BC MLC NAND
Message-ID: <20230102175932.6c11a0b3@xps-13>
In-Reply-To: <bfc81317-3c63-cabe-f43f-c1ec216749e4@sholland.org>
References: <20221229190906.6467-1-samuel@sholland.org>
	<20221229190906.6467-2-samuel@sholland.org>
	<20221230134507.719edeae@xps-13>
	<1b17f332-827b-c8b1-807c-9c6e38caf173@sholland.org>
	<20230102110630.4c68e038@xps-13>
	<bfc81317-3c63-cabe-f43f-c1ec216749e4@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_085939_638204_7F018C36 
X-CRM114-Status: GOOD (  34.36  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBNb24sIDIgSmFuIDIwMjMg
MDk6NTA6MjEgLTA2MDA6Cgo+IE9uIDEvMi8yMyAwNDowNiwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiA+IEhpIFNhbXVlbCwKPiA+IAo+ID4gc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBGcmks
IDMwIERlYyAyMDIyIDEwOjA4OjEzIC0wNjAwOgo+ID4gCj4gPj4gSGkgTWlxdcOobCwKPiA+Pgo+
ID4+IE9uIDEyLzMwLzIyIDA2OjQ1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4+PiBIaSBTYW11
ZWwsCj4gPj4+Cj4gPj4+IHNhbXVlbEBzaG9sbGFuZC5vcmcgd3JvdGUgb24gVGh1LCAyOSBEZWMg
MjAyMiAxMzowOTowMyAtMDYwMDoKPiA+Pj4gICAKPiA+Pj4+IEgyN1VDRzhUMkZUUi1CQyBpcyBz
aW1pbGFyIHRvIHRoZSBhbHJlYWR5LXN1cHBvcnRlZCBIMjdVQ0c4VDJFVFItQkMsIGJ1dAo+ID4+
Pj4gcmVwb3J0cyBhIGRpZmZlcmVudCBJRC4gIAo+ID4+Pgo+ID4+PiBDYW4geW91IHByb3ZpZGUg
YSBkYXRhc2hlZXQgZm9yIHRoaXMgcGFydD8gSSBhbSBzdXJwcmlzZWQgYnkgdGhlIHBhZ2UKPiA+
Pj4gc2l6ZS4gSW4gZ2VuZXJhbCBhbnl3YXksIGl0J3MgYmVzdCB0byBwcm92aWRlIGEgbGluayB3
aGVuIGFkZGluZwo+ID4+PiBzdXBwb3J0IGZvciBhIG5ldyBjb21wb25lbnQuICAKPiA+Pgo+ID4+
IEkgd2FzIHVuYWJsZSB0byBmaW5kIGEgZGF0YXNoZWV0IGZvciBzcGVjaWZpY2FsbHkgSDI3VUNH
OFQyRlRSLUJDLiBUaGUKPiA+PiBiZXN0IGRhdGFzaGVldCBJIGNvdWxkIGZpbmQgaXMgZm9yIEgy
N1VDRzhUMkVUUi1CQ1swXVsxXS4gSG93ZXZlciwgdGhlcmUKPiA+PiBhcmUgbGF5b3V0IHBhcmFt
ZXRlcnMgZm9yIEgyN1VDRzhUMkZUUi1CQyBpbiBzb21lIHZlcnNpb25zIG9mIHRoZSB2ZW5kb3IK
PiA+PiBOQU5EIGRyaXZlclsyXVszXVs0XS4gVGhlIEh5bml4IGNoaXAgaXMgcGFja2FnZWQgYXMg
RXNzZW5jb3JlCj4gPj4gSTNULThHUThUMkg1VEFSQywgYXMgcmVmZXJlbmNlZCBpbiB0aGF0IE5B
TkQgSUQgdGFibGUsIHdoaWNoIGlzIHRoZQo+ID4+IGFjdHVhbCBwYWNrYWdlIG9uIHRoZSBib2Fy
ZCBJIGhhdmUuCj4gPj4KPiA+PiBSZWdhcmRzLAo+ID4+IFNhbXVlbAo+ID4+Cj4gPj4gWzBdOgo+
ID4+IGh0dHBzOi8vejNkOWI3dTguc3RhY2twYXRoY2RuLmNvbS9wZGYtZG93bi9ILzIvNy9IMjdV
Q0c4VDJFVFItQkMtSHluaXgucGRmCj4gPiAKPiA+IFBvaW50aW5nIHRvIFswXSBvciBbMV0gaW4g
dGhlIGNvbW1pdCBsb2cgd291bGQgYmUgbmljZSBhdCBsZWFzdCwgZXZlbgo+ID4gdGhvdWdoIHdl
IGNhbm5vdCBnZXQgb3VyIGhhbmRzIG9uIHRoZSByZWFsIGRhdGFzaGVldC4uLgo+IAo+IE9LLCBJ
IHdpbGwgZG8gdGhhdCBmb3IgdjIuCj4gCj4gPj4gWzFdOiBodHRwOi8vd3d3Lnpzb25nLmNvbS5j
bi91c2VyZmlsZXMvSDI3VUMoRClHOFQoVSkyRVRSLUJDX1JldjEuMF8wODI2LnBkZgo+ID4+IFsy
XToKPiA+PiBodHRwczovL2dpdGh1Yi5jb20vZW5nU2ludGVjay9BMTMzX0ltYWdlL2Jsb2IvbWFp
bi9sb25nYW4va2VybmVsL2xpbnV4LTQuOS9tb2R1bGVzL25hbmQvc3VuOGl3MTVwMS9waHktbmFu
ZC9waHlzaWNfdjIvbmFuZF9pZDIuYyNMMTU5Mgo+ID4+IFszXToKPiA+PiBodHRwczovL2dpdGh1
Yi5jb20vbGF1bmNoZnVyL3JnODE4LWtlcm5lbC9ibG9iL21hc3Rlci9tb2R1bGVzL25hbmQvc3Vu
OGl3MTVwMS9waHktbmFuZC9waHlzaWNfdjIvbmFuZF9pZDIuYyNMMTU5Mgo+ID4+IFs0XTogQWRk
aW5nIG1lbWJlciBuYW1lcyB0byB0aGF0IHRhYmxlIGVudHJ5Ogo+ID4+Cj4gPj4gey5uYW5kX2lk
ICAgICAgICAgICAgICAgPSB7MHhhZCwgMHhkZSwgMHgxNCwgMHhhYiwgMHg0MiwgMHg0YSwKPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAweGZmLCAweGZmfSwKPiA+PiAgLmRpZV9jbnRf
cGVyX2NoaXAgICAgICA9IDEsCj4gPj4gIC5zZWN0X2NudF9wZXJfcGFnZSAgICAgPSAzMiwKPiA+
PiAgLnBhZ2VfY250X3Blcl9ibGsgICAgICA9IDI1NiwKPiA+PiAgLmJsa19jbnRfcGVyX2RpZSAg
ICAgICA9IDIxMTIsCj4gPj4gICNkZWZpbmUgTkFORF9NVUxUSV9QUk9HUkFNICgxIDw8IDMpCj4g
Pj4gICNkZWZpbmUgTkFORF9SQU5ET00gICAgICAgICgxIDw8IDcpCj4gPj4gICNkZWZpbmUgTkFO
RF9SRUFEX1JFVFJZICAgICgxIDw8IDgpCj4gPj4gICNkZWZpbmUgTkFORF9MU0JfUEFHRV9UWVBF
ICgweGZmIDw8IDEyKQo+ID4+ICAub3BlcmF0aW9uX29wdCAgICAgICAgID0gMHgwMDAwMjE4OCwK
PiA+PiAgLnZhbGlkX2Jsa19yYXRpbyAgICAgICA9IDg5NiwKPiA+PiAgLmFjY2Vzc19mcmVxICAg
ICAgICAgICA9IDQwLAo+ID4+ICAuZWNjX21vZGUgICAgICAgICAgICAgID0gOCwKPiA+PiAgLnJl
YWRfcmV0cnlfdHlwZSAgICAgICA9IDB4MDUwODA0LAo+ID4+ICAuZGRyX3R5cGUgICAgICAgICAg
ICAgID0gMCwKPiA+PiAgLm9wdGlvbl9waHlpc2Nfb3Bfbm8gICA9IDE0LAo+ID4+ICAuZGRyX2lu
Zm9fbm8gICAgICAgICAgID0gMCwKPiA+PiAgLmlkX251bWJlciAgICAgICAgICAgICA9IDB4MDEw
MDI2LAo+ID4+ICAubWF4X2Jsa19lcmFzZV90aW1lcyAgID0gMzAwMCwKPiA+PiAgLmRyaXZlcl9u
byAgICAgICAgICAgICA9IDEsCj4gPj4gIC5hY2Nlc3NfaGlnaF9mcmVxICAgICAgPSA0MCwKPiA+
PiAgLnJhbmRvbV9jbWQyX3NlbmRfZmxhZyA9IDAsCj4gPj4gIC5yYW5kb21fYWRkcl9udW0gICAg
ICAgPSAwLAo+ID4+ICAubmFuZF9yZWFsX3BhZ2Vfc2l6ZSAgID0gMTYzODQgKyAxNjY0fSwKPiA+
IAo+ID4gVGhpcyBhbmQgd2hhdCBpcyBkaXNwbGF5ZWQgaW4gdGhlIHR3byBkYXRhc2hlZXRzIHBv
aW50ZWQgYWJvdmUgbG9va3MKPiA+IHZlcnkgbXVjaCBsaWtlIG91dC1vZi1iYW5kIGRhdGEgdG8g
bWUsIEkgZG9uJ3QgZ2V0IHdoeSB3ZSBzaG91bGQgdHJlYXQKPiA+IHRoaXMgcGFydCBvZiB0aGUg
YXJyYXkgZGlmZmVyZW50bHk/IFRoZSBPT0IgYXJlYSBpcyBub3Qgb25seSBzdXBwb3NlZCB0bwo+
ID4gYmUgdXNlZCBmb3IgRUNDIGJ5dGVzIChldmVuIHRob3VnaCB0aGF0J3MgaG93IFVCSSBtYWtl
IHVzZSBvZiBpdCksIHlvdQo+ID4gY2FuIHN0b3JlIGFsbCB0aGUgZGF0YSB5b3Ugd2FudCB0aGVy
ZSAoYnV0IGl0J3Mgbm90IG5lY2Vzc2FyaWx5Cj4gPiBwcm90ZWN0ZWQgYnkgdGhlIEVDQyBlbmdp
bmUsIHdoaWNoLCBpbiBnZW5lcmFsLCBtYXR0ZXJzIGEgbG90Lgo+ID4gCj4gPiBJIGRvbid0IHNl
ZSBob3cgdGhpcyBkYXRhc2hlZXQgd291bGQgYmUgZGlmZmVyZW50IHRoYW4gdGhlIG90aGVycy4g
VGhleQo+ID4gZG9uJ3QgZGV0YWlsIHRoZSBnZW9tZXRyeSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVk
IHRoZW0gdG8gZG8gaXQgaWYgdGhlCj4gPiBwYWdlIHNpemUgd2FzIGFueXRoaW5nIGRpZmZlcmVu
dCB0aGFuIHRoZSBzdGFuZGFyZD8KPiAKPiBNYXliZSB3ZSBhcmUgbWlzdW5kZXJzdGFuZGluZyBl
YWNoIG90aGVyLiBUaGUgcGFnZSBzaXplIEkgaGF2ZSBkZWNsYXJlZAo+IGluIHRoZSB0YWJsZSBp
cyBTWl8xNkssIHdoaWNoIEkgYmVsaWV2ZSBpcyBhIHN0YW5kYXJkIHZhbHVlLiBUaGUKPiBub24t
cG93ZXItb2YtdHdvIGNoaXAgc2l6ZSBjb21lcyBmcm9tIHRoZSBudW1iZXIgb2YgYmxvY2tzIGlu
IHRoZSBjaGlwOwo+IHRoZSAiLmJsa19jbnRfcGVyX2RpZSA9IDIxMTIiIGFib3ZlIGNvcnJlc3Bv
bmRzIHRvIHRoZSAiODQ0OCIgaW4gcGF0Y2ggMy4KPiAKPiBGb3IgSDI3VUNHOFQyRVRSIHRoaXMg
aXMgZGVzY3JpYmVkIGluIHRoZSBkYXRhc2hlZXQgb24gcGFnZSAzIGFzICIxLDA2MAo+IGJsb2Nr
cyB4IDIgcGxhbmUiIGFuZCAiKDEsMDI0IGJsb2NrcyArIDM2IGJsb2NrKS8xcGxhbmUiLiBUaGVz
ZSBleHRyYQo+IGJsb2NrcyBhcmUgc2VwYXJhdGUgZnJvbSB0aGUgT09CIGFyZWEgaW5zaWRlIGVh
Y2ggcGFnZS4KCk9oIHJpZ2h0LCBzb3JyeSBJIG1lc3NlZCB0aGluZ3MgdXAgaW4gbXkgbWluZC4g
U28geWVzIGl0J3MgYSByZWFsCnNpdHVhdGlvbi4gSWYgd2UgZ3JlcCBjaGlwX3NoaWZ0IGFuZCBw
YWdlbWFzayB0aGVyZSBhcmUgYSBudW1iZXIgb2YKdXNlcnMgKGNvbnRyb2xsZXIgZHJpdmVycykg
d2hpY2ggbWlnaHQgYWN0dWFsbHkgYmUgaW1wYWN0ZWQuIFdlIG5lZWQgdG8KYmUgY2FyZWZ1bC4g
UmlnaHQgbm93IEkgYW0gbm90IHN1cmUgd2Ugc2hvdWxkIHdlIHNob3VsZCBwbGF5IHdpdGggdGhl
CmNvcmUgdG8gc3VwcG9ydCB0aGVzZSBleHRyYSBibG9ja3MuLi4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
