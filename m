Received: from nm22-vm1.bullet.mail.bf1.yahoo.com ([98.139.212.127])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP6LK-0005ZL-N4
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 07:50:35 +0000
Message-ID: <1380181813.24538.YahooMailNeo@web161206.mail.bf1.yahoo.com>
Date: Thu, 26 Sep 2013 00:50:13 -0700 (PDT)
From: Poyo VL <poyo_vl@yahoo.com>
Subject: BUG: JFFS2 filesystem corrupted after writing a 4 MB file on a low
 space left NOR flash
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Reply-To: Poyo VL <poyo_vl@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hello,

I have a big endian device with a 16 MB NOR flash.
Flash is structured in 128 erase blocks of 128 KB each.

It happened a few times that when device had a small amount of free space, writing a big file (4MB or more using mv from /tmp or wget) corrupted the whole filesystem and device wasn't able to boot anymore (init not found for example).


This time the problem was:
1. I don't know exactly how much free space was on device
2. I wrote a big file 4.07 MB
3. Trying to write someting to flash returned "no free space"
4. I rebooted the device
5. Device wasn't able to boot

I was able to dump the whole filesystem and I tried to convert it to little endian using jffs2dump but it resulted an invalid image so I converted each erase block.

Statistics:
- Total 128 erase blocks (128 KB each)
- 2 empty erase blocks (just 0xFFFF)
- 29 corrupted erase blocks (3.6 MB total)

There was a small problem with jffs2dump: corrupted inodes had invalid "totlen" (and invalid header CRC) and jumping from an inode to another was not ok. Also it does not validate if an inode is ok, it just check the magic bitmask so I made a small heuristic check: nodetype must have set only necessary bits, version must not exceed a decent value, uid and gid must be smaller than 1024 (I didn't have a bigger value), atime, ctime, mtime must not be greater than 2014 and so on.

If an inode corresponded those check, I considered it valid, even if I am not sure about some things: 

1. It happened to have a totlen of 0x02, 0x0A or 0x1A for an inode
2. It happened to have a csize > 0 and a dsize == 0 and I am not sure if this is ok or not

I executed modified version and I found only one possible valid inode in all corrupted erase blocks:

Found valid iNode at: 0x0000000c

19 85 - Magic
C0 02 - Node type
00 00 01 45 - Totlen
CA F3 23 E9 - Header CRC
00 00 4A 00 - Inode number
00 00 00 52 - Version
00 00 81 80 - Mode
00 00 - UID
00 00 - GID
00 05 00 00 - Isize
52 1C 24 80 - Atime
52 1C 24 80 - Ctime
52 1C 24 80 - Mtime
00 05 20 00 - Offset
00 00 01 01 - Csize
00 00 00 00 - Dsize
06 - Compr
00 - User compr

As you can see, csize is 0x0101 and dsize is 0x0000. Also, isize (0x00050000) is smaller than offset (0x050200) and I'am not sure this is ok.
There were no other valid node.
Also header CRC was not ok. I manually calculated header CRC, setting ACCURATE flag and I bruteforced the totlen field so it will match the CRC form the specified inode and i resulted a really big value, more then 3 GB.

Corrupted erase blocks did not contain just dirty data, they contained partially valid inodes headers. For example, an inode from a corrupted erase block:

19 85 - Magic
C0 02 - Node type
00 00 00 02 - Totlen
2A 05 21 0B - CRC
00 00 49 00 - Inode number
00 00 00 02 - Version
00 00 81 A4 - Mode
00 00 - UID
00 00 - GID 
00 00 04 90 - Isize
50 00 50 8C - Atime
50 00 50 8C - Ctime
52 10 60 8A - Mtime
00 00 00 00 - Offset
00 00 00 02 - Csize
00 00 00 00 - Dsize
06 - Compr
00 - User compr

As you can see "totlen" is 0x02, csize is 0x02 and dsize is 0x00. Header CRC does not match. 

This was practically the problem: I am pretty sure there is a problem calculating totlen, isize, csize and dsize but I can't be sure.

I have the kernel version 2.6.25.20. So, first, I ask you the following question: did you fixed a problem like this and it is ok just to upgrade the kernel, or I have to get more details about this issue?

I checked write, file, gc, erase code but I couldn't find an overflow. Do you think it can be a syncronization problem related to garbage collector?

Do you ahve any suggestion for me? 

What can I do?

Thank you,
Ionut Popescu
