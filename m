Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136s8h-0001xg-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 10:58:43 +0100
Received: from virgo.techno.spb.ru ([195.5.142.100])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 136s8f-0001xa-00
	for mtd@infradead.org; Tue, 27 Jun 2000 10:58:41 +0100
Received: from maverick (Maverick.Techno.Spb.Ru [195.5.142.101])
	by Virgo.Techno.Spb.Ru (8.9.3/8.9.3) with SMTP id OAA17823
	for <mtd@infradead.org>; Tue, 27 Jun 2000 14:01:15 +0400
Message-ID: <005001bfe01f$5267b700$658e05c3@techno.spb.ru>
From: "Nick Maximov" <maxs@techno.spb.ru>
To: <mtd@infradead.org>
Subject: does anyone here used Ampro modules?
Date: Tue, 27 Jun 2000 14:06:11 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Is there specific conditions for using MTD drivers with Ampro CM/p5e?

I still trying to figure out how it should work. Ampro said NEVER USE
ORIGINAL
M-SYSTEM UTILITIES TO FORMAT DOC!!!
Does MTD utilities compatible with my hardware or I need special tune for
them?

I tried though... And got BIOS corruption :) After first sucessful recovery
I tried to
load alternative firmware file (grub.exb) to DoC firmware area. Now my DoC
even unable to be formated!

Does anyone knows what is exact address map for DoC device?
As I know BIOS occupied 128K at 0xE000,
user extention BIOS located at 0xD000 address and should occupied up to 64K.
And then where the Flash Firmware is located? Why p5update utility unable to
update exact area in memory space?

--
Regards,
Nick Maximov

Techno-St.Petersburg
http://www.techno.spb.ru



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
