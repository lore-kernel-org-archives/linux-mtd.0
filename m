Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3AM9-0004aN-PW
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 18:03:59 +0000
In-Reply-To: <1330624434.10902.YahooMailClassic@web29011.mail.ird.yahoo.com>
References: <1330623502.1881.YahooMailClassic@web29011.mail.ird.yahoo.com>
 <1330624434.10902.YahooMailClassic@web29011.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OFF8581AC6.39235742-ONC12579B4.00629DA8-C12579B4.00633A79@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 1 Mar 2012 19:03:50 +0100
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

Paul Parsons <lost.distance@yahoo.com> wrote on 2012/03/01 18:53:54:
>
> --- On Thu, 1/3/12, Paul Parsons <lost.distance@yahoo.com> wrote:
> > From: Paul Parsons <lost.distance@yahoo.com>
> > Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
> > To: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
> > Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
> > Date: Thursday, 1 March, 2012, 17:38
> > --- On Thu, 1/3/12, Paul Parsons
> > <lost.distance@yahoo.com>
> > wrote:
> > > It seems to me that waiting for SR[7:6]=00 instead of
> > just
> > > SR.6=0 would:
> > > 1. Have the same outcome.
> > > 2. Be strictly within spec; SR[7:6] have been cleared
> > > therefore the Erase
> > > Resume command has been accepted.
> >
> > Actually on second thoughts maybe not: if the erase has
> > actually completed
> > when we issue an Erase Resume command then SR.7 should read
> > back as 1 and we
> > end up looping forever. hmm...
>
> OK, how about this:
>
> 1. Erase Suspend now checks SR.6, exactly as it *should* according to the
> spec flowchart.
>
> 2. If SR.6=0 then the erase has already completed, and there is no need to set chip->erase_suspended or subsequently issue an Erase Resume command.

Wont work when you have interleaved chips, there one chip may complete and the other not.
It would be an optimization though, if all chips complete then skip suspend state.

>
> 3. If an Erase Resume command is needed then we know that the erase has
> not completed, therefore it should be safe to wait for SR[7:6]=00.

Just wait for SR.6 to clear might work.

Perhaps adding 1 or 2 extra throw away status reads to create a small delay instead?

 Jocke
