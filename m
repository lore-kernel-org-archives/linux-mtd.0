Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZnX2-0003mR-PQ
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 09:09:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Gregg C Levine <hansolofalcon@worldnet.att.net>
In-Reply-To: <000001c343e5$e6bb1d20$239efea9@who5>
References: <000001c343e5$e6bb1d20$239efea9@who5>
Message-Id: <1057651750.28965.85.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 08 Jul 2003 09:09:10 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Russ.Dill@asu.edu
cc: linux-mtd@lists.infradead.org
Subject: RE: File systems and Disk on Chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-07-06 at 18:41, Gregg C Levine wrote:
> (See below, to honor the hosting list's policies.)

Gregg, I've asked you about this before. Please see below to see how
your mail _should_ have looked. Perhaps you can count the errors?

Note that in my version you have only quoted the single line (with
appropriate attribution) of Russ's mail to which you are replying, and
you do not add noise to your reply. Your paragraphs are clearly
separated by newlines and not merged together into gratuitously quoted
mailing list footers. Your bizarre signature is correctly separated by
the '-- ' separator.

I am, of course, only addressing the _form_ of your mail here, which
makes me object to its mere presence on my mailing list. If you actually
want me to bother to read it and try to help you, you'd _also_ have to
do basic things like quoting the errors you see rather than describing
them in such vague terms that I can't tell what you're wittering on
about. Perhaps it would have helped to omit the weird paragraph about
Bochs, since I can't see how getting a kernel to boot in an emulator
which doesn't emulate a DiskOnChip could be at all relevant. 

Describe, coherently and concisely, precisely what you have done and
precisely the manner in which it broke. Then we can attempt to help you.
If we haven't spent long enough just trying to get sense out of you in
the first place, that is.

  -------------

On Sun, 2003-07-06 at 07:42, Russ Dill wrote:
> Basically, you put a block filesystem on top of NFTL that grub
> understands. 

Okay that makes more sense. But now how do I go about creating the 
"block filesystem on top of NFTL" that I need to use? 

For example, I've gotten with my test image, as far as creating a
floppy disk image, and booting that, inside the Bochs emulator. It
worked, the test kernel launched, and told me that the kernel did what
it was supposed to do. 

My other problem, is that I still can not get the utilities inside
that directory to properly compile, they always break when trying to
create the ones that manage the JFFS2 stuff. I am hoping that the
snapshot from yesterday has been fixed, but I don't know.

-- 
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )


  -------------- 
-- 
dwmw2
