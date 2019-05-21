Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F05CC04E87
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E944821773
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 07:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XNZlCT9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E944821773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKfCd/wpDzVC5lY3KuRsjs17PX8b0hvQZXwuGad76sM=; b=XNZlCT9KsqoC0G
	ghd1ij3eFLRCJ2n3ymyPBqMayamkZlwcjLIkrDwRAX+TV8OyQvQIfbZMjrks+9oMq9o+HCAi3snOV
	gks5nWAHGLc+XBbJCfLheFWR8i4TpJRYiSQiUAZm0zwdDb6MuV//fXqA+fcfv82xcwuWLAA82KQB4
	nb77qnM2MF+1QgGG704O5rQg1TzljKdlNPGguhL8wHmh1ftncObG7NZuWFIllSMd2sncFo8cD304O
	HD0hFuaXNrfTfxMskTehNQT0e52Of9dATJYOblYaZAzK8UGXO0x+LjVJ7VflKMpiBd9Q0pHZE/Jce
	nnIz63sqn10lLZJ23mAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSz6f-0003bT-0l; Tue, 21 May 2019 07:22:41 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSz6c-0003aC-1w
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 07:22:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 93690608A384;
 Tue, 21 May 2019 09:22:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TfL5ZIaKlxXl; Tue, 21 May 2019 09:22:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C8A6E608A38B;
 Tue, 21 May 2019 09:22:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9IQD62NG9Kwp; Tue, 21 May 2019 09:22:26 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A697C608A384;
 Tue, 21 May 2019 09:22:26 +0200 (CEST)
Date: Tue, 21 May 2019 09:22:26 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <396413492.65658.1558423346551.JavaMail.zimbra@nod.at>
In-Reply-To: <20190521070937.GA10654@mwanda>
References: <20190521070937.GA10654@mwanda>
Subject: Re: [bug report] ubifs: Don't leak orphans on memory during commit
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: ubifs: Don't leak orphans on memory during commit
Thread-Index: lMYurwpGHCpORWFhvQOtwvygfB9DZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_002238_242971_855BE353 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RGFuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbiBDYXJwZW50
ZXIiIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBu
b2QuYXQ+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4K
PiBHZXNlbmRldDogRGllbnN0YWcsIDIxLiBNYWkgMjAxOSAwOTowOTozNwo+IEJldHJlZmY6IFti
dWcgcmVwb3J0XSB1YmlmczogRG9uJ3QgbGVhayBvcnBoYW5zIG9uIG1lbW9yeSBkdXJpbmcgY29t
bWl0Cgo+IEhlbGxvIFJpY2hhcmQgV2VpbmJlcmdlciwKPiAKPiBUaGUgcGF0Y2ggYzE2ZTczNTg3
YWQ2OiAidWJpZnM6IERvbid0IGxlYWsgb3JwaGFucyBvbiBtZW1vcnkgZHVyaW5nCj4gY29tbWl0
IiBmcm9tIE1heSAxNSwgMjAxOSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tl
cgo+IHdhcm5pbmc6Cj4gCj4JZnMvdWJpZnMvb3JwaGFuLmM6MjMxIHViaWZzX2RlbGV0ZV9vcnBo
YW4oKQo+CXdhcm46ICdvcnBoJyB3YXMgYWxyZWFkeSBmcmVlZC4KPiAKPiBmcy91Ymlmcy9vcnBo
YW4uYwo+ICAgMjE0ICB2b2lkIHViaWZzX2RlbGV0ZV9vcnBoYW4oc3RydWN0IHViaWZzX2luZm8g
KmMsIGlub190IGludW0pCj4gICAyMTUgIHsKPiAgIDIxNiAgICAgICAgICBzdHJ1Y3QgdWJpZnNf
b3JwaGFuICpvcnBoLCAqY2hpbGRfb3JwaCwgKnRtcF9vOwo+ICAgMjE3Cj4gICAyMTggICAgICAg
ICAgc3Bpbl9sb2NrKCZjLT5vcnBoYW5fbG9jayk7Cj4gICAyMTkKPiAgIDIyMCAgICAgICAgICBv
cnBoID0gbG9va3VwX29ycGhhbihjLCBpbnVtKTsKPiAgIDIyMSAgICAgICAgICBpZiAoIW9ycGgp
IHsKPiAgIDIyMiAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZjLT5vcnBoYW5fbG9jayk7
Cj4gICAyMjMgICAgICAgICAgICAgICAgICB1Ymlmc19lcnIoYywgIm1pc3Npbmcgb3JwaGFuIGlu
byAlbHUiLCAodW5zaWduZWQKPiAgIGxvbmcpaW51bSk7Cj4gICAyMjQgICAgICAgICAgICAgICAg
ICBkdW1wX3N0YWNrKCk7Cj4gICAyMjUKPiAgIDIyNiAgICAgICAgICAgICAgICAgIHJldHVybjsK
PiAgIDIyNyAgICAgICAgICB9Cj4gICAyMjgKPiAgIDIyOSAgICAgICAgICBvcnBoYW5fZGVsZXRl
KGMsIG9ycGgpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXgo+IFRoZSAi
b3JwaCIgcG9pbnRlciBpcyBzb21ldGltZXMgZnJlZSBpbiBvcnBoYW5fZGVsZXRlKCkuCj4gCj4g
ICAyMzAKPiAgIDIzMSAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoY2hpbGRfb3Jw
aCwgdG1wX28sICZvcnBoLT5jaGlsZF9saXN0LAo+ICAgY2hpbGRfbGlzdCkgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl4K
PiB1c2UgYWZ0ZXIgZnJlZT8KPiAKPiAgIDIzMiAgICAgICAgICAgICAgICAgIGxpc3RfZGVsKCZj
aGlsZF9vcnBoLT5jaGlsZF9saXN0KTsKPiAgIDIzMyAgICAgICAgICAgICAgICAgIG9ycGhhbl9k
ZWxldGUoYywgY2hpbGRfb3JwaCk7Cj4gICAyMzQgICAgICAgICAgfQo+ICAgMjM1Cj4gICAyMzYg
ICAgICAgICAgc3Bpbl91bmxvY2soJmMtPm9ycGhhbl9sb2NrKTsKPiAgIDIzNyAgfQoKVGhhbmtz
IGEgbG90IGZvciB0aGUgaGVhZHMgdXAuClRoaXMgY29tbWl0IGlzIG5vdCByZWFkeSB5ZXQgYW5k
IHdpbGwgYmUgcmVwbGFjZWQgd2l0aCBhIG5ld2VyIHZlcnNpb24uCgpUaGFua3MsCi8vcmljaGFy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
