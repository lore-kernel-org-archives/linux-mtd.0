Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C49C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZ+epTyOBnjFVhTyKgbX8Z0vLbc33FhlVKqIOSa8/1E=; b=jLIxoJEYbrAt6x
	r0xk3bqIcQ15dIE4UaoUOHs/RhRkzmPplfhOwB7buenaQnuIlCQGBbqLhIt+DbFc27Nr+lsBNNBuP
	pL/FOEa3zP1/N5q80t0l+vKJkIpOEmc0+0f93FIHHTS0JhqJf8/Yqem5/WOlw22RfgxGOb29UlqD7
	0MBdWUG/Ndj7iOlotK5q/QKfeB/DV3UjRG+ZpB19Pso1WH5aLP9FKz4Rq188b7qgOrHnkwppsjjGH
	Bd8icDdAri0rCDa4nf66+m0Is/AG4EFKnufOwBmCAx2yUWq6ZfQdsHMwoEAeoWoaeLuJ9hAqCsap2
	7QLtTzYpSo/thxaZdYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrNv-0010wo-0S; Fri, 03 Feb 2023 08:25:27 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrNs-0010sN-G3
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 08:25:25 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pNrNI-003Nx4-Ij; Fri, 03 Feb 2023 09:24:48 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pNrNI-0042Ei-Ac; Fri, 03 Feb 2023 09:24:48 +0100
Message-ID: <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>,  Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org,  linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org,  linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org,  linux-sh@vger.kernel.org
Date: Fri, 03 Feb 2023 09:24:46 +0100
In-Reply-To: <20230203071423.GA24833@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_002524_708643_CF686C57 
X-CRM114-Status: GOOD (  15.44  )
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

Hello Christoph!

On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
> On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
> > We have had a discussion between multiple people invested in the SuperH port and
> > I have decided to volunteer as a co-maintainer of the port to support Rich Felker
> > when he isn't available.
> 
> So, this still isn't reflected in MAINTAINERS in linux-next.  When
> do you plan to take over?

Since this is my very first time stepping up as a kernel maintainer, I was hoping
to get some pointers on what to do to make this happen.

So far, we have set up a new kernel tree and I have set up a local development and
test environment for SH kernels using my SH7785LCR board as the target platform.

Do I just need to send a patch asking to change the corresponding entry in the
MAINTAINERS file?

> What platforms will remain supported and what can we start dropping due to
> being unused and unmaintained?

This has not been sorted out yet.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
