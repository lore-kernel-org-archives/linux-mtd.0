Received: from [80.68.244.50] (helo=smtp.hotbox.ru)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19XleD-0003Tn-C2
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2003 18:44:01 +0100
Message-ID: <000e01c340c1$73ca2800$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: <tglx@linutronix.de>, "Thayne Harbaugh" <tharbaugh@lnxi.com>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<1051312243.1172.388.camel@tubarao>
	<000d01c30f39$3a05d880$1a00a8c0@itc.intrinsyc.com>
	<200304302013.41845.tglx@linutronix.de>
Date: Wed, 2 Jul 2003 10:43:11 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1251"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,



Sorry for big delay with answer – I had no hardware to test. Now I got my
CerfCube 405ep back and can play with it.

So I had two problems

  1.. Write verify sometimes fail
  2.. Write operation during erase sometimes cause data corruption


Hardware details :

- NAND chip Toshiba TC58256AFT

- ALE/CLE and CE connected to GPIO

- R/B pin connected to GPIO and I use ready function which reads it pin.

- I played with different timings – even slowest setting gets  me the same
result



1-st problem was solved by applying new MTD snapshot  (Jun 26). It’s look
like nand_deselect(); nand_select() fixes the problem.



However  after applying new MTD release the 2-nd problem still remained.
Then I comment out erase abort in nand_get_chip (as you suggested) and it
fixes my second problem!



Could you remove this erase abort from MTD source? I think it will not
affect much on efficiency.



BTW -  jedec_probe.c file has no #include <linux/init.h> . And it cause
compilation problem within my source tree.



Alex Samoutin

Intrinsyc Software.







----- Original Message -----

From: "Thomas Gleixner" <tglx@linutronix.de>

To: "Alex Samoutin" <samoutin@hotbox.ru>; "Thayne Harbaugh"
<tharbaugh@lnxi.com>

Cc: <linux-mtd@lists.infradead.org>

Sent: Wednesday, April 30, 2003 11:13 AM

Subject: Re: Fw: corrupt my NAND flash device



On Wednesday 30 April 2003 18:54, Alex Samoutin wrote:

> Yes I had absolutely the same problem. Some times first write command was
> ignored, but second always successful. However I have no problem with
erase
> operations, only write some times was ignored.
>
> (For Thomas) It’s not a bad H/W or incorrect timing. I’ve played with
> timing and result was the same. Also I have 5 boards with Toshiba NAND
chip
> and 2 of them are working fine without retry, but other 3 need retry for
> normal operation.

What timing params did you play with ?
Are CLE/ALE connected to GPIO pins ?
Do you use a ready function, which reads the R/B hardware pin ?

Can you please check the following:

1. Add a delay into nand_wait and play with the time

--- nand.c 14 Apr 2003 07:00:39 -0000 1.43
+++ nand.c 30 Apr 2003 17:05:26 -0000
@@ -226,6 +226,8 @@
  this->hwcontrol (NAND_CTL_CLRALE);
  }

+ udelay (500);
+
  /*
  * program and erase have their own busy handlers
  * status and sequential in needs no delay

2.. Report if that helps or changes anything

3. Remove the erase abort in nand_get_chip
--- nand.c 14 Apr 2003 07:00:39 -0000 1.43
+++ nand.c 30 Apr 2003 17:08:23 -0000
@@ -287,16 +287,6 @@
  return;
  }

- if (this->state == FL_ERASING) {
- if (new_state != FL_ERASING) {
- this->state = new_state;
- spin_unlock_bh (&this->chip_lock);
- nand_select (); /* select in any case */
- this->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
- return;
- }
- }
-
  set_current_state (TASK_UNINTERRUPTIBLE);
  add_wait_queue (&this->wq, &wait);
  spin_unlock_bh (&this->chip_lock);

4.. Report if that helps or changes anything

Thanks

--
Thomas
