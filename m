Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O26QA-0000QY-A2
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2010 17:30:39 +0000
Received: by fg-out-1718.google.com with SMTP id e21so263297fga.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Apr 2010 10:30:36 -0700 (PDT)
Subject: Re: UBI wear leveling / torture testing algorithms having trouble
	with MLC flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910FDD31773@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910FDD31773@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Apr 2010 20:30:24 +0300
Message-Id: <1271266225.2532.726.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Darwin,

On Mon, 2010-04-12 at 18:00 -0700, Darwin Rambo wrote:
> Setup:
> I am using a Samsung 2GB MLC flash with 4K page size and 8-bit
> hardware ECC support. I am using a 2.6.31 kernel, but if I read the 
> code right, the problem I see is in the latest 2.6.34-rc2 code as well.

as usually, I recommend using the ubifs-2.6.31 tree, which is vanilla
2.6.31 plus all UBI/UBIFS patches back-ported. Take a look here:

http://git.infradead.org/users/dedekind/ubifs-v2.6.31.git/shortlog

> Summary:
> I traced a torture test caught in a repeating loop, wearing out a 
> flash block. It appears that the torture test with it's simple 
> 0xA5/0x5A/0x00 pattern is passing, whereas actual application data 
> is consistently showing a bit flip on the same block. MLC flashes I 
> have used regularly show corrected errors over several blocks in time, 
> and also show corrected errors consistently due to program-disturb 
> effects, but these program disturb effects appear to be data dependent, 
> based on device geometry (e.g. adjacent multi-bit cell effects). The 
> scenario above can cause an repeating scrubbing / torture test loop 
> to occur. It is initiated by the nand driver reporting a bit correction 
> in a block which starts the scrubbing/torturing loop.

Bear in mind we developed and tested all the UBI/UBIFS stuff only on
SLC. In fact, I never used MLC, and do not know this well enough. Thus,
it is up to you to amend UBI to support MLC better, because you have the
HW.

> 
> Details:
> 
> (Please correct me if I have got ubi parts of this explanation wrong - Thanks).
> 
> A single bit correction is a relatively normal event with MLC flash and 
> this triggers a scrub operation in UBI in which the block is considered 
> marginal, and the data is moved from a marginal block to a good block.

Sounds right.

>  A 
> good block is one that is considered to have passed the UBI torture test, 
> which simply writes 0xA5, 0x5A, and 0x00 to a block with 3 erases, and 
> then does a 4th erase for the user data that will eventually be copied to 
> this block.

Well, it did not necessarily pass the torture test. It might have been
just normally erased in the past.

>  But this torture test is too simplistic since it doesn't 
> understand the geometry of MLC flashes and in particular, write-disturb 
> and read-disturb effects from neighboring cells and columns.

Right, it does not understand that. It is way less complicated than
that.

>  What's maybe 
> needed is a torture test that understands the geometry and the bit correction 
> level 1,4,8,12 etc and is able to toggle geometrically neighboring bits rather 
> than view it as a simple memory test, but this may be difficult.

May be, but then I think this function should be moved down from UBI to
the MTD level. Then the driver-level information like geometry may be
used.

>  Perhaps 
> torturing MLC blocks with only 3000 cycles is inappropriate anyways, why not 
> just trust the error correction and only mark uncorrectable blocks as bad?.

May be. But on the other hand, ignoring soft-errors completely is not
very good, as they may develop into hard-errors. Probably, as usually,
we need a balance.

> Since the torture test passes with no bit errors I believe that it didn't 
> find certain error correction patterns that appear with actual application 
> data. As a result, when the torture test passes, the block shows no correctable 
> errors, and is returned to the free pool.

Sounds OK, as expected.

>  The original block X that had a 
> correctable error is scrubbed and it's data is copied to the free block with 
> the highest erase count.

Right.

Although I have one note, which is not very important here, but it is
nice to know this.

UBI does select an eraseblock with the highes EC. However, this happens
only when the difference between the max. and min. erasecounters is less
than WL_FREE_MAX_DIFF. Otherwise, UBI selects an eraseblock with
eraseconter around min. EC + WL_FREE_MAX_DIFF.

In other words, if there is one or few eraseblocks with very high EC,
then they will be out of the WL loop till other eraseblocks catch up.

BTW, WL_FREE_MAX_DIFF is defined as

#define WL_FREE_MAX_DIFF (2*UBI_WL_THRESHOLD)

UBI_WL_THRESHOLD is configurable, and in case of MLC it should not be
the default 4096 bytes value. Ideally, we should compute this value
automatically using some parameters from the MTD level. However, current
MTD does not provide anything like that.

>  The highest erase count block is chosen and will remain 
> partially written and available for new scrubs, and data will be scrubbed to it 
> from other marginal blocks while the other blocks catch up in erase count. However, 
> if block Y previously had a bit error and was torture tested and passed, it's 
> erase count will go up by 4. As a result, block Y has a higher probability of 
> being the target of the copy from X to Y. But when the copy of actual application 
> data is done, block Y now shows a data-dependent correctable bit error again and 
> the scrub operation fails, and block Y is again sent out for torture testing, and 
> the process repeats itself until block Y either shows no error or the block wears 
> out, is marked bad, and another free block is chosen. 

Almost, but not exactly. UBI will stop picking Y when it's erasecounter
becomes greater than min. EC + WL_FREE_MAX_DIFF.

> So not only do blocks wear 
> out, but many blocks can be taken out of service as well by being marked bad.

Yeah, this sounds bad.

>  If 
> the available pool of free blocks for bad block management (typically 1% of the 
> total blocks in a partition) go bad, then the file system is remounted read-only 
> and the product becomes unusable for writable data in that partition.

Right, bad.

>  If I have a 
> 3000 erase MLC part, then only 750 quick loops of the scrub/torture (4 erase) cycle 
> will wear the block out.

This suggests you did not change the default UBI_WL_THRESHOLD = 4096.
You should set it to something smaller. This will make the problem less
severe, but will not fix it, of course.

>  At that point the next free block will be used which may 
> or may not show a corrected error.
> 
> Possible Solutions:
> I think that with MLC flashes, we perhaps shouldn't be so aggressive to scrub/torture 
> given the more frequent error rate than we see with SLC parts.

Absolutely.

>  Also hiding the actual 
> corrections in the nand driver to hide the problem in UBI isn't a good long term 
> solution easier.

Right.

>  The UBI algorithm doesn't appear to understand different levels 
> of correction possible. For example, on a 12-bit part, an single corrected error 
> is much more common and normal than say, 11 bit corrections on a marginal block, 
> but UBI treats 1 or 11 bits the same algorithmically. The ecc correction capability 
> maybe should be known by UBI so it can make better decisions about when to run 
> scrub/torture algorithms? Or perhaps we don't do torturing at all with MLC flash and 
> rely on the multi-bit correction instead to help us. The correction level and the 
> flash type could be useful information for UBI to use in deciding algorithms like these.
> 
> The short term solution might be for the nand driver to hide error corrections from 
> the UBI wear leveling software by reporting all good corrections as 0 errors. Then 
> UBI shouldn't start scrubbing and torturing on a single bit error in a block. Two 
> blocks with a single error that are part of the scrubbing/torturing duo start the 
> loop of flash erasing/wear out.

How about improving UBI a little and just teach it avoid doing any
scrubbing for eraseblocks with high enough erase-counter? Say, if UBI
notices a bit-flip in eraseblock A, then:

if (EC of eraseblock A < min. EC + WL_FREE_MAX_DIFF / 2)
	do_scrubbing();
else
	/* Do not do scrubbing for relatively "fresh" eraseblocks */

or something like that. This could be good enough to start with.

Also, torturing can be disabled or improved for MLC. This depends on how
much efforts you want to invest into UBI over MLC.

> I also attach a log file I collected demonstrating the problem, with some annotations 
> inline. The log are basically the existing printk's plus a few of my own converted to 
> log quickly to RAM to avoid cluttering the console and destabilizing real time. 
> 
> I hope this helps us understand and support MLC flash a bit better. I am curious to 
> know if anyone else has seen problems like these and how they dealt with them.

Not me at least :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
