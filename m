Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38487C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ag4bI7GytFt06S9DY/M05YISgM5btpovI33UDKMd9hs=; b=vgjQjbQNUKjHsJ
	HpN6vIgICqDD8IQQmL0EmbdO6bZQsjchap6iFqDAcuqwMveAjqiy8INBN9SjyYBCVNB7PI6eXP3Hk
	xvz+vVzfuLb/XyRsxO16wLYfaRm52hOdSHMwfQwGndZ4RProHR6CytyZk3MxBcNShpk1pbD07QKGF
	1oIN159x6ZH4Tv8a391cCqlbvwkQFE3wCb1UPdOoY5W9bnv7KldaGE9hccrW0XQIJ0FD7WY7ZJDKz
	yUFHM1kFG1bE3rW49+LwG2RoMY6ErvI3Ke70zrpieq1qsA++DRdRIYah2WDd/1i36EE+2PjOwtRrm
	8SWyMKTq8gEa683SocCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6v4-0000000DZv5-3gN8;
	Fri, 25 Sep 2026 14:28:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6v1-0000000DZpB-0G88
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:28:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91BF21A101E;
	Fri, 25 Sep 2026 14:28:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65DDD6073B;
	Fri, 25 Sep 2026 14:28:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6F88102F08C8;
	Fri, 25 Sep 2026 16:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FKzsy+CYXj4lbJ3LMsgqSQbf9iKfxj/uQZtvE+v+/n4=;
	b=gXZcrreVRlEjpngJOa2Yl3i0dkCM5F4NPD5I/aB+IuRzRf6Nhq0HF9cri+/gqhN1gvOXtg
	bL2sfg2mVWhVb24UAO9w4iLLbOfKmW0R+U8vqjlMIPSISI3n5CAJ0rDO+A5+iQt3OTMC12
	P1ZxqWArLYb3MEcs2uyDDx4uQtyIEipYxFXlO5AV9hLrjfvLMZs7LIESRyoTRsqNJSn3fn
	K2X4jE/dMnk2I0vQJF0IK77ABAFCElGexeELa6Vq0TwhPrJeYs4nvWtzKfixGMs/ZrigRh
	2ZsyhbM/x1ltcqCwHGcZoTvjqrnNH1/CJX65qg0Qxmw/BY8eCAh6w8NTjF+C/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dhowells@redhat.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 richard@nod.at, vigneshr@ti.com, viro@zeniv.linux.org.uk, 
 stable@vger.kernel.org
In-Reply-To: <20260917102550.2146806-1-vulab@iscas.ac.cn>
References: <20260917102550.2146806-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: mtdsuper: Fix MTD device reference leak in
 mtd_get_sb()
Message-Id: <179034653062.1166139.3563266165640465080.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072855_250256_A828F110 
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxMDoyNTo1MCArMDAwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IG10ZF9nZXRfc2IoKSBpcyBjYWxsZWQgd2l0aCBhIHJlZmVyZW5jZSB0byB0aGUgTVREIGRldmlj
ZSBhbHJlYWR5Cj4gdGFrZW4gYnkgdGhlIGNhbGxlci4gIFdoZW4gc2dldF9kZXYoKSBmYWlscywg
dGhlIGZ1bmN0aW9uIHJldHVybnMgdGhlCj4gZXJyb3Igd2l0aG91dCBkcm9wcGluZyB0aGF0IHJl
ZmVyZW5jZSwgc28gdGhlIGRldmljZSBpcyBuZXZlciByZWxlYXNlZAo+IGFuZCBpdHMgcmVmY291
bnQgbmV2ZXIgcmVhY2hlcyB6ZXJvLiAgRXZlcnkgbW91bnQgYXR0ZW1wdCBvbiBhbiBNVEQKPiBk
ZXZpY2Ugd2hvc2Ugc3VwZXJibG9jayBjYW5ub3QgYmUgc2V0IHVwIGxlYWtzIGEgcmVmZXJlbmNl
Lgo+IAo+IFJlc3RvcmUgdGhlIHB1dF9tdGRfZGV2aWNlKCkgdGhhdCB0aGUgZnNfY29udGV4dCBj
b252ZXJzaW9uIGRyb3BwZWQgb24KPiB0aGlzIHBhdGguCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8g
bXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbXRkc3VwZXI6IEZpeCBNVEQgZGV2aWNlIHJl
ZmVyZW5jZSBsZWFrIGluIG10ZF9nZXRfc2IoKQogICAgICBjb21taXQ6IDYyZWUzZGEzOGY0MWJl
ZjgzYzFjZjI1MGY2ODE2YTBlZTE4NzY3NGIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxl
IG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlk
ZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXD
qGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
