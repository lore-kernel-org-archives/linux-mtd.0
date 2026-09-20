Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D12C982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1rFXrLQMZsql8IpnxqrkhW+WAuSeyuyt1wzG/10BYg=; b=lMwtGIc2fMyEAS
	IYtxNL2/BlZ2gg7Z1phBWkG27uYTii3le+4Ed8+OkBWsJqFkKzYDKRvYIJ8Blyf8Mfno1NsKrGWIc
	UI/94LIkJrpir/XWzKdPfKIDN+00hS7B2y7b5HHW5mJjy2HZ8IrMbwBMm+lMPesBe+ocEnoYPE4IP
	hQsOiZflPflYzUsuXvW806QlaatQqols43OQ0byY0WKxL1j9K1PV8CgsH6M013VG5xWIZn/3OmS1o
	2tPmqZNyw5dgxYJWfmcgH3pPKhibyweHB+aAd4YkKTOF1qKWmY/xBYZK1QMp094/dEq/SUAtJb+/1
	PouW70KdiOJI0+JHVlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IH8-0000000HZJ8-26uv;
	Sun, 20 Sep 2026 14:12:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IH7-0000000HZJ0-1eUq
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6746B601DB;
	Sun, 20 Sep 2026 14:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32B51F000FF;
	Sun, 20 Sep 2026 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789913531;
	bh=ooPm1z4Hk459Nv++8dOZ7VzieNwEt094pfRrZ3nLsn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zmpz8DrX2qKFr5Sj0eBCeNPfAqJmTrepgGk4KkUmHit7nqVavyRoy+b3lpQaxbBt/
	 s3hq6M634ooQLmBiowHKXu9dtXDVYpibSxVGvT3F64E/FHfPn5C6dR7UGrPjVJ8xq1
	 yRaJD5ox2/Jknc47KXhbCKNXIVIsgR5p5Yd1o95PDYBkV65mUNdi7r+P7jkZUgRjBB
	 BUNYztkSy+RRL3lM/rYZ7n5EFEGKuIGGB342/w4qNDtkoHoj0i8EX1McPyebBOywY7
	 KsPGajwSSSt+IqGST8UY0RNoOFmqUj+DAZFxz+W3FiH3xgJnsr37Nd3xY66O4FpLZ5
	 0mlJPsMe+hVqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-Q/N
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Michael Walle" <mwalle@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
 <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
Date: Sun, 20 Sep 2026 14:12:10 +0000
Message-Id: <20260920141210.B32B51F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpLW5vcjogd2lu
Ym9uZDogY29tbWl0IG1lc3NhZ2UgY2xhaW1zIEVDQyBzdXBwb3J0IGZvciBXMjVRMzNQVy1RL04g
YnV0IGNvZGUgZXhjbHVkZXMgaXQKLS0KCmNvbW1pdCBhMGUwZGMxNmFhZWYzNWEwNGEzMDBkMjI4
YjdlMDc5NDlkMjJiMzFiCkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KCm10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNVEzM1BX
LVEvTgogICAgClRoZXJlIGlzIGFuIElEIGNvbGxpc2lvbiB3aXRoIGNoaXBzIG9mIHNhbWUgZGVu
c2l0eSBmcm9tIHRoZSBKVyBmYW1pbHkKKHdoaWNoIGl0IHNlbGYgY29uZmxpY3RlZCB3aXRoIHll
dCBhbm90aGVyIGZhbWlseSkuIENoaXBzIGFyZSB2ZXJ5CnNpbWlsYXIgaW4gcHJhY3RpY2UsIGl0
IGlzIG1vc3RseSBhIG1hdHRlciBvZiBlbGVjdHJpY2FsIGRpZmZlcmVuY2VzCihtb3N0bHkgcG93
ZXIgY29uc3VtcHRpb24gYmVpbmcgbG93ZXIpIGFzIHdlbGwgYXMgdGhlIGFkZGl0aW9uIG9mIGlu
bGluZQpFQ0MgY2FwYWJpbGl0eS4KCj4gICAgIFRoZXJlIGlzIGFuIElEIGNvbGxpc2lvbiB3aXRo
IGNoaXBzIG9mIHNhbWUgZGVuc2l0eSBmcm9tIHRoZSBKVyBmYW1pbHkKPiAgICAgKHdoaWNoIGl0
IHNlbGYgY29uZmxpY3RlZCB3aXRoIHlldCBhbm90aGVyIGZhbWlseSkuIENoaXBzIGFyZSB2ZXJ5
Cj4gICAgIHNpbWlsYXIgaW4gcHJhY3RpY2UsIGl0IGlzIG1vc3RseSBhIG1hdHRlciBvZiBlbGVj
dHJpY2FsIGRpZmZlcmVuY2VzCj4gICAgIChtb3N0bHkgcG93ZXIgY29uc3VtcHRpb24gYmVpbmcg
bG93ZXIpIGFzIHdlbGwgYXMgdGhlIGFkZGl0aW9uIG9mIGlubGluZQo+ICAgICBFQ0MgY2FwYWJp
bGl0eS4KPiAgICAgCj4gICAgIDE2IGJ5dGVzIGNodW5rcyBhcmUgcHJvdGVjdGVkIGFnYWluc3Qg
c2luZ2xlIGVycm9ycy4gSW4gY2FzZSBhCj4gICAgIG5vbi1hbGlnbmVkIHdyaXRlIGhhcHBlbnMs
IEVDQyBpcyBsb2NhbGx5IGRpc2FibGVkIHVudGlsIHRoZSBuZXh0IGVyYXNlLgoKW1NldmVyaXR5
OiBNZWRpdW1dCkRvZXMgdGhlIFcyNVEzM1BXLVEvTiBhY3R1YWxseSBoYXZlIEVDQyBzdXBwb3J0
PwoKVGhlIGNvbW1pdCBtZXNzYWdlIGNsYWltcyBpdCBkb2VzLCBidXQgdGhpcyBwYXRjaCBtYXBz
IHRoZSBXMjVRMzNQVy1RL04gdG8KSUQgMHhlZiAweDYwIDB4MTYuIFRoZXJlIGlzIGV4aXN0aW5n
IGxvZ2ljIHRoYXQgZXhwbGljaXRseSBleGNsdWRlcyB0aGlzCmRlbnNpdHkgZnJvbSBFQ0MgY29u
ZmlndXJhdGlvbjoKCmRyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jOndpbmJvbmRfcHdfd2l0
aF9lY2NfbWF0Y2goKSB7CgkuLi4KCS8qIFcyNVF4eFBXIGRlbnNpdGllcyA8PSAzMiBNYml0IChp
ZFsyXSA8PSAweDE2KSBkbyBub3QgaGF2ZSBidWlsdC1pbiBFQ0Mgc3VwcG9ydCAqLwoJcmV0dXJu
IGlkLT5sZW4gPT0gMyAmJiBpZC0+Ynl0ZXNbMl0gPj0gMHgxNzsKfQoKQmVjYXVzZSBpZC0+Ynl0
ZXNbMl0gaXMgMHgxNiwgdGhpcyBmdW5jdGlvbiB3aWxsIHJldHVybiBmYWxzZSBhbmQgRUNDIHdv
bid0CmJlIGVuYWJsZWQuCgpDb3VsZCB0aGUgY29tbWl0IG1lc3NhZ2UgYmUgaW5hY2N1cmF0ZSwg
b3IgZG9lcyB0aGUgRUNDIGV4Y2x1c2lvbiBsb2dpYyBuZWVkCnRvIGJlIHVwZGF0ZWQgdG8gc3Vw
cG9ydCB0aGUgVzI1UTMzUFctUS9OPwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+IGluZGV4IGEyZGVh
NzdkZmMyY2UuLjY5MzRmM2UxMGVjM2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci93aW5ib25kLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+IEBAIC0z
NzMsNyArMzczLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHdpbmJvbmRfbm9y
X3BhcnRzW10gPSB7Cj4gIAkJLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFT
X1RCLAo+ICAJCS5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwg
U1BJX05PUl9RVUFEX1JFQUQsCj4gIAl9LCB7Cj4gLQkJLyogVzI1UTMyRFctUC9HLCBXMjVRMzJG
Vy1HL1EsIFcyNVEzMkpXLVEvTiAqLwo+ICsJCS8qIFcyNVEzMkRXLVAvRywgVzI1UTMyRlctRy9R
LCBXMjVRMzJKVy1RL04sIFcyNVEzM1BXLVEvTiAqLwo+ICAJCS5pZCA9IFNOT1JfSUQoMHhlZiwg
MHg2MCwgMHgxNiksCj4gIAkJLm5hbWUgPSAidzI1cTMyZHciLAo+ICAJCS5zaXplID0gU1pfNE0s
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwOTIwLXdpbmJvbmQtbWFzdGVyLXNwaS1ub3ItanctY2xlYW51cC1wdy1hZGRpdGlvbi12
Mi0wLWFiOWM5Njg4ZDA3MUBib290bGluLmNvbT9wYXJ0PTE3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
