Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from web214.mail.yahoo.com ([128.11.68.114])
	by imladris.mvhi.com with smtp (Exim 2.12 #1)
	id 11cDlR-0005rx-00
	for mtd@infradead.org; Fri, 15 Oct 1999 21:15:45 +0100
Message-ID: <19991015201554.18428.rocketmail@web214.mail.yahoo.com>
Date: Fri, 15 Oct 1999 13:15:54 -0700 (PDT)
From: "Marco A. Moreno" <marcoamoreno@yahoo.com>
Subject: Re: AM29DL16x series driver
To: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



--- Alexander Larsson <alex@cendio.se> wrote:
> 
> 
> On Fri, 15 Oct 1999, Marco A. Moreno wrote:
> 
> > Hi,
> > 
> > I'm working on a project that is slated to use the 'DL162 and 'DL163 AMD
> parts.
> > I saw in the archives that someone wrote an 'LV160 driver.  I want to know
> if
> > there would be significant changes to the driver to support the DL parts
> which
> > differ in that they have flexible sectors.  Does the CFI take care of this?
> 
> > Any info would be greatly appreciated.
> 
> What do you mean by "flexible sectors"? The driver can handle flash chips
> with erase sectors of different sizes. 
> 
> / Alex
> 

Sorry about that, it's not the 16x parts that have what AMD calls the "Flexible
Sector Achitecture", it's the 800 parts.  There's a comment in the mtd memory
mapped code that says that the 800 parts aren't supported.  Now that I've taken
a closer look, I don't think that the amd_flash driver even depends on the
memory mapped code.  Is this true?

What I really meant to say was that it looks like the big difference between
the lv160 and the dl162/163 is that the 162/163 supports simultaneous
read/write capability.  It doesn't seem like this feature would warrant a
driver change.  Besides, if the kernel runs from RAM, then this feature never
gets used after the kernel is booted.  So, does anyone see any reason why the
lv160 driver wouldn't work for the dl162/163 chips?

Marco

=====

__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com


To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
