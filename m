Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BcDp-0008Iv-00
	for mtd-list@infradead.org; Mon, 10 Jul 2000 12:59:37 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13BcDn-0008Io-00
	for mtd@infradead.org; Mon, 10 Jul 2000 12:59:36 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Mon, 10 Jul 2000 14:57:58 +0300 (IDT)
To: rmoya@tsai.es
CC: MTD <mtd@infradead.org>
Subject: plilo problems
In-Reply-To: <93086896@toto.iv>
Message-ID: <14697.47343.431809.752099@jodie.lucid>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Rodrigo Moya writes ("Re: Re: Re: Re: plilo problems"):

> Well, now my kernel is 436367 bytes, and the problem is still there. But I
> get a different LILO prompt:
> 
> > LILO
> > )boot:

Try an even smaller kernel.  Also check that LILO reads from the
correct places.  That is, make sure your /etc/lilo.conf tells it to
look for the kernel/boot loader/map in the flash, and not on a hard
disk that you might remove.

Also, you might want to use the same LILO and boot.b on a hard disk,
and see if it works there.  Other than that, I can't much help you
out.

Oh - one more thing you might want to check is to run the same LILO,
without the firmware (either install the .fff file, or press ctl+alt+b 
at boot when you see the M-Systems' messages to disable the firmware loading).

> Any time I run lilo, I then boot from DOS to put the firmware (with
> dupdate). Is that the correct way? Or it is needed only once?

You only need it once.  Note, though, that there are _two_ firmwares - 
one that is just 0's (the .fff file) and one which actually has the
firmware.  If you install the .fff file, you erase the firmware, so
you'll need to install it again, of course.  However, after you
installed the firmware, you don't need to re-install it every time.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
