Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B94C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7o+dm3k7RK8rcrchoiw1n1CWX/ciVTcJ34xA98Am6E=; b=H62n/mdDy7Oe09
	/GEv0wPkSyTxUjIONFp/m8Wri8McZHXZITUD/4Ci7kezn3txoGnA0Do9WdVzTuPmumsQgRDMOWcUm
	Ggp6PJQ1wT6yL2N1/mOYnPctE6ZdeRbhmImimBu7CTWJjQrv7tj7S429FYgjObttvtbCEQezowYYI
	IeZJrjHUjPdinjw6fro0XsyHQLLKyHW0nq+TOAAuwki+j/WmZEG7oYJwRnoYL2VIf1MeW81ERZ2HE
	XXVw0lldyd8wvj3Sk7j4KNxTdMhkbSUMLAHO/xLq7Fo0bUjp3AUcDWdaBmu4Lqj3/hRrB6oJvYqUi
	UjHhAHPmfrNUKOTXGLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrTA-0011py-DM; Fri, 03 Feb 2023 08:30:52 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrT7-0011oB-Hz
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 08:30:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 494A367373; Fri,  3 Feb 2023 09:30:38 +0100 (CET)
Date: Fri, 3 Feb 2023 09:30:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20230203083037.GA30738@lst.de>
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de> <20230116071306.GA15848@lst.de> <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de> <20230203071423.GA24833@lst.de> <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_003049_756569_E8296420 
X-CRM114-Status: GOOD (  20.23  )
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

On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> Since this is my very first time stepping up as a kernel maintainer, I was hoping
> to get some pointers on what to do to make this happen.
> 
> So far, we have set up a new kernel tree and I have set up a local development and
> test environment for SH kernels using my SH7785LCR board as the target platform.
> 
> Do I just need to send a patch asking to change the corresponding entry in the
> MAINTAINERS file?

I'm not sure a there is a document, but:

 - add the MAINTAINERS change to your tree
 - ask Stephen to get your tree included in linux-next

then eventually send a pull request to Linus with all of that.  Make
sure it's been in linux-next for a while.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
