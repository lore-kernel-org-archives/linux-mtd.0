Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CZURm-0007BZ-Ep
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2004 08:23:08 -0500
Date: Wed, 1 Dec 2004 14:22:40 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Rainer Weikusat <rainer.weikusat@sncag.com>
Message-ID: <20041201132240.GA9138@wohnheim.fh-wedel.de>
References: <200411291024906.SM01112@ACarlisle>
	<1101742712.23997.2.camel@weaponx.rchland.ibm.com>
	<87hdn8fwk4.fsf@farside.sncag.com>
	<1101749178.23997.22.camel@weaponx.rchland.ibm.com>
	<87is7oaxx8.fsf@farside.sncag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87is7oaxx8.fsf@farside.sncag.com>
Cc: Andrew Carlisle <ACarlisle@acmepacket.com>, linux-mtd@lists.infradead.org,
	Rainer Weikusat <rweikusat@sncag.com>
Subject: Re: Multiple banks of flash?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 November 2004 03:11:15 +0100, Rainer Weikusat wrote:
> Josh Boyer <jdub@us.ibm.com> writes:
> >> > Joern Engel wrote a mphysmap driver some time ago.  It works fairly
> >> > well.  You might be able to find it if you google for it.  Not sure why
> >> > it wasn't included in MTD CVS.
> >> 
> >> Various people have written something like this at different times
> >> :->.
> >
> > Indeed.  Joern's just happened to be the one I am most familiar with. 
> > But since lots of different implementations have been written, it makes
> > one wonder why none are in CVS...
> 
> Open Source Mantra: 'Not my problem'.

And embedded seems to be extremely devoted to that mantra.  It was
quite a learning experience (buzzword of the year) to figure that one
out.  Writing code is just 1% of the work.  Debugging it is 9%.
Getting it into some standard (Linux kernel, libc, whatever) is 90%.

And with the 'Not my problem.' mentality, the whole 90% are left to
the original author, who finally gives up and moves on to something
less frustrating.  Or at least gets a job and has someone pay for it.

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin
