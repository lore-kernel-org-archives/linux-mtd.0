Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikana.artecdesign.ee)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmpO7-00052y-Ub
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 03:22:29 -0500
Date: Fri, 7 Jan 2005 10:22:23 +0200 (EET)
From: Olav Kongas <ok@artecdesign.ee>
To: Dan Post <postster@gmail.com>
In-Reply-To: <9f920bdf0501061000699d8d77@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0501070939500.32416-100000@pcx>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.10, Sharp chip, incorrect numparts (was: Intel chip)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dan,

Thank you for your reply.

First, please excuse me about the incorrect information - it
is Sharp chip and not Intel one.

On Thu, 6 Jan 2005, Dan Post wrote:

> What flash chip are you using, e.g. model, density, etc?
> I see you're using a x16 buswidth, not a x32 pair.  That could be
> related to the problem--e.g. one small piece of code not taking into
> account the interleave--but I'm just making a wild stab in the dark,
> which could be utterly wrong.  Latest MTD code works for me on L18,
> 32MiB (28F256L18), albeit on a 2.4 kernel (I have yet to try 2.6.10).

My flash chip is lh28f640bfhe-pbtl90, 64M (4Mbit x 16), and
as Sharp docs say, its model no. is LHF64F12. It has 8
4Kword blocks at the beginning of the flash and then 127
32Kword blocks. There is just a single flash chip on the
board.

> Later MTD code, including that in 2.6.10, actually looks at the CFI,
> and in a rather nice manner (thanks Nicolas), but sounds like it has
> some missing cases...

Yeah, months ago I noticed that the kernel understood only
the 64kiB blocks but not the 8KiB ones at the beginning of
the flash.

I have to admit I know almost nothing about the CFI and
flashes. But I can print out more flash info and do testing,
if needed.

Sorry again for misinformation,
Olav
