Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509C2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wcvg3HGsMf8qbkgJiKKjBOaRP7pMHvgOung7rtVXgOc=; b=JvVnR3rkXC0Qfl3mDV54baToVB
	e0rSmqQfX2hjZ5qmQgjrKinXlyJ2hL4jitrSnNW4iKiUixkU86i9X9xCQfl51gVRywZcdKYpMywa+
	uj88aQNZRhit2dLbAGdpowEjaYgupz4Qe4yOGhhg+0cHqk5RXV3RbdTHbgO4lqprji7Tfdh60euRG
	qQSXaBV+yTwV1JR3ZCtnnvmf3fKoenP76SGBTZcXpZlGZUdHp8NdR/A0ruPuZtA1IW3ih9a6j058G
	f23wQx7kxT4IwJd7dwElzXDHmf0IvcJP00s/PBtF+mKXR1fpARhV2bX8n7xkqvORCCzqV+geS/Ycb
	VRDkfN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFZ7d-000kvm-8C; Thu, 03 Feb 2022 10:13:49 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFZ7Z-000ktD-Cp
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 10:13:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 23CB1613AFDF;
 Thu,  3 Feb 2022 11:13:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DCn2Sc0aGa12; Thu,  3 Feb 2022 11:13:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A46B9614E2C9;
 Thu,  3 Feb 2022 11:13:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id N62xb5yN6wDW; Thu,  3 Feb 2022 11:13:42 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6B45D613AFAE;
 Thu,  3 Feb 2022 11:13:42 +0100 (CET)
Date: Thu, 3 Feb 2022 11:13:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <340602071.12640.1643883222200.JavaMail.zimbra@nod.at>
In-Reply-To: <20220203104654.6cb43ea3@xps13>
References: <20220125104822.8420-1-kernel@kempniu.pl>
 <20220125104822.8420-5-kernel@kempniu.pl>
 <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
 <20220203104654.6cb43ea3@xps13>
Subject: Re: [PATCH v3 4/4] mtdchar: add MEMREAD ioctl
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdchar: add MEMREAD ioctl
Thread-Index: hZNaN/vnabP7CZbdubDi1iosoXSpeQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_021345_619231_3692C64E 
X-CRM114-Status: UNSURE (   5.18  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBJZiBtdGQtPmVyYXNlc2l6ZSBpcyBsYXJnZSAo
d2hpY2ggaXMgbm90IHVuY29tbW9uIHRoZXNlIGRheXMpIHlvdSBtaWdodAo+PiByZXF1ZXN0IG1v
cmUgZnJvbSBrbWFsbG9jKCkgdGhhbiBpdCBjYW4gc2VydmUuCj4+IE1heWJlIGt2bWFsbG9jKCkg
bWFrZXMgbW9yZSBzZW5zZT8KPiAKPiBNbW1oLCBJIHdvdWxkIHJlYWxseSBsaWtlIHRoZXNlIGJ1
ZmZlcnMgZG1hLWFibGUuCj4gCj4gSSBqdXN0IGRpc2NvdmVyZWQgbXRkX2ttYWxsb2NfdXBfdG8o
KS4gV291bGQgdGhpcyB3b3JrPwoKbXRkX2ttYWxsb2NfdXBfdG8oKSBtYWtlcyBzZW5zZSB0byBi
ZSBtb3JlIGZyaWVuZGx5IHRvIHRoZSBzeXN0ZW0uCkl0IHRyaWVzIHRvIGdldCBtZW1vcnkgd2l0
aG91dCBmb3JjaW5nIHdyaXRlLWJhY2sgYW5kIHN1Y2guCkJ1dCBpZiB3ZSdyZSBvdXQgb2YgY29u
dGludW91cyBtZW1vcnkgaXQgd29uJ3QgaGVscCBtdWNoLiAKClJlZ2FyZGluZyBkbWEtYWJsZSwg
YXMgc29vbiB5b3UgdXNlIHNvbWV0aGluZyBsaWtlIFVCSS9VQklGUyBvbnRvcCBvZiBpdAp0aGUg
bXRkIGRyaXZlciBoYXMgdG8gYmUgYWJsZSB0byBkZWFsIGluIGFueSB3YXkgd2l0aCB2bWFsbG9j
KCknZWQgbWVtb3J5LgoKQW5vdGhlciBvcHRpb24gd291bGQgYmUgbm90IHdvcmtpbmcgb24gZnVs
bCBlcmFzZSBibG9ja3MuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
