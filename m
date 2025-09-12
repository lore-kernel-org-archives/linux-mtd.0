Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EAACAC582
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Sep 2025 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2J7HQLvyNRgVT/4ZAWOSRXW83+TDLB81McDHokBNwt8=; b=rfB9iXS2jSVQhK9bqj+Dy317hb
	UJPvVBXNGDMxkCe1ehe/2ayjzaHjhsJ+h7/2uOTVB/fbMUSyL5NtF102I5vc8RPi7YOXvNKyIhu8l
	TAsRanQFM9LdsTeBfZtcapBLL3xrYBkVR9DXfojEd63DJvcQ8PhnpnLwLKwtXqGK2SrZ/aMFeYiVe
	QyDATcnYUR37Ew8osAwXwosOqKx3kIoFSEdNtjIdKcAARHLtHpnJy1sU8OyPVxmziOSTIhNQBshlk
	iTWotPrFvr37jV9XsnhjoV0Ehuruzj9cFbTNtANNbpiU+ng5XUlvIDoOhmcW74RLvWDg6Nwro5hEi
	eScfhIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwym3-00000007nys-0k1U;
	Fri, 12 Sep 2025 08:04:51 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwym0-00000007nwL-0YJB
	for linux-mtd@lists.infradead.org;
	Fri, 12 Sep 2025 08:04:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6C14F2BA98D;
	Fri, 12 Sep 2025 10:04:46 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9oQYwUgJsckZ; Fri, 12 Sep 2025 10:04:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1EA132B4F62;
	Fri, 12 Sep 2025 10:04:46 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TYWbwBhd_z1d; Fri, 12 Sep 2025 10:04:46 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id F04EC2B03C8;
	Fri, 12 Sep 2025 10:04:45 +0200 (CEST)
Date: Fri, 12 Sep 2025 10:04:45 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, leoyu <leoyu@mxic.com.tw>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Message-ID: <579487457.27484.1757664285819.JavaMail.zimbra@nod.at>
In-Reply-To: <CAAyq3SZmuTPrEb4i7QR-4Gi6YWsLFGOGm9=a0UvLR5rMLiLxsA@mail.gmail.com>
References: <20250812051949.983040-1-linchengming884@gmail.com> <152133202.103367.1754981828821.JavaMail.zimbra@nod.at> <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com> <608935583.115196.1755171013804.JavaMail.zimbra@nod.at> <CAAyq3SZT67uwggdNX99qEc4bwSkUw2U=sCc6mon064D=f7oH=w@mail.gmail.com> <1899901955.27456.1757663848457.JavaMail.zimbra@nod.at> <CAAyq3SZmuTPrEb4i7QR-4Gi6YWsLFGOGm9=a0UvLR5rMLiLxsA@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: skip programming unused bits in ubi headers
Thread-Index: KYU+KBLIMEgyf12O7akTXDrRUQ7ZhQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_010448_313689_E7D2C7AD 
X-CRM114-Status: UNSURE (   5.39  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNoZW5nIE1pbmcgTGluIiA8
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4KPj4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgYW5z
d2VyIQo+PiBTbywgeWVzIGxldCdzIGFwcGx5IHRoaXMgY2hhbmdlLgo+IAo+IFNvcnJ5LCBJIG5l
ZWQgdG8gYWRqdXN0IHRoZSBjb2RlIGEgYml0LCBzaW5jZSBJIGp1c3Qgbm90aWNlZCBteQo+IGNv
bmRpdGlvbiBvbiB2aWRfaGRyIHNoaWZ0IHdhcyBpbmNvcnJlY3QuIEkgd2lsbCBzZW5kIGEgdjIg
dmVyc2lvbi4KCkkgZXhwZWN0ZWQgYW55d2F5IHRoYXQgeW91J2xsIHNlbmQgYSBub24tUkZDIHZl
cnNpb24gb2YgdGhlIHBhdGNoLiA6KQpKdXN0IGluIGNhc2UsIHlvdSByYW4gdWJpIHRlc3RzIHdp
dGggdmFyaW91cyBkaWZmZXJlbnQgbmFuZHM/Cm5hbmRzaW0gY2FuIGhlbHAuCkVzcGVjaWFsbHkg
d2l0aCBhbmQgd2l0aG91dCBzdWJwYWdlIHN1cHBvcnQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
