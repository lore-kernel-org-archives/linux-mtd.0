Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FiXlM-0002kz-Sm
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 10:21:40 -0400
Date: Tue, 23 May 2006 16:21:27 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
Message-ID: <20060523142127.GA10870@wohnheim.fh-wedel.de>
References: <20060502214507.C56443DC@arbetsmyra.dyndns.org>
	<20060510122626.GB31935@wohnheim.fh-wedel.de>
	<20060523094607.5B30C8B3@arbetsmyra.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060523094607.5B30C8B3@arbetsmyra.dyndns.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] for passing JFFS2 options at mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 May 2006 11:44:18 +0200, Ronny L Nilsson wrote:
> 
> > > -#ifdef CONFIG_JFFS2_PROC
> > >
> > >  #define JFFS2_STAT_BUF_SIZE 16000
> >
> > This makes sense, but should go in a seperate patch.
> >
> > > @@ -330,18 +326,37 @@ char *jffs2_get_compression_mode_name(vo
> >
> > #elif
> >
> 
> Jörn, I'm not sure I understand what you mean here but perhaps 
> something like in this patch? I've left pretty much of the previous  
> #ifdef CONFIG_JFFS2_PROC  intact now. Since there was no easy way for 
> the user to configure this option I made a change in the parent Kconfig 
> as well though, to let him choose whether runtime options shall be 
> built. Did I get you right?

Ronny, I'm not sure I understand what you mean here but perhaps...
...perhaps you didn't get me right.

What I said was that the removal of #ifdef CONFIG_JFFS2_PROC had
nothing to do with the rest of the patch.  Patches should do one thing
and do it well.  So all you should do is send two patches, one for the
#ifdef removal and the other for your mount option.

And dwmw2 is right, the mount option would make more sense as a
superblock element.

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
