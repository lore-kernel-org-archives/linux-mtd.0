Received: from gate.epygi.de ([212.126.211.241])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Xwtp-0005Gr-Ex
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jul 2003 06:44:53 +0100
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Alex Samoutin" <samoutin@hotbox.ru>
Date: Thu, 3 Jul 2003 07:44:59 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJCEAHDEAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
In-Reply-To: <000e01c340c1$73ca2800$1a00a8c0@itc.intrinsyc.com>
Content-Type: text/plain;
	charset="windows-1251"
Content-Transfer-Encoding: 8bit
cc: Linux-Mtd <linux-mtd@lists.infradead.org>
Subject: RE: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex,

I just had a look at this mail and one of the problems you mention just reminds me of me experiences a few month ago.
You say that write verify on you NAND flash sometimes failes. I had the same on my board using YAFFS on a NAND. I figured out that
verify failes during partial writes. The reason the compair routine doesn'T deal with that special situation where there is already
some data in the page and someone writes only a few 0's leaving the rest at 0xFF since the manual says to do so in partial writes.
To deal with that write verify whould have to read the page first and after writing the new data check if the data read back is
"resonable" compaired to the original data and the new data. Unfortately this test can't show you whether the page content is what
you whant it to be but it checks whether the result is reasonable under the given preconditions...
This version of write verify is mutch more complicated and will take a lot more time but on the other hand this is the only correct
way and write verify is mainly for "debugging" anyway.
I didn't keep the modifications in my code (just switched of write verify instead) so I can't send you a simple patch but it's not
as difficult to do anyway. It's only that the patch is quite uggly.

Stephan

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Alex Samoutin
> Sent: Mittwoch, 2. Juli 2003 19:43
> To: tglx@linutronix.de; Thayne Harbaugh
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Fw: corrupt my NAND flash device
>
>
> Hi Thomas,
>
>
>
> Sorry for big delay with answer – I had no hardware to test. Now I got my
> CerfCube 405ep back and can play with it.
>
> So I had two problems
>
>   1.. Write verify sometimes fail
>   2.. Write operation during erase sometimes cause data corruption
>
>
> Hardware details :
>
> - NAND chip Toshiba TC58256AFT
>
> - ALE/CLE and CE connected to GPIO
>
> - R/B pin connected to GPIO and I use ready function which reads it pin.
>
> - I played with different timings – even slowest setting gets  me the same
> result
>
>
>
> 1-st problem was solved by applying new MTD snapshot  (Jun 26). It’s look
> like nand_deselect(); nand_select() fixes the problem.
>
>
>
> However  after applying new MTD release the 2-nd problem still remained.
> Then I comment out erase abort in nand_get_chip (as you suggested) and it
> fixes my second problem!
>
>
>
> Could you remove this erase abort from MTD source? I think it will not
> affect much on efficiency.
>
>
>
> BTW -  jedec_probe.c file has no #include <linux/init.h> . And it cause
> compilation problem within my source tree.
>
>
>
> Alex Samoutin
>
> Intrinsyc Software.
>
>
>
>
>
>
>
> ----- Original Message -----
>
> From: "Thomas Gleixner" <tglx@linutronix.de>
>
> To: "Alex Samoutin" <samoutin@hotbox.ru>; "Thayne Harbaugh"
> <tharbaugh@lnxi.com>
>
> Cc: <linux-mtd@lists.infradead.org>
>
> Sent: Wednesday, April 30, 2003 11:13 AM
>
> Subject: Re: Fw: corrupt my NAND flash device
>
>
>
> On Wednesday 30 April 2003 18:54, Alex Samoutin wrote:
>
> > Yes I had absolutely the same problem. Some times first write command was
> > ignored, but second always successful. However I have no problem with
> erase
> > operations, only write some times was ignored.
> >
> > (For Thomas) It’s not a bad H/W or incorrect timing. I’ve played with
> > timing and result was the same. Also I have 5 boards with Toshiba NAND
> chip
> > and 2 of them are working fine without retry, but other 3 need retry for
> > normal operation.
>
> What timing params did you play with ?
> Are CLE/ALE connected to GPIO pins ?
> Do you use a ready function, which reads the R/B hardware pin ?
>
> Can you please check the following:
>
> 1. Add a delay into nand_wait and play with the time
>
> --- nand.c 14 Apr 2003 07:00:39 -0000 1.43
> +++ nand.c 30 Apr 2003 17:05:26 -0000
> @@ -226,6 +226,8 @@
>   this->hwcontrol (NAND_CTL_CLRALE);
>   }
>
> + udelay (500);
> +
>   /*
>   * program and erase have their own busy handlers
>   * status and sequential in needs no delay
>
> 2.. Report if that helps or changes anything
>
> 3. Remove the erase abort in nand_get_chip
> --- nand.c 14 Apr 2003 07:00:39 -0000 1.43
> +++ nand.c 30 Apr 2003 17:08:23 -0000
> @@ -287,16 +287,6 @@
>   return;
>   }
>
> - if (this->state == FL_ERASING) {
> - if (new_state != FL_ERASING) {
> - this->state = new_state;
> - spin_unlock_bh (&this->chip_lock);
> - nand_select (); /* select in any case */
> - this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> - return;
> - }
> - }
> -
>   set_current_state (TASK_UNINTERRUPTIBLE);
>   add_wait_queue (&this->wq, &wait);
>   spin_unlock_bh (&this->chip_lock);
>
> 4.. Report if that helps or changes anything
>
> Thanks
>
> --
> Thomas
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
