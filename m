Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UmsC-0006Ll-00
	for mtd-list@infradead.org; Fri, 01 Sep 2000 10:12:32 +0100
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Ums7-0006Lc-00
	for mtd@infradead.org; Fri, 01 Sep 2000 10:12:28 +0100
Message-ID: <39AF7363.2BBA3228@arcom.co.uk>
Date: Fri, 01 Sep 2000 10:14:11 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re; MTD support for 8x16 devices
Content-Type: multipart/mixed;
 boundary="------------BA90C70CFEB812BA59D94E6B"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------BA90C70CFEB812BA59D94E6B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

 
--------------BA90C70CFEB812BA59D94E6B
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <39AF67C3.C1CB4448@arcom.co.uk>
Date: Fri, 01 Sep 2000 09:24:35 +0100
From: David Vrabel <dvrabel@arcom.co.uk>
Organization: Arcom Control Systems Ltd
X-Mailer: Mozilla 4.72 [en] (X11; U; Linux 2.2.14 i686)
X-Accept-Language: en
MIME-Version: 1.0
To: Alice Hennessy <ahennessy@mvista.com>
Subject: Re: MTD support for 8x16 devices
References: <39AC4D1F.BFBEEA21@mvista.com>  <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> <9503.967625312@cygnus.co.uk> <39AF00C6.DA335C86@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Alice Hennessy wrote:

> The other product has a single strata chip (8x16 variety) set in byte mode so
> the bus width is 1.  The cfi ident info is requested at address 0xaa and read
> starting at 0x20 so this is new code that I've added.   I'll  merge my code to
> make use of the new define CFI_DEVICETYPE_X8 which I'm assuming was added for
> this purpose?

I have some Intel StrataFlash 28F640 which are 16x devices in 8x mode. 
It got it to work by setting the bus width to 2 (not 1) and fudging the
"next chip" detection to look in the right place (ie pretend the bus
width was 1).  This made a single chip look like two interleaved chips
but of course the chip size with the entire chip (not half) hence the
fudging.

I wonder is it might be a good idea to have something in struct map_info
which says that the devices are "interleaved internally"...?

While you're poking about in cfi_cmdset_0001.c you'll possibly need to
change the code which selects the appropriate access routines (it
currently only uses the interleave to select whether to use the 1_16 or 
2_by_8 routines)

> > I think it's probably best to keep it in a header file or in physmap.c
> > itself. The driver can default to no partitioning, and we can set up some
> > #defines at the beginning which allow people to change it as they see fit.

Since lots of people want partitioning (me included) is it possible to
have some sort of generic partitioning support instead of device
specific partitions?  Something in mtdcore.c? Something extra
mtdpartition.c?

David Vrabel

--------------BA90C70CFEB812BA59D94E6B--




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
