Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F49FD3776
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+0Fw0y39BsHKmkC6eN7jcBg6cXJUZejXtZtqoP2xA0=; b=KC+aS88yIOBM5W
	BTLuDZN5Pbuu6MF8HBOACMHu/JhGRCTYGCB1L9p/j3u4qtENI0NiGOLdvepJ3/lNwL0SITHuvMsNE
	+FqCB+Hp0Mui6YWFz95j3V/Gss0ZNDTo6DBj99Y9Rmc0ECA0FSDTLiI1kktpdJB8P7HoibLC/UyXK
	8pBgQdctectwlNB7gQT3mcRdK/2i1e7VvSSCpeFrlLZjwZqNhIGy6RQmKS0A+lMLOEqOLLK6BmlpG
	OuviEP4c+BL3bzoy3+Qv3FT+OW+gBKN+MB/jHcmLkqUWKBitIRs0kWjtwxv2YpDW7otLeFJaBgpDX
	NJnPzbCDW+6sRe5PdG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI28-00000004Yr9-15U5;
	Wed, 25 Feb 2026 16:46:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI25-00000004YpZ-0QtV
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:46:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C8B191A1315;
	Wed, 25 Feb 2026 16:46:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CBDA5FDE6;
	Wed, 25 Feb 2026 16:46:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0122110369259;
	Wed, 25 Feb 2026 17:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772037997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nnBjrX0bQL3U41NR9f2JQMbwQ/kpp6U5NlGNmgZ8yJA=;
	b=Sa38iQd+A9UKiqdZk/EdYjEH6IBO5bXLaf0J6duKpVyx8/5+NjLYE550rxS7kLJUpbpHY8
	eB50pkmmpah8JYJwqV/iT4h1cI3uiSibfVSTduskPOQhZAvMmoR2KDPs0mdDd2Yx9lPqd6
	gKZanXCP8ffkN80WWGgJ/0eLb71d7YuZJ+a35EW5WOLeAH0izuKn1tcU1wslNNoj/QFQJg
	q87D7w2MtOgobKscNEY2h2aTgMKt9zDGeccgmdZoolDrEXj0b+DcOplelDiZt1vaxkEe/m
	idP2ulswtNRCJrKEISKNX2X4RNejHlMMei41fYPIcO9LV9edq/8v5zzFmVkPMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: imx: clean up imx2* NAND CHECK_DTBS warnings
Date: Wed, 25 Feb 2026 17:46:25 +0100
Message-ID: <177203795880.1985489.4831780196878536315.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
References: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_084641_265495_17FCA24C 
X-CRM114-Status: UNSURE (   9.76  )
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

T24gRnJpLCAxMyBGZWIgMjAyNiAxMjowODoyNCAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6Cj4gVGhl
IG5hbmQtY29udHJvbGxlciBzY2hlbWEgZW5mb3JjZXMgc3BlY2lmaWMgbm9kZSBuYW1pbmcuIEFk
anVzdCB0aGUKPiBleGlzdGluZyBEVHMgaW5zdGVhZCBvZiBtb2RpZnlpbmcgdGhlIFlBTUwgc2No
ZW1hIHRvIG1hdGNoIGxlZ2FjeSBsYXlvdXRzLgo+IAo+IFVwZGF0ZSB0aGUgRFRzIHRvIGZvbGxv
dyB0aGUgbW9kZXJuIE5BTkQgY29udHJvbGxlciBsYXlvdXQsIHdoaWNoIGhhcwo+IGJlZW4gdXNl
ZCBpbiB0aGUgTVREIHN1YnN5c3RlbSBmb3IgbWFueSB5ZWFycy4KPiAKPiAKPiBbLi4uXQoKQXBw
bGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzNdIGR0LWJpbmRpbmdzOiBtdGQ6IG14Yy1u
YW5kOiBhZGQgaS5NWDI1IGFuZCBpLk1YMjcgbmFuZCBzdXBwb3J0CiAgICAgIGNvbW1pdDogZDg2
ZTcwZTljYTk5NTk0MmU4NDg1MTViMDg5ZTliZTc0MzBjODYyZQoKUGF0Y2hlKHMpIHNob3VsZCBi
ZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0
IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVn
YXJkcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
