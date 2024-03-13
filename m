Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E5C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 22:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI19VcBoE1DjNnx/y2tXAu/YHK7cnxjSd+15MkbqyR4=; b=Wr55lPcWdRcGbb
	NWxJj1KizeSPFA6c9uDX9TvZQ2llEnD/pU7sMMwlzR0NL2L9DBmC5WtXgxHRrwTUCAeyRRiILBu/g
	CG8JcCgE/J0PIq9XE7zY7CEmEJyMwFQf9DEk6sexrpMvFZ/t5oMcLxH4Ia/hPoldRzEi/THLnU6r3
	PwFi0feP16Q1Zx3hof6tzPzsuy5blu7Lww9MEZCsbq9B530qEVElk7uJEpsz9OnA6IfrqeMjeYrKZ
	AjBBVjGufjSvTfgWWKcwJQWnqu4LJYVkDxkUDRokP9sjgVx9n3doLOuFwHp0MmqviLR6zGuw+icsF
	HkbKPUToLaOMWOLKgH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkX1J-0000000C791-02VZ;
	Wed, 13 Mar 2024 22:24:21 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkX1G-0000000C78R-0T56
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 22:24:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 639121BF204;
	Wed, 13 Mar 2024 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710368656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2i0kqkvtSmRqV8NOX2aALk9dXH51lAfm/ZDyJbNdQk=;
	b=bEiP/rEf0y7WjlEnYLl58l2yO8vOUWeQ6NS4rRFo1C4d5WhREClesTDfxR2DI2D+gA0T8E
	l93GZwp7ubCVaQ64WNhZBeA9Gblg6tgOTAfel51Nw2hyPqgqyGxwKXGWcMx0W02BJnoiWZ
	+/Uey5BktUokyYAFiWICFr3t8hJmgc+xbDH6YJn/omXfHX/DQ6skMcXZGJDT7Z3fg6VrAo
	wf/c+Ijopat9ZWMBuWgJXvvdDb5QDVXq/SRml0m5I2YEn/tmCJUwCIZMb7C/wygPD5ASMt
	tzLrhw09yxAq8zgHiERnK9g4TLZmgPZTz/ZfnH6HjaaaFuQ+Ul04PAAV6MGdyg==
Date: Wed, 13 Mar 2024 23:24:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <mwalle@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.9
Message-ID: <20240313232413.3c93b4ac@xps-13>
In-Reply-To: <7d391df2-09e4-4166-9116-312bfa74e738@linaro.org>
References: <7d391df2-09e4-4166-9116-312bfa74e738@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_152418_312073_68C26727 
X-CRM114-Status: UNSURE (   5.35  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVGh1LCAyOSBGZWIg
MjAyNCAxNjoxNTozNCArMDIwMDoKCj4gSGkhCj4gCj4gSGVyZSBpcyB0aGUgU1BJIE5PUiBQUiBm
b3IgdjYuOS4KClB1bGxlZCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
