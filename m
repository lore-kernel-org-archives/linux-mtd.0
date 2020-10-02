Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AC8C4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 06:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211A3206DD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 06:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eX3eubZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 211A3206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K5+of6hQROyVfm9NKy+1dhTaU8kFPV+H+OZemTmdOSU=; b=eX3eubZgnpkrtTYvK6FJP5U4b
	yIUv+87XyqEAvY3p2f74BWhn/p8M8nd4Vj2zBS9Q4A9m3H9Gd3ToaFt0VskoQPrNu2z7y+V8vUm/4
	Y/mfh9iy0GNQuobC6lDonc8p4DuNCsQhJqqvt4hPWdYbyZqrul2714BtDa7biXa0WAeeOMu/1fVZ7
	tbasmuzS9tYx9a7n4pNzFbDCPtgoD/mTe50dp1NwUT/svxC9/ocPZfcYYQh33DKQRaiavfMpmCcXQ
	mR9ptFFTJ1UrFx4VwJ6GNgEcgA4GA03uciOKI788A0jvPiLpktBqiH/lpe6XoULtm4nPgE2nUjn87
	YluhjZbJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOEX8-0001ro-Vk; Fri, 02 Oct 2020 06:27:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOEX5-0001r1-1Q; Fri, 02 Oct 2020 06:27:08 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C3A481C000B;
 Fri,  2 Oct 2020 06:27:01 +0000 (UTC)
Date: Fri, 2 Oct 2020 08:27:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v9 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
Message-ID: <20201002082700.7ed74f27@xps13>
In-Reply-To: <20200929090807.21511-3-yifeng.zhao@rock-chips.com>
References: <20200929090807.21511-1-yifeng.zhao@rock-chips.com>
 <20200929090807.21511-3-yifeng.zhao@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_022707_190227_935C2CA9 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWWlmZW5nLAoKWWlmZW5nIFpoYW8gPHlpZmVuZy56aGFvQHJvY2stY2hpcHMuY29tPiB3cm90
ZSBvbiBUdWUsIDI5IFNlcCAyMDIwCjE3OjA4OjA1ICswODAwOgoKPiBUaGlzIGRyaXZlciBzdXBw
b3J0cyBSb2NrY2hpcCBORkMgKE5BTkQgRmxhc2ggQ29udHJvbGxlcikgZm91bmQgb24gUkszMzA4
LAo+IFJLMjkyOCwgUktQWDMwLCBSVjExMDggYW5kIG90aGVyIFNPQ3MuIFRoZSBkcml2ZXIgaGFz
IGJlZW4gdGVzdGVkIHVzaW5nCj4gOC1iaXQgTkFORCBpbnRlcmZhY2Ugb24gdGhlIEFSTSBiYXNl
ZCBSSzMzMDggcGxhdGZvcm0uCj4gCj4gU3VwcG9ydCBSb2NrY2hpcCBTb0NzIGFuZCBORkMgdmVy
c2lvbnM6Cj4gLSBQWDMwIGFuZCBSSzMzMjYoTkZDdjkwMCkuCj4gCUVDQzogMTYvNDAvNjAvNzAg
Yml0cy8xS0IuCj4gCUNMT0NLOiBhaGIgYW5kIG5mYy4KPiAtIFJLMzMwOCBhbmQgUlYxMTA4KE5G
Q3Y4MDApLgo+IAlFQ0M6IDE2IGJpdHMvMUtCLgo+IAlDTE9DSzogYWhiIGFuZCBuZmMuCj4gLSBS
SzMwMzYgYW5kIFJLMzEyOChORkN2NjIyKS4KPiAJRUNDOiAxNi8yNC80MC82MCBiaXRzLzFLQi4K
PiAJQ0xPQ0s6IGFoYiBhbmQgbmZjLgo+IC0gUkszMDY2LCBSSzMxODggYW5kIFJLMjkyOChORkN2
NjAwKS4KPiAJRUNDOiAxNi8yNC80MC82MCBiaXRzLzFLQi4KPiAJQ0xPQ0s6IGFoYi4KPiAKPiBT
dXBwb3J0ZWQgZmVhdHVyZXM6Cj4gLSBSZWFkIGZ1bGwgcGFnZSBkYXRhIGJ5IERNQS4KPiAtIFN1
cHBvcnQgSFcgRUNDKG9uZSBzdGVwIGlzIDFLQikuCj4gLSBTdXBwb3J0IDIgLSAzMksgcGFnZSBz
aXplLgo+IC0gU3VwcG9ydCA4IENTKGRlcGVuZCBvbiBTb0NzKQo+IAo+IExpbWl0YXRpb25zOgo+
IC0gTm8gc3VwcG9ydCBmb3IgdGhlIGVjYyBzdGVwIHNpemUgaXMgNTEyLgo+IC0gVW50ZXN0ZWQg
b24gc29tZSBTb0NzLgo+IC0gTm8gc3VwcG9ydCBmb3Igc3VicGFnZXMuCj4gLSBObyBzdXBwb3J0
IGZvciB0aGUgYnVpbHRpbiByYW5kb21pemVyLgo+IC0gVGhlIG9yaWdpbmFsIGJhZCBibG9jayBt
YXNrIGlzIG5vdCBzdXBwb3J0ZWQuIEl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZQo+ICAgdGhlIEJC
VChiYWQgYmxvY2sgdGFibGUpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlpZmVuZyBaaGFvIDx5aWZl
bmcuemhhb0Byb2NrLWNoaXBzLmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHY5Ogo+IC0gVGhl
IG5mYy0+YnVmZmVyIHdpbGwgcmVhbGxvYyB3aGlsZSB0aGUgcGFnZSBzaXplIG9mIHRoZSBzZWNv
bmQgbXRkCj4gICBpcyBsYXJnZSB0aGFuIHRoZSBmaXJzdCBvbmUKPiAtIEZpeCBjb2Rpbmcgc3R5
bGUuCj4gLSBSZW1vdmUgc3RydWN0IHJrX25mY19jbGsuCj4gLSBQcmVwZW5kIHNvbWUgZnVuY3Rp
b24gd2l0aCBya19uZmNfLgo+IC0gUmVwbGFjZSBmdW5jdGlvbiByZWFkbF9wb2xsX3RpbWVvdXRf
YXRvbWljIHdpdGggcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQuCj4gLSBSZW1vdmUgZnVuY3Rp
b24gcmtfbmZjX3JlYWRfYnl0ZSBhbmQgcmtfbmZjX3dyaXRlX2J5dGUuCj4gLSBEb24ndCBzZWxl
Y3QgdGhlIGRpZSBpZiAnY2hlY2tfb25seSA9PSB0cnVlJyBpbiBmdW5jdGlvbiBya19uZmNfZXhl
Y19vcC4KPiAtIE1vZGlmeSBmdW5jdGlvbiBya19uZmNfd3JpdGVfcGFnZSBhbmQgcmtfbmZjX3dy
aXRlX3BhZ2VfcmF3LgoKWW91IHNob3VsZCBwcm9iYWJseSByZWJhc2UgeW91ciBwYXRjaGVzIG9u
IGEgbW9yZSByZWNlbnQga2VybmVsLCB0aGVyZQphcmUgc2V2ZXJhbCBpbmNvbnNpc3RlbmNpZXMg
d2l0aCB0aGUgY3VycmVudCBjb3JlIChzZWUgdGhlIGtlcm5lbCB0ZXN0CnJvYm90IHJlcG9ydHMp
LiBQbGVhc2UgY29uc2lkZXIgaGF2aW5nIGEgbG9vayBhdCB0aGUgaGlzdG9yeSB0byBmb2xsb3cK
dGhlIG5hbWluZy4gSWYgeW91IG5lZWQgaGVscCwgcGxlYXNlIGFzayEKCkNoZWVycywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
