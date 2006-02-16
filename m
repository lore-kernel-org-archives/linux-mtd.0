Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F9eWg-0000sp-VV
	for linux-mtd@lists.infradead.org; Thu, 16 Feb 2006 03:30:13 -0500
From: Wolfgang =?iso-8859-15?q?M=FCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 16 Feb 2006 09:30:00 +0100
References: <200602161617.04905.manningc2@actrix.gen.nz>
In-Reply-To: <200602161617.04905.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602160930.00363.wolfgang.mues@auerswald.de>
Subject: Re: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Charles,

Charles Manning wrote:

> > About bad block detection: what is your oppinion about partitioning the
> > flash (the programs in a read-only partition, the data in r/w).
>
> This gets fs specific. With YAFFS (and I assume JFFS2, but consult an
> expert), grabage collection will force read-only files to get rewritten
> occasionally. Thus for ultimate reliability it is probably a GoodIdea to
> seperate the read-only stuff into a seperate partition. This is also a
> GoodIdea in that a smaller partition mounts faster (true for YAFFS and
> JFFS2). So if all your kernel + mount stuff is seperated from your rw stuff
> things will probably dgo better.

OK.

> > How about detection of ECC errors in read only partitions?
>
> ECC should be done on both rw and read-only partitions. Sometimes NAND gets
> read disturbs which would impact on read-only partitions.

My real question was: does YAFFS do regulary reads of all files in a R/O 
partition so that one-bit-errors can be discovered? Without reading, you will 
never find them...

> Also, write disturbs from writes to one partition can still corrupt a
> read-only partition on the same chip.

Bad news. Are you shure about this?
I know from the toshiba paper that write disturb is limited to the scope of a 
block. From other vendors, I don't have informations. 

> There's been some interesting discussion over in yaffs-land on this. If you
> don't subscribe to yaffs list then you can catch up on the yaffs archive.

I am reading the YAFFS mailing list for 1 year now. Very impressed by your 
constant engagement for YAFFS and the community.

Regarding YAFFS2 and the mounting time /need for scanning the whole NAND:
Do you think it will be possible to separate the directory information from 
the file data? So scanning will be:
- read the bad block marker and the "is directory information bit"
- if directory: scan it, building the data structures in RAM
- if data: you don't need it.

Obviously, this is only a benefit if reading the bad block marker is very much 
faster than scanning the whole block.

best regards
-- 
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
