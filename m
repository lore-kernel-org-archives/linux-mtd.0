Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22490C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NWvYxZEvM+W/XsHOecwlgYjOZE+cdIHICnU4LqMGSk=; b=ppBTsLLQpSBjSG
	7AQB1BUMgkugteOPTnBhryptAxZo5XgIhczwOXwZiSqvagZ5kdaQOBnCpXcSDVObdEytbVISP/EyR
	lJ2FWhJM62tP7RviIM8tJJ1LfyEq3hXhKveYpoFQu2wBDd1RX+MFDrf9Ad2B80lapQ14IpzU1obMX
	fAhMZZksmYIb/5RrN1nlrNM0igRRO8Vj5IOdLH1tpOMCyvK5WLZy2mCJfgOXepYYriOSm7dTkHX/s
	OJJqPesnKVM7sIyKiCCDpZV/lGL7ZA1uKDjEqlWF45OM9QAKv3fT9umyUMWkM58Y9rXF1GZtPjY8+
	ulijrExh7fRA07G8CzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLck-00ElYl-PE; Tue, 26 Apr 2022 13:53:02 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1njLcQ-00ElLb-N2; Tue, 26 Apr 2022 13:52:42 +0000
Date: Tue, 26 Apr 2022 06:52:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 4/5] mtd_blkdevs: scan partitions on mtdblock if
 FIT_PARTITION is set
Message-ID: <Ymf5KpEAGybW8W17@infradead.org>
References: <Yma3ck/hygQ0badz@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yma3ck/hygQ0badz@makrotopia.org>
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

T24gTW9uLCBBcHIgMjUsIDIwMjIgYXQgMDQ6MDA6MDJQTSArMDEwMCwgRGFuaWVsIEdvbGxlIHdy
b3RlOgo+IEVuYWJsZSBwYXJ0aXRpb24gcGFyc2VycyBvbiBwbGFpbiBtdGRibG9jayBkZXZpY2Vz
IGluIGNhc2Ugb2YKPiBDT05GSUdfRklUX1BBUlRJVElPTiBiZWluZyBzZWxlY3RlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5j
IGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IGluZGV4IGY3MzE3MjExMTQ2NTUwLi5lOTc1
OWM0MTgyZjhkNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4gKysr
IGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IEBAIC0zNTksNyArMzU5LDkgQEAgaW50IGFk
ZF9tdGRfYmxrdHJhbnNfZGV2KHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpuZXcpCj4gIAl9IGVs
c2Ugewo+ICAJCXNucHJpbnRmKGdkLT5kaXNrX25hbWUsIHNpemVvZihnZC0+ZGlza19uYW1lKSwK
PiAgCQkJICIlcyVkIiwgdHItPm5hbWUsIG5ldy0+ZGV2bnVtKTsKPiArI2lmbmRlZiBDT05GSUdf
RklUX1BBUlRJVElPTgo+ICAJCWdkLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwo+ICsjZW5k
aWYKClRoaXMgd2lsbCBqdXN0IHJlY3JlYXRlIHRoZSBmaXhlZCByZWdyZXNzaW9uLCBqdXN0IHdp
dGggdGhlIGV4dHJhCnR3aXN0IG9mIG5lZWTRlm5nIGEgY29tcGxldGVseSB1bnJlbHRlZCBjb25m
aWcgb3B0aW9uIHRvIHRyaWdnZXIgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
