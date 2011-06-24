Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaCxG-0002Rb-PP
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 20:26:19 +0000
Received: by bwf12 with SMTP id 12so256748bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 13:26:14 -0700 (PDT)
Subject: Re: linux-next: Tree for June 24 (mtd + of)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
Date: Fri, 24 Jun 2011 23:26:06 +0300
In-Reply-To: <20110624090456.191f1fda.randy.dunlap@oracle.com>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
	<20110624090456.191f1fda.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308947172.13493.37.camel@koala>
Mime-Version: 1.0
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	LKML <linux-kernel@vger.kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
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

On Fri, 2011-06-24 at 09:04 -0700, Randy Dunlap wrote:
> On Fri, 24 Jun 2011 15:58:22 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110623:
> > 
> > My fixes tree includes:
> > 	(as an experiment) the early part of mmotm-2011-06-22-13-05
> > 	STAGING: Comedi: Build only on arches providing PAGE_KERNEL_NOCACHE
> 
> 
> When CONFIG_MTD=m, CONFIG_MTD_OF_PARTS=y:
> 
> drivers/mtd/ofpart.o: In function `init_module':
> ofpart.c:(.init.text+0x0): multiple definition of `init_module'
> drivers/mtd/mtdcore.o:(.init.text+0x43): first defined here

I guess this is some old issue? I do not think ofpart can be compiled-in
if the mtd core is a module...

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
