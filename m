From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Sun, 30 Mar 2003 23:22:50 +0200
Subject: jffs2 / eCos
In-Reply-To: <1049057380.1180.36.camel@pc-002>
References: <1049057380.1180.36.camel@pc-002>
Message-ID: <20030330212250.GC12927@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 30 March 2003 22:49:40 +0200, Bob Koninckx wrote:
> 
> I successfully included jffs2 in my powerpc based system. The fileio1
> test runs sucessfully. I am now trying to flash an initial version of
> the filesystem to be used by my application.
> 
> The block size of my flash is 128kBytes. I made the filesystem image
> with the following command
> 
> mkfs.jffs2 -v --big-endian -e 0x20000 -r ./jffs2root -o jffs2root.img -p
> 
> First I tried mkfs.jffs2 version 1.32. Mounting the filesystem did not
> even succeed in this case. Apparently some magic number that needed to
> be 1985 was read as 8519. Some endianness problem I suppose.

You forgot -b (big endian), it seems.

> After upgrading to version 1.35, the filesystem can be mounted. Files
> and directories appear to be present (the same fileio1 test still runs
> sucessfull and lists what should be present). Opening a file on this
> system seems to succeed (fopen returns a FILE * anyway). However, when I
> try to _read_ from the file, I get EIO errors.

This is strange. You still forgot -b but can mount it?

J?rn

-- 
More computing sins are committed in the name of efficiency (without
necessarily achieving it) than for any other single reason - including
blind stupidity.
-- W. A. Wulf 
