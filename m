From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 31 Mar 2003 08:50:47 +0200
Subject: jffs2 / eCos
In-Reply-To: <1049091997.972.1.camel@pc-002>
References: <1049057380.1180.36.camel@pc-002> <20030330212250.GC12927@wohnheim.fh-wedel.de> <1049091997.972.1.camel@pc-002>
Message-ID: <20030331065047.GA17210@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 31 March 2003 08:26:37 +0200, Bob Koninckx wrote:
> On Sun, 2003-03-30 at 23:22, J?rn Engel wrote:
> > On Sun, 30 March 2003 22:49:40 +0200, Bob Koninckx wrote:
> > > 
> > > I successfully included jffs2 in my powerpc based system. The fileio1
> > > test runs sucessfully. I am now trying to flash an initial version of
> > > the filesystem to be used by my application.
> > > 
> > > The block size of my flash is 128kBytes. I made the filesystem image
> > > with the following command
> > > 
> > > mkfs.jffs2 -v --big-endian -e 0x20000 -r ./jffs2root -o jffs2root.img -p
> > > 
> > > First I tried mkfs.jffs2 version 1.32. Mounting the filesystem did not
> > > even succeed in this case. Apparently some magic number that needed to
> > > be 1985 was read as 8519. Some endianness problem I suppose.
> > 
> > You forgot -b (big endian), it seems.
> 
> 
> I _did_ specify --big-endian. That has the same effect doesn't it ?

It should. But then again, I'd have to check the code to see that it's
smarter than me. :)

> > > After upgrading to version 1.35, the filesystem can be mounted. Files
> > > and directories appear to be present (the same fileio1 test still runs
> > > sucessfull and lists what should be present). Opening a file on this
> > > system seems to succeed (fopen returns a FILE * anyway). However, when I
> > > try to _read_ from the file, I get EIO errors.
> > 
> > This is strange. You still forgot -b but can mount it?

Even stranger now. Jffs2 on powerpc work just fine for me (unter
linux), mkfs.jffs2 on i386 host included.

J?rn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
