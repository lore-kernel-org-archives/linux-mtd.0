Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A7DC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/+BE5SA3Wqw/XpoINe4HckcZ62ZxJj+W/qtiKtKeWc=; b=BMOqFZShZC7kwv
	qyWzI/EYhIpzvxx9iw/TbIo3QDLom2noMajXZ/mHtaZSvBYEwem+ef8NMNmnm6OAOCWzs84CxuIEd
	A1/G3Gf+mbHLpU4Jt4wZwKVsm35XO+T/jGwY76qEHz3ELPo8KdCTMHpI3FzDuBEUkbUU50Az8lhBj
	IqsaCV1DUwTigtwohtHa/bGFvUygVyc5aHrW4PakwXm1Ss2JyIYKV53JmDwccs/e/w6R8NBtAeb9J
	bbYcovVSnQ52d+mS1FTN7Xt+YgZq6OEKe80W0WNkfEuvR01SF5XQKGIrtcaiBxo+1k4R2Cgm4cUGB
	SzBYFObShLu+qXV4tkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCG25-0051Rr-Sj; Fri, 15 Jul 2022 07:46:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCG22-0051Qa-5U
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 07:46:39 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1oCG1x-0007Bp-CL; Fri, 15 Jul 2022 09:46:33 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1oCG1v-0005yr-K1; Fri, 15 Jul 2022 09:46:31 +0200
Date: Fri, 15 Jul 2022 09:46:31 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <20220715074631.GA7333@pengutronix.de>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtD/9KJZwlVj+6hS@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_004638_227902_68BDF8D5 
X-CRM114-Status: GOOD (  35.42  )
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

T24gRnJpLCBKdWwgMTUsIDIwMjIgYXQgMDc6NDk6NDBBTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDE1LCAyMDIyIGF0IDA3OjI3OjAyQU0gKzAyMDAsIFRv
bWFzeiBNb8WEIHdyb3RlOgo+ID4gT24gTW9uLCAyMDIyLTA3LTExIGF0IDExOjEyICswMjAwLCBU
b21hc3ogTW/FhCB3cm90ZToKPiA+ID4gT24gRnJpLCAyMDIyLTA3LTAxIGF0IDEzOjAzICswMjAw
LCBTYXNjaGEgSGF1ZXIgd3JvdGU6Cj4gPiA+ID4gMDY3ODFhNTAyNjM1MCBGaXhlcyB0aGUgY2Fs
Y3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZX1RJTUVPVVQgcmVnaXN0ZXIKPiA+ID4gPiB2YWx1
ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lfdGltZW91dF9jeWNsZXMgaXMgY2FsY3Vs
YXRlZCB3cm9uZwo+ID4gPiA+IHRob3VnaDogSXQgaXMgY2FsY3VsYXRlZCBiYXNlZCBvbiB0aGUg
bWF4aW11bSBwYWdlIHJlYWQgdGltZSwgYnV0IHRoZQo+ID4gPiA+IHRpbWVvdXQgaXMgYWxzbyB1
c2VkIGZvciBwYWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBvcGVyYXRpb25zIHdoaWNoCj4gPiA+
ID4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiA+ID4gPiAK
PiA+ID4gPiBGaXggdGhpcyBieSBjYWxjdWxhdGluZyBidXN5X3RpbWVvdXRfY3ljbGVzIGZyb20g
dGhlIG1heGltdW0gb2YKPiA+ID4gPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4KPiA+ID4gCj4g
PiA+IDA2NzgxYTUwMjYzNTAgd2FzIG1lcmdlZCBpbiB2NS4xOS1yYzQgYW5kIHRoZW4gd2FzIHBp
Y2tlZCB1cCBieSBzZXZlcmFsCj4gPiA+IHN0YWJsZSBrZXJuZWxzLCBpbmNsdWRpbmcgdjUuMTUu
NTEuIEFmdGVyIHdlIGhhdmUgdXBncmFkZWQgdG8gdjUuMTUuNTEKPiA+ID4gd2UgaGF2ZSBvYnNl
cnZlZCB0aGUgaXNzdWUgdGhhdCBTYXNjaGEgbWVudGlvbmVkIGluIGhpcyBlbWFpbCBbMV0uCj4g
PiA+IAo+ID4gPiBBcyB0aGUgdjUuMTktcmM2IHdhcyByZWxlYXNlZCB5ZXN0ZXJkYXkgYW5kIHRo
aXMgZml4IGlzIHN0aWxsIG5vdAo+ID4gPiBhcHBsaWVkLCB0aGUgdjUuMTktcmM2IChhbmQgYWxs
IHN0YWJsZSBrZXJuZWxzIHRoYXQgcGlja2VkIHVwIHRoZQo+ID4gPiBiYWNrcG9ydCkgY2F1c2Vz
IE5BTkQgZmxhc2ggZGF0YSBsb3NzIG9uIGlteCB0YXJnZXRzLgo+ID4gPiAKPiA+ID4gSSBoYXZl
IGJhY2twb3J0ZWQgdGhpcyBwYXRjaCB0byBvdXIgaW50ZXJuYWwgdjUuMTUuNTEgYmFzZWQga2Vy
bmVsIG9uCj4gPiA+IDR0aCBKdWx5IDIwMjIgYW5kIEkgY2FuIGNvbmZpcm0gdGhhdCBpdCBkb2Vz
IGluZGVlZCBzb2x2ZSB0aGUgTkFORCBkYXRhCj4gPiA+IGxvc3Mgb24gaW14IHRhcmdldHMuCj4g
PiA+IAo+ID4gPiBJcyBpdCBwb3NzaWJsZSBmb3IgdGhpcyBwYXRjaCB0byBtYWtlIGl0IHRvIHRo
ZSB2NS4xOS1yYzc/Cj4gPiAKPiA+IE5vIHJlc3BvbnNlLCBzbyBzZW5kaW5nIHRoZSBlbWFpbCB0
byBtb3JlIHBlb3BsZSBzbyB0aGUgdm9pY2UgaXMgaGVhcmQuCj4gPiBTb3JyeSBpZiB0aGlzIGlz
IG5vdCB0aGUgcHJvcGVyIHdheSwgYnV0IEkgdGhpbmsgdGhlIGlzc3VlIGlzIHNlcmlvdXMuCj4g
PiAKPiA+IEN1cnJlbnQgcHJlcGF0Y2gga2VybmVscyBzdGFydGluZyB3aXRoIHY1LjE5LXJjNCBh
bmQgc3RhYmxlIGtlcm5lbHMKPiA+IHN0YXJ0aW5nIHdpdGggdjUuNC4yMDIuIHY1LjEwLjEyNywg
djUuMTUuNTEsIHY1LjE4LjggY29udGFpbiBhCj4gPiAgICJbUEFUQ0hdIFtSRUFMTFkgUkVBTExZ
IEJST0tFTl0gbXRkOiByYXduYW5kOiBncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0
dGluZyIKPiA+IHRoYXQgaXMgd3JlYWtpbmcgaGF2b2MgdG8gaS5NWFs2NzhdIG9yIGkuTVgyOCBk
ZXZpY2VzIHdpdGggTkFORAo+ID4gICAiKiogVEhJUyBQQVRDSCBXSUxMIENBVVNFIERBVEEgTE9T
UyBPTiBZT1VSIE5BTkQhISAqKiIgWzFdCj4gPiAKPiA+IFRoZSBzb2x1dGlvbiBpcyB0byBlaXRo
ZXI6Cj4gPiAgICogUmV2ZXJ0IDA2NzgxYTUwMjYzNTAgKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IEZp
eCBzZXR0aW5nIGJ1c3kgdGltZW91dAo+ID4gc2V0dGluZyIpIGFuZCBhbGwgaXRzIGNoZXJyeS1w
aWNrcyB0byBzdGFibGUgYnJhbmNoZXMsICpPUioKPiA+ICAgKiBBcHBseSB0aGUgZml4ICgibXRk
OiByYXduYW5kOiBncG1pOiBTZXQgV0FJVF9GT1JfUkVBRFkgdGltZW91dAo+ID4gYmFzZWQgb24g
cHJvZ3JhbS9lcmFzZSB0aW1lcyIpIFsyXQo+ID4gCj4gPiBQbGVhc2UgZG8gd2hhdGV2ZXIgeW91
IHNlZSBmaXQuCj4gCj4gSSBjYW4gZG8gZG8gYSBzdGFibGUgcmVsZWFzZSB3aXRoIHRoaXMgcmV2
ZXJ0ZWQsIGJ1dCBJIHJlYWxseSBleHBlY3RlZAo+IHRvIHNlZSB0aGUgZml4IGluIGxpbnV4LW5l
eHQgYnkgbm93IGF0IHRoZSB2ZXJ5IGxlYXN0LiAgRG9lcyB0aGlzIGRyaXZlcgo+IG5vdCBoYXZl
IGFuIGFjdGl2ZSBtYWludGFpbmVyIGFuZCBzdWJzeXN0ZW0gbWFpbnRhaW5lciBmb3Igc29tZSBy
ZWFzb24/CgpNeSBJUkMgaGlzdG9yeSBkb2Vzbid0IGdvIGJhY2sgZmFyIGVub3VnaCwgYnV0IGlm
IEkgcmVjYWxsIGNvcnJlY3RseQpNaXF1ZWwgaXMgb24gdmFjYXRpb24sIGhlIHdvdWxkIGhhdmUg
cGlja2VkIHVwIHRoaXMgcGF0Y2ggZm9yIGxpbnV4LW5leHQKb3RoZXJ3aXNlLgoKU2FzY2hhCgot
LSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAg
ICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwg
R2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwK
QW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01
MTIxLTIwNjkxNy01NTU1IHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
