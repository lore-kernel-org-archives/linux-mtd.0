Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13f3q8-0003Mm-00
	for mtd-list@infradead.org; Fri, 29 Sep 2000 18:20:52 +0100
Received: from trappist.elis.rug.ac.be ([157.193.67.1] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13f3q7-0003Mg-00
	for mtd@infradead.org; Fri, 29 Sep 2000 18:20:51 +0100
Received: from rug.ac.be (polaris.elis.rug.ac.be [157.193.67.43])
	by trappist.elis.rug.ac.be (8.9.3/8.9.2) with ESMTP id TAA21437
	for <mtd@infradead.org>; Fri, 29 Sep 2000 19:20:49 +0200
Message-ID: <39D4CF6E.76E89B@rug.ac.be>
Date: Fri, 29 Sep 2000 19:20:46 +0200
From: Michiel Ronsse <Michiel.Ronsse@rug.ac.be>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: SBC-MediaGX
References: <E13f1t2-0003Zd-00@pearl.tao.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Given wrote:
> 
> >after checking all the messages in the archive of this
> >mailing list I managed to access the Intel Strataflash
> >chip on our Arcom SBC-MediaGX board. I 'repartitioned' the flash:
> >256kB for the BIOS extension, 1.5MB for DOS and the remainder
> >for Linux. The linux partition was formatted with JFFS.
> >Everything seems to work find although JFFS makes a lot
> >of noise when mounting the partition, moreover it finds only
> >13MB free and df only reports 4MB free...
> 
> There may be sectors needing garbage collection. Try syncing it and having
> another look. As for why it's so slow, I'm not sure, but someone posted a
> patch a few days ago that should speed things up considerably (I haven't tried
> it).

It seems the JFFS image made by mk.jffs was totaly f**ked up. The
garbage
collector freaked out after a while (endless loop) and managed to erase
the first few bytes from my FlashFX-BIOS image! However after each few
reboot/
mount/garbage collections everything seems to work fine now. Actually,
it
works like a charm!


> >The next logical step would be to make the flash bootable
> >by overwriting the BIOS extension. I'm a bit reluctant to
> >do this as I don't want to make my board unbootable. E.g.
> >what happens if there is something wrong with the new BIOS?
> >Can you prevent somehow the BIOS on the board
> >from executing the BIOS extension in the flash?
> 
> My understanding (you better check this before trying anything) is that the
> BIOS extension only contains the VBF code needed for DOS to see the VBF
> volume. If you trash it, all that will happen is that you won't be able to
> access the VBF volume, and you can always reinstall it from the Arcom floppy.
> The BIOS itself is in another flash chip entirely. I think.

As I understand it, the BIOS is in the first 256kB of the flash.
Disassembling
the first few bytes surely look like the start of a BIOS extension (e.g.
it
starts with the magic numbers AA55). Actually, after the first bytes
were
wiped out by the garbage collector, I couldn't access the Flash-drive
under DOS
anymore (the FlashFX message that 'flashes' by at bootup didn't appear
=> no
BIOS extension installed.)


> 
> What do you have in mind for a boot loader?

Good question that remains to be answered...

> 
> >Another question: why is the BIOS extension area soo big as
> >the extension itself is only about 14kB? The autoexec.bat file
> >on the Arcom bootfloppy mentions that the extension was enlarged
> >some time ago to 256KB in order to accomodate the Windows CE
> >registry???
> 
> Don't know. I stuck with 256kB on my board for the same reason you did. I
> don't think it's critical; what's the maximum size for a ROM extension? 16kB?
> 32kB?

The memory window it takes up at bootup (processor in real mode) is only
16kB big,
so this seems to be the maximum.



Michiel Ronsse.


BTW: my board now works like a charm. The flash starts with a BIOS
extension of
256kB, followed by a DOS/FlashFX partition of 1MB containing
loadlin+vmnlinuz and
I have a minimal Linux-system in the last partition of around 15MB.



-- 
+- Michiel Ronsse --- michiel.ronsse@rug.ac.be -+
| Parallel Information Systems Group            |
| ELIS - Ghent University  - Ghent, Belgium     |
| Phone: +32/9/264.33.67   Fax: +32/9/264.35.94 |
+------ http://www.elis.rug.ac.be/~ronsse ------+

In a train station the train stops, in a work station ...


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
