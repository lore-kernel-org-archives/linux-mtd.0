Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13f4Hy-0003PI-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 18:49:38 +0100
Received: from [12.17.135.1] (helo=firegate.datalight.com ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13f4Hw-0003PC-00
	for mtd@infradead.org; Fri, 29 Sep 2000 18:49:36 +0100
Received: from loqtis2 ([10.0.0.242])
	by firegate.datalight.com (8.8.5/8.8.7) with SMTP id KAA05725
	for <mtd@infradead.org>; Fri, 29 Sep 2000 10:44:51 -0700
Message-Id: <200009291744.KAA05725@firegate.datalight.com>
Date: Fri, 29 Sep 2000 10:47:01 -0700
From: Tony Questad <tony.questad@datalight.com>
Subject: re[2]: SBC-MediaGX
To: <mtd@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>  My understanding (you better check this before trying anything) is that
>>   the BIOS extension only contains the VBF code needed for DOS to see the =
VBF=20
>>  volume. If you trash it, all that will happen is that you won't be able to
>>  access the VBF volume, and you can always reinstall it from the Arcom
>>   floppy.  The BIOS itself is in another flash chip entirely. I think.

That sounds right -- on the MediaGX the BIOS is contained in a seperate BIOS =
ROM, and the FlashFX BIOS Extension is stored in the beginning of the flash =
array.  Erasing this will remove the FlashFX driver, but if this is not a =
concern at this time, you can always reprogram it from the original Arcom =
disks.

>>  >Another question: why is the BIOS extension area soo big as
>>  >the extension itself is only about 14kB? The autoexec.bat file
>>  >on the Arcom bootfloppy mentions that the extension was enlarged
>>  >some time ago to 256KB in order to accomodate the Windows CE
>>  >registry???
>>  Don't know. I stuck with 256kB on my board for the same reason you did. I=20
>>  don't think it's critical; what's the maximum size for a ROM extension?
>>   16kB?  32kB?

What is the erase zone size on that board?  You would need to reserve space in =
erase zone sized chunks; On a flash part with 128KB erase zones, the minimum =
you would need to reserve would be 128KB, no matter how large your BIOS =
extensions are.  You do not want the area that your BIOS extension is in being =
moved around by FlashFX, or any wear leveling system as it would need to stay =
put in the beginning of the flash -- The reason for 256k escapes me at this =
moment, as I remember that the BIOS Extension for FlashFx is probably 16kb, but =
I am sure they were using the other area for CE related issues.  It may very =
well be that the first 128k (or 64k) was reserved as a full sector to handle =
the 16kb BIOS extension, and the rest was done for future growth.

****************************************************************************
 Senior Development Support Engineer   Datalight, Inc
 tel: 425 951 8086 x142                21520 30th Drive SE, Suite 110
 fax: 425 951 8094                     Bothell, WA
 email: tony.questad@datalight.com     98021


Leverage over 100 man-years of embedded system experience!  24-hour/7-day=20
support is found at: http://datalight.custhelp.com/cgi-bin/datalight
****************************************************************************


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
