Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DFBC54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTmCQ3ZVH1QhfuZ5987UctBdb7rsltV+R6tpgyv5b/s=; b=uCOFaZVt/iN2W0
	vcXWv1bEqp46PKro2fWxyozY7jd3+vIEOr2kh8CXr/M6SKHkWtl9wC2sLlW27r7CQP6PNgH9ZzHlh
	xFgORoQI15gO/PiGSAZE3b/iH0Aks0doC/MRhM+WVUj9N6wUSMjRe5VB8LzWJ+qYDDBJdmNWvUkUg
	KT1uFSVeTvyJVaxv2v3rHmKxLrThUi4syDDvxJV/yYJxgWepAvIlioQx4fyM3tITBV4SEAoqyppCq
	2PvI2gUD8EbZFn7gaZK7T4l8U/d0MB5aqYAeK8IhJO/IkyXy+QQZlMOs8uovcGgOwmr6IbQkmNrCn
	SYOk//fuY/1BhgA5hFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEGf-000wjI-5a; Fri, 13 Jan 2023 07:14:25 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEGc-000whB-6B
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 07:14:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 78A2D68D07; Fri, 13 Jan 2023 08:14:13 +0100 (CET)
Date: Fri, 13 Jan 2023 08:14:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH 02/22] usb: remove the dead USB_OHCI_SH option
Message-ID: <20230113071413.GA25637@lst.de>
References: <20230113062339.1909087-1-hch@lst.de> <20230113062339.1909087-3-hch@lst.de> <Y8EEbCP6PRMzWP5y@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8EEbCP6PRMzWP5y@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_231422_410375_97949EA1 
X-CRM114-Status: GOOD (  12.62  )
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

On Fri, Jan 13, 2023 at 08:12:44AM +0100, Greg Kroah-Hartman wrote:
> Do you want all of these to go through a single tree, or can they go
> through the different driver subsystem trees?
> 
> If single:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> If not, I'll be glad to take this.

I think taking all the patches together would make most sense.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
