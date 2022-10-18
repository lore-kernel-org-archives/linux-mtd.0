Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A9C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QeJ0olhovK9rIpwEtx+F6uPVXaCROF+xZAQtF6ufwA=; b=fseXXNsbG02ZKM
	srOqw4GuQTZNmoA0AvnAjLVxWlHgT5PF086lzTPd1uRaVN0Eft/gmfbiWn2bEh04HxUE8umA13Lg5
	ATm270BFWgh/nPTF2I5qJ0eqFkV5LYTfoep303Z9JsMduOPRPv43AIwqzEJTdEOpJG4NI18fSuYOW
	KNouxVsDJ17tm8VCQVxY0IxAD28Rfm3ztOt9OW1tpUIWVrY63mBZFv0cVjA4R8p4vK/XMWN4OdxV3
	3pxpTlgiiB3fr+ZCxn++eOQvapBio5wH6MUyrHpnK2QN7thV/sR+Qj7n5H+nkFPfMm9A658ECEC2R
	wF3z1PI/DsN8SBlFZqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLq-005PkY-Fb; Tue, 18 Oct 2022 09:57:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjL7-005P6y-L0
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:56:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D505BFF80D;
	Tue, 18 Oct 2022 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666087007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baIcB6Pr29o1KI2n+bO1ThO9ZZAOux+kI/uBwWzJ69I=;
	b=aT7Na8zc8GWyIMtBx5Yxssctdt4XQlaLsmB5d+kECgX/Q0dZ0Zt+tSGmOpAWKFBwKA7eyw
	B9jnFop+PoRaWtIm28f1sRV5EGV+q1v+sj/5DsZe8Bsi8wLh6WPaJVnb9xKfaOm9j+/dz0
	UM6MZ0Yq6dc2u8QJPgRGX65q5XJW8q1odJ+Rd0U+mIKjvs62SGt/KNTP1HApRaJfhslJeR
	FkAkCS3UA4HCqZESRu47bWYS34JzB9xopzbR4odJeOkyiS3gGOXnNmCZCDXx2lnqoBcig5
	XCdXe/l9udnPeba/mNfncOLUtArNayypH87XtzItLzskj8g2isszuHHY7w9C0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?b?UmFm?= =?utf-8?b?YcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 2/2] mtd: core: try to find OF node for every MTD partition
Date: Tue, 18 Oct 2022 11:56:45 +0200
Message-Id: <20221018095645.543315-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004083710.27704-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ddb8cefb7af288950447ca6eeeafb09977dab56f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025649_883313_9F36E42B 
X-CRM114-Status: UNSURE (   7.65  )
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

T24gVHVlLCAyMDIyLTEwLTA0IGF0IDA4OjM3OjEwIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFNvIGZhciB0aGlzIGZlYXR1cmUgd2FzIGxpbWl0ZWQgdG8gdGhlIHRvcC1sZXZl
bCAibnZtZW0tY2VsbHMiIG5vZGUuCj4gVGhlcmUgYXJlIG11bHRpcGxlIHBhcnNlcnMgY3JlYXRp
bmcgcGFydGl0aW9ucyBhbmQgc3VicGFydGl0aW9ucwo+IGR5bmFtaWNhbGx5LiBFeHRlbmQgdGhh
dCBjb2RlIHRvIGhhbmRsZSB0aGVtIHRvby4KPiAKPiBUaGlzIGFsbG93cyBmaW5kaW5nIHBhcnRp
dGlvbi0qIG5vZGUgZm9yIGV2ZXJ5IE1URCAoc3ViKXBhcnRpdGlvbi4KPiAKPiBSYW5kb20gZXhh
bXBsZToKPiAKPiBwYXJ0aXRpb25zIHsKPiAJY29tcGF0aWJsZSA9ICJicmNtLGJjbTk0N3h4LWNm
ZS1wYXJ0aXRpb25zIjsKPiAKPiAJcGFydGl0aW9uLWZpcm13YXJlIHsKPiAJCWNvbXBhdGlibGUg
PSAiYnJjbSx0cngiOwo+IAo+IAkJcGFydGl0aW9uLWxvYWRlciB7Cj4gCQl9Owo+IAl9Owo+IH07
Cj4gCj4gQ2M6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CgpBcHBsaWVkIHRv
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51
eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
