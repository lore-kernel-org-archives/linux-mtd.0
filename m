Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tQ4T-0006XD-00
	for mtd-list@infradead.org; Sat, 28 Apr 2001 09:27:17 +0100
Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tQ4R-0006X7-00
	for mtd@infradead.org; Sat, 28 Apr 2001 09:27:15 +0100
Message-ID: <000d01c0cfb4$af131460$4d02010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
References: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk> <01042316543802.01109@rob> <3AE4B5B3.26E340E8@daniel.com> <01042412450101.00394@rob> <3AE5950D.D10C1F8B@daniel.com> <000d01c0cf12$129fd700$4d02010a@lrpeople.com> <3AE9A4E4.EED412CA@daniel.com>
Subject: Re: Boot kernel from flash on CDPSC520 w/o BIOS!
Date: Sat, 28 Apr 2001 11:27:25 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Friday, April 27, Vipin Malic wrote :


> Alexander Melichenko wrote:
>
> > Hello, Vipin!
> > To boot kernel from flash I do :
> > - reset the board (z).
> > - init it (yi).
> > - load lstart16.abs to it (ns lstart16.abs ff800, ns lstart16.abs
7ff800).
>
> Nope. You need to load the lstart16.abs file to the BIOS FLASH chip, NOT
to
> the FLASH bank0
>
> >
> > - load zImage to it with offset 0 (ns zImage 0).
>
> Where did you init the root fs? Whe  zFlashImage boots, it will look to
mount
> the root fs. Also you need to
> tell zFlah image what the root device is. See the HOWTO for more details.
>
> >
> > After that I reboot CDP, but nothing is happening.
> > What step is wrong?
>
> This is quite a complicated procedure. Make sure that you can read/write
the
> /mtd partitions. Read the HOWTO.
>

Hello, Vipin!
Are the next steps correct?
- put lstart16.abs to 29F040 flash with offset 40000 (ns lstart16.abs
40000);
- put zImage to 29LV017 bank0 with offset 0 (???).
- put zFlash (root file system) to 29LV017 bank1 with offset 0 (???).
- rdev /dev/mtdblock??  /dev/mtdblock??.
- rdev -R zImage 0.

I experimented with that and other options, but currently result is bad.

Thank You.
           Alexander.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
