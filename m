Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WQ5J-0001Uj-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 23:21:21 +0100
Message-Id: <5.1.0.14.0.20010813172206.00b02a38@mail.spewey.com>
Date: Mon, 13 Aug 2001 17:27:06 -0500
To: Frederic Giasson <fgiasson@mediatrix.com>,
 "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: RE: JFFS2 is broken
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D9955F7@webmail.mediatrix.c
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

At 02:34 PM 8/13/2001 -0400, Frederic Giasson wrote:
>Hi again Vipin,
>
>I ran your JitterTest program on my MPC860T 50MHz embedded platform.  I
>experienced worst case around 40 seconds like you did.  I think that such
>jitter time is unacceptable in a real time embedded system like mine, so I
>wonder what can be done to patch JFFS2 so it relinquish the CPU from time to
>time... I spinkled a lot of loops into JFFS2 compression files with "if(
>current->need_resched) schedule();" and the worst case was 4 seconds.

Did the 40 become 4 for the task writing to JFFS2? or was it some "other" task
that had the 40 seconds jitter?
Could you pl describe your setup. Were you running JitterTest as a POSIX 
Real Time
task or regular task?

In my test, the task writing to JFFS2 experienced the 40seconds block 
times, but
another task- not interacting with JFFS2- experienced a jitter of "only" ~50ms.



>After having spinkled the code with schedule(), I ran another application
>which accessses JFFS2 too at the same time that JitterTest, and the
>execution of my program took 17% more time, which in my opinion is
>acceptable because now JFFS2 has to cope with 2 applications accessing it at
>the same time.
>
>Do you think that something sharp and clean could be done with JFFS2 to fix
>that problem once and for all?

I hope something can be done. Those excessive blocking times are just killer!
David once mentioned that there are some obvious optimizations that can be
carried out in the JFFS2 code. Maybe he could list out his favorite ones 
and maybe
someone could volunteer to tackle them one by one.

Vipin
