Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DMJUY-0000e5-Q7
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2005 01:35:47 -0400
Date: Fri, 15 Apr 2005 07:35:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20050415053544.GB32689@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0504111600540.28647@localhost.localdomain>
	<1113251997.7500.5.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0504111645360.28836@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0504111645360.28836@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: why can i select both PHYSMAP and MULTI_PHYSMAP?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 11 April 2005 16:48:07 -0400, Robert P. J. Day wrote:
> On Mon, 11 Apr 2005, Josh Boyer wrote:
> >
> > Joern (the author) is on vacation so I'll try to answer for him.

Well, they do have internet cafes in Sydney. ;)

> > If mphysmap proves to be useful and stable (it is fairly new), then
> > maybe it can eventually replace physmap.  Until then, I suppose it's
> > safest to leave both there.

Yup.

> the one thing i don't see (perhaps i'm overlooking it) is the ability
> to concatenate chips in menuconfig.  perhaps that's getting overly
> ambitious, but maybe it's not such a big step to throw in an option
> for "Concatenate all chips in their numerical order?".

If someone actually needs it, such a change wouldn't be hard to do.
Right now, mphysmap needs real users (aka a test base).  Once I
receive some success reports, things can get merged to Linus and
further functionality could be added.

Writing software you don't personally need or use is a strange
business indeed.

Jörn

-- 
A quarrel is quickly settled when deserted by one party; there is
no battle unless there be two.
-- Seneca
