Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from [209.167.190.118] (helo=ampr.rt-control.com)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11cAv2-0005fV-00
	for mtd@infradead.org; Fri, 15 Oct 1999 18:13:28 +0100
From: "D. Jeff Dionne / VE3DJF" <jeff@rt-control.com>
Message-Id: <199910151711.RAA20593@ampr.rt-control.com>
Subject: Re: AM29DL16x series driver
In-Reply-To: <19991015140924.15581.rocketmail@web217.mail.yahoo.com> from "Marco A. Moreno" at "Oct 15, 1999  7: 9:24 am"
To: marcoamoreno@yahoo.com (Marco A. Moreno)
Date: Fri, 15 Oct 1999 17:11:08 +0000 (GMT)
Cc: mtd@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> Hi,
> 
> I'm working on a project that is slated to use the 'DL162 and 'DL163 AMD parts.
>  I saw in the archives that someone wrote an 'LV160 driver.  I want to know if

If the driver uses CFI, the problem is going to be that (some of?) the DL
series parts don't support CFI.  The Am29DL800 does not, for instance.
I'm not sure, but perhaps the reason is that CFI does not have the
concept of a split map with concurrent read/write capibility.  This
is a major issue for uClinux hardware, since we can't always be sure of a 
supply of LV _or_ DL parts.  Have you tried to buy these yet?  Good luck,
it's sort of take what you can get or wait.  It's not a harware problem
though, all are pin compatible from LV400 up to DL323.  The software
interface is not the same, so we can't rely on _any_ feature one series
has that the other does not if we want to keep our options open.

The only common functionality we feel we can be sure of is the Mfg and 
Type ID to find the sector sizes from a table.  Then we use the smallest
subset of commands common to all types we might end up using.


D. Jeff Dionne.

> there would be significant changes to the driver to support the DL parts which
> differ in that they have flexible sectors.  Does the CFI take care of this? 
> Any info would be greatly appreciated.
> 
> Thanks,
> Marco
> 
> 
> =====
> 
> __________________________________________________
> Do You Yahoo!?
> Bid and sell for free at http://auctions.yahoo.com
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
