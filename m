From: tmbinc@elitedvb.net (Felix Domke)
Date: Wed, 26 Feb 2003 00:51:08 +0100
Subject: "Hot" updating root-mounted mtd partitions
Message-ID: <3E5C016C.4070700@elitedvb.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

i'm using MTD on a Linux Set-Top-Box, and i like to upgrade the (cramfs) 
root FS, which is on a mtd, while the device is running.

Of course updating it (be it from internet, from satellite or whatever) 
includes erasing and rewriting the root. This naturally causes troubles. 
How can i avoid this?

Possibilities are:
  - remount rootfs using an in-memory-copy (ramfs), but i don't think 
this is possible, since there are many open files in the old fs.
  - including ugly hacks in the flash driver, mainly by copying the 
partition to RAM and redirect accesses to that backup while flashing the 
rootfs

both possibilities suck.

I tried the following: (with proper error checking, of course)

p=mmap(0, size, PROT_READ, MAP_SHARED|MAP_LOCKED, 
open("/dev/mtdblock/0"), 0);

to map the BLOCK(!)device mtdblock0 in memory. as block accesses are 
chached, i thought, this should prevent them to go out of cache (=ram).

to enforce them to go into ram, i used

for (i=0; i<size; i+=PAGE_SIZE) (void)p[i];

Well, actually, it did help, but it's still not perfect. Sometimes the 
application crashes with a busfault after erasing the root.

My question: is it possible to do that this way? If not - why not?

I know that the application might reload data of a.) itself or b.) used 
fonts (it's a graphical application, based for example on freetype+ttf 
fonts), so i cannot simple remove the root.

Is such a mmap "strong enough" ?

What else can i do? How is this normally done? Having a 2nd system in 
flash is no choice.

felix
