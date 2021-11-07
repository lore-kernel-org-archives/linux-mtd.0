Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774FBC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 16:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46F2061052
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 16:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46F2061052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66Ht5BQZDGXQKXHIrdPRDxqhrnngAfuyZsXJxRlihQQ=; b=2/aKbdzuziruTX
	ZWf6SAMUmExe8IIgZZvS6IKjxISBldy6Tj+LKt0R63xRCUMBPYXmJmKavxI6HmwfcX/ZnUGAlygnq
	4t2y/G0aPmLH6cQtuqMCoChwQScvyCrPDEoCi2id5yKX/I37pMIFJuYrQDQuRf6+ihKHss8UlYyCE
	bxhPiTGQWpt7LWNqVAuapekgnWLHeEpVvRsWWH+XWATW/wzarXKpwgJpnzWOMXUtm1SGpvu5KRgMC
	UHzAegjqcmk1dpnOxYrF8jcS+ZEUchytf5JMGi1lt1HMROd4U48cxkGI3cLj2V0AdjH/y+G6MG3HP
	/6YttAkAdnf0GJ9XAMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjlGa-00EZxU-S5; Sun, 07 Nov 2021 16:43:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjlGY-00EZx3-8b
 for linux-mtd@lists.infradead.org; Sun, 07 Nov 2021 16:43:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 810C01BF203;
 Sun,  7 Nov 2021 16:43:31 +0000 (UTC)
Date: Sun, 7 Nov 2021 17:43:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <richard@nod.at>, <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>,
 <frieder.schrempf@kontron.de>, <p.yadav@ti.com>, <michael@walle.cc>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.16
Message-ID: <20211107174330.54821536@xps13>
In-Reply-To: <9138061e-ff86-b3b1-f00f-69ef4885213b@microchip.com>
References: <9138061e-ff86-b3b1-f00f-69ef4885213b@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_084334_458837_647EFE7F 
X-CRM114-Status: UNSURE (   4.95  )
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

SGVsbG8gVHVkb3IsCgpUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gVHVlLCAy
IE5vdiAyMDIxIDA4OjM3OjEwICswMDAwOgoKPiBIaSwgUmljaGFyZCwKPiAKPiBUaGlzIGlzIHRo
ZSBTUEkgTk9SIFBSIGZvciA1LjE2LgoKUHVsbGVkLCB0aGFua3MhCgpNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
