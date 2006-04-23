Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FXTKz-0008Ev-LH
	for linux-mtd@lists.infradead.org; Sat, 22 Apr 2006 21:24:41 -0400
Date: Sun, 23 Apr 2006 03:24:29 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Message-ID: <20060423012429.GA10258@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
	<625fc13d0604221709h6ce815e2y1d502fcfdbf7927c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0604221709h6ce815e2y1d502fcfdbf7927c@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 22 April 2006 19:09:55 -0500, Josh Boyer wrote:
> On 4/22/06, Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> > Next version with the FIXMEs filled in.  If anyone has comments, spots
> > errors, etc., please tell me.
> >
> > 1. Clone Linus' tree
> >
> >   $ git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git mtd
> >
> > 2. Change into soon-to-be mtd tree
> >
> >   $ cd mtd
> >
> > 3. Setup mtd remotes file
> >
> >   $ vi .git/remotes/mtd
> >   URL: git://git.infradead.org/mtd-2.6
> >   Pull: master:mtd
> >
> > 4. Fetch mtd tree
> >
> >   $ git fetch mtd
> >
> 
> Huh?
> 
> These look odd to me.  Here are the steps I use (note git 1.3.0 is required)
> 
> 1. git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> linux-git
> 
> This clones the latest of Linus' tree.
> 
> 2. git clone --reference linux-git git://git.infradead.org/mtd-2.6.git mtd
> 
> This clones the MTD tree, however it uses the previous tree created as
> a reference to pull objects from so you don't have two copies of the
> exact some git objects lying around.
> 
> The reason I do this is two fold.  One is that I want to have the
> latest 2.6 tree available to me anyway.  If you don't want/need that,
> then just clone the mtd-2.6 tree outright.  The second reason is that
> I don't have to do wonky things like 'git fetch mtd'.  A fetch doesn't
> merge the changes into the tree.  It just gets the objects.
> 
> By using --reference, you get the benefit of sharing the bulk of the
> git objects and the simplicity of being able to just do 'git pull' in
> both trees to update them.  You also avoid having to locally merge in
> the mtd-2.6 changes, which is something David would really like to
> avoid.  That way he can pull directly from your tree and doesn't get
> extraneous merges.  Which also makes it easier for him to have Linus
> pull from _his_ tree, because Linus hates extraneous merges.

Well, we have two sets of weird and arcane command that basically do
the same.  Minor differences are:

Joern					Josh
o works well with "cp -lr"
  -linus and -mtd trees can share	-
  source files as well as git objects
o requires extra branch			+
o sequence of commands is longer	+
o works with older git versions		-

Everything else should be shared.  So people get to decide which of
the pros and cons are more important.  I happen to care a lot about
older git versions (until debian unstable has 1.3.0) and even more
about "cp -lr".  YMMV

So I guess we should have both versions in the howto.

> The rest of your steps seem fine.

Excellent.

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
