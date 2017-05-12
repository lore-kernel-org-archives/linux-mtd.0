Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d961w-0005Jx-Fz
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 08:34:34 +0000
Received: by mail-wm0-x244.google.com with SMTP id y10so12277607wmh.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 May 2017 01:34:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170512102407.217b805a@bbrezillon>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
From: Mario Rugiero <mrugiero@gmail.com>
Date: Fri, 12 May 2017 05:34:10 -0300
Message-ID: <CAKKQwLTVpsu8j50BkqkgBwk9A3rPfrYDUTYDXbAn_OiA-tUd7g@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-05-12 5:24 GMT-03:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Fri, 12 May 2017 05:16:08 -0300
> Mario Rugiero <mrugiero@gmail.com> wrote:
>
>> 2017-05-12 5:12 GMT-03:00 Richard Weinberger <richard.weinberger@gmail.com>:
>> > Mario,
>> >
>> > On Fri, May 12, 2017 at 7:39 AM, Mario J. Rugiero <mrugiero@gmail.com> wrote:
>> >> Some chips used under a custom vendor driver can get their blocks
>> >> incorrectly detected as bad blocks, out of incompatibilities
>> >> between such drivers and MTD drivers.
>> >> When there are too many misdetected bad blocks, the device becomes
>> >> unusable because a bad block table can't be allocated, aside from
>> >> all the legitimately good blocks which become unusable under these
>> >> conditions.
>> >> This adds a build option to workaround the issue by enabling the
>> >> user to free up space regardless of what the driver thinks about
>> >> the blocks.
>> >
>> > Hmm, this sounds like a gross hack.
>> It is, but I see no other solution. The NAND chips were used in an
>> incompatible way by a hack-n-slash driver made by allwinner, and
>> trying to load them with a proper MTD driver fails miserably if this
>> is not done.
>> If anyone can propose a better solution I'll more than happily implement it.
>> I'm open to suggestions, and of course I'm open to rejection of my
>> patches if needed.
>
> u-boot provides the nand.scrub command, which does exactly what you're
> looking for. And no, I don't think it's a good idea to allow erasing
> bad blocks, at least not by default.
>
> If we really want to support this feature in linux, this should be
> explicitly enabled through debugfs.
If I do this, does it stand a chance at getting upstream?
If so, I'll have it done soon.
Note however that the build option is disabled by default. I get that
there should also be one runtime option, disabled by default, exposed
through debugfs. Does that sound right?
>
>> >
>> >> Example usage: recovering NAND chips on sunxi devices, as explained
>> >> here: http://linux-sunxi.org/Mainline_NAND_Howto#Known_issues
>> >
>> > What this wiki suggests is not wise.
>> > How can you know which blocks are really bad and which not?
>> You don't, at least not without an even grosser hack implementing read
>> support for their incompatible format.
>> Would that be better? I might attempt it if desired.
>
> No, please don't do that, at least not in the kernel. If you really
> want to parse the old format, you should develop a tool that reads NAND
> pages in raw mode, stores the list of bad blocks somewhere and then
> re-use this list to select which blocks should be forcibly erased.
>
> Not sure it's worth the pain :-).
It's worth the pain to me. I'm dealing with a bit rotten 3.4 based
pile of cr*p on production because of this. Whatever I have to do to
get those machines running the mainline kernel is worth it.
