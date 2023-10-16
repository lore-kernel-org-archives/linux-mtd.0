Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A477CDB484
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2gRJTCHTSmaZMl4jZgIWfEqwl+r+uAjey+vaovkw60=; b=KZQVO40c34p4ma
	A2VvAqTRysgO76NJmCE+FJS62kHgxvpw1SX448E/Qt9oMISkddht/7rKD51wR+7zgzUstnchs+j7d
	X9wmGoH/MImCjGr6ErSByUKeJQV0cuCnoR7RxXc7p3iIUGCESni6GlujFRWpJneYQz1d2faHI2H65
	Anlr/FJKCvqoZMet5mNFgPaoZZ2dsweYsJZ+Eoty7yjmPO1lqt9bT8G8t15v8cKnYD1KzKAYW9hrN
	KVIXxTj9cgyChIs/KMc0GExI5an7QskuLb4nXOoMs0m7E+8ODlAsSA10s+DU43C0tqN5Qlo3JQBwh
	WYAgVZaRQj8/o4/jeVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKrZ-009JEZ-09;
	Mon, 16 Oct 2023 10:30:17 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJtr-00909H-0s
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:28:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B587F240004;
	Mon, 16 Oct 2023 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JA4dH7+W4X0hthK1rkmDQZ9qNlxsfLFxfUMu6MOAyl8=;
	b=HqCHDZSAJsghEOifz5RrBzfuSRgP0O8CFa7nxMMOo1s03RGYZfeeD6mSz1ZKpvm9J7l16S
	mzSQpbv8tfkh+SREICD1xx3QFPETl2Qe8tgg/EYudwDyFnZ4IFCoUZ9PX/C/hszZZXc9i8
	GJ3hnW6/toXSc9UpINSL+CvmeA2hAnmaxjqMsMbSEf/ihJAWcoT0lDHU93yRBes+BbT8l4
	Ad81MJ7twbGeF5Nwv0EzkU9nAFMQs3uCshtzXOJBeJKr8um/EOyi4Xo6/v3BnhrYW+dTcu
	YyYt8F2vOBbepG0YElCZrXuhHzhH7McWky81C6siNhI3iqkHL4341S1dno1qhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: John Thomson <lists@johnthomson.fastmail.com.au>,
	linux-mtd@lists.infradead.org,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mtd: mtdpart: check for subpartitions parsing result
Date: Mon, 16 Oct 2023 11:28:32 +0200
Message-Id: <20231016092832.288868-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927202657.27169-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5c2f7727d437cd42033d13ebc8b3d74b9fe65712'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022835_461565_ECBAB782 
X-CRM114-Status: UNSURE (   6.52  )
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

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDIwOjI2OjU3IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IHBhcnNlX210ZF9wYXJ0aXRpb25zKCkgbWF5IHJldHVybiBhbiBlcnJvciBzbyBp
dCBzaG91bGQgYmUgY2hlY2tlZCBhbmQKPiBvcHRpb25hbGx5IHBhc3NlZCB1cAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkFwcGxpZWQgdG8g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4
LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
