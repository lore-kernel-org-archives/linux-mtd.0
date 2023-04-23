Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27778C77B76
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Apr 2023 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zKJsOQejVSzMV/NPmBJNVhaaxERIeSUk64HEUmVbXBQ=; b=L+k2bYgyJN2f0i/d/0RUYuq8HD
	ixrByCxUWrdmInskAyoAWEoOx4TeA551Z9/Hw+fAIIV6fRnUJyE1jokBhtT7y5tDeDG2Cy9qMD0a/
	2TRFuMWc4kwtYxT7tm3+bzRYnzGy8M8GaawWcAiUcFkKy86VP2wdklFXMevaknYQ4yH5/qTTBtsyT
	iFIwNi8aNbZUn4tb4qnKwM2YCvqY8FwdLkwa3h+YtfvbuINDrvAjaNf8LQ4LwdWhaKv/iQR8JZZWz
	mIr43mkv54nB9isZhrggT0F1ezEqi0weB6yQIopj3ZtEKomK1mtjl4UAWUNkCZqR67XADrZzcY8CA
	yMsYnNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqUg9-00Dt4T-22;
	Sun, 23 Apr 2023 08:02:37 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqUg4-00Dt2n-0R
	for linux-mtd@lists.infradead.org;
	Sun, 23 Apr 2023 08:02:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CEB0463CC166;
	Sun, 23 Apr 2023 10:02:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SGYmLo3VK3p2; Sun, 23 Apr 2023 10:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5CBEA63CC174;
	Sun, 23 Apr 2023 10:02:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zUKjAkq3QXJ7; Sun, 23 Apr 2023 10:02:20 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 42A9563CC166;
	Sun, 23 Apr 2023 10:02:20 +0200 (CEST)
Date: Sun, 23 Apr 2023 10:02:20 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Yu Hao <yhao016@ucr.edu>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at>
In-Reply-To: <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com> <687864524.118195.1681799447034.JavaMail.zimbra@nod.at> <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com> <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com> <977347543.226888.1682011999468.JavaMail.zimbra@nod.at> <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com> <412779912.228444.1682023015809.JavaMail.zimbra@nod.at> <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: divide error in ubi_attach_mtd_dev
Thread-Index: P5jqm95hRKoxVO9TZkSQrtm6hLkHZQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_010232_351600_23F82730 
X-CRM114-Status: UNSURE (   7.91  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+Pj4gcm9vdEBzeXprYWxsZXI6fiMgY2F0IC9wcm9jL210
ZAo+Pj4gZGV2OiAgICBzaXplICAgZXJhc2VzaXplICBuYW1lCj4+PiBtdGQwOiAwMDAyMDAwMCAw
MDAwMTAwMCDigJxtdGRyYW0gdGVzdCBkZXZpY2XigJ0KPj4gCj4+IEhtbSwgbXRkcmFtIHNob3Vs
ZCBiZSBmaW5lLCBlcmFzZXNpemUgaXMgbm90IHplcm8uCj4+IAo+IAo+IEkgZ3Vlc3MgdGhlIHpl
cm8tZXJhc2VzaXplIG10ZCBkZXZpY2UgaXMgZHluYW1pY2FsbHkgZ2VuZXJhdGVkIGluCj4gcnVu
dGltZSwgYWZ0ZXIgbG9va2luZyB0aHJvdWdoIHRoZSBjb2RlLCBJIGZpbmQgZXJhc2VzaXplIGlz
Cj4gaW5pdGlhbGxpemVkIGluIHNwZWNpZmljIGZsYXNoIGRyaXZlciBhbmQgaXQgd29uJ3QgYmUg
dXBkYXRlZCBsYXRlcihlZy4KPiBpb2N0bFxzeXNjdGwpLiBBbmQgc29tZSBtdGQgZGV2aWNlcyBt
YXkgaGF2ZSB6ZXJvIGVyYXNlc2l6ZSwgZWcuCj4gZHJpdmVycy9tdGQvZGV2aWNlcy9tY2hwMjNr
MjU2LmNbMV0uIFVuZm9ydHVuYXRlbHksIEkgZG9uJ3Qga25vdyBob3cgdG8KPiBsb2FkL3NpbXVs
YXRlIHRoaXMgbXRkLCBtYXliZSBpdCByZXF1aXJlcyBhIHJlYWwgZGV2aWNlPyBJZiB3ZSBsb2Fk
IHRoaXMKPiBtdGQgZGV2aWNlIGFzIHViaSwgaXQgd2lsbCB0cmlnZ2VyIHRoZSBwcm9ibGVtPwoK
SW5kZWVkLiBJIGd1ZXNzIHFlbXUgY2FuIGVtdWxhdGUgc3VjaCBjaGlwcy4KU28gYmV0dGVyIGZp
eCBVQkkgdG8gcmVqZWN0IGF0dGFjaGluZyBvZiBtdGQncyB3aXRoIGVyYXNlc2l6ZSBiZWluZyAw
LgooUGxlYXNlIG5vdGUsIHdlIGNhbm5vdCB0ZXN0IGZvciBNVERfTk9fRVJBU0UsIHRoaXMgb25l
IG1lYW5zIHRoZXJlIGlzIG5vCmVyYXNlIG1ldGhvZCkuCgpUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
