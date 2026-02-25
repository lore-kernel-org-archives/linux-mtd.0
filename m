Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C013FD3776
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7UkBy0Pl8BWgiv5RDiwGQcQ9jW0ibZNKtWKQxmMUCQ=; b=EMGTgU/C4ui7uL
	Nc6EW0w2cXC6zarm64hh9PzLDoMGpOJFgnfALv3U0+aBayoykfHDxs4iXVmc/HGm+1/xMylck3/AT
	v/dJWdyx8Lxc8YOn05KNpkBZiSpTNtgUV2N+lcBa4V64hOJTRm8fipbXHylJDIOApf6A6owWOTvOt
	gPcPKCLWSEc3Vg8FffgwU7zricl1R1pyt1qjjvXaHlYtyF96XSqBvX0gI33QIU9dUat6TZNfo2PcZ
	Jf96+pObUfQnueznrFA7F2t39fP5cZNET6UCpVKEOWQieHuGJwjXoAMvBPaZ5gmM4TphsD8yzndS/
	CO1ux38ugvNSjp25rpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHr4-00000004X7e-3wkV;
	Wed, 25 Feb 2026 16:35:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHqz-00000004X6u-3l7H
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 16:35:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B66F2C143FD;
	Wed, 25 Feb 2026 16:35:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A59685FDE6;
	Wed, 25 Feb 2026 16:35:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B13FF10369259;
	Wed, 25 Feb 2026 17:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772037310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UFaqZFkjXpX4ZOHgto3MapJdgoeyP0YFfcrJ09z0Qx0=;
	b=16GVgG8J+F4HJkAnnxIyNsvAxz2gLcwzzP9Uhl+Mw+K774s+TitaYGGWFB3il/spaDCSrZ
	afVzgFDZXEvqchCdINBAWdNu6vCC7vWUk8wY2XnPIIYLV0Gg1eM4YSqzjgq/kz4hXRGQxu
	3IdJ0oGjZiMbfxGESNIHtunOnjuO2J6V8qsQT8gIkdJR6NESz7iSOXpNg3aLsqE8HyiwfS
	nB10xWlqhE3lf3yGjT3b/vfHg/xIgltY+J7tHzaWiv/tR1qxqC/WIUb0I4seQ0ph+qusG3
	nCCvaUsAwKNrZRVzEI3HZMCWkNE/rhPA5ktT8rRn1wBXIUAij0/tCRapDnCsuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Michal Simek <monstr@monstr.eu>,
	Bernhard Frauendienst <kernel@nospam.obeliks.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 0/3] mtd: Add support for stacked memories
Date: Wed, 25 Feb 2026 17:35:02 +0100
Message-ID: <177203729096.1970868.11555968857767278151.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260204-mtd-virt-concat-v17-0-5e98239bb55b@bootlin.com>
References: <20260204-mtd-virt-concat-v17-0-5e98239bb55b@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_083516_341018_BC03532F 
X-CRM114-Status: GOOD (  11.95  )
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

T24gV2VkLCAwNCBGZWIgMjAyNiAwOTozMjoxNSArMDEwMCwgTHVjYSBDZXJlc29saSB3cm90ZToK
PiBbVEw7RFIgZm9yIHYxNTogYXMgYWdyZWVkIHdpdGggQW1pdCBJJ20gc2VuZGluZyBhIG5ldyBp
dGVyYXRpb24gb2YgaGlzCj4gcGF0Y2hlcyB0byBmaXggdGhlIGJ1aWxkLXRpbWUgZmFpbHVyZSBk
dWUgdG8gYSBtb2R1bGUgZGVwZW5kZW5jeQo+IGxvb3AuIE9yaWdpbmFsIGNvdmVyIGZvbGxvd3Mu
XQo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3RhY2tlZCBzdXBwb3J0IGJ5IGVuaGFuY2lu
ZyB0aGUgZXhpc3RpbmcgbXRkLWNvbmNhdAo+IGRyaXZlciB0byBiZSBtb3JlIGdlbmVyaWMuCj4g
Cj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzNdIGR0LWJpbmRpbmdz
OiBtdGQ6IERlc2NyaWJlIE1URCBwYXJ0aXRpb25zIGNvbmNhdGVuYXRpb24KICAgICAgY29tbWl0
OiA1YzU0M2RlODU2YzQ2MzIzNWNlZjA4MDhjMmIxMDBlNDc1ZmM4NDM4ClsyLzNdIG10ZDogTW92
ZSBzdHJ1Y3QgbXRkX2NvbmNhdCBkZWZpbml0aW9uIHRvIGhlYWRlciBmaWxlCiAgICAgIGNvbW1p
dDogNTk1MDlkYTBjYjUxZGM0OGU0ZWRjNTdkN2QzZWYxZDQyNGM1OGZjOQpbMy8zXSBtdGQ6IEFk
ZCBkcml2ZXIgZm9yIGNvbmNhdGVuYXRpbmcgZGV2aWNlcwogICAgICBjb21taXQ6IDQzZGI2MzY2
ZmMyZGUwMjA1MGU2NjM4OWY1NjI4ZDNmZGM5YWYxMGEKClBhdGNoZShzKSBzaG91bGQgYmUgYXZh
aWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAo
cHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMs
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
