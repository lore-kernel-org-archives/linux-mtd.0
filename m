Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B5vr-0008Sg-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2002 04:12:15 +0000
Date: Sun, 10 Nov 2002 20:42:36 -0800
From: Marc Singer <elf@buici.com>
To: Wolfgang Denk <wd@denx.de>
Cc: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
  linux-mtd@lists.infradead.org
Subject: Re: crc32() optimization
Message-ID: <20021111044236.GA21104@buici.com>
References: <20021111013114.GB27214@buici.com> <20021111013738.4FEB410162@denx.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20021111013738.4FEB410162@denx.denx.de>
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

On Mon, Nov 11, 2002 at 02:37:33AM +0100, Wolfgang Denk wrote:
> In message <20021111013114.GB27214@buici.com> you wrote:
> >
> > > > What's "Duff's Device"?
> > > 
> > > It's a tricky way to implement general loop unrolling directly in  C.
> > > Applied  to your problem, code that looks like this (instead of 8 any
> > > other loop count may be used, but  you  need  to  adjust  the  "case"
> > > statements then):
> > > 
> > > 	register int n = (len + (8-1)) / 8;
> > > 
> > > 	switch (len % 8) {
> > > 	case 0: do {	val = crc32_table ... ;
> > > 	case 7:		val = crc32_table ... ;
> > > 	case 6:		val = crc32_table ... ;
> > > 	case 5:		val = crc32_table ... ;
> > > 	case 4:		val = crc32_table ... ;
> > > 	case 3:		val = crc32_table ... ;
> > > 	case 2:		val = crc32_table ... ;
> > > 	case 1:		val = crc32_table ... ;
> > > 		} while (--n > 0);
> > > 	}
> > 
> > This doesn't look right to me.  You are decrementing n but using the
> > modulus of len in the switch.  The len modulus is correct when n == 1,
> > but not when n > 1.  The idea makes sense, but the implementation
> > appears to be missing a detail.
> 
> You don't understand. The  switch  is  only  needed  for  the  first,
> partial loop where we want less than N statements; then we're nunning
> the remaining fully unrolled loos in the do{}while loop.

I see.  I misread the code.  I cannot see why this would not be better
than the original poster's version.  I'll test it on my code to see if
there is an improvement. 


> > As for performance problems, I believe that the trouble is evident
> > from the assembler output.  The reason that the unrolled loop is more
> > efficient than the simple loop is mainly because you don't jump as
> > often.  We all know that jumps tend to perturb the instruction fetch
> > queue and cache.
> 
> Did you enable optimization?

Indeed.  But it doesn't matter since it executes the switch jump only
one time.
