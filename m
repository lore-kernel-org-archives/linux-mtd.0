Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9394CC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjEP5JfR2LuS2ne3f1qr0YhonUxXX81pxizabT+uSSE=; b=pvu7bInsjlVPJg
	ZvcXkbgfnGrpNjMrDTDOK03WpGz2EMndtS/8I4Y0Mf3W1e7FONQ8Ng2eIWB9LcjfMVbAQYrw09665
	DxpfWjSJ2P6pANLv7jIMGOWhCwW16kttYy7DKTH7SypRma9suw/+CZUpptIR2Bst5MXDIDf+fV9cN
	cWHrBcEnxj79V4KRB0tiRdyfuXakQ2trG5zNA2+tTj+LHLaZtJk4cacCKXYDd5oK+qwHQ/AjKMi63
	cemYNxl6QMaD5aNRrI2IgxoPViVmc/uyG70yLwwIFolgtx3VUmkd4QlmZACSDEZfWrQaI8nj+w97V
	tgJPIVf9q0S2OP9NlyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAis-00Cbrk-Ke; Thu, 12 May 2022 15:27:26 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAip-00Cbp8-0s
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1220F60004;
 Thu, 12 May 2022 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yxc7R/jP+AWIC50etTxljBYPzzQ0Dt5kL2aEw0NrExg=;
 b=FvyRn0lrkU4HdcFgqxt9zmJbXaESr0UzjbGd+6hK0TJJciQsZmi1x007eIaC//fXXREL9/
 yAFC1kKGP4KepfefuEbQF3UED4So8JrsHq4/131o8vxcGh5+T1Mg+FJ9gIuVrLpcimcX2H
 42XQLMpH02cTcW8zl/ecjCsQYfcWV3MFw9NJ+qB+ib4yaM11NznP4Bw87jzbhh4opF6ajj
 +cPHmpXkv81qW1UvKzILYbJcdxjdfltgNHJaWfwXVE/9Bul806vQSl+xKBKytKkTQ0WoU3
 nTTqvcjQvBFRqSsp3pJrNjApCG6WFogIjkgEbf/DAV61nLQmoYwdunHpKd9CDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3] mtd: call of_platform_populate() for MTD partitions
Date: Thu, 12 May 2022 17:27:15 +0200
Message-Id: <20220512152715.244735-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220510131259.555-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a955b5d07987a7ba7034cf70db7b2288e275c563'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082723_254198_AD98BE82 
X-CRM114-Status: UNSURE (   8.93  )
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

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDEzOjEyOjU5IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFVudGlsIHRoaXMgY2hhbmdlIE1URCBzdWJzeXN0ZW0gc3VwcG9ydGVkIGhhbmRs
aW5nIHBhcnRpdGlvbnMgb25seSB3aXRoCj4gTVREIHBhcnRpdGlvbnMgcGFyc2Vycy4gVGhhdCdz
IGEgc3BlY2lmaWMgLyBsaW1pdGVkIEFQSSBkZXNpZ25lZCBhcm91bmQKPiBwYXJ0aXRpb25zLgo+
IAo+IFNvbWUgTVREIHBhcnRpdGlvbnMgbWF5IGhvd2V2ZXIgcmVxdWlyZSBkaWZmZXJlbnQgaGFu
ZGxpbmcuIFRoZXkgbWF5Cj4gY29udGFpbiBzcGVjaWZpYyBkYXRhIHRoYXQgbmVlZHMgdG8gYmUg
cGFyc2VkIGFuZCBzb21laG93IGV4dHJhY3RlZC4gRm9yCj4gdGhhdCBwdXJwb3NlIE1URCBzdWJz
eXN0ZW0gc2hvdWxkIGFsbG93IGJpbmRpbmcgb2Ygc3RhbmRhcmQgcGxhdGZvcm0KPiBkcml2ZXJz
Lgo+IAo+IEFuIGV4YW1wbGUgY2FuIGJlIFUtQm9vdCAoc3ViKXBhcnRpdGlvbiB3aXRoIGVudmly
b25tZW50IHZhcmlhYmxlcy4KPiBUaGVyZSBleGlzdCBhICJ1LWJvb3QsZW52IiBEVCBiaW5kaW5n
IGZvciBNVEQgKHN1YilwYXJ0aXRpb24gdGhhdAo+IHJlcXVpcmVzIGFuIE5WTUVNIGRyaXZlci4K
PiAKPiBSZWY6IDVkYjFjMmRiYzA0YyAoImR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFUtQm9vdCBl
bnZpcm9ubWVudCB2YXJpYWJsZXMgYmluZGluZyIpCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0aGFu
a3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
