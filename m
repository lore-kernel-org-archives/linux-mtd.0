Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=alex)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11c8i4-0005Wh-00
	for mtd@infradead.org; Fri, 15 Oct 1999 15:51:57 +0100
Date: Fri, 15 Oct 1999 16:54:25 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: "Marco A. Moreno" <marcoamoreno@yahoo.com>
cc: mtd@infradead.org
Subject: Re: AM29DL16x series driver
In-Reply-To: <19991015140924.15581.rocketmail@web217.mail.yahoo.com>
Message-ID: <Pine.LNX.4.10.9910151652450.5371-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 15 Oct 1999, Marco A. Moreno wrote:

> Hi,
> 
> I'm working on a project that is slated to use the 'DL162 and 'DL163 AMD parts.
> I saw in the archives that someone wrote an 'LV160 driver.  I want to know if
> there would be significant changes to the driver to support the DL parts which
> differ in that they have flexible sectors.  Does the CFI take care of this? 
> Any info would be greatly appreciated.

What do you mean by "flexible sectors"? The driver can handle flash chips
with erase sectors of different sizes. 

/ Alex



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
