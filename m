Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5963AC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Dec 2021 13:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ehZ6kQH+Hn6JPttEefbf6CLbl3v4GivdHFMp4WmvdY=; b=z3Ugg/5fI1Z+MT
	Ur1jcAADaCgRGNFsVjQh9lwtxEcJ64IDYeph8YgJS6G2VX9jKh0JN4fCdf3VamoopxSApkQOYPJUC
	TJDlB1TvXYQGfq2P4b0pD3gCC/GoB/R/lv8BsaW0GjY+JpdpMGL0CxjqL7hSJDL4K/rNP0BS1YFdB
	ABvqiGWqX/qFJUFHO1Tdu62rhbo7rNyS1xS0pONROGSLvgy8zE/LQyx9+3jLSClyjeq9JwWqOCFOY
	lvCJkrXYJ6i5SaPVDPX6tT8jhWx7MG+8aLgZFOxr+ynIJx4e26VicAAKvJn0hHc8boKg85mm4w1d7
	xBDa5MqS66OqiJvRRNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3HWl-0063oV-E6; Fri, 31 Dec 2021 13:00:59 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3HWi-0063nV-F7
 for linux-mtd@lists.infradead.org; Fri, 31 Dec 2021 13:00:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5499C40005;
 Fri, 31 Dec 2021 13:00:52 +0000 (UTC)
Date: Fri, 31 Dec 2021 14:00:50 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <richard@nod.at>, <p.yadav@ti.com>, <michael@walle.cc>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.17
Message-ID: <20211231140050.21281bdb@xps13>
In-Reply-To: <3644f2a5-1f46-58a0-1175-454f241c4785@microchip.com>
References: <3644f2a5-1f46-58a0-1175-454f241c4785@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_050056_666205_DFB2C8D0 
X-CRM114-Status: UNSURE (   4.85  )
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

SGkgVHVkb3IsCgpUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gV2VkLCAyOSBE
ZWMgMjAyMSAwOToxOToyMiArMDAwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBpcyB0aGUgU1BJIE5P
UiBQUiBmb3IgNS4xNy4KClB1bGxlZCwgdGhhbmtzIQpNaXF1w6hsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
