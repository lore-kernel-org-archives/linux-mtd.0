Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3TUw-0008OY-4d
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 14:30:18 +0000
In-Reply-To: <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
References: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
 <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 2 Mar 2012 15:30:11 +0100
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

Paul Parsons <lost.distance@yahoo.com> wrote on 2012/03/02 15:06:33:
>
> --- On Fri, 2/3/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> > > > > 2. If SR.6=0 then the erase has already
> > completed, and
> > > > there is no need to set chip->erase_suspended
> > or
> > > > subsequently issue an Erase Resume command.
> > > >
> > > > Wont work when you have interleaved chips, there
> > one chip
> > > > may complete and the other not.
> > >
> > > OK, I see, I think: one chip might have finished
> > erasing by the time we
> > > issue an Erase Suspend, but the other might not. Yikes,
> > they don't make it
> > > easy for us.
>
> Thinking about this more, it shouldn't matter if not all interleaved chips
> have completed their erase. We should initiate Erase Resume to *all* chips
> if we find that *any* chips have suspended. The worse that happens is that
> we issue unnecessary resumes to those chips which have already completed.
> Since this is what the current MTD driver already does it shouldn't be a
> problem.

Absolutely, this happens already today. What is missing it if all chips are finished,
then you don't have to resume at all. That could save some erase time.

>
> > > > Just wait for SR.6 to clear might work.
> > >
> > > That is what my 2nd patch does. Should I just submit
> > that as V2?
> >
> > Not sure yet, you would have add tmo support though and
> > check
> > were to change state/oldstate as the loop drop the lock.
>
> OK.
>
> > > > Perhaps adding 1 or 2 extra throw away status
> > reads to
> > > > create a small delay instead?
> > >
> > > How much delay is enough for which platform and which
> > chips? I would
> > > prefer just waiting for SR.6 to clear if that works.
> >
> > The problem is very rare, the other case I mentioned is the
> > only one I know of.
> > I seem to recall that in that case adding a throwaway status
> > read cured his problem.
> > You could try, just so we known if it works and mail the
> > other guy too, he might have
> > some more info.
>
> The problem only became a problem for me after I switched from JFFS2 to
> UBIFS. I found that UBIFS would make file systems read-only. Either JFFS2
> was more forgiving of CFI errors, or UBIFS exercised CFI in new ways that
> provoked the errors. As others switch from JFFS2 to UBIFS they too might
> find the same problem.

yes, UBI probably has some different use. One seems that it keeps erasing the
same block over and over again if the erase fails. JFFS2 doesn't do that since
you can't trust a block that is failing erase(how can you be sure that write will work?)
So, IMHO, UBIFS should reconsider this policy.

On that note, have you noticed any difference between JFFS2 and UBIFS?
Is performance comparable?

 Jocke
