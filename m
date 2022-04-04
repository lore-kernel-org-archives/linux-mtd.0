Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B189DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZNkNeij9lOlxya/ETHHgG2ra5pwK1biQzhzam2jepM=; b=enaeZO79OoEnWw
	AL9BEsV64+PxP13kTqbbtryIzSf8Szp26eK75P86zlieTU1CQv+GR8tD4mYsSX8S+vDM3fssNWHvO
	KGTb9d5CLgK4+hV4wF/wevc7zwq19TBRD3flvSwAo7jQz4bR1vbhl1ldtp13OJ1vb7qy7EIhWc8YL
	7yDDW2kssR4qXf+NZ2uOC/MTHxM91SvBs55u26Ac/bDamIApfs6Ux4JPwXp/2zYGupj/tvhxYzt6m
	byUyzqLnsgbDqR0fcH6SQ2D1lTCT8jymVjEYfwQrS6tXtwkA4z2wdv4VGi7UWaigZXGk21pxhk3hR
	L8DOtx5F66SdmCPwcprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbILq-00DuOC-8u; Mon, 04 Apr 2022 08:46:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbILm-00DuN1-MU
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:46:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B8DD1BF20F;
 Mon,  4 Apr 2022 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649061970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8ZbDc+LbqaPgZ/G4KSF4QMkB4YVA4caUBz1CYzpxPA=;
 b=PmsVT1pywZO+2oCl+HgxN9nSqx34+rnMt6VtuJdSUb0t4irCguEZlWb2Nuax3htAOm6J0y
 0n4mxWgCIJXxUVroWYLATN2MiBYUFVvygFv63goAcgJZXX7/HhUdCxRCCZcSMO7jeIN2LG
 q5wA0UYr39QdnxFj6n52QKznre+MU6G16qlJVWTKU97jdIrl1JSsW3v0VKaC4i9jnh1qlD
 jx4Sglqt5e0kfbIBLXx795f8s35DcsE7va1kpSh7DNtoDlu/UnKjkisKOLPERky/3rz/NM
 dk4YR1d/JHQYvlF2d0SSOrquL7miaY+gP4PD2mVQg+DyAL7LG4liSHDPpDsqaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: parsers: bcm47xxpart: print correct offset on read
 error
Date: Mon,  4 Apr 2022 10:46:07 +0200
Message-Id: <20220404084607.1127450-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317114316.29827-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4c38eded807043f40f4dc49da6df097f9dcac393'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014614_905829_E167A9F6 
X-CRM114-Status: UNSURE (   6.09  )
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

T24gVGh1LCAyMDIyLTAzLTE3IGF0IDExOjQzOjE2IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IG10ZF9yZWFkKCkgZ2V0cyBjYWxsZWQgd2l0aCBvZmZzZXQgKyAweDgwMDAgYXMg
YXJndW1lbnQgc28gdXNlIHRoZSBzYW1lCj4gdmFsdWUgaW4gcHJfZXJyKCkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQXBwbGllZCB0byBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXgu
Z2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
