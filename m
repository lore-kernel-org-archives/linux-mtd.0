Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC471C83F17
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKpnlk8gQ/JLe08EVW+RPtWp0XuplWmZQLtExfwSsPI=; b=Q7EDwqjpOjpGbQ
	ctnNQ8X+wY+5jz92B2djJKpsgP4Gmv35YqC7PRcUOn0+xAhCDqBtlwXvj8BALol5fuksA7wM5odQ3
	X6pDC0ZALkYTyPXY7E9ZYYnfHUK3JyFc9mnK9NGBBPcGDVpSsZyWnra8jFGUY1sgs0GcQJNPEUFYg
	xfuCvWWextTB2ChxFyVA7A+feIk+GniwjwPTqoZqtKqOJDe7oncGbpWFpGC6dIeDrABCDBIaR4fs0
	7XKJliLmwgcLvTyjyYha/Q8aIfXyD3zwDI9VzJAciERqfR383XInGUp9W4CLuoWgeMzRvI+TIJLQl
	D2Ju7WkZzXgAmeuzZxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKzr-0000000EDZh-1Kgl;
	Mon, 28 Jul 2025 10:22:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKv3-0000000ECXf-1Xqb
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pboHQ9RcvBOP/wjmFACMKjqT7sFHUCrx35OKtpXAyO8=; b=fykd+s5M6LnlR6/38AJKAJtckV
	n1hEzIp9wvimIYZDoYjDIzLOnvfZYqHDgrpnhJ1esGLhuznQemwOOWCwqP5jpwjB1OThvmr8bcASw
	Twwzm89GiRr6c0gci2byZle8nrakHH5uG02ZETPrwElmYOUEgh1r10Ac4mrBU89clh7G/EPWUHJFi
	Z438ZMDkooR6MI+ibRUmTfLwiYLWVvl2JMns/WRxHj+y/TNh8K/PDqeiGtyjL3A+Su/gcYwiqupig
	75kSRbAXE31pOIDdUNWamJ/xBg1+Hi8tpauYldRdsgj10XxTRKKw7uurxllTxvEutSDtVseMGqWxR
	kbVj0e3g==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKus-0000000CQxF-0TlG
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E11B44329A;
	Mon, 28 Jul 2025 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pboHQ9RcvBOP/wjmFACMKjqT7sFHUCrx35OKtpXAyO8=;
	b=gfNVx2aEAmhGmeroxZz0+RRhTArWPK2eT7Ya6u47qy0KW7qlHfusv5OsGxUFx3yi+MSu/w
	EM+wJBA9CzO5Zrgkbqr4pwjjufn3PNhodvxuyG9hhaJNZvrsPs38OlzsTJ82xXv6hpfRr7
	GEj0Dd6lhPpHTv94mXav7aE/0viAE7qBGD+FWvo2Z1VYWqarWj1B8y9Elf3Qa7ezoXk7CP
	M5ryeRD7UbO2ZaPfIym+2gxjPZWmYvZR6LaAyodXBtCXD+5xlrx4GXG3SU/5xCMqS2ZyI9
	E811zNKaPML2vdCFV6uzOXvKn5c3oVMt/ezVBQyzCVb8YnLs1f9zfYpDX+QgZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250708-spinand-propagate-wait-timeout-v1-1-76f8c14ea2d7@gmail.com>
References: <20250708-spinand-propagate-wait-timeout-v1-1-76f8c14ea2d7@gmail.com>
Subject: Re: [PATCH] mtd: spinand: propagate spinand_wait() errors from
 spinand_write_page()
Message-Id: <175369782886.102528.14496009254436108539.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehjgehgkeihjeesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111714_264580_C29FC3B9 
X-CRM114-Status: UNSURE (   6.22  )
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

T24gVHVlLCAwOCBKdWwgMjAyNSAxNToxMTowMCArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
U2luY2UgY29tbWl0IDNkMWYwOGIwMzJkYyAoIm10ZDogc3BpbmFuZDogVXNlIHRoZSBleHRlcm5h
bCBFQ0MgZW5naW5lCj4gbG9naWMiKSB0aGUgc3BpbmFuZF93cml0ZV9wYWdlKCkgZnVuY3Rpb24g
aWdub3JlcyB0aGUgZXJyb3JzIHJldHVybmVkCj4gYnkgc3BpbmFuZF93YWl0KCkuIENoYW5nZSB0
aGUgY29kZSB0byBwcm9wYWdhdGUgdGhvc2UgdXAgdG8gdGhlIHN0YWNrCj4gYXMgaXQgd2FzIGRv
bmUgYmVmb3JlIHRoZSBvZmZlbmRpbmcgY2hhbmdlLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25l
eHQsIHRoYW5rcyEKClsxLzFdIG10ZDogc3BpbmFuZDogcHJvcGFnYXRlIHNwaW5hbmRfd2FpdCgp
IGVycm9ycyBmcm9tIHNwaW5hbmRfd3JpdGVfcGFnZSgpCiAgICAgIGNvbW1pdDogZTRjODk2Y2U0
MjRhNGFhMjQ4YzE3ODRjNWNlZjlkZGQwZTQ5MDBmYgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFp
bGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChw
cm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywK
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
