Received: from web13207.mail.yahoo.com ([216.136.174.192])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qABq-0001Nj-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 09:57:58 +0000
Message-ID: <20020327095756.90242.qmail@web13207.mail.yahoo.com>
Date: Wed, 27 Mar 2002 01:57:56 -0800 (PST)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: probing two non-contiguous cfi flash and  a single partition 
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi David,
I need to use two flash chips(Both AMD CFI flash and each of 4MB size)
with the following mapping configuration -

1. starts at 0xbfa00000 and is of size 4MB
2. starts at 0xbfc00000 and is of 4MB size

Previously I was having only one flash starting at 0xbfc00000
with two partition, first 640k for bootloader and the rest for JFFS2
and is working fine for me.

Now still I want to have only two partition; the 640k at the address
0xbfc00000 for bootloader in first partition and remaining for JFFS2 in 
second partition. It means I need the following partition  
memory mapping -
4MB starting at 0xbfa00000 for JFFS2 -  second partition
fisrt 640kB at 0xbfc00000 for bootloader - First Partition for bootlaoder
remaining out of 4MB at 0xbfc00000 for JFFS2 - second partition

So I need suggestions about how to probe the two flash and make the partition
as per my requirements.
I am using linux2.4.2. and MIPS processor.

Thanks & Regards,
Sanjay



I don't know how to probe the two devices and 

__________________________________________________
Do You Yahoo!?
Yahoo! Movies - coverage of the 74th Academy Awards®
http://movies.yahoo.com/
