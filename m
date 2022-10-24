Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9304FC38A2D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcbJBVqIvMBMh/9yp8sUP6f6FGXetHr1X85/2Kz/IZk=; b=Fc+AGYBJEgAqt4
	Oor4+vYbTXWVARp9BGdSpZI/ETz6SiMqLn0olovnVyAY1mJY0k6d8/Ac6w9u5h6N2QX9nN2gYJttq
	quuvplkkfTaHx2io1k9IiScjOrOHLfm+jEMEZGNc//jNQoebLTBq/dF46SUHzppPss6eVrYrzk6Sm
	aMtfTp0FaqiOoEkg45S9qVPyph1r+g0vgbtlkzsv0jpXj0rH0U8uweAZaUJp9mmcz9Pm68At04oD4
	Mm87y8a6KCPinWspLE5mQ3aPNsYqYaSfBA1CJM/KkeXc965HRpmni8xaMApeORGr4sMR9AvN5YuVg
	md3JnZLV1e5nPny6yjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsOf-00Has3-Uk; Mon, 24 Oct 2022 08:01:21 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsOd-00Har2-QW
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2022 08:01:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 26BB81C0009;
	Mon, 24 Oct 2022 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666598476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WM1gKr/mJ27ySIGzD2Gf2oi7gGjkYnWH+0R0rF+13XI=;
	b=GJEZSBEBwUH2EjeVhW9v2X07otLUMZT5PdZbKjnrSgCumTBgZFZQfXVgsF5SY0TTkAUPOa
	VQAh6zUgOzKc5z76o8AJehxy01Fn734UVuhGPzmTmV0O3ENVBRRkKyfH4lRRjgbPJvpyVn
	79FftIUDh8yyqusaeRRt34rcmzLWc/NUFzxCu9ac59tpMWcTpW5AYvIpFXAXbtyzh41r+Y
	mg0doF9QRchusP4M//U4v4Bjb2xHCO/nxeHD3VP4k5kAeLFjhER7IYoZWUPLF0Mqnvwnk2
	mIhbcH/mtWq8p8KMOQmNgo+Id9peIIy70ni6c8yVpf44GdtIBVbTV1YFXH35UQ==
Date: Mon, 24 Oct 2022 10:01:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tomasz =?UTF-8?B?TW/FhA==?=
 <tomasz.mon@camlingroup.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sasha Levin <sashal@kernel.org>,
 torvalds <torvalds@linux-foundation.org>, Han Xu <han.xu@nxp.com>, kernel
 <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, k drobinski
 <k.drobinski@camlintechnologies.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Message-ID: <20221024100114.627f87bd@xps-13>
In-Reply-To: <CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
	<c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
	<fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
	<YtD/9KJZwlVj+6hS@kroah.com>
	<20220715074631.GA7333@pengutronix.de>
	<YtEdIujszEKSprbF@kroah.com>
	<770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
	<20220902090252.75285234@xps-13>
	<CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_010120_014573_A1938002 
X-CRM114-Status: GOOD (  21.94  )
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

SGkgVGltLAoKdGhhcnZleUBnYXRld29ya3MuY29tIHdyb3RlIG9uIEZyaSwgMjEgT2N0IDIwMjIg
MTQ6NTU6MTUgLTA3MDA6Cgo+IE9uIEZyaSwgU2VwIDIsIDIwMjIgYXQgMTI6MDMgQU0gTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGV5IGZv
bGtzLAo+ID4KPiA+IHJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIEZyaSwgMTUgSnVsIDIwMjIgMDk6
NTk6MTAgKzAyMDAgKENFU1QpOgo+ID4gIAo+ID4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWls
IC0tLS0tICAKPiA+ID4gPj4gTXkgSVJDIGhpc3RvcnkgZG9lc24ndCBnbyBiYWNrIGZhciBlbm91
Z2gsIGJ1dCBpZiBJIHJlY2FsbCBjb3JyZWN0bHkKPiA+ID4gPj4gTWlxdWVsIGlzIG9uIHZhY2F0
aW9uLCBoZSB3b3VsZCBoYXZlIHBpY2tlZCB1cCB0aGlzIHBhdGNoIGZvciBsaW51eC1uZXh0Cj4g
PiA+ID4+IG90aGVyd2lzZS4gIAo+ID4gPgo+ID4gPiBFeGFjdGx5LiAgCj4gPgo+ID4gSW5kZWVk
LCBJIHdhcyBvZmYgZm9yIGFuIGV4dGVuZGVkIHBlcmlvZCBvZiB0aW1lLCBJJ20gKHZlcnkpIHNs
b3dseQo+ID4gY2F0Y2hpbmcgdXAgbm93Lgo+ID4gIAo+ID4gPiAgCj4gPiA+ID4gT2ssIGxldCBt
ZSBkbyBhIHJvdW5kIG9mIHN0YWJsZSByZWxlYXNlcyBzbyB0aGF0IHBlb3BsZSBkb24ndCBnZXQg
aGl0IGJ5Cj4gPiA+ID4gdGhpcyBub3cuLi4gIAo+ID4gPgo+ID4gPiBUaGFua3MgYSBsb3QgZm9y
IGRvaW5nIHNvLgo+ID4gPiAgCj4gPiA+ID4gSG9wZWZ1bGx5IHRoaXMgZ2V0cyBmaXhlZCB1cCBi
eSA1LjE5LWZpbmFsLiAgCj4gPiA+Cj4gPiA+IFN1cmUsIEknbGwgcGlja3VwIHRoaXMgcGF0Y2gu
ICAKPiA+Cj4gPiBUaGFua3MgR3JlZyAmIFJpY2hhcmQgZm9yIHRoZSBoYW5kbGluZyBvZiB0aGlz
IGlzc3VlLgo+ID4KPiA+IENoZWVycywKPiA+IE1pcXXDqGwKPiA+ICAKPiAKPiBIZWxsbyBBbGws
Cj4gCj4gQXMgVG9tYXN6IHN0YXRlZCBwcmV2aW91c2x5IDA2NzgxYTUwMjYzNTAgd2FzIG1lcmdl
ZCBpbiB2NS4xOS1yYzQgYW5kCj4gdGhlbiB3YXMgcGlja2VkIHVwIGJ5IHNldmVyYWwgc3RhYmxl
IGtlcm5lbHMuIFdoaWxlIHRoaXMgbWFkZSBpdCBpbnRvCj4gdGhlIDUuMTUgYW5kIDUuMTggc3Rh
YmxlIGJyYW5jaGVzIGl0IGRpZCBub3QgbWFrZSBpdCBpbnRvIHRoZQo+IGZvbGxvd2luZyB3aGlj
aCBhcmUgdGh1cyB0aGUgYXJlIGN1cnJlbnRseSBicm9rZW46Cj4gNS4xMC55Cj4gNS4xNy55Cj4g
Cj4gSG93IGRvIHdlIGdldCB0aGlzIHBhdGNoIGFwcGxpZWQgdG8gdGhvc2Ugc3RhYmxlIGJyYW5j
aGVzIGFzIHdlbGwgdG8KPiByZXNvbHZlIHRoaXM/CgpJdCBpcyBsaWtlbHkgdGhhdCB0aGUgb3Jp
Z2luYWwgcGF0Y2ggKHRhcmdldGluZyBhIG1haW5saW5lIGtlcm5lbCkgZGlkCm5vdCBhcHBseSB0
byB0aG9zZSBicmFuY2hlcy4gSW4gdGhpcyBjYXNlIHlvdSBjYW4gYWRhcHQgdGhlIGZpeCB0byB0
aGUKY29uY2VybmVkIGtlcm5lbHMgYW5kIHNlbmQgaXQgdG8gc3RhYmxlQCAoZm9sbG93aW5nIHRo
ZSBEb2N1bWVudGF0aW9uCmd1aWRlbGluZXMgZm9yIGJhY2twb3J0cykuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
