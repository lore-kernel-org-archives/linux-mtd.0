Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PannU-0005xf-Ne
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 11:14:35 +0000
Received: by bwz5 with SMTP id 5so16513363bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Jan 2011 03:14:07 -0800 (PST)
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110106121316.1b98c132@wker>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
	<AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
	<1292942724.2286.57.camel@localhost>
	<AANLkTikmbbECMLNZ-3d=Z32RcFvsiv=eDyAwJ2=n1sHi@mail.gmail.com>
	<AANLkTinWtEmu9nwcww4JKang+cNoHsrETT_Mojz7FF0L@mail.gmail.com>
	<1294216041.2179.4.camel@koala>  <20110106121316.1b98c132@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 Jan 2011 13:14:04 +0200
Message-ID: <1294312444.2219.2.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Guillaume LECERF <glecerf@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-01-06 at 12:13 +0100, Anatolij Gustschin wrote:
> Hi,
> 
> On Wed, 05 Jan 2011 10:27:21 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Thu, 2010-12-30 at 12:49 +0100, Guillaume LECERF wrote:
> > > 2010/12/30 Guillaume LECERF <glecerf@gmail.com>:
> > > > Anatolij, what about such patches ?
> > > > Note : this is totally untested ;)
> > > 
> > > Please disregard 08-patch.patch, I think it does not even compile :(
> > 
> > Anatolij is not answering, probably he is just very busy or having
> > holidays or something. I think it is better to wait a little with these
> > patches and let Anatolij look at this. So I'm removing them from my l2
> > tree so far and save them in the 'anatolij' branch of the l2 tree.
> 
> Sorry for not answering quickly, I was very busy and then was very
> ill. The two patches from Guillaume are wrong. Please apply my patches
> again.

Yes, done, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
