Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CFC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Dec 2021 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyjssh79Y0yoLDtwkDe6yjKq+KOATLihomZN5vyLBrw=; b=GB7LA+WjqBNd6k
	eoB0zdvFfHdIXpFBszGEAwDBFzOzkfGfB82U2qiOn7wbaRNSnj6lZgMbhMU0vTSBckgYsaUEodxVa
	eJetXoFwpLFXloY36dIoN7/gMpukqksZZqHz7o68UlPOXXDy/guJQysHYSL6ZrkBg0aTZAEXA3PlA
	2w5/8MT6BFftaCJnMubhpBJYBoFDJYfD0wrlbhAMZ5a9Rhywfo9HV57NBzqH39NzeYfvRwgLCFKQy
	AyDpYz5pIR2ss72oT55gsTkqaDd2LDTLecOpi9A4IMrK7uMAQ/hTI5vzUWTCqUzvFsjSwUZhMLB3F
	b0htiPXC5hhoce3Gjz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3HXC-0063pz-BW; Fri, 31 Dec 2021 13:01:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3HX9-0063pa-49
 for linux-mtd@lists.infradead.org; Fri, 31 Dec 2021 13:01:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A676E2000B;
 Fri, 31 Dec 2021 13:01:17 +0000 (UTC)
Date: Fri, 31 Dec 2021 14:01:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>, MTD Maling List
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] CFI and HyperFlash changes for v5.17-rc1
Message-ID: <20211231140116.42927a96@xps13>
In-Reply-To: <cbb28885-fb36-2847-d691-cf1dc5e5c386@ti.com>
References: <cbb28885-fb36-2847-d691-cf1dc5e5c386@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_050123_325527_9267760B 
X-CRM114-Status: UNSURE (   4.96  )
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

SGkgVmlnbmVzaCwKCnZpZ25lc2hyQHRpLmNvbSB3cm90ZSBvbiBGcmksIDI0IERlYyAyMDIxIDE5
OjIwOjUzICswNTMwOgoKPiBIaSAgTWlxdWVsLCBSaWNoYXJkLAo+IAo+IEhlcmUgaXMgdGhlIEh5
cGVyQnVzL0h5cGVyRmxhc2ggcmVsYXRlZCBQUiBmb3IgdjUuMTctcmMxLiBUaGFua3MhCgpQdWxs
ZWQsIHRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
