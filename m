Received: from ipmail07.adl2.internode.on.net ([150.101.137.131])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P16KR-0004nR-6U
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 23:44:53 +0000
Message-ID: <4CA3CF60.5060705@call-direct.com.au>
Date: Thu, 30 Sep 2010 09:44:32 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
References: <70E876B0EA86DD4BAF101844BC814DFE093ED6015C@Cloud.RL.local>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED6015C@Cloud.RL.local>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jon Povey wrote:
> I can't speak for Mike, but I have run into a few situations where
> blocks were marked bad incorrectly. For example, the ROM bootloader of
> a chip I work with requires a different OOB layout to that specified by
> the NAND flash manufacturer, so to write the second-stage bootloader
> you must write data into what is, as far as the NAND maker is concerned,
> the OOB area. Then when u-boot or Linux loads, it finds no BBT, scans
> the bootloader, finds non-FF OOB and marks it bad.
> 
> These blocks are NOT really bad, and as engineers who know what we are
> doing, we need to be able to rewrite these for firmware upgrades and
> so on.

No problem with that. Anything *you* have marked bad is fair game.

Although I would always use an in-flash BBT for this kind of situation.
As you say, there are bootloaders, filesystems and hardware ECC that
will only work if you re-purpose the bad block marker region in the
OOB.

In such a case, just do the bad block scan once, at production time,
and write the BBT. Then change everything else to use that BBT. And
you leave the BBT alone during reflash.

> There are also situations of upgrading to new firmware that uses a
> different OOB layout (yes it's perverted, and yes I have been there),
> maybe we know a block is bad but it's full of FF, we are going to
> reboot and rebuild the BBT, we want to write a bad block marker in
> the new OOB - we need to be able to write the bad block.

You can't guarantee that that will always succeed. It's unlikely,
but you can end up with a marker that verifies correctly and then
fades, long before the official 10 endurance years are over.

It's a judgement call, of course. It somewhat depends whether
you're making a toy or a medical implant. Warranty return or
lawsuit. :-)

In the case you describe, I would use the old BBT to create the
new one directly, without attempting to write to the bad blocks.

> imo, the mtd-utils are low-level and specialist enough that allowing
> a --yes-i-really-know-what-i-am-doing kind of flag makes sense.
> Perhaps that support could even be an #ifdef, disabled by default.
> 
> Yes, someone using it has to really know what they are doing, including
> being aware of manufacturer-marked bad blocks.
> 
> Either way, I for one need to do these kind of low-level hacks, and if
> mtd kernel or utils have policy hardwired into them, happily I have
> the source and a compiler and can fix that locally.

I agree. I only wrote what I did to maybe contribute to the 
documentation. There seemed to be the sentiment that the tools
only skiped bad blocks because of some silly tradition.

I'm all in favour of adding the feature.


Best regards,

Iwo
