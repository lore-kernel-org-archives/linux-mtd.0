Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psuwf-0002lf-LN
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:30:46 +0000
Received: by wwb29 with SMTP id 29so1322010wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:30:44 -0800 (PST)
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:29:22 +0200
Message-ID: <1298629762.2798.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Peverley <pev@sketchymonkey.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 10:09 +0100, Ricard Wanderlof wrote:
> On Fri, 25 Feb 2011, Artem Bityutskiy wrote:
> > 
> > > On Thu, 2011-02-17 at 11:04 +0100, Ricard Wanderlof wrote:
> > > Which all goes to say that as Cooke notes in his document above, it is 
> > > necessary for the software to keep track of the number of erase cycles, 
> > > and not just rely in the erase/write status that the chip itself reports.
> > 
> > Yeah, in UBI we do keep have erase counters, but we do not actually use
> > them to make decisions about whether to mark a block as good or bad.
> > Probably we should.
> 
> It's a difficult call. How bad is bad? If the spec says 100 000 cycles, 
> should we mark a block bad after that time, or could we in a certain case 
> go to 200 000 cycles and still get reasonable performance? It would all 
> depend on the application and the also specs of the actual chip in 
> question, which is something that cannot be read from the chip so it would 
> have to be configured.
> 
> I think the best way is for UBI to provide only wear levelling, in order 
> to use the flash optimally, then it's up to the system designer to design 
> the system so that the maxium erase cycle spec is not exceeded for the 
> life of the system.
> 
> Hm, perhaps there could be a tuning option, first to enable bad block 
> marking when the erase counters reach a certain value, and secondly a 
> parameter specifying the number of cycles. Most users would probably not 
> bother about this, but it would be there for those who want to make sure 
> that blocks are not used that potentially could be out of spec.

Yes, something like this. I am not going to do anything about this now,
just wanted to let potential UBI users know about this good idea.

Currently the mechanism to mark a block is bad is the torture function
failure: we write a pattern, read it back, compare, and do this several
times with different patterns. In case of any error in any step, or if
we read back something we did not write, or even if we get a bit-flip
when we read back the data, we bark the eraseblock as bad. Otherwise it
is returned to the pull of free eraseblocks.

See torture_peb() in drivers/mtd/ubi/io.c

This procedure is not ideal, and could be improved:

a) we could store amount of times the eraseblock was tortured. Since we
torture only if there was a write error, too many torture session would
indicate that the eraseblock is unstable.
b) we could take into account the erase count somehow.

But yes, the threshold would probably set up by the system designer at
the end.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
