Received: from law11-f26.law11.hotmail.com ([64.4.17.26] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AArxx-0002LV-6A
	for <linux-mtd@lists.infradead.org>; Sat, 18 Oct 2003 15:22:01 +0100
From: "J B" <mad_flasher@hotmail.com>
To: jffs-dev@axis.com, linux-mtd@lists.infradead.org
Date: Sat, 18 Oct 2003 09:20:23 -0500
Mime-Version: 1.0
Message-ID: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
Content-Type: text/plain; format=flowed
Subject: jffs2 fragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, maybe I am just completely missing something here, but I am stumped.  I 
am running some tests (similar to the jitter tests Vipin did a long time 
ago), and I am seeing some very bad performance.   Below is a summary of 
what I am doing and what I am seeing.

I have a jffs2 filesystem that is mounted and starts out at ~87% full.  
There are various small files on there, and one big file, ~15MiB (lgood 
compression :).  Here is what I do:

rm /opt/big_file; cp /home/big_file /opt/big_file; rm /opt/big_file; cp 
/home/big_file2 /opt/big_file

/opt is the jffs2 filesystem, /home is an nfs mounted directory.  big_file 
and big_file2 are the same size, but have different content (i.e. possibly 
different compression ratios).

Normally, a rm/cp pair takes about 2 minutes on my system.  After about 10 
iterations, the copies begin to take longer, about 3-4 minutes.   After 
about 10 iterations they take upwards of 1/2 an hour.

Looking at the dirty, used, and wasted size from a df command, I see this:

<7>STATFS:
<7>flash_size: 00680000
<7>used_size: 0041afe4
<7>dirty_size: 00199d2c
<7>wasted_size: 0000012c
<7>free_size: 000cb1c4
<7>erasing_size: 00000000
<7>bad_size: 00000000
<7>sector_size: 00020000
<7>nextblock: 0x00660000
<7>gcblock: 0x000a0000

So almost 13 eraseblocks worth of dirty space (NOR flash with 128KiB 
eraseblocks).  But, there is only 1 block on the dirty_list, 6 on the 
free_list, and 44 on the clean_list.  Garbage collection is going on during 
the writes obviously, but it doesn't seem to be making any difference.  In 
fact, the dirty_size _increases_.

So here is my question:  because of the size of the file involved and the 
relative lack of free eraseblocks to start with, is it possible that the 
filesystem is so fragmented that the dirty space is spread accross many 
eraseblocks and garbage collection is incapable of actually freeing up any 
space?

That is the only conclusion I could come to.  Any thoughts would be 
appreciated.

Thx,
J

_________________________________________________________________
Want to check if your PC is virus-infected?  Get a FREE computer virus scan 
online from McAfee.    
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
