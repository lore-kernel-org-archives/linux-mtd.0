Received: from 1wt.eu ([62.212.114.60])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdi5h-0004l8-TF
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 14:58:50 +0000
Date: Tue, 5 Nov 2013 15:57:48 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: Ubiblock users call (Re: mvneta / openblocks switch)
Message-ID: <20131105145748.GE17316@1wt.eu>
References: <20131031135322.GN26784@titan.lakedaemon.net>
 <52738D6A.1010900@hitachi.com> <20131101130528.716e53d9@skate>
 <20131105103555.GD16420@1wt.eu> <5278E824.8050405@hitachi.com>
 <20131105135323.GA17316@1wt.eu> <20131105144003.GB9632@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131105144003.GB9632@localhost>
Cc: piergiorgio.beruto@gmail.com, Mike Frysinger <vapier@gentoo.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Tue, Nov 05, 2013 at 11:40:04AM -0300, Ezequiel Garcia wrote:
> On Tue, Nov 05, 2013 at 02:53:23PM +0100, Willy Tarreau wrote:
> > > 
> > > Hmm, could you tell me which github branch is good to try?
> 
> [...]
> 
> > 
> > then I have set up a large collection of patches, including Ezequiel's work
> > on the NAND flash, his UBI block devices and
> [...]
> 
> Hey Willy,
> 
> Which patches have you taken for UBI block device?

I found a patch you posted on a list (probably linux-mtd but I'm not certain)
which received very little feedback. I wanted to give it a try and found that
it was easy to integrate and that it worked fine out of the box.

> Can you describe your usage?

I wanted to avoid ubifs for having used too many non-recoverable FS
corruptions with it in the past (most likely due to a faulty NAND in
the iomega Iconnect, or at least problems with the timings). More
importantly, seeing that there is no fsck equivalent for it is not
something to reassure me, because each time I got an issue, it was
not possible to remount the FS nor to fix it and everything was lost.

Still, I like the idea of UBI and wanted to experiment with something
like this to offer a block device interface. And before starting any
work, I googled around, thinking "probably someone will already have
had this idea". I found your patch and gave it a try. I only played
with it for one evening and did not have any more time to power my
mirabox on since. But I see some potential in it. Having the ability
to support partitions, various FS types, etc... makes it easier to
migrate systems designed to work this way to NAND-based devices. This
is probably also one reason for the success of eMMC which tends to
replace raw NAND on some new boards.

For example, one of my distro's boot scripts automatically detects
the available partitions, checks for a mountable FS there, then
locates the current config and loads it. With a block device, I have
nothing to change at all. With other solutions, I have to reconsider
the boot process.

> I've been wanting to push this upstream since a long while, and the patches
> seem ready. However, given I'm not using these *at all*, I'd like to have some
> real users supporting the feature addition.

I definitely am a supporter. It's still too early for me to judge whether the
design is the best one or not, but the feature of presenting a reliable block
device on top of a NAND is clearly appealing to make NAND-based devices work
more similarly to other devices found in the x86 world and reduce the porting
effort. I was a bit sad to see that your work received to little feedback, and
am ashamed for not having sent you any since (nor retried your two latest
pxa3xx patch series).

> Just for reference, the latest work is here:
> 
> http://git.free-electrons.com/users/ezequiel-garcia/linux/log/?h=ubiblock-v4-two-cache
>
> And the user stuff:
> 
> http://git.free-electrons.com/users/ezequiel-garcia/mtd-utils/log/?h=ubiblkvol

Ah excellent, thank you for the links!

One thing I noticed is that my mirabox's u-boot is able to read and write an
UBI volume, but IIRC, it can read what I format from linux but if I write from
u-boot, the linux cannot reread it. That's where I remember it was late in the
night and I had to go back home, then I haven't had an opportunity to try again
since.

I would find it really convenient to be able to ubi-write a block image from
u-boot and read it from Linux using the same format. It would ease the
(re)installation process making abstraction of bad blocks.

Best regards,
Willy
