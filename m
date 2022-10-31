Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A8BFA3740
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9v0SKgMWEPL4PHr+y6c/cHA8yM4QT3LX/LwTL5wxyw=; b=I0+URX/VAkoZ81
	DHFUFFKc9Swdsf4vIin/PnvTrCJngZ2vRVyc1h0uVsvELYS3Tzl+QNscP5aubvha2HLhuTpkvBtDB
	b4Fj1/ChC440BUsNODZdIcyD/G1oq4VK1A+szV8qHOK8GgGMZ4w8qtIEYCQQjdpakL7DEZ9Oh6/KX
	P8zh/VJ22BVdMlrC/nnJQfougMlHQQkJTGesHjclbcQQn7QkzDH6m5x1C2bdIjsiRYQy3dr1mRyJd
	dpOJitOXzIlvXz7kTWKXOxL7u++fDoeCKjnmhoRW9pMeIOqiQA+g64ckEws7PFFI2nojahlxdh6nK
	f8AB8trevFCVWSu+O2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPRK-009Fke-O8; Mon, 31 Oct 2022 07:42:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPRI-009FiS-J0
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2022 07:42:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A92861000;
	Mon, 31 Oct 2022 07:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3523EC433C1;
	Mon, 31 Oct 2022 07:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667202150;
	bh=1+riR0KFIgYReetD4Za293COMQ2UlNbOhkT/yMgNgrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cV4nE08TCakSA1OgDXwm6hyCe3V7/HbEDl28hHM6GR9xYxDS3FNm5Zxo0vh+Fx5z/
	 atk8g6dns3OdHsBpgvJzpMrS9r0K7m9N/NTngohH21G/svQUFM70LM1QCeRJY/A6Xz
	 xe2bcqWcVkKjXGSHUxc0yW5w8okxnHQ9y6nMtcpY=
Date: Mon, 31 Oct 2022 08:43:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sasha Levin <sashal@kernel.org>, Han Xu <han.xu@nxp.com>,
	kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH RESEND stable 5.10] mtd: rawnand: gpmi: Set
 WAIT_FOR_READY timeout based on program/erase times
Message-ID: <Y198nomOpDZ9SUq/@kroah.com>
References: <20221028213315.4171685-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028213315.4171685-1-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_004232_682245_73515D33 
X-CRM114-Status: GOOD (  20.61  )
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

T24gRnJpLCBPY3QgMjgsIDIwMjIgYXQgMDI6MzM6MTVQTSAtMDcwMCwgVGltIEhhcnZleSB3cm90
ZToKPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gMDY3
ODFhNTAyNjM1MCBGaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZX1RJTUVP
VVQgcmVnaXN0ZXIKPiB2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lfdGltZW91
dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+IHRob3VnaDogSXQgaXMgY2FsY3VsYXRlZCBi
YXNlZCBvbiB0aGUgbWF4aW11bSBwYWdlIHJlYWQgdGltZSwgYnV0IHRoZQo+IHRpbWVvdXQgaXMg
YWxzbyB1c2VkIGZvciBwYWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBvcGVyYXRpb25zIHdoaWNo
Cj4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiAKPiBGaXgg
dGhpcyBieSBjYWxjdWxhdGluZyBidXN5X3RpbWVvdXRfY3ljbGVzIGZyb20gdGhlIG1heGltdW0g
b2YKPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4KPiAKPiBUaGlzIGlzIGZvciBub3cgdGhlIGVh
c2llc3QgYW5kIG1vc3Qgb2J2aW91cyB3YXkgdG8gZml4IHRoZSBkcml2ZXIuCj4gVGhlcmUncyBy
b29tIGZvciBpbXByb3ZlbWVudHMgdGhvdWdoOiBUaGUgTkFORF9PUF9XQUlUUkRZX0lOU1RSIHRl
bGxzIHVzCj4gdGhlIGRlc2lyZWQgdGltZW91dCBmb3IgdGhlIGN1cnJlbnQgb3BlcmF0aW9uLCBz
byB3ZSBjb3VsZCBwcm9ncmFtIHRoZQo+IHRpbWVvdXQgZHluYW1pY2FsbHkgZm9yIGVhY2ggb3Bl
cmF0aW9uIGluc3RlYWQgb2Ygc2V0dGluZyBhIGZpeGVkCj4gdGltZW91dC4gQWxzbyB3ZSBjb3Vs
ZCB3aXJlIHVwIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0byBhY3R1YWxseSBkZXRlY3QKPiBhbmQg
Zm9yd2FyZCB0aW1lb3V0cyBvY2N1cnJlZCB3aGVuIHdhaXRpbmcgZm9yIHRoZSBjaGlwIGJlaW5n
IHJlYWR5Lgo+IAo+IEFzIGEgc2lkZW5vdGUgSSB2ZXJpZmllZCB0aGF0IHRoZSBjaGFuZ2UgaW4g
MDY3ODFhNTAyNjM1MCBpcyByZWFsbHkKPiBjb3JyZWN0LiBJIHdpcmVkIHVwIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciBpbiBteSB0cmVlIGFuZCBtZWFzdXJlZCB0aGUKPiB0aW1lIGJldHdlZW4gc3Rh
cnRpbmcgdGhlIG9wZXJhdGlvbiBhbmQgdGhlIHRpbWVvdXQgaW50ZXJydXB0IGhhbmRsZXIKPiBj
b21pbmcgaW4uIFRoZSB0aW1lIGluY3JlYXNlcyA0MXVzIHdpdGggZWFjaCBzdGVwIGluIHRoZSB0
aW1lb3V0Cj4gcmVnaXN0ZXIgd2hpY2ggY29ycmVzcG9uZHMgdG8gNDA5NiBjbG9jayBjeWNsZXMg
d2l0aCB0aGUgOTlNSHogY2xvY2sKPiB0aGF0IEkgaGF2ZS4KPiAKPiBGaXhlczogMDY3ODFhNTAy
NjM1MCAoIm10ZDogcmF3bmFuZDogZ3BtaTogRml4IHNldHRpbmcgYnVzeSB0aW1lb3V0IHNldHRp
bmciKQo+IEZpeGVzOiBiMTIwNjEyMjA2OWFhICgibXRkOiByYXduaWFuZDogZ3BtaTogdXNlIGNv
cmUgdGltaW5ncyBpbnN0ZWFkIG9mIGFuIGVtcGlyaWNhbCBkZXJpdmF0aW9uIikKPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8cy5oYXVl
ckBwZW5ndXRyb25peC5kZT4KPiBBY2tlZC1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNvbT4KPiBU
ZXN0ZWQtYnk6IFRvbWFzeiBNb8WEIDx0b21hc3oubW9uQGNhbWxpbmdyb3VwLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IC0tLQo+IHN0
YWJsZS01LjEwCgpZb3UgZGlkIG5vdCBzaWduLW9mZiBvbiB0aGlzIGJhY2twb3J0LiAgUGxlYXNl
IGZpeCB0aGF0IHVwIGFuZCByZXNlbmQKYW5kIGFsc28gZ2l2ZSB1cyBhIGhpbnQgYXMgdG8gd2hh
dCB0aGUgdXBzdHJlYW0gY29tbWl0IGlkIGlzIGhlcmUuCgp0aGFua3MsCgpncmVnIGstaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
