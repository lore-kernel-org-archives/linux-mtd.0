Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00212C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbrU0UrRrLP2zeD93oKhJ+0UiAfRyyRwKKOkL20aPtc=; b=onm62V+hC45NLf
	jq7Wg4t2KZKYXLc0c2KBETbpkZn7iO4+l/6Fj0WkUAxlcWEXckbOO0FP+nujVGBLt9mrOwkETjMmQ
	11KCoihMYiNVt9liPo8ATJEX267IJJgIh2y1l+e4YwMbnKXGil11KMXd41LvZp7oGDcZf4yka8fH8
	+dw1u4nvUDlxxvaeuIWUWWRjGVsxRugTRHWjkcflwGkFeJSVSJfZnrUhn8NtXE3bqHtg2gJQOYXmt
	h38VkjXVpkOmdzEWGv7e2Bz9mH5nxnHlECsl719urlsr4ilQFOEW82EYAwH2r7HKvvhBLpZdHel7v
	2mmIhRb1gv4diLsBUU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqRo-000miK-I5; Fri, 03 Feb 2023 07:25:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqRm-000mhK-8C
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 07:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 479EEB82913;
	Fri,  3 Feb 2023 07:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9EAC433D2;
	Fri,  3 Feb 2023 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675409118;
	bh=w/73Uc/n5KxsufzX5CddSnsJWhi8Tl5rHcWOUj980gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvD8eTpjLOtWB+UEaur78gdbkDk2uNg4iTyG7EduGBBQeFYYfDMJR0zI5M46iGXgI
	 B/g60xlZj15BQnrefnVhdWcwV0eYwBhVI1fWaHKJRFJ022Eb8m0gihPo6B9goL/ROM
	 S4BKuWCyK0zSKt6MO3m0b0jgs8LUO3Xke14ThSpk=
Date: Fri, 3 Feb 2023 08:25:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
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
Message-ID: <Y9y221RalpLWJE0S@kroah.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-3-hch@lst.de>
 <Y8EEbCP6PRMzWP5y@kroah.com>
 <20230203071542.GC24833@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203071542.GC24833@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_232522_452840_D4182758 
X-CRM114-Status: GOOD (  12.89  )
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

On Fri, Feb 03, 2023 at 08:15:42AM +0100, Christoph Hellwig wrote:
> On Fri, Jan 13, 2023 at 08:12:44AM +0100, Greg Kroah-Hartman wrote:
> > Do you want all of these to go through a single tree, or can they go
> > through the different driver subsystem trees?
> 
> Looks like the big removal isn't going in for this merge winodw,
> so can you queue this patch up after all Greg?

Sure, I'll go apply it right now, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
