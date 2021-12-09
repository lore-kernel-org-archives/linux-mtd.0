Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4F6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LkSIYsO41rWPU3egknxSvuvRoeRChltlgwN0XnRxWCc=; b=GLbLPsZUVOBB2Z
	4zVDflXKsQrwrHaDmwp3fCEknLWTwXs/EzAXBftnLvs3xiJ2zzqIyVzsNYdFr4QpZrGdqIoaa8SP5
	TByjOczLnTY/tEbNmEvt1zzZUEYxSRvZawRNTBB9lIunOrO/s/Kih/gWWBwhJEkdzyumxI8tDi5x7
	ERqpniYIbRUDiqJbOq4lboQ/do4TUWFoP1+9Sb/0+hvkNjJZ80waVxxI1liwXFEH5XJWDQmNfr/Se
	xhRc4rc52V71T54WjRJhJsFDRjasDugtTH2DUmLioELPTBhdGBPe6fLF5e8F0H60ykbbuxDgsMfV6
	CjViAXK9b3KEPui6KnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvMqP-00GrQe-1m; Thu, 09 Dec 2021 17:04:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvMqM-00GrPf-93
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:04:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B5786E0003;
 Thu,  9 Dec 2021 17:04:25 +0000 (UTC)
Date: Thu, 9 Dec 2021 18:04:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>, Pratyush
 Yadav <p.yadav@ti.com>
Subject: [GIT PULL] mtd: Fixes for 5.16-rc5
Message-ID: <20211209180424.689b70db@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_090430_500903_F0D512EC 
X-CRM114-Status: UNSURE (   7.80  )
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
aGFua3MsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZmE1NWI3
ZGNkYzQzYzFhYTFiYTEyYmNhOWQyZGQ0MzE4YzJhMGRiZjoKCiAgTGludXggNS4xNi1yYzEgKDIw
MjEtMTEtMTQgMTM6NTY6NTIgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQgdGFncy9tdGQvZml4ZXMtZm9yLTUuMTYtcmM1Cgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gMjdhMDMwZTg3MjkyNTViMjA2OGYzNWMxY2Q2MDliNTMyYjI2MzMx
MToKCiAgbXRkOiBkYXRhZmxhc2g6IEFkZCBkZXZpY2UtdHJlZSBTUEkgSURzICgyMDIxLTEyLTAz
IDE0OjMzOjU5ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNVEQgZml4ZXM6CiogZGF0YWZsYXNoOiBBZGQgZGV2
aWNlLXRyZWUgU1BJIElEcyB0byBhdm9pZCBuZXcgd2FybmluZ3MKClJhdyBOQU5EIGZpeGVzOgoq
IEZpeCBuYW5kX2Nob29zZV9iZXN0X3RpbWluZ3MoKSBvbiB1bnN1cHBvcnRlZCBpbnRlcmZhY2UK
KiBGaXggbmFuZF9lcmFzZV9vcCBkZWxheSAod3JvbmcgdW5pdCkKKiBmc21jOgogIC0gRml4IHRp
bWluZyBjb21wdXRhdGlvbgogIC0gVGFrZSBpbnN0cnVjdGlvbiBkZWxheSBpbnRvIGFjY291bnQK
KiBkZW5hbGk6CiAgLSBBZGQgdGhlIGRlcGVuZGVuY3kgb24gSEFTX0lPTUVNIHRvIHNpbGVuY2Ug
cm9ib3RzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkNhaSBIdW9xaW5nICgxKToKICAgICAgbXRkOiByYXduYW5kOiBkZW5h
bGk6IEFkZCB0aGUgZGVwZW5kZW5jeSBvbiBIQVNfSU9NRU0KCkhlcnZlIENvZGluYSAoNCk6CiAg
ICAgIG10ZDogcmF3bmFuZDogRml4IG5hbmRfZXJhc2Vfb3AgZGVsYXkKICAgICAgbXRkOiByYXdu
YW5kOiBGaXggbmFuZF9jaG9vc2VfYmVzdF90aW1pbmdzKCkgb24gdW5zdXBwb3J0ZWQgaW50ZXJm
YWNlCiAgICAgIG10ZDogcmF3bmFuZDogZnNtYzogVGFrZSBpbnN0cnVjdGlvbiBkZWxheSBpbnRv
IGFjY291bnQKICAgICAgbXRkOiByYXduYW5kOiBmc21jOiBGaXggdGltaW5nIGNvbXB1dGF0aW9u
CgpKb24gSHVudGVyICgxKToKICAgICAgbXRkOiBkYXRhZmxhc2g6IEFkZCBkZXZpY2UtdHJlZSBT
UEkgSURzCgogZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfZGF0YWZsYXNoLmMgfCAgOCArKysrKysr
KwogZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyAgICAgICAgfCAgMiArLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvZnNtY19uYW5kLmMgICAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jICAgIHwgIDYgKysr
LS0tCiA0IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
