Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE47AC982D8
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O1zVVwiDhXQ1k4yUIHOTELGLxEnNDs9dp6Nf4GBfmdg=; b=1J9aLpqKOHnTink6bwE5jzy8+A
	2MvWYQbvc1vfWuVAamDVdC7yHTpsSq7bBuEej402a5Q0Sr/NkGEo7wIsjFKSQ7H6XrGF7cNSHdmdT
	2tKPe6Tj4TXn3jGeAYU+M2/ymDLTd9DGMuudLKyRhF7KsEXJpcub0FtKFyhrNjBReIoaBKBUBu9DS
	LIuGQIwI/GdJqzZe8zp6eKc3DvPi0GzWOfm+FsrE0dVzf7NITXNBhI3PfUmRKLk31SPTtXBtUMg3Q
	qsrCVUqmD2tUAcPiDbtbKdEnAJ5rZmUX5qPW4e27nTtdtfDNtUhmLxN6WvbGsEfvMciG020HzpuMk
	Y3bZUk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w3I-0000000GNN8-0dfT;
	Sat, 19 Sep 2026 14:28:28 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w3F-0000000GNMG-15Ze
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 14:28:26 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789828095; bh=UrgYY8MFqXrOzsNouXVaAax
	Dtnqt6fnSXyeh0VeYM04=; b=7vQXNP/H9pGK1c3sSY/0ts6j4BwJQQ+XL68EgHg0L7wuJxqWT6
	YAC3PsBSpDVmJlU6ziWQWoDgdNVwsKAmfRBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789828095; bh=UrgYY8MFqXrOzsNouXVaAax
	Dtnqt6fnSXyeh0VeYM04=; b=imjidSQuACRRCll4S1R1l/07/MzzkUkwiwx9HR69cq66NxOBpD
	MYQVNIUs5gHDC6oq1sWv/ppmhxZz54Qypde1greKAAMu3K7zYJAIOTwappCLfYMmIt2Ov2xO4l4
	VJaY9LfbFeufDEEAZfGS31axjn/dvpsjyHGfRAiYK566XPjwiGZF3k2Y0ysMAYXzWCMdoV6mahy
	AECeNmF0RioV5w9R414+0UrRgeXEJOHeMriq9H/ssHF3oGrthNgytBrPZ5nzazMmGmFDmnZqWsD
	O1ciQJdv32pnd9FnEJ2K8ArPz6dlH5wpVcdRaqEhgLHi/GKcNSUArYMb6Gb51ah7LJQ==;
From: "Richard Weinberger" <richard@nod.at>
To: =?utf-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: "Chris Roy" <iam@thechris.in>, 
	"Greg KH" <gregkh@linuxfoundation.org>, 
	"syzbot" <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, 
	<dakr@kernel.org>, <driver-core@lists.linux.dev>, 
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rafael@kernel.org>, <syzkaller-bugs@googlegroups.com>, 
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>, 
	<vigneshr@ti.com>, "Adarsh Das" <adarshdas950@gmail.com>
Subject: AW: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
In-Reply-To: <aq6afmdN5DYpuUa2@cashel.logfs.org>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
	<6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
	<CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
	<2026091753-broadness-bootie-b683@gregkh>
	<CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
	<aqwuWWMwdIcx3704@cashel.logfs.org>
	<mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
	<aq6afmdN5DYpuUa2@cashel.logfs.org>
Date: Sat, 19 Sep 2026 14:28:15 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072825_297426_23575AAD 
X-CRM114-Status: UNSURE (   9.27  )
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

QW0gU2F0LCBTZXAgMTksIDIwMjYsIDE2OjIyIHNjaHJpZWIgSsO2cm4gRW5nZWwgPGpvZXJuQGJh
cmVseXNlY3VyZS5vcmc+Ogo+IEkgYWRkZWQgQWRhcnNoIERhcywgd2hvIGFsc28gYXR0ZW1wdGVk
IHRvIGZpeCB0aGlzIGJ1Zy4KPiAKPiBPbiBTYXQsIFNlcCAxOSwgMjAyNiBhdCAwNzo0MjoyNUFN
ICswMDAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gPiAKPiA+IFdoaWxlIHdlJ3JlIGhl
cmUsIG1heWJlIGl0J3MgdGltZSB0byBhZGQgYSBkZWNlbnQgY29uZmlnZnMgaW50ZXJmYWNlIHRv
Cj4gPiB0aGlzIGRyaXZlciBpbnN0ZWFkIG9mIGNvbmZpZ3VyaW5nIHRocm91Z2ggbW9kdWxlIHBh
cmFtZXRlcnMuCj4gPiBUaGF0IHdheSBhbHNvIG11bHRpcGxlIGluc3RhbmNlcyBhcmUgcG9zc2li
bGUuCj4gCj4gSSBob25lc3RseSB3b25kZXIgd2hldGhlciB0aGlzIGRyaXZlciBoYXMgYW55IHBy
b2R1Y3Rpb24gdXNlcnMuICBJdCBpcwo+IHNvbWV3aGF0IHVzZWZ1bCBmb3IgZGV2ZWxvcGVycyB0
aGF0IHdhbnQgdG8gc2ltdWxhdGUgaGFyZHdhcmUgdGhleSBkb24ndAo+IGhhdmUuICBCdXQgYmV5
b25kIHRoYXQ/CgpJTUhPIHRlc3RpbmcgaXMgdGhlIG9ubHkgdXNlIGNhc2UuIEkgdXNlIGl0IHJl
Z3VsYXJseS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
