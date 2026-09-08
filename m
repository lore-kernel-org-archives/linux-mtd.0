Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B54C79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Message-ID:Date:
	Mime-Version:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/rqajK3KVJj3ylRlSoe6RAYRdpf5Wj3qZPKF71s0E4=; b=o0JWRl1niaT5ei
	T/noVImv5VxTDsjXb4rC0QM5vKGavpSYRSV3/iAQKrWTdt30U5RjATElqvU/IsbM+x/22oitHf3Lk
	zFk6q5D4Ffbx42w97ta7ZsSZnRRaJ+zSyxLMyl4YBqifWDOyJzMGL4Sv11XCAtlykkagGObfJKRUp
	zhWORIkWrimQsOhjMPTsMzmsrXiJZGwnKJcP0kxd8o9kyWxmBeHRkj06Nj2hQwBjh9byPooa95kdi
	vAdLTE4uxXu5KgCAOfIf1D1U0GhiN6UKfh2wxmN+mRSGq/VZijPhN+pM0yqQUByzNtluWaeluDiM1
	g6LvXM8GqxDbA6qX9eOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tBa-00000008mgX-1VEY;
	Tue, 08 Sep 2026 10:36:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tBW-00000008mgN-492U
	for linux-mtd@bombadil.infradead.org;
	Tue, 08 Sep 2026 10:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Message-ID:Date
	:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wri9jjVSnXb3f7mD1XDgExZHmsart+pPeoI+A1QedF8=; b=frcJe+eFjo7B5AEQbBhl/MlHAs
	kUJQIUvZPSAObvlR+pypyzEAHvw0LIDtpJTYyCYLJ1d0WTFIpWNqG+/pYxGA+LVdhY+iIgaK+dPwn
	CjWnRjLC9ZXlVfQORYFz6AsOk172p03mWBBbXwL09bNJ5/q9ghp3pMeSxxhMQILWPIzaeHWVCkYvQ
	5SJnK7zmzPoqSdILIeOSQAC1zXs+I1TL1vzNHoj16fkhwYUfu7NYP5eSOaqGgl7Bu6S/yMeeXavwg
	qS0X4kGVIrZUsWJYEFbd0YIvjW7Tq1XkRy9f6sAPsqqtquIhbwCRJUaG7b9aOS39Giq8YyxhB5rOX
	469uwMLw==;
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3tBT-0000000HHdd-1Aoj
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 10:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788863767; bh=wri9jjVSnXb3f7mD1XDgExZHmsart+pPeoI+A1QedF8=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=XEzo09dwAEUSBLoIHVFnSfPLFsesSruz/4eYqfdEZiJpE58kbUOU1NNsM/nAisB3g
	 ZHUZmG4JRy43sIZOlMWbI0Bh/49Jx4HwarYs8Z1u61fOGJNFKAlQJ5E7oxckoQzctC
	 y8v5g38LEpbqay2eJc5FMjrv5dVpIvRuxOfOocEY=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: NH2c3QqomeNiWNQqj8mxT9byrIJNDiOpi5dKIBWsNahoMhRf44z+YmAKwJ45Id
	 TnE15FQ3KP7QH/jmKmKzniDO/rF07Hmlt/7nXkqXSKl6bjmInFZWNgDwmGauBsmFkpQldo0M0XFsZ
	 xlRSvDy4bm0PcW6/QGNpzvGQy1kQXcbEBNHLFRH0vsWQ4nnkOw6edK9gbE0bcPlO5VdVK4HTnN+Hs
	 Cln7CShgVAMEpO+IjrFZ7tYlNraj8LFepVQ1HzLeIXhIpqYNyWfWfrSIdKB0St8lAlGtAkC+k/mIh
	 VNhVF418lBA1Ci9DVnXzgGSixcqAFAW5P+juPHagTDaKy/O15mfXRI41EBV/megrFeVU37FjLEOar
	 xTJIpvRHDrEPnwHLasKkRQJTFtBtD3PcQqHxthNOp+UFBuGa2PtIELfe3vrEco9eL1dAt82Iq4Dea
	 X4o2ZkI8bVNEJEt6/lcHi83lxKxDIGshUZYWTChFE7in9y6oylNB6W0eGV/jkm3kkbBaEhpBwr8IH
	 dTWJxm6DHy28PozKPq+7RMKV/iyy0C5KLUEEGctEY3RAqQqk/WFekKtt/NyKGMnB8rchrFEDP85MS
	 KuIEFZ/ZAKVPXzmHDFiYPzhLduwIi7y9XPUGM452MjS3QB50ZHO5FOM0vc+V0kYt1RU63dot6GP85
	 6lgt+KgN6ENhEZrNgZzzlXdBzG+rw/cA1mWkznHABn1H+TMikZk/5qO0Vzev7X+Nc0BQ9Krmfgr64
	 O08gdaCnn9H2R64NT3uzdvDDRf7bhTUW27ry1xotuQqNhOAJsJMFoqi/VQJn9bYbHfSl1VvnpIf9k
	 bTERyWzVKT9oevr4wxRjysysuvCgIRFMJqn7MgVLoIGpA+JrqZjdjlRoIQMTpeYc9FPekLwdurcet
	 MRQeLfmz/0AVkDxXLFGSLx6Ckb3QAz1hPrkGxPn/WZq8+7VXLRhDDgICZcdvBIWIXaHZTepYO4Uli
	 0IycaDATiT4fDwvPwhbFod5juFf9wUzw0w0yZDhZE6oZdaKciUpkeuNU4eYnkxfLQR9DBqtVQsaiK
	 3qBBEdZHp2Cas4+F6KOIrL66teoKuysYjOAX+yLIwKHGQlIvsu3UnApHE5N1RliQT3DVDpvogq78T
	 qxI=
From: "=?utf-8?B?Wm9uZ3poZW4gRmVuZw==?=" <1768315307@qq.com>
To: "=?utf-8?B?TWlxdWVsIFJheW5hbA==?=" <miquel.raynal@bootlin.com>
Cc: "=?utf-8?B?VmlnbmVzaCBSYWdoYXZlbmRyYQ==?=" <vigneshr@ti.com>, "=?utf-8?B?UmljaGFyZCBXZWluYmVyZ2Vy?=" <richard@nod.at>, "=?utf-8?B?bGludXgtbXRk?=" <linux-mtd@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: cache the last read page to avoid redundant SPI operations
Mime-Version: 1.0
Date: Tue, 8 Sep 2026 18:28:24 +0800
X-Priority: 3
Message-ID: <tencent_43133A77AAB16DAC8E1182F821CCD6F8F407@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
	<87bja8ulne.fsf@bootlin.com>
In-Reply-To: <87bja8ulne.fsf@bootlin.com>
X-QQ-mid: xmseua17-0t1788863304tkqjqzmna
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_113612_009787_3A005708 
X-CRM114-Status: UNSURE (   7.96  )
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

SGkgTWlxdcOobCwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4gdjMgaGFzIGJlZW4gc2VudCB0byBh
ZGRyZXNzIHRoZSB0d28gaXNzdWVzCmZvdW5kIGJ5IFNhc2hpa286CgotIEludmFsaWRhdGUgY2Fj
aGUgd2hlbiB0aGUgYm91bmNlIGJ1ZmZlciBpcyBvdmVyd3JpdHRlbiBieQogIG5vbi1jYWNoZWFi
bGUgcmVhZHMgKFJBVywgY29udGludW91cywgb3IgT09CLW9ubHkpIHRvIHByZXZlbnQKICBzZXJ2
aW5nIHN0YWxlIGRhdGEgb24gc3Vic2VxdWVudCBjYWNoZSBoaXRzLgoKLSBJbnZhbGlkYXRlIGNh
Y2hlIG9uIHVuY29ycmVjdGFibGUgRUNDIGVycm9ycyB0byBwcmV2ZW50CiAgc3Vic2VxdWVudCBy
ZWFkcyBmcm9tIGJ5cGFzc2luZyBFQ0MgY2hlY2tzIGFuZCBzaWxlbnRseQogIHJldHVybmluZyBj
b3JydXB0ZWQgZGF0YS4KClJlZ2FyZHMsClpvbmd6aGVuIEZlbmcKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
