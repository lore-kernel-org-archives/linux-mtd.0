Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2dVk-0002WB-GE
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2005 19:27:58 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Steven Hein <ssh@sgi.com>
In-Reply-To: <42F8DCBD.2020407@sgi.com>
References: <42F8DCBD.2020407@sgi.com>
Content-Type: text/plain
Date: Wed, 10 Aug 2005 01:33:15 +0200
Message-Id: <1123630395.21933.135.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Erasing NAND bad blocks?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-08-09 at 11:41 -0500, Steven Hein wrote:
> (Yes, I do know that erasing NAND flash blocks that are marked bad
> is a VERY BAD IDEA.....I'm asking the question regarding a
> specific HW/SW debug situation.......)
> 
> In the course of bringing up new hardware with NAND flash attached
> I have had occasions where a software bug will cause a NAND-based
> filesystem (such as YAFFS) to mark *all* of the blocks in a filesystem
> as bad.  In the past, I have hacked the nand_erase() function to
> allow erasing of bad blocks, then wrote a custom app to scan the OOB
> data, doing a MEM_ERASE for blocks that had been marked bad by the FS.
> Just wondering.....has anyone else
> run into this situation, and is there a more graceful way of doing
> this (i.e. without hacking the MTD NAND driver)?

This topic comes around on a regular base. 

I was more than once tempted to provide a user space interface to do
that. There are pro and cons. 

The con which holds me off is the experince that >90% of the bad block
complaints are related to buggy hardware and board drivers. Most of the
people trapping into this spend plenty of time to tinker around the real
problem.

Adding this functionality (it's simple) would just add some more
confusing reports like "Hey, I erased all the bad blocks with the
--force-erase-bad-block option, but it still shows me those annoying
messages".

OTH, we do enough witchcraft based help already, as obviously a lot of
those people 
- ignore documentation 
- are to a high grade advisory resistant
- ...

So it might just adding another shade of nerve racking, but helpful for
those who know what they are doing.

I'm not going to implement it myself, but patches are welcome. :)

Hint: 

	case MEMERASEFORCED:
		check_root_priviledges()
		force = 1;
	case MEMERASE:
		......
		erase->state = force ? ...FORCE... : 0;

erase.state seems to be a nice transport mechanism and it will uncover
all un/half initialized instances of struct erase_info by a simple check
for ...FORCE... || 0


tglx
