Received: from [64.170.22.138] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15GXHn-0003YP-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Jul 2001 03:48:36 +0100
Message-Id: <5.1.0.14.0.20010630215847.00a67068@mail.spewey.com>
Date: Sat, 30 Jun 2001 22:05:20 -0500
To: Frederic Giasson <fgiasson@mediatrix.com>,
 "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: Intense JFFS2 testcase fails after 500 times
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D9954F9@webmail.mediatrix.c
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

At 01:23 PM 6/30/2001 -0400, Frederic Giasson wrote:

>The first time I fill the flash, df command reports a 88% disk uasge.

Hmm, there is something weird right here. Why does it say 88% full
when you say you "fill flash".

The JFFS2 statfs takes into account the number of sectors required
for GC and should report 100% full when it really is full. Except of course,
the 18% empty flash is so small that it cannot fit even one of your "small 
files".

>   It
>remains like that until about 200 test case loops have executed.

You mean that when you erase all the files, disk space goes back to
x% (not 0 of course due to the reserved sectors for GC) but each time
the max full is >88%?

>   But after
>that, disk usage begins to grow slowly, and at about 520 loops, my testcase
>fails, reporting a full disk.

Do you mean even if you delete all the files, df still says that disk is full?
Is your GC task running?

>   After the test, I checked the flashes chips
>and they are not burned out, they are still very good.  Did anyone ever ran
>such tests?  If so, did it gave the same results?  If so, could there be
>some sort of memory leaks with JFFS2 filesystem?

By memory leak, I guess you mean media (flash) space leak, as you didn't say
anything about loosing RAM?

Vipin
