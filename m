Received: from f159.law14.hotmail.com ([64.4.21.159] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gfPE-0006ZE-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 05:44:16 +0100
From: "simon gittins" <simon__gittins@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 speed question
Date: Tue, 11 Sep 2001 14:49:49 +1000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F159i9fQWcXciAkQiDC0000b5df@hotmail.com>
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

Hi

I've been looking at the performance of jffs2 when under high stress 
(copying large files when fs is largely full).  Looking at the kernel debug 
messages, I've noticed fairly frequent 3-5 second gaps.  I'm fairly new to 
jffs2, but I did some hacking in the source and found:

1. The 5 second wait times are generally started by a request for a file 
semaphor, and are always terminated by kupdated, (which calls write_super?). 
  kupdated sleeps for 5 seconds (on my 2.4.9 kernel) between iterations.  Am 
I right in thinking that this is a large bottleneck in the system?  I can 
manually 'speed it up' by running the following shell commands during a 
block time:
    kill -STOP 7; kill -CONT 7 #where 7 is the pid of kupdated
Can we minimise the dependence of jffs2 on kupdated?


2.  Semaphors appear to be held during the execution of schedule().  While I 
have not delved deeply enough to fully understand the algorithms in place, a 
plethora of printk's seem to suggest that there are occasions where a 
process (gc or user process) would hold the semaphor and go to sleep (via 
schedule) without releasing the semaphor.  The other process would then pick 
up the execution, and (eventually) try to access the semaphor and fall into 
a sleep as well.  This appears to often cause the symptoms in (1), where 
both processes are napping until kupdated comes along.

Am I on the right track?

Is there any development time being spent looking at the performance issue 
(apart from mine)?



I am working with 3 September CVS code on a 2.4.9 kernel.  I am using a 
pseudo flash device with mtdram to perform my tests.

Regards
Simon Gittins



_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp
