Received: from [216.201.190.67] (helo=towelie)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHRMG-00034s-L3
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 17:22:16 +0000
Received: from genaero.com (localhost.localdomain [127.0.0.1])
	by towelie (Postfix) with ESMTP id 8DE0510CA09
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Nov 2003 11:20:30 -0600 (CST)
Message-ID: <3FA9315E.2090508@genaero.com>
Date: Wed, 05 Nov 2003 11:20:30 -0600
From: Jim Duchek <jduchek@genaero.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------040302030405050502060108"
Subject: DOC2000 + PPM-TX166 (PATCH)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040302030405050502060108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello.  I'm not subscribed to the mailing list, so please, if you could 
make sure any replies for me go to my address and not to the list, I 
would appreciate.

We saw a problem (actually, a pretty big problem) wherein when a sync() 
was done on a filesystem on the DoC we were using, it would hang and 
never come back.  The system was perfectly responsive, except trying to 
talk to the DoC wasn't going to happen again until reboot.  The problem 
would never occur if we let the fs sync itself -- that is, just wait a 
few minutes until the buffers have been cleared.

I traced the problem down to the cond_resched() in WaitReady in 
doc2000.c.  Removing cond_resched() made the problem go away (and the 
system unresponsive while doing any DoC access).  Replacing the 
udelay(1) and cond_resched() with a yield() fixes everything.  The patch 
is short and appended to this message.  I believe the patch should be 
Good for all users, although I'm not sure why we don't see this problem 
on some other setups.  My best guess is that the other setups we are 
using have Geode processors, which I don't believe have a TSC, and our 
P-MMX does have one, and udelay() is totally different depending on the 
existence of a TSC.

For those curious, we are using an unpatched 2.4.22 kernel on a 
WinSystems PPM-TX166.  The DoC in question is a 48M Industrial (X) rated 
chip.  We saw the problem with both msdos and ext2 filesystems.




--------------040302030405050502060108
Content-Type: text/plain;
 name="doc2000.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="doc2000.patch"

94a95
> 		yield();
99,100d99
< 		udelay(1);
< 		cond_resched();
101a101,104
> 	
> 	DEBUG(MTD_DEBUG_LEVEL3,
> 	      "_DoC_WaitReady finished\n");
> 

--------------040302030405050502060108--
