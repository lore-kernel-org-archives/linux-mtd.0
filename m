From: bob.koninckx@mech.kuleuven.ac.be (Bob Koninckx)
Date: 30 Mar 2003 22:49:40 +0200
Subject: jffs2 / eCos
Message-ID: <1049057380.1180.36.camel@pc-002>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi all

I successfully included jffs2 in my powerpc based system. The fileio1
test runs sucessfully. I am now trying to flash an initial version of
the filesystem to be used by my application.

The block size of my flash is 128kBytes. I made the filesystem image
with the following command

mkfs.jffs2 -v --big-endian -e 0x20000 -r ./jffs2root -o jffs2root.img -p

First I tried mkfs.jffs2 version 1.32. Mounting the filesystem did not
even succeed in this case. Apparently some magic number that needed to
be 1985 was read as 8519. Some endianness problem I suppose.

After upgrading to version 1.35, the filesystem can be mounted. Files
and directories appear to be present (the same fileio1 test still runs
sucessfull and lists what should be present). Opening a file on this
system seems to succeed (fopen returns a FILE * anyway). However, when I
try to _read_ from the file, I get EIO errors.

Has anybody successfully used mkfs.jffs2 for making a filesystem image
for a powerpc target system running eCos ? Am I doing something obvious
wrong ?

Thanks, Bob

PS1. I am not subscribed to the jffs2 mailing list, please reply to my
personal address
PS2. The host system I am using is a PIII running RH linux 8.0

-- 
----------------------------------------------------------------------
ir. Bob Koninckx
Katholieke Universiteit Leuven
Division Production Engineering,                   tel.  +32 16 322535
Machine Design and Automation                      fax.  +32 16 322987
Celestijnenlaan 300B                  bob.koninckx at mech.kuleuven.ac.be
B-3001 Leuven Belgium               http://www.mech.kuleuven.ac.be/pma
----------------------------------------------------------------------
