Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACQYs-0007JJ-9w
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 22:30:34 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Srikanth Sherman" <sri@technovare.com>,
	<linux-mtd@lists.infradead.org>
Date: Thu, 23 Oct 2003 10:35:14 +1300
References: <010001c398b6$aeadc740$1000a8c0@tsihq.com>
In-Reply-To: <010001c398b6$aeadc740$1000a8c0@tsihq.com>
MIME-Version: 1.0
Message-Id: <20031022212914.ABE23BD59@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Running FAT+MTD
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 23 October 2003 05:08, Srikanth Sherman wrote:
> Hello,
>
> After reading some of the old archives of the MTD list,
> it looks like at least a few people have used FAT+NFTL
> instead of JFFS.  The one question I have is that how do
> they take care of things like wear-leveling and garbage-collection?  Aren't
> they a function of JFFS or am I completely confused about MTD?  Thanks.
>
> Sri

First things first. ***DON'T BE TEMPTED TO DO THIS ***.

The only valid reason to use FAT is if you have removeable storage that must 
also plug into a FAT-based system.

If you use FAT:
* Your data is not safe.
* Performance goes to hell.

There are essentially two ways to implement a flash-based file system:

1) Block driver + regular file system (ext2, fat,...):
This is the approach used by SmartMedia etc. In this approach, the block 
driver tries to look like a hard disk block driver. The block driver does all 
the wear levelling etc. The file system does not know anything about flash 
and just thinks it is talking to a hard disk. To achieve this, the block 
driver needs to tell a bunch of lies and make mappings etc that are liable to 
corruption and speed issues.

2) Flash file system (eg. JFFSx, YAFFS)
These file systems know they are working with flash. They understand flash, 
know how to exploit flash and work around performance issues. Both JFFSx and 
YAFFS include some degree of journaling. They are both faster and more robust 
than equivalent FAT+block solutions.


IMHO.

-- Charles
