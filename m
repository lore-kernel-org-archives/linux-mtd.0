Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzBU7-0001Qs-Ed
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 16:50:59 +0000
Received: by bwz19 with SMTP id 19so2859704bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 09:50:54 -0700 (PDT)
Subject: Re: ubifs : corruption after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C9CC455.3000404@parrot.com>
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>
	<4C3C2740.2040105@parrot.com> <4C3C30D1.9030005@parrot.com>
	<1279031064.31639.90.camel@localhost> <4C3C81E3.3030407@parrot.com>
	<4C4FDEF5.2040405@parrot.com> <1282463086.16502.38.camel@brekeke>
	<4C9CC455.3000404@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 19:50:47 +0300
Message-ID: <1285347047.13050.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-09-24 at 17:31 +0200, Matthieu CASTET wrote:
> Artem Bityutskiy a écrit :
> > On Wed, 2010-07-28 at 09:40 +0200, Matthieu CASTET wrote:
> >> I manage to reproduce it with the backtrace [1].
> > 
> > Matthieu, your work-around patch or something very close should
> > certainly be applied to the UBIFS tree, but I still would like to find
> > out what exactly happened in your setup.
> > 
> > I see 2 possibilities:
> > 
> > 1. An error happened and 'ubifs_garbage_collect()' returned while
> > c->gc_lnum was -1. But in this case we should have switched to R/O mode,
> > and the master node would not be written. But may be for some reasons we
> > did not switch to R/O mode, dunno.
> > 
> > 2. More likely scenario: in 'ubifs_rcvry_gc_commit()' we call
> > 'ubifs_garbage_collect_leb()' directly, which can return while
> > c->gc_lnum is -1. And we do not handle this.
> > 
> > Would you please be patient enough to reproduce the issue once again with
> > the following patch, which was created against the latest ubifs-2.6.git, but
> > you should be easily able to apply it to your tree.
> None of these check happen.
> 
> only the dump in ubifs_write_master.

Hmm.... This is weird... I think I need your UBIFS. Is it possible to
share? You can take vanilla 2.6.27 and put all UBIFS stuff there. Or
send patches against ubifs-v2.6.27.git

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
