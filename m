Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F3E8FDDD
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kr996Wwn3y0VumxOOJdNJmoPR8+3NBEgfJGT1ZTQ+2w=; b=bGvK00nIvpDuw7
	7RShcRcsyoUyLDei2doLaVixCDgPSXEjuQoKSIrkvnucYFjcvbbWmHgpRlVStXjHecwO2+r8C+A42
	TENvP7n6tzDfpXJ1bebUDInfDPj4pGX8tlkPuoRuSIpQb1uo66zQnllqzJumWqAzYvYh6Z5P9tIsg
	XjrIXFfrLUeWXz9yxvG06LoUMDPFVKjLEkZ80sljdJGdXECXnoiHxywkKVFoYUdPOu1CzEFJzH611
	6eaoEl0iH4pJaCPpVtJ4cYu1DJyWefKcEZ9PuHOz5FhG0V4+HXbT4T3hrhJWR5/+Bfn/vpUJwp0XJ
	OUNPTFOXG6bGTdH1p6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxPa-00Gsm0-1e;
	Wed, 04 Oct 2023 08:39:18 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxPY-00GsjJ-0Z
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 08:39:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D22A31C0008;
	Wed,  4 Oct 2023 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696408752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/XYEYq73ZO+zD7F2L6Y1MmfY4dJus72lVk4ppYFdpk=;
	b=e3o/+HfErmLGqISJrDYJMUi2DTIPOSikg66HhiNkzV1ZZdK+zNoZABggUHI5tRdYcyvfSs
	yC+GDsysnAvI3BA3u0VbuXB/YAW0IVyPJ9oxrsoSsBRqh98t/OALLdqwkSUuw3nslx+YZw
	FlSsqlkbt7RLz/nm/x/6fp7w+1EUmwnuMSRemthH7HG517v1GefGfJ+UkcHxqlkilG+O+6
	Zpk2HqTSIg9LxRu5NoyGvkAwyvrnp7QLcmdbuu82zj1JogYhN/JGLWpHS+sVa0LoJCk7Ay
	mVswbRskpuN+3Cg/i8x9W1APF7i/ACxvciE6/yo0haHmy/Y2/QuGnJHGvgRWtA==
Date: Wed, 4 Oct 2023 10:39:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v2] mtd: nand: add support for ts72xx
Message-ID: <20231004103911.2aa65354@xps-13>
In-Reply-To: <20231004103835.55cccdc6@xps-13>
References: <20231004082223.12762-1-nikita.shubin@maquefel.me>
	<20231004103835.55cccdc6@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013916_357410_BE0ED26C 
X-CRM114-Status: UNSURE (   8.80  )
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

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gV2VkLCA0IE9jdCAyMDIzIDEwOjM4
OjM1ICswMjAwOgoKPiBIaSBOaWtpdGEsCj4gCj4gbmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZSB3
cm90ZSBvbiBXZWQsICA0IE9jdCAyMDIzIDExOjIyOjIzICswMzAwOgo+IAoKQlRXLCBzdWJqZWN0
IHByZWZpeCBzaG91bGQgYmUgIm10ZDogcmF3bmFuZDoiLgoKPiA+IFRlY2hub2xvZ2ljIFN5c3Rl
bXMgaGFzIGl0J3Mgb3duIG5hbmQgY29udHJvbGxlciBpbXBsZW1lbnRhdGlvbiBpbiBDUExELgo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVl
ZmVsLm1lPgo+ID4gLS0tCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
