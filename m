Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86739C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/uJ/pqLMg7H8kpCDwUjNQgAIYIFNDtM698eiV+ecXw=; b=jT/XrtrNqej5q0
	D5J0mqzeldeSLMquqO3r94P1aAsb2Is04s2hXHqc+U0utytrqFHiQY3EAY+xbdyAY2zegIo+VS80R
	MwEHFYmqwASJXOSrMTUir3DdxRahP+Am+NrL+4SK6fxJhpUPV8LCZEyFITX/+2Bj76bqsOYwCJ3kG
	gxBYIy1EYwbDpwhfKhCKNu97KQVXrHqq0eTVAp2Bgrh/J58CFDXICrZYpI0/1j/0lQ+vge6MdMWu0
	xIFqG1KcEaf+11bdWF9oQJskUz8bUk40Cfdn5OqI+I+P5cI5YxsloV/MSGHQWp7tqUzTeBesYKusH
	vcJXAljJdQRyLOjUG0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWHGC-007irN-7A; Mon, 21 Mar 2022 12:35:44 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWHG8-007ip4-Ss
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:35:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15B8D20003;
 Mon, 21 Mar 2022 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647866131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBTSUt8GUXUCOdIHXgmXN1kcOd2zjeOJ9XAUitbr+xI=;
 b=G0hC54UEmqGGQxEcvBpemYxcmxAY5tWsAD2cfncEGI13KhRueHberRW5KAqzl8ypwmBvz2
 tdlH3i6ESXycwgooSKqPDX+KhrUhvyUr8C+T+NxD0jwC2B7E6k3Di9Hw9VdkG68Cu0T6e6
 Y2MSVMm5qdQLLGfdVpCS4pktqKGIEl/zfMm46xAmUV5J8LngS+CJSHX9OwireKRJwYCmCw
 Inu2JRNAu771ULQY/0KTGA+ZC79tt/RqJvItIgBsIawd41I00M5TzCcDsAqm8Vqoh24e8w
 YOOpHPibqbSm1rjYeisrvmKap7IjYU/tzR8yx+kDxNV6svKZIn/qm57y3m1IAw==
Date: Mon, 21 Mar 2022 13:35:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, linux-mtd@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Message-ID: <20220321133529.2d3addaf@xps13>
In-Reply-To: <db755852-effe-c4ca-726c-200d28b0b8a5@leemhuis.info>
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com>
 <db755852-effe-c4ca-726c-200d28b0b8a5@leemhuis.info>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_053541_361256_21DA29D5 
X-CRM114-Status: GOOD (  15.58  )
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

SGkgVGhvcnN0ZW4sCgpyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvIHdyb3RlIG9uIE1vbiwgMjEg
TWFyIDIwMjIgMTI6NDg6MTEgKzAxMDA6Cgo+IE9uIDE2LjAzLjIyIDE2OjU0LCBUb2t1bm9yaSBJ
a2VnYW1pIHdyb3RlOgo+ID4gQXMgcG9pbnRlZCBvdXQgYnkgdGhpcyBidWcgcmVwb3J0IFsxXSwg
YnVmZmVyZWQgd3JpdGVzIGFyZSBub3cgYnJva2VuIG9uCj4gPiBTMjlHTDA2NE4uIFRoaXMgaXNz
dWUgY29tZXMgZnJvbSBhIHJld29yayB3aGljaCBzd2l0Y2hlZCBmcm9tIHVzaW5nIGNoaXBfZ29v
ZCgpCj4gPiB0byBjaGlwX3JlYWR5KCksIGJlY2F1c2UgRFEgdHJ1ZSBkYXRhIDB4RkYgaXMgcmVh
ZCBvbiBTMjlHTDA2NE4gYW5kIGFuIGVycm9yCj4gPiByZXR1cm5lZCBieSBjaGlwX2dvb2QoKS4g
T25lIHdheSB0byBzb2x2ZSB0aGUgaXNzdWUgaXMgdG8gcmV2ZXJ0IHRoZSBjaGFuZ2UKPiA+IHBh
cnRpYWxseSB0byB1c2UgY2hpcF9yZWFkeSBmb3IgUzI5R0wwNjROLgo+ID4gCj4gPiBbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9iNjg3YzI1OS02NDEzLTI2YzktZDRjOS1iM2FmYTY5ZWEx
MjRAcGVuZ3V0cm9uaXguZGUvICAKPiAKPiBXaHkgZGlkIHlvdSBzd2l0Y2ggZnJvbSB0aGUgZG9j
dW1lbnRlZCBmb3JtYXQgZm9yIGxpbmtzIHlvdSBhZGRlZCBvbiBteQo+IHJlcXVlc3QgKHNlZQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3N0YWJsZS9mMWI0NGU4Ny1lNDU3LTc3ODMtZDQ2ZS0w
ZDU3N2NlYTNiNzJAbGVlbWh1aXMuaW5mby8KPiAKPiApIHRvIHYyIHRvIHNvbWV0aGluZyBlbHNl
IHRoYXQgaXMgbm90IHJlY29nbml6ZWQgYnkgdG9vbHMgYW5kIHNjcmlwdHMKPiB0aGF0IHJlbHkg
b24gcHJvcGVyIGxpbmsgdGFncz8gWW91IGFyZSBtYWtpbmcgbXkgYW5kIG1heWJlIG90aGVyIHBl
b3BsZXMKPiBsaWZlIHVubmVjZXNzYXJ5IGhhcmQuIDotKCgKPiAKPiBGV0lXLCB0aGUgcHJvcGVy
IHN0eWxlIHNob3VsZCBzdXBwb3J0IGZvb3Rub3RlIHN0eWxlIGxpa2UgdGhpczoKPiAKPiBMaW5r
Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYjY4N2MyNTktNjQxMy0yNmM5LWQ0YzktYjNh
ZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLwo+ICBbMV0KPiAKPiBDaWFvLCBUaG9yc3Rlbgo+IAo+
ICNyZWd6Ym90IF5iYWNrbW9uaXRvcjoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL2I2ODdj
MjU5LTY0MTMtMjZjOS1kNGM5LWIzYWZhNjllYTEyNEBwZW5ndXRyb25peC5kZS8KPiAKCkJlY2F1
c2UgdG9kYXkncyByZXF1aXJlbWVudCBmcm9tIG1haW50YWluZXJzIGlzIHRvIHByb3ZpZGUgYSBM
aW5rCnRhZyB0aGF0IHBvaW50cyB0byB0aGUgbWFpbCBkaXNjdXNzaW9uIG9mIHRoZSBwYXRjaCBi
ZWluZyBhcHBsaWVkLiBJCnRoZW4gYXNrZWQgdG8gdXNlIHRoZSBhYm92ZSBmb3JtIGluc3RlYWQg
dG8gcG9pbnQgdG8gdGhlIGJ1ZyByZXBvcnQKYmVjYXVzZSBJIGRvbid0IHNlZSB0aGUgcG9pbnQg
b2YgaGF2aW5nIGEgIkxpbmsiIHRhZyBmb3IgaXQ/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
