Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=alex)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11d71s-0000GP-00
	for mtd@infradead.org; Mon, 18 Oct 1999 08:16:24 +0100
Date: Mon, 18 Oct 1999 09:18:51 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: "Marco A. Moreno" <marcoamoreno@yahoo.com>
cc: mtd@infradead.org
Subject: Re: AM29DL16x series driver
In-Reply-To: <19991015201554.18428.rocketmail@web214.mail.yahoo.com>
Message-ID: <Pine.LNX.4.10.9910180916340.5371-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 15 Oct 1999, Marco A. Moreno wrote:
> --- Alexander Larsson <alex@cendio.se> wrote:
> > What do you mean by "flexible sectors"? The driver can handle flash chips
> > with erase sectors of different sizes. 
> > 
> > / Alex
> > 
> 
> Sorry about that, it's not the 16x parts that have what AMD calls the "Flexible
> Sector Achitecture", it's the 800 parts.  There's a comment in the mtd memory
> mapped code that says that the 800 parts aren't supported.  Now that I've taken
> a closer look, I don't think that the amd_flash driver even depends on the
> memory mapped code.  Is this true?

Yes, this is true. The amd_flash driver was written by me totally
separate from the mtd effort. David was interested in merging it though.
 
/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
