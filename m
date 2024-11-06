Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E97D59F40
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqSAYj88/d1k3HUGfIqiCsE4HRsvfiJJ7CSzt3kxXDc=; b=oU5xtZx0e6CP2t
	KtuwnsUvoRR/L8vB6rYI8X5Ddj7Z0QqtvOfNjxQYQ+dsIbjEFCloFfB6GCUVnM5St1Ubrq9pU7g5q
	rTxc61IhO9AM8ft3Kd54dhp76Jy/Ifv/bXoARKSgypgIn9Q3V3veYyuBvyWu3n6t7xD2k6maHAVPg
	iMgAUgbggmKqeFlGaIxHqjnfIF8LNv0GTdH8tUf326FWro8d9W8yJtSVnnapYwNUtDXMjR1iSAeOj
	FQ5+WndISxWIuIikA8VvUemSRArylFdz5COaT+3wPgd++QacbmMzcFa+YmINdfYqF/lsZ8t3RpjLd
	noTRXBU/Knl5KCbxXlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8i4p-00000003qHF-2VQm;
	Wed, 06 Nov 2024 15:36:11 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8i4P-00000003qBk-3pfv
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 15:35:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A297B240007;
	Wed,  6 Nov 2024 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730907340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0O1DZej7ntn5vlTTkeOAaf/z20TWgE994IzTCP97PI=;
	b=fK/QW1FCogdbqrToYB8N3GWm4ZqL1Zprc0NhwciUGNy+i+X97EREKODC6FfqKFJBmRoU30
	u36cU4dfvTnv/uHDR8xke1mBANmSr7IDVVIR39I8AoTZhGkzuq5LptP7ovk58yDtaZddqH
	TIV2a0IbXGSg4mWVb5qT85gP95qAW9s/KdaNt2hqmW6axv9Szhr4srC8M+kHqrjr09xUiP
	Opvivl4D3bdn7CM4qNtcB47gL6CD/TX8EY+GL/xBmpQOfCguWnzP0X/N8uKqJAz3jqryL2
	EJYRwHNVhc3+ImBs1PU3YH20OhE5X2zVbLH8HfWMZqKBcM13KBci/mX1Dep2JQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: ubifs_recover_master_node: failed to recover master node
In-Reply-To: <7eaf332e-9439-4d4c-a2ea-d963e41f44f2@alliedtelesis.co.nz> (Chris
	Packham's message of "Tue, 29 Oct 2024 13:37:31 +1300")
References: <7eaf332e-9439-4d4c-a2ea-d963e41f44f2@alliedtelesis.co.nz>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 06 Nov 2024 16:35:39 +0100
Message-ID: <87jzdgjrxw.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_073547_466179_FC22F1FA 
X-CRM114-Status: GOOD (  15.12  )
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

CkhpIENocmlzLAoKT24gMjkvMTAvMjAyNCBhdCAxMzozNzozMSArMTMsIENocmlzIFBhY2toYW0g
PGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6Cgo+IEhpLAo+Cj4gSSBy
ZWNlbnRseSBhZGRlZCBzdXBwb3J0IGZvciB0aGUgU1BJLU5BTkQgY29udHJvbGxlciBvbiB0aGUg
UlRMOTMwMkMgU29DWzFdLiBJIGRpZCBtb3N0IG9mIHRoZSB3b3JrIGFnYWluc3QgTGludXggNi4x
MQo+IGFuZCBpdCdzIHdvcmtpbmcgZmluZSB0aGVyZS4gSSByZWNlbnRseSByZWJhc2VkIGFnYWlu
c3QgdGhlIHRpcCBvZiBMaW51cydzIHRyZWUgKDYuMTItcmM1KSBhbmQgZm91bmQgSSB3YXMgZ2V0
dGluZyB1Ymlmcwo+IGVycm9ycyB3aGVuIG1vdW50aW5nOgo+Cj4gWyAgICAxLjI1NTE5MV0gc3Bp
LW5hbmQgc3BpMS4wOiBNYWNyb25peCBTUEkgTkFORCB3YXMgZm91bmQuCj4gWyAgICAxLjI2MTI4
M10gc3BpLW5hbmQgc3BpMS4wOiAyNTYgTWlCLCBibG9jayBzaXplOiAxMjggS2lCLCBwYWdlIHNp
emU6IDIwNDgsIE9PQiBzaXplOiA2NAo+IFsgICAgMS4yNzExMzRdIDIgZml4ZWQtcGFydGl0aW9u
cyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2Ugc3BpMS4wCj4gWyAgICAxLjI3ODI0N10g
Q3JlYXRpbmcgMiBNVEQgcGFydGl0aW9ucyBvbiAic3BpMS4wIjoKPiBbICAgIDEuMjgzNjMxXSAw
eDAwMDAwMDAwMDAwMC0weDAwMDAwZjAwMDAwMCA6ICJ1c2VyIgo+IFsgICAyMC40ODExMDhdIDB4
MDAwMDBmMDAwMDAwLTB4MDAwMDEwMDAwMDAwIDogIlJlc2VydmVkIgo+IFsgICA3Mi4yNDAzNDdd
IHViaTA6IHNjYW5uaW5nIGlzIGZpbmlzaGVkCj4gWyAgIDcyLjI3MDU3N10gdWJpMDogYXR0YWNo
ZWQgbXRkMyAobmFtZSAidXNlciIsIHNpemUgMjQwIE1pQikKPiBbICAgNzIuMjc2ODE1XSB1Ymkw
OiBQRUIgc2l6ZTogMTMxMDcyIGJ5dGVzICgxMjggS2lCKSwgTEVCIHNpemU6IDEyNjk3NiBieXRl
cwo+IFsgICA3Mi4yODQ1MzddIHViaTA6IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogMjA0OC8y
MDQ4LCBzdWItcGFnZSBzaXplIDIwNDgKPiBbICAgNzIuMjkyMTMyXSB1YmkwOiBWSUQgaGVhZGVy
IG9mZnNldDogMjA0OCAoYWxpZ25lZCAyMDQ4KSwgZGF0YSBvZmZzZXQ6IDQwOTYKPiBbICAgNzIu
Mjk5ODg1XSB1YmkwOiBnb29kIFBFQnM6IDE5MjAsIGJhZCBQRUJzOiAwLCBjb3JydXB0ZWQgUEVC
czogMAo+IFsgICA3Mi4zMDY2ODldIHViaTA6IHVzZXIgdm9sdW1lOiAxLCBpbnRlcm5hbCB2b2x1
bWVzOiAxLCBtYXguIHZvbHVtZXMgY291bnQ6IDEyOAo+IFsgICA3Mi4zMTQ3NDddIHViaTA6IG1h
eC9tZWFuIGVyYXNlIGNvdW50ZXI6IDEvMCwgV0wgdGhyZXNob2xkOiA0MDk2LCBpbWFnZSBzZXF1
ZW5jZSBudW1iZXI6IDI1MjY0MjIzMAo+IFsgICA3Mi4zMjQ4NTBdIHViaTA6IGF2YWlsYWJsZSBQ
RUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJzOiAxOTIwLCBQRUJzIHJlc2VydmVkIGZvciBiYWQg
UEVCIGhhbmRsaW5nOiA0MAo+IFsgICA3Mi4zNzAxMjNdIHViaTA6IGJhY2tncm91bmQgdGhyZWFk
ICJ1YmlfYmd0MGQiIHN0YXJ0ZWQsIFBJRCAxNDEKPiBbICAgNzIuNDcwNzQwXSBVQklGUyAodWJp
MDowKTogTW91bnRpbmcgaW4gdW5hdXRoZW50aWNhdGVkIG1vZGUKPiBbICAgNzIuNDkwMjQ2XSBV
QklGUyAodWJpMDowKTogYmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDBfMCIgc3RhcnRlZCwg
UElEIDE0NAo+IFsgICA3Mi41MjgyNzJdIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDE0Myk6IHVi
aWZzX3JlY292ZXJfbWFzdGVyX25vZGU6IGZhaWxlZCB0byByZWNvdmVyIG1hc3RlciBub2RlCj4g
WyAgIDcyLjU1MDEyMl0gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19i
Z3QwXzAiIHN0b3BzCj4gWyAgIDcyLjcxMDcyMF0gVUJJRlMgKHViaTA6MCk6IE1vdW50aW5nIGlu
IHVuYXV0aGVudGljYXRlZCBtb2RlCj4gWyAgIDcyLjcxNzQ0N10gVUJJRlMgKHViaTA6MCk6IGJh
Y2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiIHN0YXJ0ZWQsIFBJRCAxNDkKPiBbICAgNzIu
Nzc3NjAyXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNDgpOiB1Ymlmc19yZWNvdmVyX21hc3Rl
cl9ub2RlOiBmYWlsZWQgdG8gcmVjb3ZlciBtYXN0ZXIgbm9kZQo+IFsgICA3Mi43ODc3OTJdIFVC
SUZTICh1YmkwOjApOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpZnNfYmd0MF8wIiBzdG9wcwo+Cj4g
RnVsbCBkbWVzZyBvdXRwdXQgaXMgYXRbMl0KPgo+IGdpdCBiaXNlY3QgbGVhZCBtZSB0byBjb21t
aXQgMTE4MTM4NTc4NjRmICgibXRkOiBzcGktbmFuZDogbWFjcm9uaXg6IENvbnRpbnVvdXMgcmVh
ZCBzdXBwb3J0IikuIFJldmVydGluZyB0aGUgYmxhbWVkCj4gY29tbWl0IGZyb20gNi4xMi1yYzUg
c2VlbXMgdG8gYXZvaWQgdGhlIHByb2JsZW0uIFRoZSBmbGFzaCBjaGlwIG9uIG15IGJvYXJkIGlz
IGEgTVgzMExGMkcyOEFELVRJLiBJJ20gbm90IHN1cmUgaWYgdGhlcmUKPiBpcyBhIHByb2JsZW0g
d2l0aCAxMTgxMzg1Nzg2NGYgb3Igd2l0aCBteSBzcGktbWVtIGRyaXZlciB0aGF0IGlzCj4gZXhw
b3NlZCBhZnRlciBzdXBwb3J0IGZvciBjb250aW51b3VzIHJlYWQgaXMgZW5hYmxlZC4KCkNyYXAu
IEkgaGFkIGEgbG9vaywgYW5kIFRCSCBJIGRvbid0IGtub3cuIFRoZSBvbmx5IHRoaW5nIEkgc2Vl
IGluIHlvdXIKZHJpdmVyIG1pZ2h0IGJlIHRoZSBETUEgdnMgUElPIGNob2ljZS4gQ291bGQgeW91
IHRyeSB0byBhbHdheXMgcmV0dXJuCmZhbHNlIGZyb20gcnRsX3NuYW5kX2RtYV9vcCgpPwoKSG93
ZXZlciB5b3Ugc2F5IHlvdSdyZSB1c2luZyBhbiBNWDMwKiBkZXZpY2UsIHRoaXMgaXMgYSByYXcg
TkFORCBjaGlwLApTUEktTkFORCBjaGlwcyBhcmUgSSBiZWxpZXZlIHN0YXJ0aW5nIHdpdGggTVgz
NSogaW4gdGhlaXIgSURzLCBubz8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
