Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pJHj-0003FF-0W
	for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2003 04:05:19 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
	linux-mtd@lists.infradead.org
Date: Wed, 20 Aug 2003 15:08:40 +1200
References: <a05200f03bb6877b9d497@[130.161.115.44]>
In-Reply-To: <a05200f03bb6877b9d497@[130.161.115.44]>
MIME-Version: 1.0
Message-Id: <20030820030456.07C504709@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: 2k page NANDs ?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 20 August 2003 13:02, J.D. Bakker wrote:
> Hi all,
>
> Is there any way to use either JFFS2 or YAFFS (or MTD-NAND, for that
> matter) on the newer NAND devices with 2112-byte pages ? Looks like
> all higher density (>1Gb) NANDs are using this page size nowadays.
>
> Thanks,
>
> JDB
> [who has developed an insatiable appetite for shock-proof non-volatile
> storage]

JDB

There are still 512byte devices and will always be (always in a very relative 
sort of way). These devices are used in SmartMedia and will thus be in 
production for some while. However, SmartMedia is limited to 128MB so the 
motivation for 512byte devices greater than 128MB (== 1Gb) is non-existant.

2k page devices have potential price advantages (less control circuitry per 
storage) and speed advantages.

I'm unsure as to the mtd and JFFS2 status of 2k page devices at present, but 
last time I discussed this with Thomas (mtd NAND), the consensus seemd that a 
good slap is all athat is required to get the mtd nand code working.

YAFFS is at present limited to 512-byte devices. There is a concept doc for 
YAFFS2 which includes support for 2k devices, amongst other features. Read 
all about it at http://www.aleph1.co.uk/armlinux/projects/yaffs/yaffs2.html

At present this is concept, but all major YAFFS re-gutsing over the last year 
or so has been done with an eye to YAFFS2. Thus, many of the trickier bits 
(eg. "soft delete" and the background garbage collection) are already done 
and tested.

YAFFS2 is really waiting on someone to be motivated enough to 
pay for the development. Considering the number of people asking for YAFFS2 
recently I expect to see YAFFS2 up and running before the end of the year.

-- Charles
