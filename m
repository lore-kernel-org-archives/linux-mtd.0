Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B5BC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 07:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biONI5Is34SQitnSJTS8VBGz/R2rF+FcHyIUrcCiFv8=; b=iHoR3QTdsJxTnc
	cpGPBJxZpzVXWF7XmKCOADiAzY3eAoHEkV6KWzGQ0pT3cq3gMUl/Ir7Nur1x6bpEje0TjTrU/5kOJ
	HPUwOVSW7/0Le32f1XzrT+7ldSo+5+mA4peEoycWLI+ztBE/sdbGjl7e6ViYdH+Hu4Bb8HThf9fxl
	mUwbOpHaq7q/vwEEFuWZGr8dAe/IUdh+0FMwn9iy13pk1NFC+oySVKRU/bUTv1p3ykTvMccOuO5Wy
	nLAOLdXXHgxzW0doEVZmANFTsHPAHyidsQNUHZfucVjKrA9WcjMVGl5o9/f0rAeXv8ioby2liuwMe
	1rMQXQY+09QXI4s9FHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCG9U-00575A-UR; Fri, 15 Jul 2022 07:54:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCG9S-0056pW-91
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 07:54:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0E0661E57;
	Fri, 15 Jul 2022 07:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CB9C3411E;
	Fri, 15 Jul 2022 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657871653;
	bh=4PqNjZhmlfLQad0Ys4OsnaJkFE/aS6qauyDxA00BzSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2eyLj2s/hO1IagWbyL5PXiwEHgzG4rTKr8aQewg0TO/V0/8A31Gs5GehBFI/Q6Vry
	 1eMWtWvdK0d1HmdA1BgIW+4YujA6WyCU6sooEqoTb205SXnoxYEo3spY7Gps02Fr9l
	 DsWzdSHpqKjgZqEbGBI2kx7GnLTYopBS5WbflP0w=
Date: Fri, 15 Jul 2022 09:54:10 +0200
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
Message-ID: <YtEdIujszEKSprbF@kroah.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com>
 <20220715074631.GA7333@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220715074631.GA7333@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_005418_420276_E2896368 
X-CRM114-Status: GOOD (  33.37  )
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

T24gRnJpLCBKdWwgMTUsIDIwMjIgYXQgMDk6NDY6MzFBTSArMDIwMCwgU2FzY2hhIEhhdWVyIHdy
b3RlOgo+IE9uIEZyaSwgSnVsIDE1LCAyMDIyIGF0IDA3OjQ5OjQwQU0gKzAyMDAsIEdyZWcgS3Jv
YWgtSGFydG1hbiB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDE1LCAyMDIyIGF0IDA3OjI3OjAyQU0g
KzAyMDAsIFRvbWFzeiBNb8WEIHdyb3RlOgo+ID4gPiBPbiBNb24sIDIwMjItMDctMTEgYXQgMTE6
MTIgKzAyMDAsIFRvbWFzeiBNb8WEIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgMjAyMi0wNy0wMSBh
dCAxMzowMyArMDIwMCwgU2FzY2hhIEhhdWVyIHdyb3RlOgo+ID4gPiA+ID4gMDY3ODFhNTAyNjM1
MCBGaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZX1RJTUVPVVQgcmVnaXN0
ZXIKPiA+ID4gPiA+IHZhbHVlIGZyb20gYnVzeV90aW1lb3V0X2N5Y2xlcy4gYnVzeV90aW1lb3V0
X2N5Y2xlcyBpcyBjYWxjdWxhdGVkIHdyb25nCj4gPiA+ID4gPiB0aG91Z2g6IEl0IGlzIGNhbGN1
bGF0ZWQgYmFzZWQgb24gdGhlIG1heGltdW0gcGFnZSByZWFkIHRpbWUsIGJ1dCB0aGUKPiA+ID4g
PiA+IHRpbWVvdXQgaXMgYWxzbyB1c2VkIGZvciBwYWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBv
cGVyYXRpb25zIHdoaWNoCj4gPiA+ID4gPiByZXF1aXJlIG9yZGVycyBvZiBtYWduaXR1ZGUgYmln
Z2VyIHRpbWVvdXRzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGaXggdGhpcyBieSBjYWxjdWxhdGlu
ZyBidXN5X3RpbWVvdXRfY3ljbGVzIGZyb20gdGhlIG1heGltdW0gb2YKPiA+ID4gPiA+IHRCRVJT
X21heCBhbmQgdFBST0dfbWF4Lgo+ID4gPiA+IAo+ID4gPiA+IDA2NzgxYTUwMjYzNTAgd2FzIG1l
cmdlZCBpbiB2NS4xOS1yYzQgYW5kIHRoZW4gd2FzIHBpY2tlZCB1cCBieSBzZXZlcmFsCj4gPiA+
ID4gc3RhYmxlIGtlcm5lbHMsIGluY2x1ZGluZyB2NS4xNS41MS4gQWZ0ZXIgd2UgaGF2ZSB1cGdy
YWRlZCB0byB2NS4xNS41MQo+ID4gPiA+IHdlIGhhdmUgb2JzZXJ2ZWQgdGhlIGlzc3VlIHRoYXQg
U2FzY2hhIG1lbnRpb25lZCBpbiBoaXMgZW1haWwgWzFdLgo+ID4gPiA+IAo+ID4gPiA+IEFzIHRo
ZSB2NS4xOS1yYzYgd2FzIHJlbGVhc2VkIHllc3RlcmRheSBhbmQgdGhpcyBmaXggaXMgc3RpbGwg
bm90Cj4gPiA+ID4gYXBwbGllZCwgdGhlIHY1LjE5LXJjNiAoYW5kIGFsbCBzdGFibGUga2VybmVs
cyB0aGF0IHBpY2tlZCB1cCB0aGUKPiA+ID4gPiBiYWNrcG9ydCkgY2F1c2VzIE5BTkQgZmxhc2gg
ZGF0YSBsb3NzIG9uIGlteCB0YXJnZXRzLgo+ID4gPiA+IAo+ID4gPiA+IEkgaGF2ZSBiYWNrcG9y
dGVkIHRoaXMgcGF0Y2ggdG8gb3VyIGludGVybmFsIHY1LjE1LjUxIGJhc2VkIGtlcm5lbCBvbgo+
ID4gPiA+IDR0aCBKdWx5IDIwMjIgYW5kIEkgY2FuIGNvbmZpcm0gdGhhdCBpdCBkb2VzIGluZGVl
ZCBzb2x2ZSB0aGUgTkFORCBkYXRhCj4gPiA+ID4gbG9zcyBvbiBpbXggdGFyZ2V0cy4KPiA+ID4g
PiAKPiA+ID4gPiBJcyBpdCBwb3NzaWJsZSBmb3IgdGhpcyBwYXRjaCB0byBtYWtlIGl0IHRvIHRo
ZSB2NS4xOS1yYzc/Cj4gPiA+IAo+ID4gPiBObyByZXNwb25zZSwgc28gc2VuZGluZyB0aGUgZW1h
aWwgdG8gbW9yZSBwZW9wbGUgc28gdGhlIHZvaWNlIGlzIGhlYXJkLgo+ID4gPiBTb3JyeSBpZiB0
aGlzIGlzIG5vdCB0aGUgcHJvcGVyIHdheSwgYnV0IEkgdGhpbmsgdGhlIGlzc3VlIGlzIHNlcmlv
dXMuCj4gPiA+IAo+ID4gPiBDdXJyZW50IHByZXBhdGNoIGtlcm5lbHMgc3RhcnRpbmcgd2l0aCB2
NS4xOS1yYzQgYW5kIHN0YWJsZSBrZXJuZWxzCj4gPiA+IHN0YXJ0aW5nIHdpdGggdjUuNC4yMDIu
IHY1LjEwLjEyNywgdjUuMTUuNTEsIHY1LjE4LjggY29udGFpbiBhCj4gPiA+ICAgIltQQVRDSF0g
W1JFQUxMWSBSRUFMTFkgQlJPS0VOXSBtdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeCBzZXR0aW5nIGJ1
c3kgdGltZW91dCBzZXR0aW5nIgo+ID4gPiB0aGF0IGlzIHdyZWFraW5nIGhhdm9jIHRvIGkuTVhb
Njc4XSBvciBpLk1YMjggZGV2aWNlcyB3aXRoIE5BTkQKPiA+ID4gICAiKiogVEhJUyBQQVRDSCBX
SUxMIENBVVNFIERBVEEgTE9TUyBPTiBZT1VSIE5BTkQhISAqKiIgWzFdCj4gPiA+IAo+ID4gPiBU
aGUgc29sdXRpb24gaXMgdG8gZWl0aGVyOgo+ID4gPiAgICogUmV2ZXJ0IDA2NzgxYTUwMjYzNTAg
KCJtdGQ6IHJhd25hbmQ6IGdwbWk6IEZpeCBzZXR0aW5nIGJ1c3kgdGltZW91dAo+ID4gPiBzZXR0
aW5nIikgYW5kIGFsbCBpdHMgY2hlcnJ5LXBpY2tzIHRvIHN0YWJsZSBicmFuY2hlcywgKk9SKgo+
ID4gPiAgICogQXBwbHkgdGhlIGZpeCAoIm10ZDogcmF3bmFuZDogZ3BtaTogU2V0IFdBSVRfRk9S
X1JFQURZIHRpbWVvdXQKPiA+ID4gYmFzZWQgb24gcHJvZ3JhbS9lcmFzZSB0aW1lcyIpIFsyXQo+
ID4gPiAKPiA+ID4gUGxlYXNlIGRvIHdoYXRldmVyIHlvdSBzZWUgZml0Lgo+ID4gCj4gPiBJIGNh
biBkbyBkbyBhIHN0YWJsZSByZWxlYXNlIHdpdGggdGhpcyByZXZlcnRlZCwgYnV0IEkgcmVhbGx5
IGV4cGVjdGVkCj4gPiB0byBzZWUgdGhlIGZpeCBpbiBsaW51eC1uZXh0IGJ5IG5vdyBhdCB0aGUg
dmVyeSBsZWFzdC4gIERvZXMgdGhpcyBkcml2ZXIKPiA+IG5vdCBoYXZlIGFuIGFjdGl2ZSBtYWlu
dGFpbmVyIGFuZCBzdWJzeXN0ZW0gbWFpbnRhaW5lciBmb3Igc29tZSByZWFzb24/Cj4gCj4gTXkg
SVJDIGhpc3RvcnkgZG9lc24ndCBnbyBiYWNrIGZhciBlbm91Z2gsIGJ1dCBpZiBJIHJlY2FsbCBj
b3JyZWN0bHkKPiBNaXF1ZWwgaXMgb24gdmFjYXRpb24sIGhlIHdvdWxkIGhhdmUgcGlja2VkIHVw
IHRoaXMgcGF0Y2ggZm9yIGxpbnV4LW5leHQKPiBvdGhlcndpc2UuCgpPaywgbGV0IG1lIGRvIGEg
cm91bmQgb2Ygc3RhYmxlIHJlbGVhc2VzIHNvIHRoYXQgcGVvcGxlIGRvbid0IGdldCBoaXQgYnkK
dGhpcyBub3cuLi4KCkhvcGVmdWxseSB0aGlzIGdldHMgZml4ZWQgdXAgYnkgNS4xOS1maW5hbC4K
CnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
