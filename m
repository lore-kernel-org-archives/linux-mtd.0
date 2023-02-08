Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A25C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EY/YfXkFn3WLgQpJ0YL9gTRyoqA6eb8mbQnAmgkIkIw=; b=nSoRFMvEHHBK46
	GL+UZNdti2NarUXlA3Zfm5eyIGXU0vt47Sftdl/wwayRfnh7uDZDmsxEm+EphCc2GLPmB7uN434Su
	2T5Glun55cvrOsmdsE2gWkHJVX3j+UjTpoKmgQ6D6cqhL1vIoF3EB3PN9GNGUDMdawKI/6t+QENdg
	K0B3nsY8cqOrBKyIqWA+StdDpuFiR7w39A0pcpFLdvYnbDyc9GZEcknPDvOArdqjJFPXodUBu7YR8
	EsB7zvLI0TuPIfDgTc3mDfVGiCEICVBKudkN7MxSX+o/eeoxAjXBy3KxLpsR++Ly2K+4l01SadwPv
	A1B5KImkX48cVfAGw7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjVb-00FaAh-2C; Wed, 08 Feb 2023 12:25:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjVX-00Fa9V-Sr
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 12:25:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0F95B81DA5
	for <linux-mtd@lists.infradead.org>; Wed,  8 Feb 2023 12:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271E5C433A4
	for <linux-mtd@lists.infradead.org>; Wed,  8 Feb 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675859100;
	bh=RUfI31Jp44rV1IeXbD4t0AsPLNTznicHOFs5hGw+KFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bMMO1+Azhs4Km63qgW7MyIf+xqhtlvG35nq7SJSy2pRcyN1Otm0Ye2NpZm65hUFqw
	 g2UXYyZAG7y/GFHBum+Tqvnc08IW/1rKLeK2jUsXxW7365sg7nfY60Nm/b5ecUvZQ+
	 jq+lxc+dnzzsBOH4xyeBMTDmL0feOmwqVdR28/LMrsSb4zQ7MmlEy1CKADHvAJGQ10
	 xpco4MhgWctFyqW7SPENgukrqaHiImxPZNFmW4rTruJqX80YiWBcJ9RCfx9cgGGxxL
	 w+OZLjdQi4usnRrjDZg5ctNF6esi6dZRhb/3dLkvxKIhjpj2Rv5UGltstIpXEGZNZq
	 KJq9yQDIINrkw==
Received: by mail-ed1-f51.google.com with SMTP id eq11so20180248edb.6
        for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2023 04:24:59 -0800 (PST)
X-Gm-Message-State: AO0yUKVpE5nZCx+gRAIuS/plmc5qIZ5+LMdgZAg6TaLLpCkz8sipAiF8
	PMxnz2ida7qTo0tqDN1QD4RgQRW80YH2phqKp0M=
X-Google-Smtp-Source: AK7set/Q+/uOAbYZFM/jkIz+fISRabx3Hr+/BidGERpWGk7aoFNjh3zSLNUNVVzX/I6kZ5ZONaxFoF5vNNtc7g05RbQ=
X-Received: by 2002:a50:ce0c:0:b0:4aa:a4f7:2304 with SMTP id
 y12-20020a50ce0c000000b004aaa4f72304mr1816736edi.38.1675859098335; Wed, 08
 Feb 2023 04:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de> <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de> <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org> <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
In-Reply-To: <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Feb 2023 20:24:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
Message-ID: <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@lst.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_042504_236538_CDE594E3 
X-CRM114-Status: GOOD (  27.20  )
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

Emm, maybe this patch has its chance to be merged now. :)

https://lore.kernel.org/linux-sh/CAAhV-H6siOtVkZpkS4aABejgZCqTwp3TihA0+0HGZ1+mU3XAVA@mail.gmail.com/T/#u

Huacai

On Wed, Feb 8, 2023 at 8:14 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Randy!
>
> On Tue, 2023-02-07 at 17:31 -0800, Randy Dunlap wrote:
> >
> > On 2/7/23 01:06, John Paul Adrian Glaubitz wrote:
> > > Hello Christoph!
> > >
> > > On Fri, 2023-02-03 at 08:14 +0100, Christoph Hellwig wrote:
> > > > On Mon, Jan 16, 2023 at 09:52:10AM +0100, John Paul Adrian Glaubitz wrote:
> > > > > We have had a discussion between multiple people invested in the SuperH port and
> > > > > I have decided to volunteer as a co-maintainer of the port to support Rich Felker
> > > > > when he isn't available.
> > > >
> > > > So, this still isn't reflected in MAINTAINERS in linux-next.  When
> > > > do you plan to take over?  What platforms will remain supported and
> > > > what can we start dropping due to being unused and unmaintained?
> > >
> > > I'm getting everything ready now with Geert's help and I have a probably dumb
> > > question regarding the MAINTAINERS file change: Shall I just add myself as an
> > > additional maintainer first or shall I also drop Yoshinori Sato?
> > >
> > > Also, is it desirable to add a "T:" entry for the kernel tree?
> >
> > Yes, definitely.
>
> Geert has suggested to wait with adding a tree source to the entry until I get my
> own kernel.org account. I have enough GPG signatures from multiple kernel developers
> on my GPG key, so I think it shouldn't be too difficult to qualify for an account.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
