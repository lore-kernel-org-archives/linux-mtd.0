Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB14C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejMtokfaLKu9XjnC0FMwhDn5wiad4mIbmHDMie+4AnY=; b=TADFSWTb8zulXA
	St2rI3+BZmbhaaWF4tM66tes6NjULreGHKoj2nMzFs7sRDXrYuiJW3u3qYZYz5rd9UdzUtmyu6Doy
	xZFiObHF/ENoPbm00C3Ss+72uMuhA7JH546DEdWG6ohSuXOC3s4g6fh/mx0cIMbpL9oXX6X5XyUni
	O0D3CjRBwZaZH+vkNfdmHQHF6L35861L8Z7zql0p2JdLAxnNtoEYCs236hGqX9APzzC1uhYPfF7X8
	0fEn83FBIjD4otD/k3hjslDirlprJCBGFHsLxIp8Zk6K5FJ0nu7uCf1NRICRj5flkVnlJE8r4zIsY
	bXW1X5bs6VFfA7ZUvgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPji6-00FbtI-OY; Wed, 08 Feb 2023 12:38:02 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPji3-00Fbs3-RV
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 12:38:01 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pPjhm-002HdN-3f; Wed, 08 Feb 2023 13:37:42 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pPjhl-000IqT-Oa; Wed, 08 Feb 2023 13:37:42 +0100
Message-ID: <91be7f6b52d8ed74798e86270d59bc5cddefe130.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Christoph Hellwig <hch@lst.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Arnd Bergmann <arnd@arndb.de>,  Greg Kroah-Hartman
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
Date: Wed, 08 Feb 2023 13:37:40 +0100
In-Reply-To: <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
	 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
	 <20230116071306.GA15848@lst.de>
	 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
	 <20230203071423.GA24833@lst.de>
	 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
	 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
	 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
	 <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_043800_047480_AC41B04D 
X-CRM114-Status: UNSURE (   7.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Huacei!

On Wed, 2023-02-08 at 20:24 +0800, Huacai Chen wrote:
> Emm, maybe this patch has its chance to be merged now. :)
> 
> https://lore.kernel.org/linux-sh/CAAhV-H6siOtVkZpkS4aABejgZCqTwp3TihA0+0HGZ1+mU3XAVA@mail.gmail.com/T/#u

Yes, that's the plan. We're collecting the various patches people have sent
in for arch/sh, review and test them and apply them.

My test board is running the latest kernel now, so I can test new patches, too.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
