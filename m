Received: from web10806.mail.yahoo.com ([216.136.130.248])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dGiu-0000gf-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 20:18:48 +0000
Message-ID: <20020219203003.3976.qmail@web10806.mail.yahoo.com>
Date: Tue, 19 Feb 2002 12:30:03 -0800 (PST)
From: Scott Kapu <kapus1@yahoo.com>
Subject: DOC write access...
To: linux-mtd@lists.infradead.org
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

Hello, 
I'd like to thank you for all the tips I've received
from the postings...

I'm using a DiskOnChip (288M) and a PC104 PPM-520 SBC
by WinSystems.

I have loaded the the CVS patches (downloaded within
past 2 weeks) on a 2.4.17 kernel tree. Created Inodes
compiled etc FINE. FDISK'ed the /dev/ntfla device,
creating nftla1 looks like...

-------------------------------------------------
Command (m for help):
Disk /dev/nftla: 1 heads, 577728 sectors, 1 cylinders
Units = cylinders of 577728 * 512 bytes

     Device Boot    Start       End    Blocks   Id 
System
/dev/nftla1             1         1    288863+  83 
Linux
Partition 1 has different physical/logical endings:
     phys=(768, 0, 0) logical=(0, 0, 577728)
Partition 1 does not end on cylinder boundary:
     phys=(768, 0, 0) should be (768, 0, 577728)
------------------------------------------------

Despite above, mounting the partition appears to work
and looking at the results of 'df -k' looks as
expected.

trying to touch a file yields...
--------------------------------------------------
EXT2-fs error (device nftl(93,1)): ext2_check_page:
bad extry in directory #2: rec_len is smaller than
minimal - offset=0, inode=0, rec_len=0, name_len=0
--------------------------------------------------

Any help where I've gone wrong(or how to fix) is
appreciated.
Also is JFFS or JFFS2 required or can/should I use
ext2 type?

In addition I'm new to the MTD hardware and it is my
intention to boot an embedded computer from DOC. Any
advice as to the best configuration, filesystem type,
strategies (ie boot compressed image to RAM disk,
partitions/no_partitions  etc) is appreciated!!!

Thankyou in advance
-Scott K.



__________________________________________________
Do You Yahoo!?
Yahoo! Sports - Coverage of the 2002 Olympic Games
http://sports.yahoo.com
