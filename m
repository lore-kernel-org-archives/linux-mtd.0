Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D51C02183
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2025 19:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nBSTImjePSAOigT0DwuC4CY7n8i7SO2qdXztr51sMOY=; b=jCiTVs1Juiloal
	C259hSxy0GYhCbRo6t0SJPtosZahaHRA1+WY4Bqk102BLlAYwr7RkRgZdDbPnE7h6uFmbDd2ZZ2Dh
	IItheHHopXLUePl/3hie7Yiq/hx/IJOOwZOXcP66XM0cSwYxylSBb1RXq24jpgJxbqpukd/uDXYYI
	8zMilyDiFLg0N1GKG1TzIJmlt7uRkHTo1eD65qNwol57Dgbt27UXIbZ/ICkwNs2uDenaxsFdpxZLA
	YMyEkGisIg53yscknFzkwtZ/Bp30Tkii/11S2OAZNHej2FNSyBbMpB5BcHHttqDHCeDtuzgavuxFT
	ETPIzGLXcihSzwKw+oPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrlp-00000001D1v-0Axj;
	Fri, 17 Jan 2025 19:12:41 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrll-00000001D0f-3ysj
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jan 2025 19:12:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 971431BF204;
	Fri, 17 Jan 2025 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737141154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xz3fty7p9R9lDBGTieqehYOXbkdibwFXI+KJCyFeumQ=;
	b=iwWu3i7smeAkfopUgmJLG1Pz7tHuhoF54GlTqL+lREY4pPFzRIUb3KuNmg8uuBBQm3yD5F
	DDHSXLz8NB8iNWOa2zk0Dh5z5VWVGjeC5XfFNe0V0TnELOOLM6k1BiUSnaOOtp+1M27epc
	HSGHkePKNmqxJup8gY8wla07vlCLed9lVzK71TLKpRb1bSvgwUqXfWRdQNZtJzcALX4Sbs
	XO1TkbMJwzJuKQecJe0aIFeDNWg0lKaBfMNTQmnc55o5I1L6QmBS4cySnJ8PIWxZwkz64U
	YOhN2b2o+4QsGyG9wiBMctiTdUcrKDR0eIELaQT/nVad5LvlHraakKBstszH1g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [GIT PULL] mtd: Fixes for 6.13 final
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 17 Jan 2025 20:12:30 +0100
Message-ID: <87h65xgspt.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_111238_295363_61264913 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gTGludXMsCgpXZSByZWNlbnRseSBpZGVudGlmaWVkIGFuIGlzc3VlIHdpdGggYSByZWNl
bnQgY2hhbmdlIHRoYXQgd2UgZG8gbm90IGtub3cKaG93IHRvIGhhbmRsZSwgd2UgcHJlZmVyIHRv
IHJldmVydCBpdCBiZWZvcmUgdGhlIDYuMTMgcmVsZWFzZSBhcyB3ZSBmZWVsCmxpa2Ugd2UgbmVl
ZCBtb3JlIHRpbWUgdG8gZGlzY3VzcyBhIGJldHRlciBhcHByb2FjaC4KClRoaXMgcmV2ZXJ0IHNo
b3VsZCBpZGVhbGx5IGJlIGFwcGxpZWQgYmVmb3JlIHJlbGVhc2luZyB2Ni4xMy4KClRoYW5rcyBh
bmQgc29ycnkgZm9yIHRoZSBzaG9ydCBub3RpY2UsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgNWJjNTVhMzMzYTJmNzMxNmI1OGVkYzc1NzNlOGU4OTNmN2FjYjUz
MjoKCiAgTGludXggNi4xMy1yYzcgKDIwMjUtMDEtMTIgMTQ6Mzc6NTYgLTA4MDApCgphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9y
LTYuMTMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkMTU2MzhiZjc2YWQ0Nzg3NGVj
YjVkYzM4NmYwOTQ1ZmMwYjJhODc1OgoKICBSZXZlcnQgIm10ZDogc3BpLW5vcjogY29yZTogcmVw
bGFjZSBkdW1teSBidXN3aWR0aCBmcm9tIGFkZHIgdG8gZGF0YSIgKDIwMjUtMDEtMTUgMTg6NDQ6
MjMgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClZlcnkgbGF0ZSB0aGlzIGN5Y2xlIHdlIGlkZW50aWZpZWQgYSBi
cmVha2FnZSB0aGF0IGNvdWxkIHBvdGVudGlhbGx5IGhpdApzZXZlcmFsIHNwaSBjb250cm9sbGVy
IGRyaXZlcnMgYmVjYXVzZSBvZiBhIGNoYW5nZSBpbiB0aGUgd2F5IHRoZSBkdW1teQpjeWNsZXMg
dmFsaWRpdHkgaXMgY2hlY2tlZC4gV2UgZG8gbm90IGtub3cgYXQgdGhlIG1vbWVudCBob3cgdG8g
aGFuZGxlCnRoZSBzaXR1YXRpb24gcHJvcGVybHksIHNvIHdlIHByZWZlciB0byByZXZlcnQgdGhl
IGZhdWx0eSBwYXRjaCBmb3IgdGhlCm5leHQgcmVsZWFzZS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUHJhdHl1c2ggWWFk
YXYgKDEpOgogICAgICBSZXZlcnQgIm10ZDogc3BpLW5vcjogY29yZTogcmVwbGFjZSBkdW1teSBi
dXN3aWR0aCBmcm9tIGFkZHIgdG8gZGF0YSIKCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
