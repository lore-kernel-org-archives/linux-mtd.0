Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dlMns-0001SO-Hc
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 22:10:15 +0000
Received: by mail-wm0-x241.google.com with SMTP id z132so1046648wmg.5
 for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2017 15:09:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170825234816.2d6d31b4@bbrezillon>
References: <1503394972-12541-1-git-send-email-andrea.adami@gmail.com>
 <20170822145424.54e57b94@bbrezillon>
 <CAAQYJAsTCy2nWYjMTmSGqSCn-ttWJ5H8LANmyaaVJ+mPs7x1bg@mail.gmail.com>
 <20170824120428.46e266c7@bbrezillon>
 <CAAQYJAtkHGO1-5mQsgmAA=Q6oOuN0e=OaNftXE=iKBoUYBs8Kg@mail.gmail.com>
 <20170824132710.5fdea20c@bbrezillon> <20170825045314.GC68252@google.com>
 <CAAQYJAvtr4xTKX4p2zSY6WqQTfNu3WH2Ywq13T9rbakD2pLc5A@mail.gmail.com>
 <20170825234816.2d6d31b4@bbrezillon>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 26 Aug 2017 00:09:49 +0200
Message-ID: <CAAQYJAv29KEGnkYXULiyCgS1iDrTnOuyCinCrn9iTmCWJ+b2mQ@mail.gmail.com>
Subject: Re: [PATCH v6] mtd: sharpslpart: Add sharpslpart partition parser
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 25, 2017 at 11:48 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 25 Aug 2017 19:50:25 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
>
>> On Fri, Aug 25, 2017 at 6:53 AM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > On Thu, Aug 24, 2017 at 01:27:10PM +0200, Boris Brezillon wrote:
>> >> On Thu, 24 Aug 2017 12:30:02 +0200
>> >> Andrea Adami <andrea.adami@gmail.com> wrote:
>> >>
>> >> > On Thu, Aug 24, 2017 at 12:04 PM, Boris Brezillon
>> >> > <boris.brezillon@free-electrons.com> wrote:
>> >> > > On Thu, 24 Aug 2017 11:19:56 +0200
>> >> > > Andrea Adami <andrea.adami@gmail.com> wrote:
>> >
>> > ...
>> >
>> >> > >> >> +     /* create physical-logical table */
>> >> > >> >> +     for (block_num = 0; block_num < phymax; block_num++) {
>> >> > >> >> +             block_adr = block_num * mtd->erasesize;
>> >> > >> >> +
>> >> > >> >> +             if (mtd_block_isbad(mtd, block_adr))
>> >> > >> >> +                     continue;
>> >> > >> >> +
>> >> > >> >> +             if (sharpsl_nand_read_oob(mtd, block_adr, mtd->oobsize, oob))
>> >> > >> >> +                     continue;
>> >> > >> >> +
>> >> > >> >> +             /* get logical block */
>> >> > >> >> +             log_num = sharpsl_nand_get_logical_num(oob);
>> >> > >> >> +
>> >> > >> >> +             /* FTL is not used? Exit here if the oob fingerprint is wrong */
>> >> > >> >> +             if (log_num == UINT_MAX) {
>> >> > >> >> +                     pr_info("sharpslpart: Sharp SL FTL not found.\n");
>> >> > >> >> +                     ret = -EINVAL;
>> >> > >> >> +                     goto exit;
>> >> > >> >> +             }
>> >> > >
>> >> > > Okay, I overlooked that part. Why do you exit if there's a fingerprint
>> >> > > mismatch? Can't you just ignore this physical block and continue
>> >> > > scanning the remaining ones?
>> >> >
>> >> > Norris asked to quit immediately in this case.
>> >> > https://patchwork.kernel.org/patch/9758361/
>> >
>> > I didn't specifically ask for you to quit in *that* case. Quoting myself
>> > here, as you did:
>> >
>> >> > "I wouldn't expect people to want to use this parser, but if we have a
>> >> > quick way to say "this doesn't match, skip me", then that would be
>> >> > helpful."
>> >> > "We don't want to waste too much time scanning for this partition
>> >> > table if possible."
>> >
>> > That means, is there something (not necessarily writting in the
>> > "original code" that you're massaging) that could be used to reliably
>> > detect that this is/isn't a valid "Sharp FTL"? I don't think the check
>> > you wrote is a good one. Particularly, you *don't* want to just abort
>> > completely because there's one corrupt block. This check is a
>> > reliability check (so you can possibly ignore old/bad copies and skip
>> > onto better blocks), not a validity check. It is counter-productive to
>> > abort here, IIUC.
>> >
>> >> Actually, you don't save much by exiting on "bad OOB fingerprint". If
>> >> you look at the code you'll see that the only thing you check is
>> >> whether some oob portions are equal or not, and most of the time the
>> >> OOB area is left untouched by the upper layer, which means all free
>> >> bytes will be left to 0xff, which in turn means the "is fingerprint
>> >> good?" test will pass.
>> >
>> > Agreed.
>> >
>> > I'd drop this "abort early" check and just admit that it's not possible
>> > to do what I asked.
>>
>> Ok then, I have misunderstood you. The only time-saving would be to
>> skip the creation of the table.
>> In the specific cases, the older devices with erasesize 16KiB have
>> just 448 blocks and the routine doesn't really slow down.
>> I can imagine it would be a breeze for modern devices.
>>
>> I will just return -EINVAl and this error, as well as the eventual
>> parity-check error on a specific block, will be cut-off by the checks
>> and the cycle will move to next block.
>>
>> So I understand the sharpsl_nand_check_ooblayout()  could be also avoided.
>> Please confirm this, thanks.
>
> No, that check is still needed to bail out if someone tries to use
> this parser with an incompatible NAND controller/ECC engine. Though it
> should only be called once from your sharpsl_parse_mtd_partitions()
> function (one of the first thing you should do actually).
>
>>
>> >
>> >> > Now we are quitting ever before checking for parity erors ...
>> >>
>> >> Honestly, I'd recommend not using this parser for anything but SHARPSL
>> >> platforms, so I don't think we care much about the "scan all blocks"
>> >> overhead.
>> >
>> > Sounds about right.
>> >
>> >> Moreover, the sharpsl parser is the last one in the
>> >> part_parsers list, so it should be quite fast if the user specifies a
>> >> valid mtdparts= on the cmdline or valid partitions in the DT.
>> >
>> > Brian
>> >
>> > P.S. I alluded to it earlier, but I figured I should write it down
>> > properly here sometime, as food for thought; you don't actually need any
>> > of this parser at all if you're willing to contruct an initramfs that
>> > will do the parsing in user space (e.g., some scripting and 'nanddump';
>> > or link to libmtd) and then add partitions yourself (e.g., with
>> > 'mtdpart add ...', or calling the BLKPG ioctls directly). This would
>> > just require you have a kernel with CONFIG_MTD_PARTITIONED_MASTER=y.
>>
>> Brian, the first problem in this approach is the size: there are only
>> 1264KiB available for the zImage.
>> We accepted the challenge and wrote linux-kexecboot bootloader, a
>> kernel + couple of klibc-static binaries in the initramfs and we
>> special-cased the Zaurus adding the partition parser in userspace.
>>
>> Now, as widely discussed before, there are limits to this solution:
>> - first, we cannot oblige to flash this kernel+initramfs.
>
> Just like you cannot oblige people to update to a recent/mainline
> kernel.
>
>> - second, we need to build one kernel+initramfs for each model
>
> Why is that? If you have a userspace implementation of your part-parser
> only one initramfs is needed, or am I missing something?
>
>> - third, the machines are really the same from kernel pov, just mtdparts differ
>
> I don't get that one, sorry. If you have a userspace tool in your
> initramfs that creates the partitions from the partinfo definitions
> using BLKPG ioctls you'll still be able to keep one kernel and various
> partitioning.
>
>>
>> Soon we'll test a single kernel for the pxa25x and for the pxa27x models.
>
> Still don't see the link with the suggestion made by Brian.
>
>>
>> Honestly I did just glimpse at BLKPG ioctl because resizing for mtd
>> was added recently (iirc).
>> As maintainer for the cross-toolchain and of kexecboot I am of the
>> opinion that the cleanest solution is the in-kernel partition parser.
>
> We already had this discussion. As a maintainer of the MTD subsystem
> I'm concerned about adding support for an old FTL and part parser that
> has never been mainlined before and more importantly which you don't
> seem to understand.
> The question is, who is responsible for the code if something does not
> work. As I said many times, I'm not against adding new FTLs or
> part-parsers in the kernel, just find it worrisome that you failed to
> answer to some question about how it's supposed to work.
>
>>
>> Thanks for your time reviewing this...is just a partition parser for
>> some of the first commercial linux handhelds.
>
> Come on, not this argument again.
>
> On a final note, I'd like to say I spend time reviewing the code, and
> it looks good overall, but my concern about the FTL design still stands
> and I keep thinking that it's not such a good idea to support it in
> mainline just because some old devices used to use this FTL in their
> proprietary firmware. If people want to update their kernels why not
> forcing them to use an initramfs that hides all the ugly things in some
> specific userspace tools?
>

Boris,

I am really sorry but I won't answer again in detail about the issues
with repartitioning and the fact that I have no control over other
distributions, etc. etc.

I don't understand where is your problem now, after 6 reviews.
I'll be happy to send v7 with the added oob check and I'll have to add
you to the authors now :)

My point of view is:
1- Does Zaurus devices exist under arm/mach-pxa  YES
2- Are the devices maintained                                   YES
3- Is a new module/functionality provided                  YES

What is wrong in this?

Thanks

Andrea
