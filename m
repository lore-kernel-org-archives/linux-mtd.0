Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4922DCA0EEB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8l9fXigGxnfBdTr2G+WqERFKQ9qvkf0HTBwQO0Df6Ug=; b=fzu52euzue3tVK
	7KcRj/dIPL9AzevYTQ416y91Js19TkVtME/1nF4tvGff/1t6e+i/oO9nQZbxO70XW5DUBfSeFcJEd
	QKI6HzmWZ2hyc2Xhm0J8iYitMyes2d7qw5psdPzKhkSp277dVFZ6xJ9EL4MsNsA37bHPzc610k787
	I9/2ugcxrk4Qu410O8/KmdBDtc0Q9lUbsLHH6agLWv5ynuHbjyo/Z3xiOkOJubLOtczS7R6dlVzSA
	0OfiwaAOEYhy5RZUy0Dcj7asZfUChgqh3djJzugrZ5FAYToCRkkVmUdD71xgwYw6eQTAbKWBJnHO6
	IPFAbqJpB+GouEu8GKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDW2-00000006L6r-1UuM;
	Sun, 24 Aug 2025 16:24:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqDVy-00000006L6D-2ASe
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 16:24:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 861454E40C0F;
	Sun, 24 Aug 2025 16:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D297605F1;
	Sun, 24 Aug 2025 16:24:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D30CE1C22C3C6;
	Sun, 24 Aug 2025 18:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756052653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=otXLfQ4Ld1gJ6Ja2C1Do6+eyluqz7SEV1+z0JoqPOKE=;
	b=CBgYKyU5xO4Q7dyEnj4UeX+5RLiyVyeT1VBugpwBueExjDf+RLz2u6YJ9J+rMFkQfgfeYq
	/Dye1S9nPJUP6usEdV/ECJEm2mVH0MIlglCWLlphUpO3U1HCi53aBcQHfhff5gxh3br72X
	2zjhlU1zCh1FXvVXZ4ef4wr/sNasqmGDw3WCxIjJBKeq9Ak1FVLYLMPp0XM0KqXnOsqgZp
	I4Ft3aotmL3KDm3lHBA6Po9+6CzLeH9UeAgARo2cnsqVDD9gtloDAtEBQYWdiNTaUwoZGs
	DxoFDr+J33qZGojumRoDZzDU3ml3ceiwFHpc+sLRH+bigGg/ovvSCalZ6pkfyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ray Liu
 <ray.liu@airoha.com>,  Mark Brown <broonie@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Martin Kurbanov
 <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 3/4] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 14 Aug 2025 09:54:22 +0300")
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
	<20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 18:24:00 +0200
Message-ID: <87plckit7j.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_092418_688307_B141A992 
X-CRM114-Status: UNSURE (   7.71  )
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

SGVsbG8sCgo+ICsJCWlmIChjb250cm9sbGVyX2lzX2J1Z2d5KSB7Cj4gKwkJCS8qCj4gKwkJCSAq
IFNvbWUgc3BpIGNvbnRyb2xsZXJzIG1heSBub3Qgc3VwcG9ydCByZWFkaW5nIHVwIHRvCj4gKwkJ
CSAqIGVyYXNlIGJsb2NrIHNpemUuIFRoZXkgd2lsbCByZWFkIGxlc3MgZGF0YSB0aGFuCj4gKwkJ
CSAqIGV4cGVjdGVkLiBJZiB0aGlzIGhhcHBlbiBkaXNhYmxlIGNvbnRpbnVvdXMgbW9kZQo+ICsJ
CQkgKiBhbmQgcmVwZWF0IHJlYWRpbmcgaW4gbm9ybWFsIG1vZGUuCj4gKwkJCSAqLwo+ICsJCQlz
cGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsKCkkgYW0gZmluZSB3aXRoIHRoZSBp
ZGVhLCBidXQgY291bGQgd2UgYXZvaWQgdGhpcyBsaXR0bGUgZGFuY2UgYW5kIGRyb3AKdGhlIGV4
dHJhIGNvbnRyb2xsZXJfaXNfYnVnZ3kgYm9vbGVhbiwgYW5kIGp1c3QgbGV0CnNwaW5hbmRfbXRk
X2NvbnRpbnVvdXNfcGFnZV9yZWFkKCkgZG8gdGhlIGZpeHVwIGFuZCByZXR1cm4gLUVBR0FJTj8K
Cj4gKwkJCXJldCA9IHNwaW5hbmRfbXRkX3JlZ3VsYXJfcGFnZV9yZWFkKG10ZCwgZnJvbSwgb3Bz
LAo+ICsJCQkJCQkJICAgICZtYXhfYml0ZmxpcHMpOwo+ICsJCX0KPiArCX0gZWxzZSB7Cj4gKwkJ
cmV0ID0gc3BpbmFuZF9tdGRfcmVndWxhcl9wYWdlX3JlYWQobXRkLCBmcm9tLCBvcHMsCj4gKwkJ
CQkJCSAgICAmbWF4X2JpdGZsaXBzKTsKPiArCX0KPiAgCj4gIAlpZiAob3BzLT5zdGF0cykgewo+
ICAJCW9wcy0+c3RhdHMtPnVuY29ycmVjdGFibGVfZXJyb3JzICs9CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
