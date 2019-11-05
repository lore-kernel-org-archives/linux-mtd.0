Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC68C5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 18:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BB9214D8
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 18:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8ySWR4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3BB9214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lgJnrgd3nHOEzxwVamRaos35QGHdeC2mjBh5rcMwE0=; b=f8ySWR4DkdRARo
	aWGf6DbGjlMyjMRcc55nfyk3f1M7CvcyLxsNK5QoQMtplFm2r/HgyDGnGSFIbzSQBPMypXEH2JIC/
	Ce85GsHF/TaZG6X+wFDSmWh1b26UWJvZ7V0/+2eq9FaN8iBfEeu7H9crgj1iGyccCuEbXNDfaTBKz
	CY1z8JQKveiZGBJ7PAabxV4FKNvuQsgia94PLBCFa+napoEyIx793BTulppaCAJMTRI9fe48Wy0fX
	r5XAjsRxmgsDbE6e3Tc03duS/DV/H9MJSG5Z5lBsQ66IN2ke9yVmHvHnBnT9IiVnG+Xf36UBS4QRx
	T7RkyW/IblBUW6zLge/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS3Rm-0000cp-IA; Tue, 05 Nov 2019 18:20:54 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS3Ri-0000bi-OT
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 18:20:53 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B6C1820000A;
 Tue,  5 Nov 2019 18:20:32 +0000 (UTC)
Date: Tue, 5 Nov 2019 19:20:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH][RFC] mtd: spinand: fix detection of GD5FxGQ4xA flash
Message-ID: <20191105192031.2847438c@xps13>
In-Reply-To: <20191103142741.7b2a2bf0@collabora.com>
References: <20191016013845.23508-1-gch981213@gmail.com>
 <20191028174131.65c3d580@xps13>
 <CAJsYDVJgwRfg2kfmuG4P-NCEAZ4box+=Yb53d0J+rAjLRpc3Ww@mail.gmail.com>
 <20191103142741.7b2a2bf0@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_102051_069023_0C9C72C8 
X-CRM114-Status: GOOD (  28.48  )
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
Cc: Stefan Roese <sr@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chuanhong Guo <gch981213@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Jeff Kletsky <git-commits@allycomm.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDMgTm92CjIwMTkgMTQ6Mjc6NDEgKzAxMDA6Cgo+IE9uIFN1biwgMyBO
b3YgMjAxOSAyMDowMzoyMSArMDgwMAo+IENodWFuaG9uZyBHdW8gPGdjaDk4MTIxM0BnbWFpbC5j
b20+IHdyb3RlOgo+IAo+ID4gSGkhCj4gPiAKPiA+IE9uIFR1ZSwgT2N0IDI5LCAyMDE5IGF0IDEy
OjQxIEFNIE1pcXVlbCBSYXluYWwKPiA+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZTogIAo+ID4gPgo+ID4gPiBIZWxsbywKPiA+ID4KPiA+ID4gQ2h1YW5ob25nIEd1byA8Z2NoOTgx
MjEzQGdtYWlsLmNvbT4gd3JvdGUgb24gV2VkLCAxNiBPY3QgMjAxOSAwOTozODoyNAo+ID4gPiAr
MDgwMDoKPiA+ID4gICAgCj4gPiA+ID4gR0Q1RnhHUTR4QSBkaWRuJ3QgZm9sbG93IHRoZSBTUEkg
c3BlYyB0byBrZWVwIE1JU08gbG93IHdoaWxlIHNsYXZlIGlzCj4gPiA+ID4gcmVhZGluZywgYW5k
IGluc3RlYWQgTUlTTyBpcyBrZXB0IGhpZ2guIEFzIGEgcmVzdWx0LCB0aGUgZmlyc3QgYnl0ZQo+
ID4gPiA+IG9mIGlkIGJlY29tZXMgMHhGRi4KPiA+ID4gPiBTaW5jZSB0aGUgZmlyc3QgYnl0ZSBp
c24ndCBzdXBwb3NlZCB0byBiZSBjaGVja2VkIGF0IGFsbCwgdGhpcyBwYXRjaAo+ID4gPiA+IGp1
c3QgcmVtb3ZlZCB0aGF0IGNoZWNrLgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUgYXQgaXQsIHJlZG8g
dGhlIGNvbW1lbnQgYWJvdmUgdG8gYmV0dGVyIGV4cGxhaW4gd2hhdCdzIGhhcHBlbmluZy4KPiA+
ID4gPgo+ID4gPiA+IEZpeGVzOiBjZmQ5M2Q3YzkwOGUgKCJtdGQ6IHNwaW5hbmQ6IEFkZCBzdXBw
b3J0IGZvciBHaWdhRGV2aWNlIEdENUYxR1E0VUZ4eEciKQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IENodWFuaG9uZyBHdW8gPGdjaDk4MTIxM0BnbWFpbC5jb20+Cj4gPiA+ID4gQ0M6IEplZmYgS2xl
dHNreSA8Z2l0LWNvbW1pdHNAYWxseWNvbW0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IFJGQzoK
PiA+ID4gPiBJIGRvdWJ0IHdoZXRoZXIgdGhpcyBwYXRjaCBpcyBhIHByb3BlciBmaXggZm9yIHRo
ZSB1bmRlcmx5aW5nIHByb2JsZW06Cj4gPiA+ID4gVGhlIGFjdHVhbCBwcm9ibGVtIGlzIHRoYXQg
d2UgaGF2ZSB0d28gZGlmZmVyZW50IGltcGxlbWVudGF0aW9uIG9mIHJlYWQgaWQKPiA+ID4gPiBj
b21tYW5kOiBPbmUgcmVwbGllcyBpbW1lZGlhdGVseSBhZnRlciBtYXN0ZXIgc2VuZGluZyAweDlm
IGFuZCB0aGUgb3RoZXIKPiA+ID4gPiBuZWVkIHRvIHNlbmQgMHg5ZiBhbmQgYW4gb2Zmc2V0IGJ5
dGUgKGZvdW5kIGluIHdpbmJvbmQgYW5kIGVhcmx5IEdEIGZsYXNoZXMuKSAgICAKPiA+IAo+ID4g
Q29ycmVjdGlvbjogT25seSBlYXJseSBHaWdhRGV2aWNlIG5hbmQgY2hpcHMgdXNlcyB0aGlzIGlt
cGxlbWVudGF0aW9uLgo+ID4gV2luYm9uZCBjaGlwcyB1c2VzIGEgZHVtbXkgYnl0ZSBpbnN0ZWFk
IG9mIGFuIGFkZHJlc3MgYnl0ZSBzbyB0aGVyZSdzCj4gPiBubyBwcm9ibGVtIGZvciBXaW5ib25k
IGNoaXBzLgo+ID4gICAKPiA+ID4gPiBDdXJyZW50IGNvZGUgb25seSB3b3JrcyBpZiBTUEkgbWFz
dGVyIGlzIHByb3Blcmx5IGltcGxlbWVudGVkIChpLmUuIGtlZXAgTU9TSQo+ID4gPiA+IGxvdyB3
aGlsZSByZWFkaW5nLikgICAgCj4gPiA+Cj4gPiA+IEkgYW0gbm90IGVudGlyZWx5IGFnYWluc3Qg
dGhlIGZpeCwgYnV0IHRoaXMgaXMgYSBTUEkgaG9zdCBjb250cm9sbGVyCj4gPiA+IGlzc3VlLCBy
aWdodD8gQ2FuIHlvdSB0cnkgdG8gZml4IHRoZSBjb250cm9sbGVyIGRyaXZlciBpbnN0ZWFkPyAg
ICAKPiA+IAo+ID4gSSB0aGluayB0aGlzIGlzIGEgc3BpIG5hbmQgZnJhbWV3b3JrIGlzc3VlLiBH
aWdhRGV2aWNlIHVzZXMgYW4gdW51c3VhbAo+ID4gUkVBRCBJRCBpbXBsZW1lbnRhdGlvbiwgYW5k
IGFzIGEgcmVzdWx0LCBib3RoIGhvc3QgY29udHJvbGxlciBhbmQgY2hpcAo+ID4gYXJlIHJlYWRp
bmcgZHVyaW5nIHRoZSBmaXJzdCBieXRlIGFmdGVyIDB4OWYgY29tbWFuZDogY2hpcCBpcyByZWFk
aW5nCj4gPiB0aGUgYWRkcmVzcy9vZmZzZXQgYnl0ZSBhbmQgaG9zdCBpcyBleHBlY3RpbmcgdGhl
IGZpcnN0IElEIGJ5dGUuCj4gPiBIZXJlIGxpZXMgdHdvIHByb2JsZW1zOgo+ID4gMS4gQWNjb3Jk
aW5nIHRvIHRoZSBzZXF1ZW5jZSBkaWFncmFtIGluIHRoZWlyIGRhdGFzaGVldCwgTUlTTyBwaW4g
aXMKPiA+IGluIEhpZ2gtWiBzdGF0ZSBkdXJpbmcgdGhlIDB4OWYgY29tbWFuZCBhbmQgdGhlIG9m
ZnNldCBieXRlLCBhbmQgaG9zdAo+ID4gY291bGQgcmVhZCBhbnl0aGluZyBkdXJpbmcgdGhpcyB0
aW1lIGluc3RlYWQgb2YgYSBmaXhlZCAweDAgb3IgMHhmZgo+ID4gYnl0ZSwgc28gdGhlIGNoZWNr
IG9mIGZpcnN0IGJ5dGUgc2hvdWxkIGJlIHJlbW92ZWQuIFRoaXMgaXMgd2hhdCB0aGlzCj4gPiBw
YXRjaCBpcyBkb2luZy4KPiA+IDIuIElmIHRoZXJlJ3MgYSBidWdneSBTUEkgaG9zdCBjb250cm9s
bGVyIHRoYXQgZGlkbid0IGtlZXAgTU9TSSBsb3cKPiA+IGR1cmluZyByZWFkaW5nIG9wZXJhdGlv
biwgdGhlIGNoaXAgd2lsbCBnZXQgMHhmZiBhcyBJRCBvZmZzZXQsIGNhdXNpbmcKPiA+IHRoZSBy
ZWFkIHZlbmRvci9kZXZpY2UgSUQgdG8gYmUgc3dhcHBlZC4gSSBuZXZlciBtZXQgc3VjaCBhIGNv
bnRyb2xsZXIKPiA+IHNvIGZhciwgYnV0IGlmIHRoZXJlIGlzIG9uZSwgaXQgd2lsbCBiZSBhIHNp
bGljb24gYnVnIHRoYXQgY2FuJ3QgYmUKPiA+IGZpeGVkIGJ5IHNvZnR3YXJlLiBUbyBmaXggdGhp
cyBvbmUsIHdlJ2xsIGhhdmUgdG8gbWFrZSBhIHNlY29uZAo+ID4gcmVhZC1pZCBpbXBsZW1lbnRh
dGlvbiBpbiBzcGkgbmFuZCBmcmFtZXdvcmsuICAKPiAKPiBJIHJlYWxpemUgaG93IGZyYWdpbGUg
dGhpcyBJRC1iYXNlZCBkZXRlY3Rpb24gaXMgd2hlbiBtYW51ZmFjdHVyZXJzCj4gZGVjaWRlIHRv
IG5vdCBmb2xsb3cgdGhlIHN0YW5kYXJkIFJFQURJRCBzZW1hbnRpYyAob25lIDB4OWYgY29tbWFu
ZCBieXRlCj4gZm9sbG93ZWQgYnkgMSBvciBtb3JlIGlucHV0IGN5Y2xlcyBlbmNvZGluZyB0aGUg
SUQpLiBMZXQncyBpbWFnaW5lIHlvdQo+IGhhdmUgYSB2YWxpZCBtYW51ZiBJRCBieXRlIGluIElE
WzBdLCBhbmQgdGhlIGRldmljZSBJRCAoSURbMV0pIG1hdGNoZXMKPiB0aGUgV2luYm9uZCBvciBH
aWdhZGV2aWNlIG1hbnVmYWN0dXJlciBJRCwgYW5kIElEWzNdIChleHRlbmRlZCBEZXZpY2UgSUQK
PiBieXRlPykgbWF0Y2hlcyBhIHZhbGlkIFdpbmJvbmQvR2lnYWRldmljZSBkZXZpY2UgSUQuIElm
IHlvdSBza2lwIHRoZQo+IGNoZWNrIG9uIElEWzBdIHlvdSBtaWdodCBlcnJvbmVvdXNseSBkZXRl
Y3QgYSBXaW5ib25kIG9yIEdpZ2FkZXZpY2UKPiBOQU5ELCB3aGlsZSBpdCdzIGFjdHVhbGx5IHNv
bWV0aGluZyBlbHNlLgo+IAo+IE5vdGUgdGhhdCBJIGRvbid0IHJlYWxseSBoYXZlIGEgc29sdXRp
b24gdG8gbWFrZSB0aGlzIGRldGVjdGlvbiBtb3JlCj4gcm9idXN0Lgo+IAo+ID4gCj4gPiBUaGUg
c2Vjb25kIHByb2JsZW0gb25seSBleGlzdCBpbiB0aGVvcnksIHNvIG15IHByZWZlcmVuY2UgaXMg
dG8gYXBwbHkKPiA+IHRoaXMgcGF0Y2ggYW5kIGZpeCBvbmx5IHRoZSBmaXJzdCBwcm9ibGVtIGZv
ciBub3cuICAKPiAKPiBJIHRoaW5rIHdlIHNob3VsZCBmaXggdGhhdCBwcm9ibGVtIG5vdy4gTWF5
YmUgYnkgZG9pbmcgYSAzIHN0ZXBzCj4gZGV0ZWN0aW9uOgo+IAo+IDEvIFJFQURJRCArIElEW10K
PiAyLyBSRUFESUQgKyBEVU1NWSArIElEW10KPiAzLyBSRUFESUQgKyBBRERSICsgSURbXQo+IAo+
IEF0IGVhY2ggc3RlcCB3ZSB3b3VsZCBjaGVjayBpZiB0aGUgcmV0dXJuZWQgSUQgbWF0Y2hlcyBh
IHZhbGlkIE5BTkQsCj4gYW5kIGlmIGl0IGRvZXMsIHN0b3AgdGhlcmUuCgpJIGxpa2UgdGhlIGlk
ZWEuIFRoYXQgd2lsbCBiZSB3YXkgbW9yZSByb2J1c3QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
