Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3DAC388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 13:08:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8357C206F8
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 13:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1D+tzBJm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8357C206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k1pJ8q3rH3mhM+/GCUp9VEELtvqlpkvX/hS0Q9Dh8qE=; b=1D+tzBJmDRtDkCiK/ZVOQuzCE
	hCSJQqc5TcZKU4SteCCBWIm52mBGRZYZUljq/tK3Yz8f8M56Sktd9sI7VWeuXOw8VF9zqgYCCAA9E
	CWLJLp9cKxrjU41RG9jevilBVqRhJaoPBdwR1aeRtsLPMUzM3cI6XysioaVGGL4SljT032c4PwOlU
	57KyWDkjlY4+2DDNAsqWnq6mRonF+x8pKagMF6S0WqEdvbx6xfzTDodZfR+sBYTlmFvSDcQ8kmx90
	CXS7+OjrmdywoUlg5HHDxiedRFaEO10RiS6dQIFU3VGKq4OZlQo6jHkt/pMAS1HvBjG3pom6D7H1e
	HzuNQPGSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZYe-0006e5-Vk; Mon, 02 Nov 2020 13:07:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZYa-0006cK-AM; Mon, 02 Nov 2020 13:07:33 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D7E9CFF803;
 Mon,  2 Nov 2020 13:07:26 +0000 (UTC)
Date: Mon, 2 Nov 2020 14:07:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v13 2/8] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK2928 and others
Message-ID: <20201102140725.66e7dcb1@xps13>
In-Reply-To: <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>
References: <20201028095326.15562-1-yifeng.zhao@rock-chips.com>
 <20201028095326.15562-3-yifeng.zhao@rock-chips.com>
 <a8a7875b-f08b-62c6-a630-245687e0df3b@gmail.com>
 <e02e13a0-769d-6b73-c87e-5b7d75fd4254@rock-chips.com>
 <0b417fc2-3503-9bf6-914d-0f8b38df1914@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_080732_463669_40A3DFCB 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 Yifeng <yifeng.zhao@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9oYW4sIFlpZmVuZwoKSm9oYW4gSm9ua2VyIDxqYng2MjQ0QGdtYWlsLmNvbT4gd3JvdGUg
b24gTW9uLCAyIE5vdiAyMDIwIDEzOjU3OjU2CiswMTAwOgoKPiBIaSBZaWZlbmcsCj4gCj4gRG9u
J3QgcG9rZSB3aXRoICJlY2MtPmJ5dGVzIiBvbmVzIGl0IGlzIHNldCBpbiBya19uZmNfZWNjX2lu
aXQoKS4gSXQKPiB3aWxsIG5vdCBiZSBub3RlZCBieSB0aGUgTVREIGZyYW1lIHdvcmsgb3IgdXNl
cnNwYWNlLiBJIHRoaW5rIHRoZXJlJ3MKPiBjdXJyZW50bHkgbm8gd2F5IHRvIGxldCB0aGUgdXNl
ciBrbm93IHRoYXQgYSBkaWZmZXJlbnQgRUNDIG11c3QgYmUgdXNlZC4KPiBOZWl0aGVyIGNhbiB0
aGUgdXNlciBzZXQgRUNDIG9uIHRoZSBmbHkuCj4gCj4gRXhhbXBsZSBSL1cgZmxvdzoKPiAKPiAg
ICAgICAgIG5hbmRfc2VsZWN0X3RhcmdldCgpCj4gCWNoaXAtPmVjYy53cml0ZV9wYWdlX3Jhdygp
Cj4gCWNoaXAtPmVjYy53cml0ZV9wYWdlKCkKPiAKPiBbLi5dCj4gCj4gCWNoaXAtPmVjYy5yZWFk
X3BhZ2VfcmF3KCkKPiAJY2hpcC0+ZWNjLnJlYWRfcGFnZSgpCj4gICAgICAgICBuYW5kX2Rlc2Vs
ZWN0X3RhcmdldCgpCj4gCj4gQSB3cml0ZS9yZWFkIHdpdGg6Cj4gCj4gcmtfbmZjX3JlYWRfcGFn
ZV9od2VjYygpCj4gcmtfbmZjX3dyaXRlX3BhZ2VfaHdlY2MoKQo+IAo+IG9yCj4gCj4gcmtfbmZj
X3JlYWRfcGFnZV9yYXcoKQo+IHJrX25mY193cml0ZV9wYWdlX3JhdygpCj4gCj4gbXVzdCBlbmQg
dXAgd2l0aCB0aGUgc2FtZSByZXN1bHQuIElmIHdlIGNhbid0IGFyY2hpdmUgdGhhdCwgdGhlbiB3
ZQo+IHNob3VsZG4ndCBvZmZlciBSQVcgbW9kZSB0byB0aGUgdXNlciBmb3Igbm93LiBJZiBNaXF1
ZWwgYWdyZWVzIHlvdQo+IHNob3VsZCBqdXN0IGdldCB0aGUgZHJpdmVyIHJlYWR5IG5vdyB3aXRo
b3V0IHRoZXNlIDIgZnVuY3Rpb25zIGFuZCByb3VuZAo+IHRoaW5ncyB1cC4KCldoYXQgYWJvdXQg
anVzdCBub3Qgc3VwcG9ydGluZyB0aGUgQm9vdFJPTSBhcmVhIGlmIGl0IHdhcyBtYXJrZWQKInJl
c2VydmVkIiBieSB0aGUgQlJvbSBpbiB0aGUgRFQ/CgpSYXcgYWNjZXNzb3JzIGlzIHJlYWxseSBh
IG5pY2UgYW5kIGJhc2ljIGZlYXR1cmUgdGhhdCBJIHdvdWxkIGxpa2UgdG8KaGF2ZSBpbiBldmVy
eSBuZXcgZHJpdmVyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
