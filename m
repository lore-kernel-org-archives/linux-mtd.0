Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3Rlc-0005ic-N4
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 12:39:25 +0000
In-Reply-To: <1330627829.44517.YahooMailClassic@web29011.mail.ird.yahoo.com>
References: <OFF8581AC6.39235742-ONC12579B4.00629DA8-C12579B4.00633A79@transmode.se>
 <1330627829.44517.YahooMailClassic@web29011.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 2 Mar 2012 13:39:15 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Parsons <lost.distance@yahoo.com> wrote on 2012/03/01 19:50:29:
>
> --- On Thu, 1/3/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> > > > > It seems to me that waiting for SR[7:6]=00
> > instead of
> > > > just
> > > > > SR.6=0 would:
> > > > > 1. Have the same outcome.
> > > > > 2. Be strictly within spec; SR[7:6] have been
> > cleared
> > > > > therefore the Erase
> > > > > Resume command has been accepted.
> > > >
> > > > Actually on second thoughts maybe not: if the
> > erase has
> > > > actually completed
> > > > when we issue an Erase Resume command then SR.7
> > should read
> > > > back as 1 and we
> > > > end up looping forever. hmm...
> > >
> > > OK, how about this:
> > >
> > > 1. Erase Suspend now checks SR.6, exactly as it
> > *should* according to the
> > > spec flowchart.
> > >
> > > 2. If SR.6=0 then the erase has already completed, and
> > there is no need to set chip->erase_suspended or
> > subsequently issue an Erase Resume command.
> >
> > Wont work when you have interleaved chips, there one chip
> > may complete and the other not.
>
> OK, I see, I think: one chip might have finished erasing by the time we
> issue an Erase Suspend, but the other might not. Yikes, they don't make it
> easy for us.
>
> > It would be an optimization though, if all chips complete
> > then skip suspend state.
>
> And it might just preclude other problems elsewhere. Issuing an unnecessary
> Erase Resume does seem risky, given that the command code - 0xd0 - is so
> overloaded:
> 1. 3rd cycle of Buffered Program.
> 2. 2nd cycle of Buffered Enhanced Factory Program.
> 3. 2nd cycle of Block Erase.
> 4. 1st cycle of Program Resume.
> 5. 1st cycle of Erase Resume.
> 6. 2nd cycle of Unlock Block.
> That said, I presume the state machine already prevents any ambiguity.
>
> > > 3. If an Erase Resume command is needed then we know
> > that the erase has
> > > not completed, therefore it should be safe to wait for
> > SR[7:6]=00.
> >
> > Just wait for SR.6 to clear might work.
>
> That is what my 2nd patch does. Should I just submit that as V2?

Not sure yet, you would have add tmo support though and check
were to change state/oldstate as the loop drop the lock.

>
> > Perhaps adding 1 or 2 extra throw away status reads to
> > create a small delay instead?
>
> How much delay is enough for which platform and which chips? I would
> prefer just waiting for SR.6 to clear if that works.

The problem is very rare, the other case I mentioned is the only one I know of.
I seem to recall that in that case adding a throwaway status read cured his problem.
You could try, just so we known if it works and mail the other guy too, he might have
some more info.

 Jocke
