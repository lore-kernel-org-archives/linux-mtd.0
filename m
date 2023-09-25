Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC6ECE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Sk4yKOWhlP7pfLTXQrAPEAEpSemqgbcGSeh1rizJLcc=; b=IrvBjUKR1sWh0bDR72jAgmhWtt
	M0INu0qjZ2IZI65gOX9i9TaTS5i5Qvo/2r7TxASiFyGbzqDo+CUGJoGiHglAFlt3qwXM1z2oIEF8L
	ADF2LCw81yI2VNcc22KDJP9U1aUqxt7fp97jtSrvbSP/veFg/2z26BHKIODLXzW5YvKckse0A6hFz
	AolG8ZqXJNVUUpi0OfzENHvzt3ua/7UrpFNOGup6qJ3l+EF1RRoXhfYLj1RFcCkY53fNoSNWyJ13d
	e4VxoEovsD8tlCAXykGAg4SqayD+5UCWL/DmwEOiRsxYRJQ2pw3wBvOl1y+WjwOxMeHqauhKhnG1G
	AOLEqBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmB8-00EOsb-2I;
	Mon, 25 Sep 2023 14:03:14 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmB5-00EOs6-0p
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 14:03:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 84C78635DB5B;
	Mon, 25 Sep 2023 16:03:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IuqLOyVDcGkJ; Mon, 25 Sep 2023 16:03:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 932CE622F591;
	Mon, 25 Sep 2023 16:03:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id slzN9QCr4ZQj; Mon, 25 Sep 2023 16:03:03 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 71238635DB5B;
	Mon, 25 Sep 2023 16:03:03 +0200 (CEST)
Date: Mon, 25 Sep 2023 16:03:03 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <1131184426.81026.1695650583370.JavaMail.zimbra@nod.at>
In-Reply-To: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix error code loss in mtdchar_read() function.
Thread-Index: K2deZwmqse54Lnhyky63J7p7EYeVMQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_070311_582854_25168D88 
X-CRM114-Status: UNSURE (   8.09  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlpoYW9Mb25nIFdhbmciIDx3
YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVmlnbmVzaCBS
YWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+LCAiY2hlbmd6aGloYW8xIgo+IDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4s
ICJaaGFvTG9uZyBXYW5nIiA8d2FuZ3poYW9sb25nMUBodWF3ZWkuY29tPiwgInlpIHpoYW5nIiA8
eWkuemhhbmdAaHVhd2VpLmNvbT4sICJ5YW5nZXJrdW4iCj4gPHlhbmdlcmt1bkBodWF3ZWkuY29t
Pgo+IEdlc2VuZGV0OiBTYW1zdGFnLCAyMy4gU2VwdGVtYmVyIDIwMjMgMDI6NTg6NTYKPiBCZXRy
ZWZmOiBbUkZDXSBtdGQ6IEZpeCBlcnJvciBjb2RlIGxvc3MgaW4gbXRkY2hhcl9yZWFkKCkgZnVu
Y3Rpb24uCgo+IEluIHRoZSBmaXJzdCB3aGlsZSBsb29wLCBpZiB0aGUgbXRkX3JlYWQoKSBmdW5j
dGlvbiByZXR1cm5zIC1FQkFETVNHCj4gYW5kICdyZXRsZW4nIHJldHVybnMgMCwgdGhlIGxvb3Ag
YnJlYWsgYW5kIHRoZSBmdW5jdGlvbiByZXR1cm5zIHZhbHVlCj4gJ3RvdGFsX3JldGxlbicgaXMg
MCwgbm90IHRoZSBlcnJvciBjb2RlLgoKR2l2ZW4gdGhpcyBhIHNlY29uZCB0aG91Z2h0LiBJIGRv
bid0IHRoaW5rIGEgTkFORCBkcml2ZXIgaXMgYWxsb3dlZCB0byByZXR1cm4KbGVzcyB0aGFuIHJl
cXVlc3RzIGJ5dGVzIGFuZCBzZXR0aW5nIEVCQURNU0cuClVCSSdzIElPIHBhdGggaGFzIGEgY29t
bWVudCBvbiB0aGF0OgoKICAgICAgICAgICAgICAgIC8qCiAgICAgICAgICAgICAgICAgKiBUaGUg
ZHJpdmVyIHNob3VsZCBuZXZlciByZXR1cm4gLUVCQURNU0cgaWYgaXQgZmFpbGVkIHRvIHJlYWQK
ICAgICAgICAgICAgICAgICAqIGFsbCB0aGUgcmVxdWVzdGVkIGRhdGEuIEJ1dCBzb21lIGJ1Z2d5
IGRyaXZlcnMgbWlnaHQgZG8KICAgICAgICAgICAgICAgICAqIHRoaXMsIHNvIHdlIGNoYW5nZSBp
dCB0byAtRUlPLgogICAgICAgICAgICAgICAgICovCiAgICAgICAgICAgICAgICBpZiAocmVhZCAh
PSBsZW4gJiYgbXRkX2lzX2VjY2VycihlcnIpKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIHVi
aV9hc3NlcnQoMCk7CiAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IC1FSU87CiAgICAgICAg
ICAgICAgICB9CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
