From: bob.koninckx@mech.kuleuven.ac.be (Bob Koninckx)
Date: 31 Mar 2003 08:26:37 +0200
Subject: jffs2 / eCos
In-Reply-To: <20030330212250.GC12927@wohnheim.fh-wedel.de>
References: <1049057380.1180.36.camel@pc-002>
 <20030330212250.GC12927@wohnheim.fh-wedel.de>
Message-ID: <1049091997.972.1.camel@pc-002>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-03-30 at 23:22, J?rn Engel wrote:
> On Sun, 30 March 2003 22:49:40 +0200, Bob Koninckx wrote:
> > 
> > I successfully included jffs2 in my powerpc based system. The fileio1
> > test runs sucessfully. I am now trying to flash an initial version of
> > the filesystem to be used by my application.
> > 
> > The block size of my flash is 128kBytes. I made the filesystem image
> > with the following command
> > 
> > mkfs.jffs2 -v --big-endian -e 0x20000 -r ./jffs2root -o jffs2root.img -p
> > 
> > First I tried mkfs.jffs2 version 1.32. Mounting the filesystem did not
> > even succeed in this case. Apparently some magic number that needed to
> > be 1985 was read as 8519. Some endianness problem I suppose.
> 
> You forgot -b (big endian), it seems.


I _did_ specify --big-endian. That has the same effect doesn't it ?


> 
> > After upgrading to version 1.35, the filesystem can be mounted. Files
> > and directories appear to be present (the same fileio1 test still runs
> > sucessfull and lists what should be present). Opening a file on this
> > system seems to succeed (fopen returns a FILE * anyway). However, when I
> > try to _read_ from the file, I get EIO errors.
> 
> This is strange. You still forgot -b but can mount it?
> 
> J?rn
-- 
----------------------------------------------------------------------
ir. Bob Koninckx
Katholieke Universiteit Leuven
Division Production Engineering,                   tel.  +32 16 322535
Machine Design and Automation                      fax.  +32 16 322987
Celestijnenlaan 300B                  bob.koninckx at mech.kuleuven.ac.be
B-3001 Leuven Belgium               http://www.mech.kuleuven.ac.be/pma
----------------------------------------------------------------------
