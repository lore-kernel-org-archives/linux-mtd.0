Received: from web41502.mail.yahoo.com ([66.218.93.85])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BMtws-0003nD-0S
	for linux-mtd@lists.infradead.org; Sun, 09 May 2004 20:26:54 +0100
Message-ID: <20040509192651.76331.qmail@web41502.mail.yahoo.com>
Date: Sun, 9 May 2004 12:26:51 -0700 (PDT)
From: Andre Sodermans <andreesje_werk@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: diskonchip2000 support in 2.4.22
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello all,
I can't access my diskonchip2000 partitions from
linux. I have linuxmz 2.4.18 installed on it and it
boots fine from diskonchip. 

The kernel I built for LFS5.0 is based on 2.4.22. 
I compiled the kernel with:
CONFIG_MTD = m
CONFIG_MTD_CHAR = m
CONFIG_NFTL = m

Running modprobe docprobe, I get:

DiskOnChip Millennium found at address: 0xD000
no flash chips recognized

It is actually a diskonchip2000.
There is no entry in /proc/mtd.

After I installed the kernel I noticed that I was
missing the /dev/msys/fla* so I created those. Also
the /dev/nftl* were missing, so I downloaded the
latest mtd snapshot and ran the MAKEDEV script.

I tried to mount -t ext2 /dev/msys/fla1 /mnt/doc -
result:
mount: /dev/msys/fla1 is not a valid block device

I tried to mount -t ext2 /dev/nftla
mount: /dev/nftla1: unknown device


Did I miss something?


	
		
__________________________________
Do you Yahoo!?
Win a $20,000 Career Makeover at Yahoo! HotJobs  
http://hotjobs.sweepstakes.yahoo.com/careermakeover 
