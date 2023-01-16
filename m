Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4AEC54EBE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+f11rgQqUIs87qnBVnxQDBelBpFCGCUQ6w1MG3hEvc=; b=Hiyr6yIfbDDfyq
	eb9RFSyV/95r7fMKlMv9xbKeK5piKleAoKNxh7bkfQOcCbaT77gdU3920nuZhjWQiAWv/4elc9LVv
	2Kb60iuhonaQSdu7avk5cAyTkeSdZfVWwHJN8tTToF0EI/LrV6x4pf492+Awa5iiZJyyHp4bUnPH2
	P+eeo+THGApGncuvSk8YTPZ3uWDk68Gr1RjWIA/XfrDZof9EoZ1FaNuIGs2W8fANzm2oBStzyjxuu
	H2g9Q6Ll/4R4iAmYp1rVlzukyWD1ccwdawmyHIgjo7Egy3O0EHxyi5+MouTKz3OKGxHkkPWKula45
	UjYjLUvEM8NBNO0QlqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJha-008vgx-BZ; Mon, 16 Jan 2023 07:14:42 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJhX-008vg3-VN
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 07:14:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 32DA668AFE; Mon, 16 Jan 2023 08:14:37 +0100 (CET)
Date: Mon, 16 Jan 2023 08:14:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: Re: remove arch/sh
Message-ID: <20230116071436.GB15848@lst.de>
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de> <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_231440_170361_0F4EB408 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 13, 2023 at 09:26:23AM +0100, Geert Uytterhoeven wrote:
> Indeed.  The main issue is not the lack of people sending patches and
> fixes, but those patches never being applied by the maintainers.
> Perhaps someone is willing to stand up to take over maintainership?

The other problem is that it hasn't a DT conversion, and there are
lot of crufty platforms, and crufty hooks in various drivers and
core code.

It's been mentioned a few times that it might be time to go to a minimal
DT only port and then regrow what people are actually using, but for
that we need indiciations of what people are actually using.

And yes, it does need a proper maintainer, and some actual maintainer
option like cutting down unused machine support.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
