Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Wm6H-000354-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 22:51:49 +0100
Message-Id: <5.1.0.14.0.20010814165052.00b18cf8@mail.spewey.com>
Date: Tue, 14 Aug 2001 16:57:26 -0500
To: Frederic Giasson <fgiasson@mediatrix.com>,
 "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: RE: JFFS2 is broken 
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4DD0DAE1@webmail.mediatrix.c
 om>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 01:57 PM 8/14/2001 -0400, Frederic Giasson wrote:
>My other program running at the same time is my testcase which fills JFFS2
>to 80% with various files, deletes them and continue to do on.

Be careful, in my tests, the worst case blocking times came when the flash 
was >90+%
full. You may want to increase the full % on your flash full program and 
retest.

As a matter of fact, how I tested was: I ran JitterTest itself and asked it 
to put its "fill file"
(not the log file- which i redirected to /dev/console) on my JFFS2 
partition. Then I let JitterTest fillup the entire flash partition and
measured the worst case jitter in this case.

This way you can measure the jitter time for a task writing to JFFS2 itself.

I also ran another test where in addition to the above, I also ran another 
version of JitterTest
(this time as a POSIX RT task) and did not make it interact with JFFS2 at 
all. The worst case
jitter of this guy told me the worst case jitter to expect in a task NOT 
interacting with JFFS2
even while there was another task filling up the JFFS2 partition in the 
background. The results I got
for this test were ~50ms.


>There is something else that I did and maybe you did'nt.  In my chip driver,
>I put a "if( current->need_resched ) schedule();" in these fonctions:
>atmel_0001_write(), atmel_0001_read() and atmel_0001_erase_varsize(), which
>are the functions called by mtdblock driver through the mtd_info structure.
>I put schedule()'s because I though that if an application request a write
>of 1MB to JFFS2, atmel_0001_write() would not return until that 1MB of data
>was compressed and written to JFFS2.  Same thing for read and writes.

Interesting point. Are your flash chips in my MTD flash database on 
www.embeddedlinuxworks.com?

Vipin
