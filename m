Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A592C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7SWK2t8C5pbVGNLKHxDfRXHklSmMdEipWR0jZOM7EI=; b=HdspmbuA81jU1J
	O5C4nrxvChJupqFxaHL2QqftWSDYaVGjz3MLGAMgZ54P0RULH6xH3Ei4fpP1I86ft1c/vqxnP/mxd
	Z3MYgUdni5ll1kfdSCfXpEq9ixrJkMAZMCyRHfv4G48yX2D2QIWeGTa2FfIgUy2aYiMguMUvcUqj0
	CS02OqHTlobmDrrmLTi54nswQC5x1w4PVoSZoeTo7afNnjatKOaVvFWglHV4IpxacqQbUpipMktUQ
	HMWNYAd8IIQREmz+d7enqyjHd3asGf3x1vFEun5ng3L0P+jhMZ4yfWP8yc2Kw/2LpCFKOu7yfF+Gv
	OYr6TsdyrLufvppxWexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGAC-0058Rj-9H; Fri, 15 Jul 2022 07:55:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGA9-0058ON-By
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 07:55:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 808CB60C93;
	Fri, 15 Jul 2022 07:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D776C34115;
	Fri, 15 Jul 2022 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657871696;
	bh=82nfuAmhSsviwae5A0o3DEoZ+dx2+ZJjOgTLcfthSQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yGJnEV3FcZZ596SM+iCFty1RInY52h1CIZo+0BxbXNkEnway6WhW/Y1fj4eEpYFJa
	 3y5hoWGOerzY3f3ZeUKgh6/JX54FEc5iCzDk+36zxwJ4AWtWPah15oM18gU3a98XKl
	 ZNtVOBaLjCN5YjFqjqNi2HaZSYL7XUUMWNHH/yVM=
Date: Fri, 15 Jul 2022 09:54:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Han Xu <han.xu@nxp.com>, kernel@pengutronix.de,
	stable@vger.kernel.org, k.drobinski@camlintechnologies.com
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Message-ID: <YtEdTd0qaJmFe2sw@kroah.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com>
 <20220715074631.GA7333@pengutronix.de>
 <YtEdIujszEKSprbF@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtEdIujszEKSprbF@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_005501_517780_4857E3F9 
X-CRM114-Status: GOOD (  36.22  )
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

T24gRnJpLCBKdWwgMTUsIDIwMjIgYXQgMDk6NTQ6MTBBTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDE1LCAyMDIyIGF0IDA5OjQ2OjMxQU0gKzAyMDAsIFNh
c2NoYSBIYXVlciB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDE1LCAyMDIyIGF0IDA3OjQ5OjQwQU0g
KzAyMDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gT24gRnJpLCBKdWwgMTUsIDIw
MjIgYXQgMDc6Mjc6MDJBTSArMDIwMCwgVG9tYXN6IE1vxYQgd3JvdGU6Cj4gPiA+ID4gT24gTW9u
LCAyMDIyLTA3LTExIGF0IDExOjEyICswMjAwLCBUb21hc3ogTW/FhCB3cm90ZToKPiA+ID4gPiA+
IE9uIEZyaSwgMjAyMi0wNy0wMSBhdCAxMzowMyArMDIwMCwgU2FzY2hhIEhhdWVyIHdyb3RlOgo+
ID4gPiA+ID4gPiAwNjc4MWE1MDI2MzUwIEZpeGVzIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgREVW
SUNFX0JVU1lfVElNRU9VVCByZWdpc3Rlcgo+ID4gPiA+ID4gPiB2YWx1ZSBmcm9tIGJ1c3lfdGlt
ZW91dF9jeWNsZXMuIGJ1c3lfdGltZW91dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+ID4g
PiA+ID4gPiB0aG91Z2g6IEl0IGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gdGhlIG1heGltdW0gcGFn
ZSByZWFkIHRpbWUsIGJ1dCB0aGUKPiA+ID4gPiA+ID4gdGltZW91dCBpcyBhbHNvIHVzZWQgZm9y
IHBhZ2Ugd3JpdGUgYW5kIGJsb2NrIGVyYXNlIG9wZXJhdGlvbnMgd2hpY2gKPiA+ID4gPiA+ID4g
cmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IEZpeCB0aGlzIGJ5IGNhbGN1bGF0aW5nIGJ1c3lfdGltZW91dF9jeWNsZXMg
ZnJvbSB0aGUgbWF4aW11bSBvZgo+ID4gPiA+ID4gPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4K
PiA+ID4gPiA+IAo+ID4gPiA+ID4gMDY3ODFhNTAyNjM1MCB3YXMgbWVyZ2VkIGluIHY1LjE5LXJj
NCBhbmQgdGhlbiB3YXMgcGlja2VkIHVwIGJ5IHNldmVyYWwKPiA+ID4gPiA+IHN0YWJsZSBrZXJu
ZWxzLCBpbmNsdWRpbmcgdjUuMTUuNTEuIEFmdGVyIHdlIGhhdmUgdXBncmFkZWQgdG8gdjUuMTUu
NTEKPiA+ID4gPiA+IHdlIGhhdmUgb2JzZXJ2ZWQgdGhlIGlzc3VlIHRoYXQgU2FzY2hhIG1lbnRp
b25lZCBpbiBoaXMgZW1haWwgWzFdLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBcyB0aGUgdjUuMTkt
cmM2IHdhcyByZWxlYXNlZCB5ZXN0ZXJkYXkgYW5kIHRoaXMgZml4IGlzIHN0aWxsIG5vdAo+ID4g
PiA+ID4gYXBwbGllZCwgdGhlIHY1LjE5LXJjNiAoYW5kIGFsbCBzdGFibGUga2VybmVscyB0aGF0
IHBpY2tlZCB1cCB0aGUKPiA+ID4gPiA+IGJhY2twb3J0KSBjYXVzZXMgTkFORCBmbGFzaCBkYXRh
IGxvc3Mgb24gaW14IHRhcmdldHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgaGF2ZSBiYWNrcG9y
dGVkIHRoaXMgcGF0Y2ggdG8gb3VyIGludGVybmFsIHY1LjE1LjUxIGJhc2VkIGtlcm5lbCBvbgo+
ID4gPiA+ID4gNHRoIEp1bHkgMjAyMiBhbmQgSSBjYW4gY29uZmlybSB0aGF0IGl0IGRvZXMgaW5k
ZWVkIHNvbHZlIHRoZSBOQU5EIGRhdGEKPiA+ID4gPiA+IGxvc3Mgb24gaW14IHRhcmdldHMuCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IElzIGl0IHBvc3NpYmxlIGZvciB0aGlzIHBhdGNoIHRvIG1ha2Ug
aXQgdG8gdGhlIHY1LjE5LXJjNz8KPiA+ID4gPiAKPiA+ID4gPiBObyByZXNwb25zZSwgc28gc2Vu
ZGluZyB0aGUgZW1haWwgdG8gbW9yZSBwZW9wbGUgc28gdGhlIHZvaWNlIGlzIGhlYXJkLgo+ID4g
PiA+IFNvcnJ5IGlmIHRoaXMgaXMgbm90IHRoZSBwcm9wZXIgd2F5LCBidXQgSSB0aGluayB0aGUg
aXNzdWUgaXMgc2VyaW91cy4KPiA+ID4gPiAKPiA+ID4gPiBDdXJyZW50IHByZXBhdGNoIGtlcm5l
bHMgc3RhcnRpbmcgd2l0aCB2NS4xOS1yYzQgYW5kIHN0YWJsZSBrZXJuZWxzCj4gPiA+ID4gc3Rh
cnRpbmcgd2l0aCB2NS40LjIwMi4gdjUuMTAuMTI3LCB2NS4xNS41MSwgdjUuMTguOCBjb250YWlu
IGEKPiA+ID4gPiAgICJbUEFUQ0hdIFtSRUFMTFkgUkVBTExZIEJST0tFTl0gbXRkOiByYXduYW5k
OiBncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0dGluZyIKPiA+ID4gPiB0aGF0IGlz
IHdyZWFraW5nIGhhdm9jIHRvIGkuTVhbNjc4XSBvciBpLk1YMjggZGV2aWNlcyB3aXRoIE5BTkQK
PiA+ID4gPiAgICIqKiBUSElTIFBBVENIIFdJTEwgQ0FVU0UgREFUQSBMT1NTIE9OIFlPVVIgTkFO
RCEhICoqIiBbMV0KPiA+ID4gPiAKPiA+ID4gPiBUaGUgc29sdXRpb24gaXMgdG8gZWl0aGVyOgo+
ID4gPiA+ICAgKiBSZXZlcnQgMDY3ODFhNTAyNjM1MCAoIm10ZDogcmF3bmFuZDogZ3BtaTogRml4
IHNldHRpbmcgYnVzeSB0aW1lb3V0Cj4gPiA+ID4gc2V0dGluZyIpIGFuZCBhbGwgaXRzIGNoZXJy
eS1waWNrcyB0byBzdGFibGUgYnJhbmNoZXMsICpPUioKPiA+ID4gPiAgICogQXBwbHkgdGhlIGZp
eCAoIm10ZDogcmF3bmFuZDogZ3BtaTogU2V0IFdBSVRfRk9SX1JFQURZIHRpbWVvdXQKPiA+ID4g
PiBiYXNlZCBvbiBwcm9ncmFtL2VyYXNlIHRpbWVzIikgWzJdCj4gPiA+ID4gCj4gPiA+ID4gUGxl
YXNlIGRvIHdoYXRldmVyIHlvdSBzZWUgZml0Lgo+ID4gPiAKPiA+ID4gSSBjYW4gZG8gZG8gYSBz
dGFibGUgcmVsZWFzZSB3aXRoIHRoaXMgcmV2ZXJ0ZWQsIGJ1dCBJIHJlYWxseSBleHBlY3RlZAo+
ID4gPiB0byBzZWUgdGhlIGZpeCBpbiBsaW51eC1uZXh0IGJ5IG5vdyBhdCB0aGUgdmVyeSBsZWFz
dC4gIERvZXMgdGhpcyBkcml2ZXIKPiA+ID4gbm90IGhhdmUgYW4gYWN0aXZlIG1haW50YWluZXIg
YW5kIHN1YnN5c3RlbSBtYWludGFpbmVyIGZvciBzb21lIHJlYXNvbj8KPiA+IAo+ID4gTXkgSVJD
IGhpc3RvcnkgZG9lc24ndCBnbyBiYWNrIGZhciBlbm91Z2gsIGJ1dCBpZiBJIHJlY2FsbCBjb3Jy
ZWN0bHkKPiA+IE1pcXVlbCBpcyBvbiB2YWNhdGlvbiwgaGUgd291bGQgaGF2ZSBwaWNrZWQgdXAg
dGhpcyBwYXRjaCBmb3IgbGludXgtbmV4dAo+ID4gb3RoZXJ3aXNlLgo+IAo+IE9rLCBsZXQgbWUg
ZG8gYSByb3VuZCBvZiBzdGFibGUgcmVsZWFzZXMgc28gdGhhdCBwZW9wbGUgZG9uJ3QgZ2V0IGhp
dCBieQo+IHRoaXMgbm93Li4uCj4gCj4gSG9wZWZ1bGx5IHRoaXMgZ2V0cyBmaXhlZCB1cCBieSA1
LjE5LWZpbmFsLgoKTm90ZSwgb25lIHdheSB0aGlzIGNvdWxkIGdldCBmaXhlZCB1cCBzb29uZXIg
aWYgaXQgd2FzIHJlcG9ydGVkIHRvIHRoZQpyZWdyZXNzaW9uIGJvdCwgYXMgTGludXMgYW5kIG90
aGVyIHN1YnN5c3RlbSBtYWludGFpbmVycyBkbyBtb25pdG9yIHRoYXQKYW5kIHdpbGwgcGljayB1
cCBwYXRjaGVzIHRoYXQgYXJlIGRyb3BwZWQgbGlrZSB0aGlzIG9uZS4KCnRoYW5rcywKCmdyZWcg
ay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
