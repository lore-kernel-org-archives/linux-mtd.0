Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Ji9B-0000Vt-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 22:37:37 +0000
Date: Wed, 4 Dec 2002 17:08:07 -0600
Subject: Re: Problem: 51MB partition max size on jffs2
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
To: tglx@linutronix.de
From: Ken Offer <koffer@arlut.utexas.edu>
In-Reply-To: <200212042302.44177.tglx@linutronix.de>
Message-Id: <40170F3C-07DD-11D7-937A-000393467F1A@arlut.utexas.edu>
Content-Transfer-Encoding: 7bit
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

On Wednesday, December 4, 2002, at 04:02  PM, Thomas Gleixner wrote:

> On Wednesday 04 December 2002 23:00, Ken Offer wrote:
>> On Wednesday, December 4, 2002, at 11:47  AM, Thomas Gleixner wrote:
>>> Latest CVS code ?
>>
>> I tried it with an older version (circa 20020819) and the latest code
>> (20021202).  Same result.  I am going to try the change Dave Ellis
>> <DGE@sixnetio.com> suggested.
> Strange. Could you please tell me, what output the latest CVS code 
> produces

Well, I was getting a mount failure.  There wasn't much info other than 
that.  If you look in the latest (20021202) jffs2 build.c file, you can 
see if the kmalloc of c->blocks fails in jffs2_do_mount_fs, no debug 
message is printed.  Only a non-mem error is returned.  That is 
consistent with what I was seeing, even with the highest verbosity 
debugging on.

I made the change to use vmalloc/vfree for c->blocks and that seemd to 
fix the problem.  kmalloc is indeed limited to 128KB.  Of course, I 
made the change to the 20020819 code.  I'll try the vmalloc change with 
the latest CVS code as well and see how that holds up.

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
