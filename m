Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A9FC19F4F
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2024 18:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LXSr0wDHIME3tBMXN31Zs69mG9Jblk89AOZYbYD6PYY=; b=aenxitHTI9VCuG
	o/5CFMuV/CPbMGDy+A8uNgEPxp03y/RIAlWy/7g149ZXwDXhWKWcbdstBpm/tVAdFs4I2sm/R0TXV
	7gsmsDgz9ADNOEGCADMTNdv6PLlcUhpeB/o6Y6mAo0q/GoQgZ35n7YmMHR9ydVqxJRhTYTEzplfUq
	ot2TFdjlmoU2a5q5Riv06Ovi4oKezulosVNKAz5ml7+AGpxGFKbjc7wm2CZZ+KOOJei9E1GBpCgz0
	r+oZIR6CrF+0xrpX8O9R0Mg04icqfZLyO5Tc6pqdZ7N/B/Q0lqE6hSzV6hdcRgXp5EsNb0IRB8oif
	U6TDyzPHNnssxr+1kCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QfZ-0000000DiYv-11sj;
	Fri, 26 Apr 2024 18:51:37 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QfU-0000000DiTh-1T0S
	for linux-mtd@lists.infradead.org;
	Fri, 26 Apr 2024 18:51:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 194BF1C0002;
	Fri, 26 Apr 2024 18:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714157484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BGDwF3LmHI8vTp9didlTcp3I3mEcoXABuDaz4YLe+zg=;
	b=gy9Ml43xUjrjg/Gi5x1lst7/Sa46RY9YXzQeYroTafjQg8xrRb9+zqzVLfekcTmiKRL4c6
	XE1Dyymun20Oo44Lki0ct7AiMGLdeoXSxqG4+aidGUCcx6nHzDEPaArSX16bMplHVZjmSC
	sAcO2jYexgRUU5gzYdvXJWvBp0tTPmwHGop+fc3RL92IO50BZCiUNZX6g9RYiUK1RP/YTh
	aOx1hFsuaAl6u00cO9M5rG2+Tv7Xt8HGnZemwkSqtpPDkj77VbktzVM+2Tpu+mDrq8n7hl
	jAarOaWQfMePDKfck0Qm1ilb12t6E3WCUIMe8AMs/9xRGMEibn1nuSwGdJRrfA==
Date: Fri, 26 Apr 2024 20:51:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v6.9-rc6
Message-ID: <20240426205120.36804cea@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_115132_608032_03887232 
X-CRM114-Status: UNSURE (   8.84  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFuIE1URCBmaXhlcyBQUiBmb3IgdGhlIG5leHQgLXJjLgoK
VGhhbmtzLApNaXF1w6hsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDRjZWNl
NzY0OTY1MDIwYzIyY2ZmNzY2NWIxOGEwMTIwMDYzNTkwOTU6CgogIExpbnV4IDYuOS1yYzEgKDIw
MjQtMDMtMjQgMTQ6MTA6MDUgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTYuOS1yYzYKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byBkMmQ3M2E2ZGQxNzM2NWM0M2UxMDkyNjM4NDFmN2MyNmRhNTVjZmIw
OgoKICBtdGQ6IGxpbWl0IE9UUCBOVk1FTSBjZWxsIHBhcnNlIHRvIG5vbi1OQU5EIGRldmljZXMg
KDIwMjQtMDQtMTUgMTI6MDQ6MzcgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRoZXJlIGhhcyBiZWVuIE9UUCBz
dXBwb3J0IGltcHJvdmVtZW50cyBpbiB0aGUgTlZNRU0gc3Vic3lzdGVtLCBhbmQKbGF0ZXIgYWxz
byBpbXByb3ZlbWVudHMgb2YgT1RQIHN1cHBvcnQgaW4gdGhlIE5BTkQgc3Vic3lzdGVtLiBUaGlz
IGxlYWQKdG8gc2l0dWF0aW9ucyB0aGF0IHdlIGN1cnJlbnRseSBjYW5ub3QgaGFuZGxlLCBzbyBi
ZXR0ZXIgcHJldmVudCB0aGlzCnNpdHVhdGlvbiBmcm9tIGhhcHBlbmluZyBpbiBvcmRlciB0byBh
dm9pZCBjYW5jZWxpbmcgZGV2aWNlJ3MgcHJvYmUuCgpJbiB0aGUgcmF3IE5BTkQgc3Vic3lzdGVt
LCB0d28gcnVudGltZSBmaXhlcyBoYXZlIGJlZW4gc2hhcmVkLCBvbmUKZml4aW5nIHR3byBpbXBv
cnRhbnQgY29tbWFuZHMgaW4gdGhlIFFjb20gZHJpdmVyIHNpbmNlIGl0IGdvdCByZXdvcmtlZAph
bmQgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaGFwcGVuaW5nIG9uIFNUQiBjaGlwcy4KCkFy
bmQgYWxzbyBmaXhlZCBhIFVCU0FOIGxpbmsgZmFpbHVyZSBvbiBkaXNrb25jaGlwLgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpBcm5kIEJlcmdtYW5uICgxKToKICAgICAgbXRkOiBkaXNrb25jaGlwOiB3b3JrIGFyb3VuZCB1
YnNhbiBsaW5rIGZhaWx1cmUKCkNocmlzdGlhbiBNYXJhbmdpICgyKToKICAgICAgbXRkOiByYXdu
YW5kOiBxY29tOiBGaXggYnJva2VuIE9QX1JFU0VUX0RFVklDRSBjb21tYW5kIGluIHFjb21fbWlz
Y19jbWRfdHlwZV9leGVjKCkKICAgICAgbXRkOiBsaW1pdCBPVFAgTlZNRU0gY2VsbCBwYXJzZSB0
byBub24tTkFORCBkZXZpY2VzCgpXaWxsaWFtIFpoYW5nICgxKToKICAgICAgbXRkOiByYXduYW5k
OiBicmNtbmFuZDogRml4IGRhdGEgYWNjZXNzIHZpb2xhdGlvbiBmb3IgU1RCIGNoaXAKCiBkcml2
ZXJzL210ZC9tdGRjb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2Rpc2tvbmNoaXAuYyAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21f
bmFuZGMuYyAgICAgICAgfCA3ICsrKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
