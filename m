From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 17 Feb 2003 14:05:41 +0100
Subject: CRAMFS on Flash
In-Reply-To: <20030217122526.19514.qmail@webmail32.rediffmail.com>
References: <20030217122526.19514.qmail@webmail32.rediffmail.com>
Message-ID: <20030217130541.GA6282@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 17 February 2003 12:25:26 -0000, Nandakumar  NarayanaSwamy wrote:
> 
> 1) Where to create the mtd partitions for the file system in 
> flash? First i just want to create a simple CRAMFS with some 
> binaries and executables and then mount it using mount command i.e 
> like
> mount -t cramfs /dev/mtdblock0 /home

Several options:
- Create a custom mapping driver with hard coded partitions, like most
  in drivers/mtd/maps.
- Use a partition table parser and put the partition table into flash.
- Look at the documentation to cmdline.c or browse through the mtd
  archives. (not sure, haven't looked at it myself yet)

J?rn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
