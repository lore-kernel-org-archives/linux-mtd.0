Received: from msgbas2x.cos.agilent.com ([192.25.240.37])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Awtgo-0002pc-Fe
	for linux-mtd@lists.infradead.org; Sat, 28 Feb 2004 01:54:50 +0000
Message-ID: <403FF4E6.6030801@agilent.com>
Date: Fri, 27 Feb 2004 17:54:46 -0800
From: Shawn Jin <xiaogeng_jin@agilent.com>
MIME-Version: 1.0
To: Linux Mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: David Woodhouse <dwmw2@infradead.org>
Subject: 2nd erase command issued before the 1st one finishes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The problem I came into on flash erasure is that only the first sector 
erasure can succeed. Please refer to the thread 
http://lists.infradead.org/pipermail/linux-mtd/2004-February/009327.html. 
  This really confused me for a while. Finally I got a sense why this 
happened.

The following statement is from AMD datasheet.
"After the sector erase command sequence is written, the system sould 
read the status on DQ7 or DQ6 to ensure the device has accepted the 
command sequence, and then READ DQ3. If DQ3 is "1", the internally 
controlled erase cycle has begun; all further commands other than Erase 
Suspend are ignored until the erase operation is complete. To ensure the 
command has been accepted, the system software should check teh status 
of DQ3 prior to and following each subsequent sector erase command."

The current do_erase_oneblock() doesn't check DQ3 at all. In my test I 
used 'erase /dev/mtd1 0 3' to erase 3 consecutive sectors but only the 
1st one got erased. I modified the 'erase' utility to add some delay 
between two erase commands. When the interval was 2 seconds, I found 
interestingly that only one chip got erased. My configuration is 2 chips 
(Am29PL320D) interleaved to compose a 64-bit bus.

I checked a very ancient version of cfi_cmdset_0002.c and found there 
isn't DQ3 check either. So I'm wondering if the author has special 
reasons to ignore it?

That my flash devices are not writable is most likely due to the timing 
issue (status check). I hope I can figure it out soon.

-Shawn.
