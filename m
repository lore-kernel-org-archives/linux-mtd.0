Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13f1yu-00033S-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 16:21:48 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13f1yl-00033M-00
	for mtd@infradead.org; Fri, 29 Sep 2000 16:21:40 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id QAA07290
	for <mtd@infradead.org>; Fri, 29 Sep 2000 16:21:07 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: SBC-MediaGX
In-reply-to: Your message of "Fri, 29 Sep 2000 14:55:05 +0200."
             <39D49129.7629180E@rug.ac.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 29 Sep 2000 16:15:44 +0100
Message-Id: <E13f1t2-0003Zd-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>after checking all the messages in the archive of this
>mailing list I managed to access the Intel Strataflash
>chip on our Arcom SBC-MediaGX board. I 'repartitioned' the flash:
>256kB for the BIOS extension, 1.5MB for DOS and the remainder
>for Linux. The linux partition was formatted with JFFS.
>Everything seems to work find although JFFS makes a lot
>of noise when mounting the partition, moreover it finds only
>13MB free and df only reports 4MB free... 

There may be sectors needing garbage collection. Try syncing it and having 
another look. As for why it's so slow, I'm not sure, but someone posted a 
patch a few days ago that should speed things up considerably (I haven't tried 
it).

>The next logical step would be to make the flash bootable
>by overwriting the BIOS extension. I'm a bit reluctant to
>do this as I don't want to make my board unbootable. E.g.
>what happens if there is something wrong with the new BIOS?
>Can you prevent somehow the BIOS on the board 
>from executing the BIOS extension in the flash? 

My understanding (you better check this before trying anything) is that the 
BIOS extension only contains the VBF code needed for DOS to see the VBF 
volume. If you trash it, all that will happen is that you won't be able to 
access the VBF volume, and you can always reinstall it from the Arcom floppy. 
The BIOS itself is in another flash chip entirely. I think.

What do you have in mind for a boot loader?

>Another question: why is the BIOS extension area soo big as
>the extension itself is only about 14kB? The autoexec.bat file
>on the Arcom bootfloppy mentions that the extension was enlarged
>some time ago to 256KB in order to accomodate the Windows CE
>registry???

Don't know. I stuck with 256kB on my board for the same reason you did. I 
don't think it's critical; what's the maximum size for a ROM extension? 16kB? 
32kB?

-- 
David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
