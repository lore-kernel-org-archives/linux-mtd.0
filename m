Received: from mailbox-us-s-12.mailhostingserver.com ([75.125.101.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR0Zm-0005rW-Jq
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 09:15:04 +0000
Date: Wed, 15 Jul 2009 11:15:00 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] mtdblock: introduce mtdblks_lock
Message-ID: <20090715091500.GI18774@darwin>
References: <20090714200429.GD18774@darwin>
	<1247643714.11353.11.camel@localhost.localdomain>
	<20090715083603.GH18774@darwin>
	<1247647162.11353.12.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1247647162.11353.12.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

El Wed, Jul 15, 2009 at 11:39:22AM +0300 Artem Bityutskiy ha dit:

> On Wed, 2009-07-15 at 10:36 +0200, Matthias Kaehlcke wrote:
> > El Wed, Jul 15, 2009 at 10:41:54AM +0300 Artem Bityutskiy ha dit:
> > 
> > > On Tue, 2009-07-14 at 22:04 +0200, Matthias Kaehlcke wrote:
> > > > +static struct mutex mtdblks_lock;
> > > > +
> > > >  /*
> > > >   * Cache stuff...
> > > >   *
> > > > @@ -270,6 +272,8 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
> > > >  
> > > >  	DEBUG(MTD_DEBUG_LEVEL1,"mtdblock_open\n");
> > > >  
> > > > +	mutex_lock(&mtdblks_lock);
> > > > +
> > > >  	if (mtdblks[dev]) {
> > > >  		mtdblks[dev]->count++;
> > > >  		return 0;
> > > 
> > > Now about unlocking the mutex here?
> > 
> > i missed this one ...
> > 
> > thanks for your review. i'm going fix that and send out an updated
> > version of the patch
> 
> Err, I've already amended your patch and put it to my l2-mtd-2.6.git:
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git?a=commit;h=2a4d4fdb6393fdcbfea546b2474baf41d434302a

ok, thx! 

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

             If liberty means anything at all, it means the
           right to tell people what they do not want to hear
                            (George Orwell)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
