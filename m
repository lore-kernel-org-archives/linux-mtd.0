Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E93EC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z2MYMUlooVk1Wjkiq4XZRIx+uO2j8czie8/cT8ozkV4=; b=e2+zH6Pbf9Z6WfcVccxzCIQ6Rf
	P/2W3vIoUVDHx3iX2ZaDr6DygUs3fL1xsn8f4D1n+NNs4+4xhe9MGaBofEE9fcyNdvp4i/P6p/+ZD
	g+94Pul+S3eer6jSMuzPQ1GFpjky529fb246MrFfo9mbIwLDWIXJ/mP/sVHhzFBmOAv+t/LFPVN4e
	dIfFUT8i96rOwZWKGdoBpRGDvfmMMPBInKVpMtdsFsqPkJG8jRLCNxlKw3Y2PsHCd2Q2uOVRksJHW
	Rc48ZqJ31I8wTC6vjwoqOLrnQEXpOItun7B+UWSrSHbPCBcoYcXRzyynu7pjJNPjWdfYlU+YdJ92w
	IlupOt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1jA-00ApR1-E5; Mon, 21 Nov 2022 08:00:28 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox1ix-00Ap5L-UQ
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 08:00:18 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B4C0E63E516C;
	Mon, 21 Nov 2022 09:00:03 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wqfkx6HDd9gD; Mon, 21 Nov 2022 09:00:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A4A9263E514E;
	Mon, 21 Nov 2022 09:00:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OwGoWtZDMXHC; Mon, 21 Nov 2022 09:00:02 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 64E6463E5146;
	Mon, 21 Nov 2022 09:00:02 +0100 (CET)
Date: Mon, 21 Nov 2022 09:00:02 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Lihua <hucool.lihua@huawei.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Wei Yongjun <weiyongjun1@huawei.com>, 
	yusongping <yusongping@huawei.com>
Message-ID: <540631712.260900.1669017601995.JavaMail.zimbra@nod.at>
In-Reply-To: <ed4618a5-67b4-7ee5-f172-a2709ee738fa@huawei.com>
References: <20221115083335.21211-1-hucool.lihua@huawei.com> <23feff35-6f2d-5cd7-57f9-ff2591a3c74e@huawei.com> <433070166.256175.1668893150374.JavaMail.zimbra@nod.at> <ed4618a5-67b4-7ee5-f172-a2709ee738fa@huawei.com>
Subject: Re: [PATCH] ubifs: Fix build errors as symbol undefined
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix build errors as symbol undefined
Thread-Index: 6puvwghxBPcdUYfcEut9ULq3gVbn3A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_000016_210042_0F3C1495 
X-CRM114-Status: UNSURE (   5.24  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkxpaHVhIiA8aHVjb29sLmxp
aHVhQGh1YXdlaS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJT
YXNjaGEgSGF1ZXIiIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiwgImxpbnV4LW10ZCIgPGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIKPiA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz4sICJXZWkgWW9uZ2p1biIgPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+
LCAieXVzb25ncGluZyIgPHl1c29uZ3BpbmdAaHVhd2VpLmNvbT4KPiBHZXNlbmRldDogTW9udGFn
LCAyMS4gTm92ZW1iZXIgMjAyMiAwMjo1NDo1Mwo+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIHViaWZz
OiBGaXggYnVpbGQgZXJyb3JzIGFzIHN5bWJvbCB1bmRlZmluZWQKCj4gWW91IGNhbiB2ZXJpZnkg
aXQgd2l0aCB0aGUgY29uZmlnIGluIHRoZSBhdHRhY2htZW50LiBUS1MgOkQKClRoYW5rcyBmb3Ig
eW91ciAuY29uZmlnLCBJIHdhcyBhYmxlIHRvIGlkZW50aWZ5IHRoZSBwcm9ibGVtLgpXaGVuIENP
TkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpcyBzZXQgdGhlIGNvbXBpbGVyIGRvZXMgbm90IG9w
dGltaXplIHRoaXMgY29uc3RydWN0OgoKICAgICAgICBlcnIgPSB1Ymlmc19ub2RlX2NoZWNrX2hh
c2goYywgYnVmLCB6YnItPmhhc2gpOwogICAgICAgIGlmIChlcnIpIHsKICAgICAgICAgICAgICAg
IHViaWZzX2JhZF9oYXNoKGMsIGJ1ZiwgemJyLT5oYXNoLCBsbnVtLCBvZmZzKTsKICAgICAgICAg
ICAgICAgIHJldHVybiAwOwogICAgICAgIH0KCldpdGggQ09ORklHX1VCSUZTX0ZTX0FVVEhFTlRJ
Q0FUSU9OIG5vdCBzZXQsIHRoZSBjb21waWxlciBjYW4gYXNzdW1lIHRoYXQKdWJpZnNfbm9kZV9j
aGVja19oYXNoKCkgaXMgbmV2ZXIgdHJ1ZSBhbmQgZHJvcHMgdGhlIGNhbGwgdG8gdWJpZnNfYmFk
X2hhc2goKS4KSXMgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFIGVuYWJsZWQgdGhpcyBvcHRp
bWl6YXRpb24gZG9lcyBub3QgaGFwcGVuIGFueW1vcmUuCgpTbyB3ZSBuZWVkIGEgbm8tb3AgdWJp
ZnNfYmFkX2hhc2goKSBmb3IgdGhlIENPTkZJR19VQklGU19GU19BVVRIRU5USUNBVElPTj1uIGNh
c2UuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
