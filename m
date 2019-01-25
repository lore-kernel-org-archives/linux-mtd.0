Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18047C282C6
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC03A2146E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oyUswB6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC03A2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLnrs8hmGkoxh2xdhUbZPA9V5pJ9jhxUQxx1yZzEk8c=; b=oyUswB6MZVaDRO
	SmGDjJRT9NB9TAiMg15PLQKiCeGbW0ylE7rK+C/jUMvEhMM/30F0DGr7Brb2PQOW5E9pL+72KjQJ+
	Gv3Zt87kigN5QRUHdwlg8LKeqIF9QPponASpiJmfKqIyg8vr+rOJPuePp7JAGUPG5IbSgQymcvHqG
	rPp7i7PhGulHOr5bXS6bebYzddlLu290j/LqQV1obWmpDQMv4Z/8aWtIYLOwCYf/+JEIGa+ZTbnK3
	7nkjs9X48ysWmfxDayyceJzcn8ODx0SMbZwSSldQdwBD6RZ3uYyR9rMDP7QhYUvcQx5cHCoUn/gtF
	cNYhFR3qE+LyScCK3XIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0lE-0006ay-DI; Fri, 25 Jan 2019 12:39:04 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0lA-0006aL-Uh
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 12:39:02 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 898CE207B0; Fri, 25 Jan 2019 13:38:59 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 37F3520397;
 Fri, 25 Jan 2019 13:38:49 +0100 (CET)
Date: Fri, 25 Jan 2019 13:38:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: check return code of nand_reset() and
 nand_readid_op()
Message-ID: <20190125133849.155819be@xps13>
In-Reply-To: <CAK7LNATUpyfnicBiSdL49dsFnvo+M=N9X-wY-J0efnRc-1_0gA@mail.gmail.com>
References: <1548075934-19963-1-git-send-email-yamada.masahiro@socionext.com>
 <20190121141403.20f6107b@bbrezillon>
 <CAK7LNATUpyfnicBiSdL49dsFnvo+M=N9X-wY-J0efnRc-1_0gA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_043901_256818_15881900 
X-CRM114-Status: GOOD (  24.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDIyIEphbgoyMDE5IDAwOjU3OjQzICswOTAwOgoKPiBPbiBNb24s
IEphbiAyMSwgMjAxOSBhdCAxMDoxNCBQTSBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCAyMSBKYW4gMjAxOSAyMjowNTozNCArMDkw
MAo+ID4gTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3Jv
dGU6Cj4gPiAgCj4gPiA+IG5hbmRfc2Nhbl9pZGVudCgpIGl0ZXJhdGVzIG92ZXIgbWF4Y2hpcHMg
dG8gZmluZCBhcyBtYW55IGhvbW9nZW5lb3VzCj4gPiA+IGNoaXBzIGFzIHBvc3NpYmxlLgo+ID4g
Pgo+ID4gPiBDdXJyZW50bHksIHRoaXMgbG9vcCBiYWlscyBvdXQgb25seSB3aGVuIG1hbnVmYWN0
dXJlciBvciBkZXZpY2UgSUQKPiA+ID4gdW5tYXRjaGVzLiBUaGUgcmVhc29uIG9mIHVubWF0Y2gg
aXMgbW9zdCBsaWtlbHkgbm8gY2hpcCBpcyBjb25uZWN0ZWQKPiA+ID4gdG8gdGhhdCBjaGlwIHNl
bGVjdC4gSW4gdGhpcyBjYXNlLCBuYW5kX3Jlc2V0KCkgaGFzIGFscmVhZHkgZmFpbGVkLAo+ID4g
PiBhbmQgdGhlIGZvbGxvd2luZyBuYW5kX3JlYWRpZF9vcCgpIGlzIHBvaW50bGVzcy4gIAo+ID4K
PiA+IFdoaWxlIEkgYWdyZWUgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmYsIEknZCBhbHNvIGxpa2Ug
dG8gcG9pbnQgb3V0IHRoYXQKPiA+IG5hbmRfc2NhbigpIGNhbGxlcnMgc2hvdWxkIGtub3cgaG93
IG1hbnkgY29udHJvbGxlciBDUyBsaW5lcyBhcmUKPiA+IGNvbm5lY3RlZCB0byB0aGUgY2hpcCAo
Ym9hcmQgZmlsZSBvciBEVCBkZXNjcmlwdGlvbikuIFRoZSBjaGVjayB3ZSBkbyBpbgo+ID4gbmFu
ZF9zY2FuX2lkZW50KCkgc2hvdWxkIG9ubHkgYmUgaGVyZSB0byBjbGFtcCB0aGlzIHZhbHVlIGlm
IHRoZSBib2FyZAo+ID4gZGVzYyBpcyB3cm9uZyAobWF5YmUgd2Ugc2hvdWxkIGV2ZW4gZmFpbCBp
biB0aGF0IGNhc2UgaW5zdGVhZCBvZgo+ID4gc2lsZW50bHkgZml4aW5nIHRoaW5ncykuICAKPiAK
PiAKPiBJIGtub3cgdGhpcy4KPiBUaGlzIGlzIGEgcHJvYmxlbSBmb3IgZGVuYWxpIGJlY2F1c2UK
PiBJIGhhdmUgbm90IGRlY291cGxlZCBjaGlwL2NvbnRyb2xsZXIgeWV0Lgo+IAo+IAo+IE1heWJl
LCBpcyB0aGUgZm9sbG93aW5nIGJldHRlcj8KPiAKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0+OC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tICAKPiBuYW5kX3NjYW5faWRlbnQoKSBpdGVyYXRlcyBvdmVy
IG1heGNoaXBzIHRvIGZpbmQgYXMgbWFueSBob21vZ2VuZW91cwo+IGNoaXBzIGFzIHBvc3NpYmxl
Lgo+IAo+IFNpbmNlIGNvbW1pdCAyZDQ3MmFiYTE1ZmYgKCJtdGQ6IG5hbmQ6IGRvY3VtZW50IHRo
ZSBOQU5EIGNvbnRyb2xsZXIvTkFORAo+IGNoaXAgRFQgcmVwcmVzZW50YXRpb24iKSwgbmV3IGRy
aXZlcnMgc2hvdWxkIHBhc3MgaW4gdGhlIGV4YWN0IG51bWJlciBvZgo+IENTIGxpbmVzIGluc3Rl
YWQgb2YgcG9zc2libGUgbWF4LCBidXQgb2xkIHBsYXRmb3JtcyBtYXkgc3RpbGwgcmVseSBvbgo+
IG5hbmRfc2Nhbl9pZGVudCgpIHRvIGRldGVjdCB0aGUgYWN0dWFsIG51bWJlciBvZiBjb25uZWN0
ZWQgQ1MgbGluZXMuCj4gCj4gSW4gdGhhdCBjYXNlLCB0aGlzIGxvb3AgYmFpbHMgb3V0IHdoZW4g
bWFudWZhY3R1cmVyIG9yIGRldmljZSBJRAo+IHVubWF0Y2hlcy4gVGhlIHJlYXNvbiBvZiB1bm1h
dGNoIGlzIG1vc3QgbGlrZWx5IG5vIGNoaXAgaXMgY29ubmVjdGVkCj4gdG8gdGhhdCBDUyBsaW5l
LiBJZiBzbywgbmFuZF9yZXNldCgpIHNob3VsZCBhbHJlYWR5IGhhdmUgZmFpbGVkLAo+IGFuZCB0
aGUgZm9sbG93aW5nIG5hbmRfcmVhZGlkX29wKCkgaXMgcG9pbnRsZXNzLgo+IAo+IEJlZm9yZSAt
PmV4ZWNfb3AgaG9vayB3YXMgaW50cm9kdWNlZCwgZHJpdmVycyBoYWQgbm8gd2F5IHRvIHRlbGwK
PiB0aGUgZmFpbHVyZSBvZiBOQU5EX0NNRF9SRVNFVCB0byB0aGUgZnJhbWV3b3JrIGJlY2F1c2Ug
dGhlIGxlZ2FjeQo+IC0+Y21kZnVuYygpIGhhcyB2b2lkIHJldHVybiB0eXBlLiBOb3cgZHJpdmVy
cyBpbXBsZW1lbnRpbmcgLT5leGVjX29wICAKPiBob29rIGNhbiByZXR1cm4gdGhlIGVycm9yIGNv
ZGUuIFlvdSBjYW4gc2F2ZSBuYW5kX3JlYWRpZF9vcCgpIGJ5Cj4gY2hlY2tpbmcgdGhlIHJldHVy
biB2YWx1ZSBvZiBuYW5kX3Jlc2V0KCkuIFRoZSByZXR1cm4gdmFsdWUgb2YKPiBuYW5kX3JlYWRp
ZF9vcCgpIHNob3VsZCBiZSBjaGVja2VkIGFzIHdlbGwuIElmIGl0IGZhaWxzLCBwcm9iYWJseQo+
IGlkWzBdIGFuZCBpZFsxXSBhcmUgdW5kZWZpbmVkIHZhbHVlcy4KPiAKPiBKdXN0IGZvciBjb25z
aXN0ZW5jeSwgaXQgc2hvdWxkIGJlIHNlbnNpYmxlIHRvIGNoZWNrIHRoZSByZXR1cm4KPiBjb2Rl
IGluIG5hbmRfZG9fd3JpdGVfb29iKCkgYXMgd2VsbC4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICAKPiAKClBhdGNoIGFw
cGxpZWQgdG8gbmFuZC9uZXh0IHdpdGggdGhlIHNlY29uZCBjb21taXQgbG9nIHlvdSBwcm9wb3Nl
ZC4KClRoYW5rcyBmb3IgYWxsIHlvdXIgd29yayEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
