Received: from mail-fx0-f48.google.com ([209.85.161.48])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PV68R-0006c3-Kj
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2010 17:36:28 +0000
Received: by fxm2 with SMTP id 2so4583770fxm.21
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Dec 2010 09:36:25 -0800 (PST)
Subject: Re: UBIFS not mounting on linux-omap 2.6.36
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <201012201118.01766.manningc2@actrix.gen.nz>
References: <201012201118.01766.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Dec 2010 19:36:22 +0200
Message-ID: <1292952982.13362.21.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-12-20 at 11:18 +1300, Charles Manning wrote:
> Hi All
> 
> I am trying to nail down an omap3 ubifs  performance regression, but cannot 
> get Steve Sakoman's 2.6.35 or 2.6.36 kernels
> http://www.sakoman.com/cgi-bin/gitweb.cgi?p=linux-omap-2.6.git
>  to mount ubifs although the same procedure works with older kernels and works 
> with the linux-omap 2.6.37 master.

Well, the only hint I can give is some kind of bisecting, but probably
you do not need such hint :-)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
