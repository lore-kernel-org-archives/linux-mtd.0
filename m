Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAodN-00045N-9O
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 08:58:33 -0400
Date: Thu, 1 Sep 2005 14:57:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
Message-ID: <20050901125707.GA1623@wohnheim.fh-wedel.de>
References: <20050901120030.GB694@wohnheim.fh-wedel.de>
	<1125578756.4884.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125578756.4884.10.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 September 2005 14:45:56 +0200, Øyvind Harboe wrote:
> On Thu, 2005-09-01 at 14:00 +0200, Jörn Engel wrote:
> 
> > > But who mounts a *tiny* JFFS2 volume except those that will be using it
> > > as a WORM drive?
> > 
> > People making mistakes.  It is a very important usability issue to
> > mark mistakes as such.  Making it appear as if everything is ok and
> > having it fail later, possibly days or weeks later, is bad usability.
> > 
> > I would agree with you if the user-perceived behaviour was
> > *immediatly* and *noticably* different.  But unless people write
> > enough data to fill their fs, the difference may go unnoticed.
> 
> Sounds good.
> 
> If I get some indication that there is a consensus from
> maintainers/committers to add this mount option, I'll go ahead and write
> it up.

You're asking for too much. :)

Most of the time, most people just don't care.  If they actually do
care and are opposed to your patch, they will speak up.  But you won't
ever find out before actively trying to merge the patch.

Jörn

-- 
...one more straw can't possibly matter...
-- Kirby Bakken
