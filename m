Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B32x-0008BQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2002 01:07:23 +0000
To: Marc Singer <elf@buici.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
	linux-mtd@lists.infradead.org
From: Wolfgang Denk <wd@denx.de>
Subject: Re: crc32() optimization 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sun, 10 Nov 2002 17:31:14 PST."
             <20021111013114.GB27214@buici.com>
Date: Mon, 11 Nov 2002 02:37:33 +0100
Message-Id: <20021111013738.4FEB410162@denx.denx.de>
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

In message <20021111013114.GB27214@buici.com> you wrote:
>
> > > What's "Duff's Device"?
> > 
> > It's a tricky way to implement general loop unrolling directly in  C.
> > Applied  to your problem, code that looks like this (instead of 8 any
> > other loop count may be used, but  you  need  to  adjust  the  "case"
> > statements then):
> > 
> > 	register int n = (len + (8-1)) / 8;
> > 
> > 	switch (len % 8) {
> > 	case 0: do {	val = crc32_table ... ;
> > 	case 7:		val = crc32_table ... ;
> > 	case 6:		val = crc32_table ... ;
> > 	case 5:		val = crc32_table ... ;
> > 	case 4:		val = crc32_table ... ;
> > 	case 3:		val = crc32_table ... ;
> > 	case 2:		val = crc32_table ... ;
> > 	case 1:		val = crc32_table ... ;
> > 		} while (--n > 0);
> > 	}
> 
> This doesn't look right to me.  You are decrementing n but using the
> modulus of len in the switch.  The len modulus is correct when n == 1,
> but not when n > 1.  The idea makes sense, but the implementation
> appears to be missing a detail.

You don't understand. The  switch  is  only  needed  for  the  first,
partial loop where we want less than N statements; then we're nunning
the remaining fully unrolled loos in the do{}while loop.

> As for performance problems, I believe that the trouble is evident
> from the assembler output.  The reason that the unrolled loop is more
> efficient than the simple loop is mainly because you don't jump as
> often.  We all know that jumps tend to perturb the instruction fetch
> queue and cache.

Did you enable optimization?

> Here is an example.  I know it is wrong, but it shows how the compiler
> implements the switch.  I've marked the problem jump.  It is executed

Irrelevant here.

> So, the version I posted may not be significantly better that the
> original one that unrolled 6 times.  It is just that unrolling to a

You save the extra while{} loop.


Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
See us @ electronica 2002 in Munich, Nov 12-15, Hall A3, Booth A3.325 
