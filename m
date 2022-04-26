Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD860C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yi0Y1g1IrkkYK4HyQpxMeoa1vVOxU5S5d7JbIA7mFqk=; b=RgsZnBOl98rMiY
	bWX62+jFdTcXuCmBrH3k+PHSKCuv+LPBemiHyXqgextQJadsTVmBfKO/qMIv2eXfdbWVwsLASt8Xi
	DanwvJbOwCZSvcIKk1KvN5M8xyQRieaBLUksDZVYGXNHjjMf5P0/jKR4L1+GXSr+/RXG6rsfujt69
	XOdy7klp08bvhjl/A49SCJmqkv5bYCTk2XLeg6/KOD1XQnaa3m5lFly7E0rDzsSANzRoqhwkAjXrW
	x0aGkmOiiUo22+UPnHGjkQEArCKJ60h4uEXmalNdpSv1A3bx+Qp33nPDiWzMLskzOiynmI3oNJWnv
	6gyzYy/P2ZNGEs+mjjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLv4-00Eu4k-2S; Tue, 26 Apr 2022 14:11:58 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLuY-00Etog-UZ
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 14:11:28 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1njLuP-0005Ql-Pw; Tue, 26 Apr 2022 16:11:17 +0200
Date: Tue, 26 Apr 2022 15:11:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 4/5] mtd_blkdevs: scan partitions on mtdblock if
 FIT_PARTITION is set
Message-ID: <Ymf9gyfkTn/x7u4S@makrotopia.org>
References: <Yma3ck/hygQ0badz@makrotopia.org> <Ymf5KpEAGybW8W17@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ymf5KpEAGybW8W17@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_071127_030045_5B78BB8A 
X-CRM114-Status: GOOD (  19.84  )
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

T24gVHVlLCBBcHIgMjYsIDIwMjIgYXQgMDY6NTI6NDJBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMjUsIDIwMjIgYXQgMDQ6MDA6MDJQTSArMDEwMCwgRGFu
aWVsIEdvbGxlIHdyb3RlOgo+ID4gRW5hYmxlIHBhcnRpdGlvbiBwYXJzZXJzIG9uIHBsYWluIG10
ZGJsb2NrIGRldmljZXMgaW4gY2FzZSBvZgo+ID4gQ09ORklHX0ZJVF9QQVJUSVRJT04gYmVpbmcg
c2VsZWN0ZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1h
a3JvdG9waWEub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyB8IDIg
KysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMu
Ywo+ID4gaW5kZXggZjczMTcyMTExNDY1NTAuLmU5NzU5YzQxODJmOGQ1IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRkX2Js
a2RldnMuYwo+ID4gQEAgLTM1OSw3ICszNTksOSBAQCBpbnQgYWRkX210ZF9ibGt0cmFuc19kZXYo
c3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKm5ldykKPiA+ICAJfSBlbHNlIHsKPiA+ICAJCXNucHJp
bnRmKGdkLT5kaXNrX25hbWUsIHNpemVvZihnZC0+ZGlza19uYW1lKSwKPiA+ICAJCQkgIiVzJWQi
LCB0ci0+bmFtZSwgbmV3LT5kZXZudW0pOwo+ID4gKyNpZm5kZWYgQ09ORklHX0ZJVF9QQVJUSVRJ
T04KPiA+ICAJCWdkLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwo+ID4gKyNlbmRpZgo+IAo+
IFRoaXMgd2lsbCBqdXN0IHJlY3JlYXRlIHRoZSBmaXhlZCByZWdyZXNzaW9uLCBqdXN0IHdpdGgg
dGhlIGV4dHJhCj4gdHdpc3Qgb2YgbmVlZNGWbmcgYSBjb21wbGV0ZWx5IHVucmVsdGVkIGNvbmZp
ZyBvcHRpb24gdG8gdHJpZ2dlciBpdC4KCkRvIGhhdmUgYW55IGFsdGVybmF0aXZlIHN1Z2dlc3Rp
b24gb2YgaG93IHBhcnRpdGlvbiBzY2FubmluZyBjb3VsZApiZSAoaWRlYWxseSBzZWxlY3RpdmVs
eSkgZW5hYmxlZCBmb3IgbXRkYmxvY2sgKGFuZCB1YmlibG9jaykgZGV2aWNlcz8KQW5kIHdoeSBp
dCBzaG91bGQgYmUgZGlzYWJsZWQgaW4gZmlyc3QgcGxhY2U/CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
