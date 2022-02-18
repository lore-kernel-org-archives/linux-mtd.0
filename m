Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7117CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRn2pWWHxUzeG6S9mkgbRdNpkgYMARyXp5z8gpVot3w=; b=CbvjmIvXy0Io5V
	qst+IBhRP6kUFKJW8v72RqJNUrnphZMWnUgy7/Juiifo8px2GmFcd8QVgtjb7UPsskMT+mPobprLx
	AoZTCDqa2yHaO2W5CMvgQIdAQaietGHfY3YkuG1PnoZmkQ3j2o8FkfiQ03F6hE1ip+dOjhAd6NT0L
	3NjRE19m8mqcJdQeEDUarsYbZLONkxt0ErMw+bRh3ub0pSmVTH4qTHMK4YdatpTdqSISzk3BszQp7
	YDjueqEDenYmPsr9WO2Mxxhzp7/6AahGUSzVsnrJoVyN22Ua7xQbRaHNRGfRaH3Jl2hrTBzqc+YP8
	FQ0FaBqCfE5HYeOYJGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4N2-00Eo91-1M; Fri, 18 Feb 2022 14:36:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4Mx-00Eo74-T8
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:36:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2AB03C0007;
 Fri, 18 Feb 2022 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fn3nkzJzBFVgF8fM2FSj8yDW3bHjsPdv9AqR1HVmuV8=;
 b=Irw1b76E+oIhx1Kpfcdcml+M1OiiD2cgBNcJAMCO6kinh7CMUOUIxfcksMHIXZedB7oB07
 d8qgOLFVd2GvoSYed/reJERhgP48VsaPIMMcBUKj3HvDqT15hcU92+SfvgYsj+6Dzmg0ru
 o5j+7c0dFkwNuluIcaD4+ZnYVTtN4gMdpuhN61RER/O1aCxHEAQYSAMEQwiG5rQGb7aaRp
 w2gvDkunDOrGs7AwGPw9XFmky7VY7vxqxvv1zEkMoVdamMvTYS13y6OGGnBxM6mtGMS7R0
 +aFCM6SXZ8lDc/JZLjfQVE5tcGWQAxD43a1B+XVMo8esum5/qkU48aoVZO4drA==
Date: Fri, 18 Feb 2022 15:36:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v5.17-rc5
Message-ID: <20220218153617.016a905a@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063624_126136_C65EEB99 
X-CRM114-Status: UNSURE (   7.63  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciB0aGUgbmV4dCAtcmMuCgpU
aGFua3MsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZTc4MzM2
MmViNTRjZDk5YjJjYWM4YjNhOWFlYWM5NDJlNmY2YWMwNzoKCiAgTGludXggNS4xNy1yYzEgKDIw
MjItMDEtMjMgMTA6MTI6NTMgKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTUuMTctcmM1Cgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gMzY0MTVhNzk2NDcxMTgyMmU2MzY5NWVhNjdmZWRlNjM5NzkwNTRk
OToKCiAgbXRkOiByYXduYW5kOiBicmNtbmFuZDogRml4ZWQgaW5jb3JyZWN0IHN1Yi1wYWdlIEVD
QyBzdGF0dXMgKDIwMjItMDEtMzEgMTc6MDg6NTYgKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1URCBjaGFuZ2Vz
OgoqIFFjb206CiAgLSBEb24ndCBwcmludCBlcnJvciBtZXNzYWdlIG9uIC1FUFJPQkVfREVGRVIK
ICAtIEZpeCBrZXJuZWwgcGFuaWMgb24gc2tpcHBlZCBwYXJ0aXRpb24KICAtIEZpeCBtaXNzaW5n
IGZyZWUgZm9yIHBwYXJ0cyBpbiBjbGVhbnVwCiogcGhyYW06IFByZXZlbnQgZGl2aWRlIGJ5IHpl
cm8gYnVnIGluIHBocmFtX3NldHVwKCkKClJhdyBOQU5EIGNvbnRyb2xsZXIgY2hhbmdlczoKKiBp
bmdlbmljOiBGaXggbWlzc2luZyBwdXRfZGV2aWNlIGluIGluZ2VuaWNfZWNjX2dldAoqIHFjb206
IEZpeCBjbG9jayBzZXF1ZW5jaW5nIGluIHFjb21fbmFuZGNfcHJvYmUoKQoqIG9tYXAyOiBQcmV2
ZW50IGludmFsaWQgY29uZmlndXJhdGlvbiBhbmQgYnVpbGQgZXJyb3IKKiBncG1pOiBEb24ndCBs
ZWFrIFBNIHJlZmVyZW5jZSBpbiBlcnJvciBwYXRoCiogYnJjbW5hbmQ6IEZpeCBpbmNvcnJlY3Qg
c3ViLXBhZ2UgRUNDIHN0YXR1cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbnN1ZWwgU21pdGggKDIpOgogICAgICBtdGQ6
IHBhcnNlcnM6IHFjb206IEZpeCBrZXJuZWwgcGFuaWMgb24gc2tpcHBlZCBwYXJ0aXRpb24KICAg
ICAgbXRkOiBwYXJzZXJzOiBxY29tOiBGaXggbWlzc2luZyBmcmVlIGZvciBwcGFydHMgaW4gY2xl
YW51cAoKQnJ5YW4gTydEb25vZ2h1ZSAoMik6CiAgICAgIG10ZDogcmF3bmFuZDogcWNvbTogRml4
IGNsb2NrIHNlcXVlbmNpbmcgaW4gcWNvbV9uYW5kY19wcm9iZSgpCiAgICAgIG10ZDogcGFyc2Vy
czogcWNvbTogRG9uJ3QgcHJpbnQgZXJyb3IgbWVzc2FnZSBvbiAtRVBST0JFX0RFRkVSCgpDaHJp
c3RpYW4gRWdnZXJzICgxKToKICAgICAgbXRkOiByYXduYW5kOiBncG1pOiBkb24ndCBsZWFrIFBN
IHJlZmVyZW5jZSBpbiBlcnJvciBwYXRoCgpEYW4gQ2FycGVudGVyICgxKToKICAgICAgbXRkOiBw
aHJhbTogUHJldmVudCBkaXZpZGUgYnkgemVybyBidWcgaW4gcGhyYW1fc2V0dXAoKQoKTWlhb3Fp
YW4gTGluICgxKToKICAgICAgbXRkOiByYXduYW5kOiBpbmdlbmljOiBGaXggbWlzc2luZyBwdXRf
ZGV2aWNlIGluIGluZ2VuaWNfZWNjX2dldAoKUm9nZXIgUXVhZHJvcyAoMSk6CiAgICAgIG10ZDog
cmF3bmFuZDogb21hcDI6IFByZXZlbnQgaW52YWxpZCBjb25maWd1cmF0aW9uIGFuZCBidWlsZCBl
cnJvcgoKZGF2aWQgcmVnYW4gKDEpOgogICAgICBtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBGaXhl
ZCBpbmNvcnJlY3Qgc3ViLXBhZ2UgRUNDIHN0YXR1cwoKIGRyaXZlcnMvbXRkL2RldmljZXMvcGhy
YW0uYyAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrLS0tLQogZHJpdmVycy9tdGQvbmFuZC9y
YXcvS2NvbmZpZyAgICAgICAgICAgICAgIHwgIDMgKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jICAgfCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1u
YW5kL2dwbWktbmFuZC5jIHwgIDMgKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2lu
Z2VuaWNfZWNjLmMgfCAgNyArKysrKystCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgICAgICAgICAgfCAxNCArKysrKystLS0tLS0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9xY29t
c21lbXBhcnQuYyAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tCiA3IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
