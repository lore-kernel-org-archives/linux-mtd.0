Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nk5le-00061Y-4z
	for linux-mtd@lists.infradead.org; Wed, 24 Feb 2010 01:10:26 +0000
Received: by bwz10 with SMTP id 10so3185606bwz.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Feb 2010 17:10:19 -0800 (PST)
Subject: Re: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <75802.83415.qm@web37603.mail.mud.yahoo.com>
References: <75802.83415.qm@web37603.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Feb 2010 03:10:15 +0200
Message-ID: <1266973815.5068.8.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-23 at 01:01 -0800, Alex Dubov wrote: 
> > > > Alex, could you explain how a single TPC is
> > performed?
> > > > 
> > > > I currently first send MS_TPC_SET_RW_REG_ADRS,
> > and then
> > > > MS_TPC_READ_REG
> > > > 
> > > > When I send the TPC I specify both the tpc number
> > and its
> > > > len. Is the
> > > > len transmitted?
> > > 
> > > Of course, it is. How otherwise media would know how
> > many bits to sample
> > > in?
> > By watching the #BS?
> > Every clock cycle media reads 1 or 4 bits, when #BS goes
> > low it stops
> > reading...
> > Why otherwise one would need the #BS line?
> 
> It is so and not so.
> It appears, length is not transmitted as part of actual TPC payload.
> However, number of data payload bytes is always determined by the media
> register values. If this condition is not maintained all sorts of bad
> things may happen.
It is finally clear to me.
While googling I found that in fact the CRC is transmitted after data in
both directions
(ieeexplore.ieee.org/iel5/40/18745/00865865.pdf?arnumber=865865)

So, if host transmits too much or little that media expects, it will
treat wrong bytes as the CRC, and vise versa. thus both ends have to
know exactly how many bytes to expect.

One last thing that I probably will accepts as is. It appears that card
has some special way to tell the host that command if complete
regardless or serial/parallel mode, since there is special hw register
(bit 29 of register 16) that is polled only after commands, and I
verified that it takes significant time to turn that bit on, thus I
suspect that card can somehow inform the host that it not only accepted
the TPC, but actually done with the command.

Other that that, I have no more questions, thanks you again very much.

Best regards,
Maxim Levitsky
