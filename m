Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QabDU-0003K5-Fh
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 22:20:41 +0000
Date: Sat, 25 Jun 2011 15:20:09 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: dedekind1@gmail.com
Subject: Re: linux-next: Tree for June 24 (mtd + of)
Message-Id: <20110625152009.f264be78.randy.dunlap@oracle.com>
In-Reply-To: <1308983721.23868.2.camel@koala>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
	<20110624090456.191f1fda.randy.dunlap@oracle.com>
	<1308947172.13493.37.camel@koala> <4E04F5D0.9090900@oracle.com>
	<1308983721.23868.2.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vitaly Wool <vwool@ru.mvista.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 25 Jun 2011 09:35:13 +0300 Artem Bityutskiy wrote:

> On Fri, 2011-06-24 at 13:38 -0700, Randy Dunlap wrote:
> > On 06/24/11 13:26, Artem Bityutskiy wrote:
> > > On Fri, 2011-06-24 at 09:04 -0700, Randy Dunlap wrote:
> > >> On Fri, 24 Jun 2011 15:58:22 +1000 Stephen Rothwell wrote:
> > >>
> > >>> Hi all,
> > >>>
> > >>> Changes since 20110623:
> > >>>
> > >>> My fixes tree includes:
> > >>> 	(as an experiment) the early part of mmotm-2011-06-22-13-05
> > >>> 	STAGING: Comedi: Build only on arches providing PAGE_KERNEL_NOCACHE
> > >>
> > >>
> > >> When CONFIG_MTD=m, CONFIG_MTD_OF_PARTS=y:
> > >>
> > >> drivers/mtd/ofpart.o: In function `init_module':
> > >> ofpart.c:(.init.text+0x0): multiple definition of `init_module'
> > >> drivers/mtd/mtdcore.o:(.init.text+0x43): first defined here
> > > 
> > > I guess this is some old issue? I do not think ofpart can be compiled-in
> > > if the mtd core is a module...
> > 
> > [adding driver author, Vitaly]
> > 
> > No, it's a current issue.
> 
> I meant that the subject suggests this is about linux-next, but this
> problem should be in upstream.

Sorry I misunderstood your comment.

3.0-rc4 does not have this build error when I use the .config file with it...
however, I think that 3.0-rc4 also does not build ofpart.ko as it should.

Looks to me like changes in drivers/mtd/{Kconfig && Makefile} caused this
build error.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
