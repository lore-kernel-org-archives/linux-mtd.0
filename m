Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FFA30-0001Nz-Ke
	for linux-mtd@lists.infradead.org; Fri, 03 Mar 2006 08:10:27 -0500
Date: Fri, 3 Mar 2006 14:10:07 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060303131007.GD13523@wohnheim.fh-wedel.de>
References: <20060302135400.GB12074@wohnheim.fh-wedel.de>
	<20060302171539.GA30402@xi.wantstofly.org>
	<20060302173202.GA28045@wohnheim.fh-wedel.de>
	<20060302181928.GA30632@xi.wantstofly.org>
	<1141368821.3920.3.camel@sauron.oktetlabs.ru>
	<20060303104955.GA13523@wohnheim.fh-wedel.de>
	<625fc13d0603030456m73ef0b5ew205bdb2070e57c8f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0603030456m73ef0b5ew205bdb2070e57c8f@mail.gmail.com>
Cc: Jesse Off <joff@embeddedarm.com>, linux-mtd@lists.infradead.org,
	Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH,RFC] ts72xx NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 March 2006 06:56:39 -0600, Josh Boyer wrote:
> On 3/3/06, Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> > On Fri, 3 March 2006 09:53:41 +0300, Artem B. Bityutskiy wrote:
> > >
> > > > +   /* Return happy */
> > > > +   return 0;
> > > This is very informative comment :-)
> >
> > And it should definitely be changed to "happily". ;)
> 
> It doesn't have to be.  "happily" would be modifying the action, in
> this case returning.  That is the equivalent of saying "I'll happily
> return to you".  "Return happy" would be the equivalent of saying "I
> return to you in a good mood".
> 
> Doesn't english suck?

In this particular case: no.  Such subtleties are the basis of any
good poetry.

They also tend to be the basis of any well-obfuscated code, though.

Jörn

-- 
/* Keep these two variables together */
int bar;
