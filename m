Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13LpiK-0001U0-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 17:25:20 +0100
From: "Stephane Laroche" <stephane.laroche@colubris.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
   "David Vrabel" <dvrabel@arcom.co.uk>
Cc: <mtd@infradead.org>
Subject: RE: 2nd CFI chip detection fails sometimes 
Date: Mon, 7 Aug 2000 12:17:43 -0400
Message-ID: <NDBBJFCHBCKDFHNNGJAFMENOCBAA.stephane.laroche@colubris.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <6467.965658810@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I vote for the 2nd solution, as it's much easier and simpler than the 1st
one.

Also, I don't know how other people use MTD, but in my case I need to write
map drivers for the flash (and specify it's CFI compliant), which implies
that I know it's not RAM...

-Stephane

-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of David Woodhouse
Sent: Monday, August 07, 2000 10:34
To: David Vrabel
Cc: mtd@infradead.org
Subject: Re: 2nd CFI chip detection fails sometimes



dvrabel@arcom.co.uk said:
>  The line marked error causes problems because it can put the flash
> chip into an error state preventing correct detection.  We need some
> way of knowing if it's RAM before we do the write.  Suggestions
> welcome!

We should probably only put back the original value if we completely fail
to probe the device, _AND_ if it appears to be behaving like RAM (i.e. if
the contents of the address are exactly what we wrote to it.

Alternatively, we could accept the fact that we overwrite some bytes in a
RAM chip when we unload and reload its driver, and just not bother to write
back those bytes at all.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
