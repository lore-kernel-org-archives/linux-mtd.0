Received: from mailout-de.gmx.net ([213.165.64.23])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm65b-0000Vb-To
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 14:59:49 +0000
Subject: JFFS2: truncated files after power loss scenario
From: Sven <svenjaborek@gmx.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="ISO-8859-15"
Date: Sun, 06 Feb 2011 15:59:44 +0100
Message-ID: <1297004384.2084.9.camel@hbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi mtd list,

What is the expected behavior for files beeing written on a jffs2 (on
nand) during a power loss? Would an incomplete file exist, or would the journaling do a roll back
because of an incomplete transaction?
Is there a difference with new files created, or existing files beeing modified?

My tests show that on next bootup the file exists, but is truncated. I have not seen any journaling related roll backs.

I took a look at this, because we have seen a truncated configuration file once. I'm not sure what caused this. Perhaps a power loss during write.

What do you think about the following jffs2dump?:
( dwnld.conf was created once by extracting it from an archive,
  it might have been modified afterwards. (fopen "w+"; fprintf; close),
  the file existed afterwards, but was truncated in to 4k,
  then during error analysis the file was renamed "mv dwnld.conf
dwnld.conf.org" and a new file dwnld.conf was created there)

Dirent     node at 0x00346f2c, totlen 0x00000032, #pino    41, version    23, #ino        42, nsize       10, name dwnld.conf
Dirent     node at 0x003e63e8, totlen 0x00000032, #pino    41, version     5, #ino        42, nsize       10, name dwnld.conf
Dirent     node at 0x009c19e0, totlen 0x00000032, #pino    41, version    28, #ino      2484, nsize       10, name dwnld.conf
Dirent     node at 0x009fc398, totlen 0x00000036, #pino    41, version    27, #ino        42, nsize       14, name dwnld.conf.org
Inode      node at 0x003e63a4, totlen 0x00000044, #ino     42, version     1, isize        0, csize        0, dsize        0, offset 0
Inode      node at 0x003e641c, totlen 0x000005d8, #ino     42, version     2, isize     4096, csize     1428, dsize     4096, offset 0
Inode      node at 0x003e69f4, totlen 0x000006f5, #ino     42, version     3, isize     8192, csize     1713, dsize     4096, offset 4096
Inode      node at 0x003e70ec, totlen 0x0000028f, #ino     42, version     4, isize     9445, csize      587, dsize     1253, offset 8192
Inode      node at 0x003e737c, totlen 0x00000044, #ino     42, version     5, isize     9445, csize        0, dsize        0, offset 0
Inode      node at 0x003e73c0, totlen 0x00000044, #ino     42, version     6, isize     9445, csize        0, dsize        0, offset 0
Inode      node at 0x003e7404, totlen 0x00000044, #ino     42, version     7, isize     9445, csize        0, dsize        0, offset 0
Inode      node at 0x009bcba8, totlen 0x000005d8, #ino     42, version     9, isize     4096, csize     1428, dsize     4096, offset 0
Inode      node at 0x00e51ea0, totlen 0x000005d8, #ino     42, version     9, isize     4096, csize     1428, dsize     4096, offset 0

I reproduced a good-case of the actions on the file with a fresh filesystem:
Dirent     node at 0x00364e3c, totlen 0x00000032, #pino    41, version    11, #ino        42, nsize       10, name dwnld.conf
Dirent     node at 0x00553000, totlen 0x00000036, #pino    41, version    12, #ino        42, nsize       14, name dwnld.conf.org
Dirent     node at 0x00553038, totlen 0x00000032, #pino    41, version    13, #ino         0, nsize       10, name dwnld.conf
Dirent     node at 0x00555844, totlen 0x00000032, #pino    41, version    14, #ino      1171, nsize       10, name dwnld.conf
Inode      node at 0x00364e70, totlen 0x00000044, #ino     42, version    10, isize     9445, csize        0, dsize        0, offset 0
Inode      node at 0x00449cb4, totlen 0x000005d8, #ino     42, version     2, isize     4096, csize     1428, dsize     4096, offset 0
Inode      node at 0x0044a2c8, totlen 0x000006f5, #ino     42, version     3, isize     8192, csize     1713, dsize     4096, offset 4096
Inode      node at 0x0044accc, totlen 0x0000028f, #ino     42, version     4, isize     9445, csize      587, dsize     1253, offset 8192
Inode      node at 0x0096e1c4, totlen 0x00000044, #ino     42, version    11, isize        0, csize        0, dsize        0, offset 0
Inode      node at 0x0096e208, totlen 0x000005d8, #ino     42, version    12, isize     4096, csize     1428, dsize     4096, offset 0
Inode      node at 0x0096e7e0, totlen 0x000006f5, #ino     42, version    13, isize     8192, csize     1713, dsize     4096, offset 4096
Inode      node at 0x0096eed8, totlen 0x0000028f, #ino     42, version    14, isize     9445, csize      587, dsize     1253, offset 8192


I wonder about the Inode #42 Version 5 to 9 and about why two Dirent exist(ed) for #ino 42.
Do you think this was caused by a power loss scenario?

The truncated file error happened on a 2.6.18 based kernel.
I have done power loss tests on 2.6.34, which showed truncated files as well.

regards, Sven Jaborek
