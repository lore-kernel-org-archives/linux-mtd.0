Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhXAc-00061e-0h
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 23:49:38 +0000
Received: by fxm1 with SMTP id 1so7080973fxm.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Feb 2010 15:49:31 -0800 (PST)
Subject: Re: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <154304.22668.qm@web37606.mail.mud.yahoo.com>
References: <154304.22668.qm@web37606.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 17 Feb 2010 01:49:28 +0200
Message-ID: <1266364168.13308.35.camel@maxim-laptop>
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

On Tue, 2010-02-16 at 06:15 -0800, Alex Dubov wrote: 
> > > 
> > > It is quite possible. Some controllers will
> > automatically retrieve an
> > > "interrupt" field from the status register on each
> > media access (in fact,
> > > this behavior is mandated in parallel mode). Check if
> > the bits fit "inter-
> > > rupt" register bits.
> > Doesn't seem to map to anything.
> > 
> > 
> > 
> > 
> > 0x10 is polled on register writes
> > 0x20 is polled on command writes, and then 0x10 is polled
> > 0x50 (0x40 | 0x10) if polled after MS_TPC_GET_INT and only
> > it
> > 
> > 0x03 is mask for error detection, if found in any of above
> > polls, error
> > out.
> > 
> > The above was for register #19 (0xXX000000) 
> 
> So, it's probably an implementation specific register.
> There's no common standard for MS interfaces.
I think I now more or less understand what this reg means.

> 
> > 
> > after the MS_TPC_READ_LONG_DATA, 0x40 is polled, and
> > register #18 is
> > polled for 0x20 clear. These are all bits that are
> > accessed.
> > 
> > You try to tell me that controller itself issues TPCs,
> > reads their
> > responses, and puts that in registers, right? This is very
> > interesting.
> > 
> > Bus is half duplex, and there is a line that indicates who
> > sends data.
> > 
> > I currently understand that host sends an TPC, then card
> > sends a
> > response. Is it another TPC?
> 
> 
> Not at all.
> I answered this already.
> See below.
I  mean when controller reads the 'int status' it does send a TPC?
(I am sure that it does)

However mine can't do that and int status is read normally (yay...)


> 
> > > > As I understand it, TPCs are send in both
> > directions, and
> > > > nothing more.
> > > > There are no dedicated lines, or something like
> > that.
> > > 
> > > TPC means "transport protocol command" and it is only
> > send from host to
> > > media. Generally speaking, the whole thing works like
> > this (each point
> > > is a TPC):
> > > 
> > > 1. Host selects media register access window.
> > > 2. Host modifies media register values.
> > > 3. Host invokes media command.
> > > 4. Host reads media registers.
> > > 5. Host moves data around.
> > > 6. Lather, rinse, repeat.
> > 
> > > 
> > > > 
> > > > So status should be a content of the answer TPC
> > or
> > > > something like that.
> > > 
> > > It is not.
> > > 
> 
> Legacy MS protocol uses 3 meaningful lines: SCLK (clock), SDIO (data/
> command IO) and BS (bus state lane). There may be additional 3 or 7
> DIO lines but they are only used for bulk data transfer.
> 
> There are 4 hw states:
> 
> 1) BS at low - media is idle
> 2) BS goes to high - TPC is clocked in on SDIO
> 3) BS goes to low - host waits for level change on SDIO
> 4) BS goes to high - data can be clocked in/out on all data lines
> 5) BS goes to low again -> same as 1 (idle)
Thanks a lot for this explanation. Much better that in free ms spec.


> 
> Media can not initiate anything and can not send anything to host.
> Host is responsible to query the media state as necessary.
Now I understand. Just like USB I see.


> 
> > > > I wish I had the memstick spec (original not
> > pro)
> > > > 
> > > 
> > > There's an email address on Sony's website.
> > And the chances they give me the specs without NDA and a
> > lump of money
> > are higher that winning a lottery?
> > 
> 
> They will give you the spec for nothing if you're a certified sony
> developer. How do you become one is different question, but it is not
> money dependent.
I don't think this is easy, but maybe I give it a try.
Now I more or less understand what is going on.


Thank you very much!

Best regards,
Maxim Levitsky
