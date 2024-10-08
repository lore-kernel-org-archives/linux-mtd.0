Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61389CED27E
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlQNkx2pvm4wBwtCNJ3yg8HcGdK46+druNxBR9mFuJw=; b=TAsT2i0HeZZCqM
	MDzAAVTBPEtPr+e/Wbwcfh4OExlp+oJiFRWZ74OGPf8NalRLW2DzmFzKEF6BLhYfXwkJX6IsPUsw+
	N/pom68FN5dBhgSG0+M6HCy7Y0eWAIb5zCUN2jcPr5lfr989rJENpGYg/17jkzn2YIP19R5wtM77N
	841FGNVj5PUkCZ7LqWx3ICzR9PwafJ0wEtqEPh0JM4/fA5YA2UpKXVd4J6iOPU6k1+DUdX+WJmx6c
	8sJaaVAWNBZvAYtuH0L16pH2HtDWHh0uWOEsg86PjPLU67j1hrNUCJ0j2V69kdcktX3LQLCSSZS5l
	xmPYy+epTA3XzZCVTZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5qL-000000057W6-2wDx;
	Tue, 08 Oct 2024 08:45:21 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5h4-000000054cn-14cV
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 08:35:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F126A40008;
	Tue,  8 Oct 2024 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728376543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzTXdtYGYPM59AXtWT/HOfKZE5uKA7SNrJArrUmDmXQ=;
	b=EUvdK83V202AVaIN+lp+rxHvfc8TsfhMAtAMgEDI1NZzS9FMx4fOHaJoh6VpEoShoVGunJ
	hOPD5IKU+yfnPaaAM0dY10nF8OExQz7OiBVoktWtgHfiLftTqOD1n9AIhXksSJx8uSeFR2
	shyf/r+oVra2YUvBNB6m/MSQzZJnkqv+zTTsqBh9s2Og6HWqA9wH3o1w2c32GFVaVs+Mwf
	oUt+f0YExYVlzOsDL2HxR8qr/YluuK2iGwlsLJrUxwVuBHm4pUw2GIhrIvUmB/9nkSiJtu
	RF5ithfYPBWRbbbXk6lay5biXlnuxC8XN2IkkckEuBlFPsVfVbK2tcjC2K+/XA==
Date: Tue, 8 Oct 2024 10:35:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>, Alvin Zhou
 <alvinzhou@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH mtd-utils 00/10] New options for hardening continuous
 read support
Message-ID: <20241008103541.6e061160@xps-13>
In-Reply-To: <c4f2b009-aa89-4ce9-a0dd-188528e280bb@sigma-star.at>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
	<c4f2b009-aa89-4ce9-a0dd-188528e280bb@sigma-star.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_013546_544362_13FBA16B 
X-CRM114-Status: UNSURE (   6.52  )
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

SGkgRGF2aWQsCgpkYXZpZC5vYmVyaG9sbGVuemVyQHNpZ21hLXN0YXIuYXQgd3JvdGUgb24gVHVl
LCA4IE9jdCAyMDI0IDA5OjAwOjM1CiswMjAwOgoKPiBBcHBsaWVkIHRvIG10ZC11dGlscy5naXQg
bWFzdGVyLgoKVGhhbmtzIQoKSSdsbCB0cnkgdG8gcmVtZW1iZXIgYnVtcGluZyB0aGUgQnVpbGRy
b290IHBhY2tldCBsYXRlciB3aGVuIHlvdSB0YWcgYQpuZXcgdmVyc2lvbiAoaXQncyBub3QgYSBy
ZXF1ZXN0LCBJIGhhdmUgbXkgb3duIHNldHVwIGZvciBub3cgYW55d2F5KS4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
