Received: from moutng.kundenserver.de ([212.227.126.186])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1915sq-0002zf-HI
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 15:40:04 +0100
Received: from [212.227.126.160] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1915sq-00012n-00
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 16:40:04 +0200
Received: from [217.227.92.20] (helo=comm.esd-electronics.com)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 1915sq-0001ME-00
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 16:40:04 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "Thayne Harbaugh" <tharbaugh@lnxi.com>
Date: Thu, 3 Apr 2003 16:33:29 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJIEHIFEAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
In-reply-to: <1049216388.25992.91.camel@tubarao>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thayne!

> > 2) Support for the ST39LF160 device.
> > The ID-check in every block doesn't work on this device, since
> it's block
> > size is smaller that it's unlock addresses.
>
> Somehow I don't understand what "block size smaller than unlock
> addresses" means.

On the SST39LF160 flash the block size is 0x1000 (4kByte). The unlock
addesses are 0xaaaa and 0x5554!

0xaaaa > 0x1000, right?

You can't even reach the unlock addresses in the first block!

> >  Therefore the ID-check in every
> > block has to disabled for SST devices.
>
> I was somewhat uncertain about this method - thought it would be enough
> to check just the first block.  The "check ID in every block" method was
> suggested by David Woodhouse.  I implemented it because it worked for
> the selection of devices I have access to - including an SST49LF040.

I have never seen this ID check for ever block in any other code. In my
opinion a little too much... _And_ not working on some devices!

> Should just the first block be checked for the ID for _all_ devices or
> should we have "if" statements to disable it for certain devices?  I
> don't like having a bunch of special cases, but I also prefer things to
> work.

I would go for checking only the first block on _all_ devices!

> > Please find attached a patch for these two problems (against
> the current cvs
> > version). Any comments? Could this be commited?
>
> I'll likely commit the 16bit devices today.  I also want to do some
> cleanup with unlock addresses - the addresses listed in jedec_table[]
> should be used in more places (I don't like the hard-coded magic numbers
> that appear in various sections of the code).

Fine...

Best regards,
Stefan.
