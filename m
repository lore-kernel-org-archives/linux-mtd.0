Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G8ehJ-0006Up-P6
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 11:01:27 -0400
Subject: Re: "Bad eraseblock" - NAND memory gone bad? (Zaurus, mtdblock)
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Jan Korger <Jan.Korger@uni-konstanz.de>
In-Reply-To: <20060801200451.26e54e4e@urania.exp.univie.ac.at>
References: <20060801200451.26e54e4e@urania.exp.univie.ac.at>
Content-Type: text/plain
Date: Thu, 03 Aug 2006 19:00:43 +0400
Message-Id: <1154617243.9457.16.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jan,

On Tue, 2006-08-01 at 20:04 +0200, Jan Korger wrote:
> Not working "properly" means the device does boot but the GUI (GPE 2.7,
> X) is not usable (various minor issues, could be due to lost
> configuration data). I can however manage to get a text console with
> bash and friends. I saved the output from 'dmesg' after a reboot:
> http://www.oesf.org/forums/index.php?act=Attach&type=post&id=2744
Hmm, I don't see any MTD/JFFS2-related message there.

> The interesting part, which makes me think I may have a NAND problem, is
> this:
> 
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Bad eraseblock 32 at 0x00080000
> Bad eraseblock 3095 at 0x0305c000
> Bad eraseblock 3099 at 0x0306c000
Well, few bad eraseblocks is normal for NANDs. And the message looks OK.

> I understand that NAND chips usually have a few badblocks from the very
> beginning, i.e. when they leave the manufacturer, and that NAND wears
> out after c. 100'000 write/erase cycles. How can I tell the difference?
> Are these worn out NAND blocks and -- if yes -- does this mean I have
> already reached the end of the NAND's lifetime?
Yeah, and more bad eraseblocks may appear with time.

Unfortunately, with MTD/JFFS2 you cannot say how worn-out are your
eraseblock. And it'll hardly help if I say that UBI - a new system -
does provide this information as it stores erase-counters. But this is
more for UBI advertising/promotion.


> The only test I did was running md5sum on /dev/mtdblock? (where ? is 0
> to 3). For mtdblock1 and mtdblock2 I saw "IO errors", these are the
> first two partions on the NAND chip in question, i.e. the kernel
> ("System area") and the "Root Filesystem". This is exactly where the
> badblocks as seen above are. (JFTR, I think mtdblock0 refers to another
> ROM.)

AFAIR mtdblock was not bad-block aware, so it may try accessing bad
eraseblocks. So it's all-right.

> If possible, I want to get the Zaurus back to a usable state. I have
> backed up my data but I don't want to experiment too much for not to
> make things worse. There are three options to operate on the
> built-in NAND: (I don't want to disassamble it. I don't have suitable
> tools anyways.)

One theory what could happen is that a new bad eraseblock appeared and
you lost you data. JFFS2 is bad-block aware (in theory) and one of those
3 bad eraseblocks could be marked bad by JFFS2.

Probably, if you re-flash your gizmo, it'll be fine - but this is just
my guess. Ideally, it would be nice to run a flash I/O test which would
examine your flash, find&mark new bad eraseblock before. But I don't
know such a tool.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
