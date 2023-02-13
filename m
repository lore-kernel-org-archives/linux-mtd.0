Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FDC636D4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Feb 2023 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJeArGDY1gEyiJZVQ8Y2t1ZSQp8u8S4A+y7gT/H7Zec=; b=KmqK0V2fJAygqE
	x6v/ElGyxoz7J+c90a4uIxYFnzAPejXkC3H/X2ar1/WsDdol4paErREhobSsZ0UAeunDumBxh5vYU
	cGbGs+fr3d3/v1PCwV+WrAUh2g3OPltvvUBe+2F8KrPW4Zrw/3p2LAEprV0F+y9DMAV5pUjehWR3q
	S76aw6C2sy1D/bf15HNlVTbnGkSuEhYLCX/pWjr0wRXLWkbxYg0KlxLY+Kdv67vM3hRlAf51JjUlN
	LiAMjSPsERspS9LeUKP8wI2PFAAwY9Iu4eV0TavFdeJKQ2k7ylf8sLteHFlJgSPF2yUWZRiPe7+Bq
	47bXyJoncfuUpGBfGKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRbjh-00FTyi-Bd; Mon, 13 Feb 2023 16:31:25 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRbje-00FTo4-Mh
	for linux-mtd@lists.infradead.org; Mon, 13 Feb 2023 16:31:24 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pRbiw-0043kT-S2; Mon, 13 Feb 2023 17:30:38 +0100
Received: from p5b13aa49.dip0.t-ipconnect.de ([91.19.170.73] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pRbiw-0046cc-HY; Mon, 13 Feb 2023 17:30:38 +0100
Message-ID: <dbda1f6e1c280c13d963ad6e7f68a853a7741199.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>,  Rich Felker <dalias@libc.org>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
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
Date: Mon, 13 Feb 2023 17:30:36 +0100
In-Reply-To: <20230206100856.603a0f8f@canb.auug.org.au>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
	 <20230203083037.GA30738@lst.de> <20230206100856.603a0f8f@canb.auug.org.au>
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.73
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_083122_913903_19E5A057 
X-CRM114-Status: GOOD (  25.97  )
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

Hi Steve!

On Mon, 2023-02-06 at 10:08 +1100, Stephen Rothwell wrote:
> Hi,
> 
> On Fri, 3 Feb 2023 09:30:37 +0100 Christoph Hellwig <hch@lst.de> wrote:
> > 
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> > > Since this is my very first time stepping up as a kernel maintainer, I was hoping
> > > to get some pointers on what to do to make this happen.
> > > 
> > > So far, we have set up a new kernel tree and I have set up a local development and
> > > test environment for SH kernels using my SH7785LCR board as the target platform.
> > > 
> > > Do I just need to send a patch asking to change the corresponding entry in the
> > > MAINTAINERS file?  
> > 
> > I'm not sure a there is a document, but:
> > 
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
> 
> And by "Stephen", Christoph means me.  When you are ready, please send
> me a request to include your tree/branch in linux-next (usually the
> branch is called something like "for-next" or just "next") telling me
> the git URL, and the contacts I should send email to if there are
> conflicts/build issues with the branch.  I will then fetch the branch
> every time I create a new linux-next release (most work days), so all
> you need to do is update that branch each time you are ready to publish
> more commits.

I'm in the MAINTAINERS now in Linus' tree. I have requested a kernel.org
account now and will hopefully have my trees set up later this week.

I'll let you know about the URLs as soon as possible.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
