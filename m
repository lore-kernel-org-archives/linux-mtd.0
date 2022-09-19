Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186E8ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnySZYUcszWE5pVQ/8OMnaOwLxmC9ooe/SGtEnlvc8c=; b=mcTf+jK0XYDbbg
	eeXGFQeXr+2M9QMGcfDEjNaHCh7UhOOmsprvZ5+5G2uLISQ69r1boZySJCHZTfD+Ni55U6CVHLo0t
	fTU/TJ36z/aoEPJVBJTVYlf/HMCPB6kBOCqxEX0TfL0EdLXY6fwJKCzIuaQ3GccIFI6StUkfr0EWF
	9aZ8g3I1Hw3oH7VbU3WWvPrXpGxAmCqg8suAybTSoqqNSru/cJz7b2PRekYHR6snKghSu6831Itk+
	QWPkKC2jhIbQrZQAlYtZS/JR/nkjfXAdXn8AsOB0MrxTA0MevVXCIHOoL5IwVUAzYeHdHErLV9/R5
	+GI+CQUlZtDB52h9+7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJVi-00CqVD-IK; Mon, 19 Sep 2022 16:20:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJVf-00CqSY-8U
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:20:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DDB72240007;
	Mon, 19 Sep 2022 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IUMqLbULQGbkIxRFBE/MsSYr16nbj1/byQGJmLuwso=;
	b=WVABEvgJBcNLslhplq1oL+SjAr23CTx3KssJggxY2hm/Y7i0I9yIBEblZPt2ig14/tvwG2
	uskvuK9GwOEs8xzwXsGANn+dKpPs6ads6KlPo0ZCeZcUvhm9RbDrcLq/k6jfxprFUWMEDK
	dqRjgIDmRE9VR8yh9RvAhBzjnUdAF2wXlXuUHYh6M4X+oC++2fsUS3mDWgH6XJLkvMTIqm
	h8xJj5ACiPAAf3QLhavm3qF6NK1GlAg4E39oipAr0rIVzsmZJfqMvYFtWU5VYm/Z15tVSv
	srhDiuzqcBWZt0kYn7n6W4n86hiyiJQjPFnn3jlnkECstMMX5SIOX7r39GIpUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: partitions: add binding for U-Boot bootloader
Date: Mon, 19 Sep 2022 18:20:34 +0200
Message-Id: <20220919162034.226938-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711153041.6036-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'27bfb201b2c03c8a033b60e5ad80cbf3aaa52b94'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_092039_466061_F090A5E2 
X-CRM114-Status: UNSURE (   8.84  )
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

T24gTW9uLCAyMDIyLTA3LTExIGF0IDE1OjMwOjQwIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFJpZ2h0IG5vdyB0aGVyZSBpcyBubyAoa25vd24pIHJlYWwgcmVhc29uIGZvciBh
IGN1c3RvbSBiaW5kaW5nIGZvcgo+IHN0YW5kYXJkIFUtQm9vdCBwYXJ0aXRpb25zLiBCcm9hZGNv
bSdzIFUtQm9vdCBob3dldmVyIHJlcXVpcmVzIGV4dHJhCj4gaGFuZGxpbmcgLSBsb29raW5nIGZv
ciBlbnZpcm9ubWVudCB2YXJpYWJsZXMgc3ViYmxvY2tzLiBUaGlzIGNvbW1pdCBhZGRzCj4gQnJv
YWRjb20gc3BlY2lmaWMgYmluZGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
