Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gMCU-0005R4-7t
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 11:22:54 +0100
Mime-Version: 1.0
Message-Id: <a05200f05bb4803789a4f@[130.161.115.44]>
In-Reply-To: <1059148567.28255.47.camel@lapdancer.baythorne.internal>
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>	
 <1059147413.28255.40.camel@lapdancer.baythorne.internal>	
 <a05200f01bb4700e6ff94@[130.161.115.44]>
 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
Date: Sat, 26 Jul 2003 12:22:46 +0200
To: David Woodhouse <dwmw2@infradead.org>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 11:56 -0400 25-07-2003, David Woodhouse wrote:
>On Fri, 2003-07-25 at 11:51, J.D. Bakker wrote:
>>  I have a two-hour old CVS; where should I look ?
>
>The fact that select_chip() now takes a 'chip_number' argument, that
>nand_scan() now takes a 'max_chips' argument and probes for up to that
>many... next is to fix the read/write/erase functions to select the
>_correct_ chip according to the address, etc.

/me grep(2)s source...

Ah, I see. Are you planning to always treat the NANDs as a linear 
array ? As I obviously have access to multi-NAND hardware, I'll 
happily beta-test this WIP.

>  > Does it *help* to have separate data/CLE/ALE ?
>
>Probably not. What may help, and to be honest I won't be 100% sure till
>we actually come to implement it, is having separate FR/B# so you can
>happily poll for completion and leave multiple chips _busy_
>independently.

Polling should be possible through the Status Read command 
(0x70/0x71) anyway, right ? Or would you want hardware to generate an 
interrupt when any of the FR/B# lines change ? Hmmm...

JDB
[now testing the CVS code with a single 1Gb NAND chip]
-- 
"There is a style of design I call "wishful thinking engineering."  It starts
  with something like "pigs can fly if you feed them enough beans" and develops
  utopian plans such as like having everyone commute to work riding on personal
  pigs, and along the way ignores minor details such as the consequent rain of
  the non-gaseous byproducts."

  (Vernon Schryver in n.a.n-a.e)
