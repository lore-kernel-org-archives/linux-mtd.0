Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817A2EE20AB
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgreKcQOswGK/qYtwui3ID5Vr8d6vKfUW0Ly2jWRXIs=; b=jugCQ6JXZjawfj
	82xizia4agKXhFUBw0NhRHVY43YC+VtqG2Ntnu+bbRBapKIMf65oTDdSnp88OG3PmBspV50ieMUcz
	GYzv4LYUQbm2n2xsX857wo0do/aCMVTuswd4qQz9eU3xado9ymvVnK6YQXnKKt2J5gP9qeXFjHHCa
	nZrY1ZHXy0oRyWCSxZ9Ha3Pu6+Ix0RsE4tQE4WbslXNypuKiw08UR1lVmCcI2m0kn7e2OghgMh1KJ
	nh9nTVoVGMD/J1ARVzU7VLvrZOcwn6lDybK76Tcc5DXZ7MWks3vWQL6ignDmDhwtGCxpeEtK4hJ2r
	3xVvTMW7RWAeffqwL5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMk8-0000000BRDT-1FAV;
	Fri, 06 Feb 2026 14:23:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMk5-0000000BRCz-2sDy
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 14:23:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 145371A2C58;
	Fri,  6 Feb 2026 14:23:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D807160729;
	Fri,  6 Feb 2026 14:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D609119D1DE9;
	Fri,  6 Feb 2026 15:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770387807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9jrDE1DTQqQcWQVv/UJz6FvrSFyNgWp1ariYMe2medo=;
	b=P3dgunVntf0AU6iE5wBEXjkSHu7GtBfFrSuBrqGHVcBwfl80Y90ZUVZQSsSpB+8z56haqZ
	0RpbCh0zokGLzqqifhv6J5IbFd+y0GxWAfaq9ST0Cqas2irU9mySKEG4QUIIk0bKnSl2ON
	vlB1lB8E9VriN/xh+1cAdyO4wRTWoMLFzU+DwLlCINeWLLp1CC4C6AvSgcE2f24C1IZ0le
	Ig0K+AlX7B5FBqJvT3PHx0u+4wWWb4RtfMKeC0b1446S2sj2TP/kB1StmOYxn5S+Ia1fXG
	BGlri5plfKZvTwyL9JGoBg6ZAv5gp/UzhhQNlfDjUth8vX+WmaqSTt/03wyMyg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aYXu7uqMQdZRMmQF@stanley.mountain>
References: <aYXu7uqMQdZRMmQF@stanley.mountain>
Subject: Re: [PATCH next] mtd: spi-nor: hisi-sfc: fix refcounting bug in
 hisi_spi_nor_register_all()
Message-Id: <177038780444.1194483.7825758239559320500.b4-ty@bootlin.com>
Date: Fri, 06 Feb 2026 15:23:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_062329_854699_64061DF2 
X-CRM114-Status: UNSURE (   5.66  )
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

T24gRnJpLCAwNiBGZWIgMjAyNiAxNjozODo1NCArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBUaGlzIHdhcyBjb252ZXJ0ZWQgdG8gYSBfc2NvcGVkKCkgbG9vcCBidXQgdGhpcyBvZl9ub2Rl
X3B1dCgpIHdhcwo+IGFjY2lkZW50YWxseSBsZWZ0IGJlaGluZCB3aGljaCBpcyBhIGRvdWJsZSBm
cmVlLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogc3Bp
LW5vcjogaGlzaS1zZmM6IGZpeCByZWZjb3VudGluZyBidWcgaW4gaGlzaV9zcGlfbm9yX3JlZ2lz
dGVyX2FsbCgpCiAgICAgIGNvbW1pdDogNmM3ODYwYWEyOGI4MWI3ZTkwOWI4ZDIwNzJlZDc2ZmEy
MmRiNmVkYQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBh
bmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNv
bXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
