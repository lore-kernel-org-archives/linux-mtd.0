Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAvba-0005mU-0o
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2004 15:19:45 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Arik Funke <arik.funke@gmx.de>, linux-mtd@lists.infradead.org
Date: Sat, 25 Sep 2004 07:22:08 +1200
References: <41546333.50102@gmx.de>
In-Reply-To: <41546333.50102@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040924191930.965AD60A7@blood.actrix.co.nz>
Cc: 
Subject: Re: i386 Linux on USB pen drive
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 25 September 2004 06:10, Arik Funke wrote:
> Hello together,
>
> I am setting up a linux system to run on a USB memory stick. Currently I
> am using kernel 2.6.7 and ext3 as filesystem. Can anybody tell me if
> wear-leveling will be a problem with this system? Or should I rather use
> a fs like jffs or jffs2? Is kernel 2.6.x ok?

This is very much like those threads one reads occasionally about Compact 
Flash.

All we really know about these devices is that they conform to USB mass 
storage. We don't really know what goes on inside them, but we can make some 
educated guesses :-).

Most likely, IMHO, these devices will be using a block swapping strategy like 
that used in SmartMedia. This does not do explicite wear levelling, but the 
block management does effect wear levelling.

The biggest source of problems with these devices, IMHO, is FAT corruption. I 
see you've taken steps too get rid of that. 

The flash file systems like JFFSx and YAFFS are really suited to raw flash 
(SmartMedia and XD cards and soldered down chips) , not USB Mass storage 
devices (which look like hard disks). Dave might not share my opinion on this.

-- CHarles
