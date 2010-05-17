Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1ODsLq-0004QL-RY
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 04:54:51 +0000
Received: by gyb11 with SMTP id 11so1980812gyb.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 May 2010 21:54:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BF04DBE.5020309@shemesh.biz>
References: <4BF011D7.4010907@shemesh.biz>
	<AANLkTilU5vfVxCH9Ch7K6IUQAImLN83fewQdBptzeWiX@mail.gmail.com>
	<4BF041A3.70304@shemesh.biz>
	<AANLkTikIBhFudwi5DiiqROyhQjOSjJnyxxVoWLrE9ztj@mail.gmail.com>
	<4BF04DBE.5020309@shemesh.biz>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 17 May 2010 00:54:29 -0400
Message-ID: <AANLkTikjeciIH0tdmWIlgstKjaiCw66KwIImc-kmM5hI@mail.gmail.com>
Subject: Re: Wrong flash type in m25p80 driver
To: Shachar Shemesh <shachar@shemesh.biz>
Content-Type: text/plain; charset=UTF-8
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, May 16, 2010 at 15:55, Shachar Shemesh wrote:
> Mike Frysinger wrote:
>> so your answer is "there is no problem with calling it NOR flash"
>>
>> if it looks like a duck, quacks like a duck, and walks like a duck,
>> then why waste time calling it a DataDuck ?  for all intents and
>> purposes, all the kernel code/utilities that work with the flashes can
>> treat these SPI flashes as NOR flashes and everything works fine.
>
> Actually, that is not the case. Not even remotely.
>
> NOR flashes (and the m25p80 driver broadcasts it this way) have the ability
> to change individual bytes (and, some flashes, individual bits). The SPI
> flashes need to erase an entire block. NOR flashes are accessible via the
> data bus, these require complicated SPI transactions. They neither quack nor
> look anywhere near the same.

you havent shown how the current behavior results in non-working
flashes.  you probably can claim that things dont work as optimally as
possible according to the hardware, but as you noted, people work on
what interests/annoys them rather than what other people report.

> You might want to claim that they are NAND flashes, but, again, those are
> somewhat different. Dataflashes are the closest these come to, as far as I
> can tell.

it doesnt make sense to lump SPI and NAND together because NAND allows
for bad blocks.  both NOR and SPI are guaranteed to be good throughout
or the device is dead.  so for all practical uses thus far, SPI and
NOR operate the same way.

>> it isnt acceptable in the current format.  so until you clean it up
>> and submit it properly, nothing is going to happen.
>
> Care to elaborate? Have never submitted patches to Linux before. I don't
> mind RTFM, but please point me to the right manual.

all Linux documentation is in the folder aptly named "Documentation",
and from there it's a short hop to "SubmittingPatches".

>> this of course ignores the errors in the patch like calling it
>> DataFlash which you yourself clearly have shown is wrong.  DataFlash
>> is a special type of flash made by Atmel.  it has properties which
>> other SPI flashes do not.
>
> What would have really been necessary was a property saying "Serial flash".
> I'm afraid I don't fully understand all of the consequence of adding such a
> property, however. For one thing, this type is exported to user space. If
> that's the only way to get this patch in, I'll do it, of course. I was
> attempting to defer to your experience on the matter.

since it is an exported ABI as you noted, the details need to be
thought & hashed out before committing things as typically you cant go
back.  so why not start with a list of the differences that matter to
the MTD layers where the NOR flashes differ from SPI flashes.

emphasis here is on "where it matters to the MTD layers".  if the MTD
layers operate no differently whatsoever when encountering NOR and SPI
flashes, then it doesnt really make sense to declare a new type for
it.

> I am not so sure about the "properties which other SPI flashes do not". Not,
> at least, according to my research (which does not beat experience, but does
> beat obscure abstract statements).

iirc, dataflashes allow programming on individual bytes just like NOR
flashes.  most serial flashes (like the ST micro that started the SPI
flash driver in the first place) have to be programmed on a page
basis.  dataflashes also have more flexible erase structures (4kb,
32kb, or 64kb) while ST micro can only be erased at 64kb sectors.

my point is just that calling all SPI flashes "dataflashes" is
inherently wrong since only Atmel makes dataflashes.  it's also a bit
funny since you started off the thread with the complaint that calling
SPI flashes NOR flashes was wrong because SPI flashes arent NOR
flashes.  if you're going to declare a new category for SPI flashes,
then it should be something that applies to all the current SPI
flashes (just look in the m25p80.c driver to see all the ones
supported).

> Again, I'm trying to recruit the collective knowledge of this list in order
> to do the right thing, not get into a fight.

i'm just a schlub here.  i'm not a MTD maintainer and wont be
approving any patches.  but this list suffers from responses, so i
figured i'd throw something out i have a passing knowledge of.

> I don't mind doing the work,
> but I need help filling in the knowledge. I was told that newbies are
> welcome, so long as they show a willingness not to dump their desires on
> others, say by submitting actual patches.....

that is indeed the way.  but you cant really say "this patch is
intended for inclusion" when (1) it is incorrectly formatted and (2)
it has clearly unacceptable known bugs before the patch was even
reviewed.
-mike
