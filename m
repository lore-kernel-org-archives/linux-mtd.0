Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bv9mW-0004dz-UG
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2004 03:13:50 -0400
To: Josh Boyer <jdub@us.ibm.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
	<1089735455.29112.14.camel@weaponx.rchland.ibm.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 12 Aug 2004 01:13:46 -0600
In-Reply-To: <1089735455.29112.14.camel@weaponx.rchland.ibm.com>
Message-ID: <m31xic6d79.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer <jdub@us.ibm.com> writes:

> On Tue, 2004-07-13 at 10:25, Eric W. Biederman wrote:
> > Ok recording what the reason for this that I got on irc.
> > 
> > cfi_cmdset_0020 is just a variant on cfi_cmdset_0001 that shares most of
> > the code.
> 
> Thinking about this more, I wouldn't worry too much about
> cfi_cmdset_0020.c.  It's old, fairly unmaintained, and only has a single
> user as far as I know.
> 
> If your changes break it, then it'll give someone and excuse to update
> the code.  Eventually it should be merged with cfi_cmdset_0001.c anyway,
> since M58LW128A reports command set 01, but really needs the
> functionality of command set 20.  The exception list you talked about in
> IRC might help with that.
> 
> But don't let me stop you from making it work if you want to :).

So far I have been busy with other things so I have been taking the slow route
to refactoring.  I have just reported the cfi_fixup function from cfi_util
and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
under control.  

It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
merged.

For the deeper pieces of command set common code moving their helper functions
into cfi_util is probably a good place to start.

I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

Eric
