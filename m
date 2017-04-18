Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0V24-0000Fc-Vs
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 15:27:11 +0000
Received: by mail-oi0-x242.google.com with SMTP id a189so10721345oib.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 08:26:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170417164412.3dc5b457@bbrezillon>
References: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
 <1492287078-22369-2-git-send-email-andrea.adami@gmail.com>
 <d9ef9878-932c-955a-5ba6-c0f0ec03731c@gmail.com>
 <20170417164412.3dc5b457@bbrezillon>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 18 Apr 2017 18:26:47 +0300
Message-ID: <CALT56yPcuvcYuDnPFMCCqJXj2m4WciFK2NjzK2uX0G6L=30JJw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: sharpsl: add sharpslpart MTD partition parser
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Andrea Adami <andrea.adami@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-04-17 17:44 GMT+03:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Marek, Andrea,
>
> Before we even start discussing minor improvements (like coding style),
> I'd like to discuss the sharp FTL and partition table format, and
> decide whether we want to have such an old FTL included in the kernel.
>
> Actually, that's the very reason I asked Andrea to post his series as
> soon as possible even if some things were not perfect.
>
> I'll try to document myself on the on-flash format of the FTL and
> partition table before giving a definitive opinion, but I have the
> feeling this ancient FTL is not 100% safe, and by accepting an old
> (maybe unreliable?) FTL we are setting a precedent, and refusing other
> (broken) proprietary/vendor FTLs will be almost impossible after that.
>
> Maybe I'm wrong, and this FTL is really safe and can be used on other
> devices, that's why I'd like to understand how it works before giving
> my opinion.
>
>
> On Sun, 16 Apr 2017 18:07:47 +0200
> Marek Vasut <marek.vasut@gmail.com> wrote:
>
>> On 04/15/2017 10:11 PM, Andrea Adami wrote:
>> > The Sharp SL Series (Zaurus) PXA handhelds have 16/64/128M of NAND flash
>> > and share the same layout of the first 7M partition, managed by Sharp FTL.
>> >
>> > The purpose of this self-contained patch is to add a common parser and
>> > remove the hardcoded sizes in the board files (these devices are not yet
>> > converted to devicetree).
>> > Users will have benefits because the mtdparts= tag will not be necessary
>> > anymore and they will be free to repartition the little sized flash.
>> >
>> > The obsolete bootloader can not pass the partitioning info to modern
>> > kernels anymore so it has to be read from flash at known logical addresses.
>> > (see http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm )
>
>
> Okay, IMO that's not really a good argument to support this partition
> parser. As Richard and I already mentioned several times, if your
> bootloader is not capable of passing valid mtdparts= you can hardcode
> it in the kernel using a default CMDLINE.
>
> Now, I understand that you want to support multiple devices with the
> same kernel, and having this partition parser would simplify your job.
> I also know you are developing a 2nd stage bootloader (based on
> kexec+a minimal initramfs) to address the limitations of the
> non-upgradable 1st stage bootloader.
>
> According to the rest of the description, you already have user-space
> tools to manipulate the partition-table and those are aware of the FTL
> layer, so I think you have all the basic blocks to get rid of this
> in-kernel implementation.
>
> All you need is a way to extract the partitions from the 2nd stage
> bootloader (using some tools you have in your initramfs) and build the
> according mtdparts= parameter to pass to kexec when booting the real
> kernel (the one used by the system).
>
> You tried to explain why it was not doable, but I still don't see
> why.
> You first said that not all systems had CONFIG_MTD_CMDLINE_PARTS
> enabled and that some people were booting distro kernels. Honestly, I
> think you have more chances to have CONFIG_MTD_CMDLINE_PARTS in those
> distro kernels than having your custom FTL enabled.
> Then you tried to explain that with the user-space only solution you
> wouldn't be able to support systems where the user had resized the
> partitions with the nandlogical tool, and I still don't see why. Maybe
> you can give more details to explain why this is impossible.
>
> Just going through all these details to say that, IMO, we should only
> consider inclusion of this feature if we think it's safe, because I
> think all that is done here can be done from user-space.

Not everybody is using kexecboot preloader. Asking users to depend on
the exact bootloader is not viable solution in my opinion.

>
> One last thing I was wondering. You said you want to keep existing
> partitioning unchanged, but I'd recommend to just drop the existing
> partitioning and have a single 121MB partition with UBI on it.
> This way you get support for UBI volumes, which is doing exactly what
> this FTL+partition-table is doing but in a standard/safe way.
> What is forcing you to keep the existing partitioning exactly?

Mostly compatibility with pre-flashed recovery kernel and with older kernels/
setups. Yes, flash on those PDAs contains secondary kernel+rootfs which
are used to reflash the main kernel (=kexecboot in some cases) and filesystems.

Just a short notice: we are not asking to add a full support for FTL,
read/write, etc.
We are asking for a small enough support that is necessary to actually read
partition table. After that MTD partitions are accessed w/o any FTL.

And unfortunately we are stuck with old FTL/partition table format, since
nobody wants to replace existing Sharp bootloader.

>> >
>> > In kernel, under arch/arm/mach-pxa we have already 8 machines:
>> > MACH_POODLE, MACH_CORGI, MACH_SHEPERD, MACH_HUSKY, MACH_AKITA, MACH_SPITZ,
>> > MACH_BORZOI, MACH_TOSA.
>> > Lost after the 2.4 vendor kernel are MACH_BOXER and MACH_TERRIER.
>> >
>> > Almost every model has different factory partitioning: add to this the
>> > units can be repartitioned by users with userspace tools (nandlogical)
>> > and installers for popular (back then) linux distributions.
>> >
>> > The Parameter Area in the first (boot) partition extends from 0x00040000 to
>> > 0x0007bfff (176k) and contains two copies of the partition table:
>> > ...
>> > 0x00060000: Partition Info1 16k
>> > 0x00064000: Partition Info2 16k
>> > 0x00668000: Model           16k
>> > ...
>> >
>> > The first 7M partition is managed by the Sharp FTL reserving 5% + 1 blocks
>> > for wear-leveling: some blocks are remapped and one layer of translation
>> > (logical to physical) is necessary.
>> >
>> > There isn't much documentation about this FTL in the 2.4 sources, just the
>> > MTD methods for reading and writing using logical addresses and the block
>> > management (wear-leveling, use counter).
>> > For the purpose of the MTD parser only the read part of the code was taken.
>> >
>> > The NAND drivers that can use this parser are sharpsl.c and tmio_nand.c.
>> >
>> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
> I'll comment on the FTL and partition-table format later, after I had
> time to review it properly.
>
> In the meantime, I'd like other MTD maintainers to comment on my
> reply. Maybe I'm the only one to think that supporting
> old/unmaintainerd FTLs is a bad idea, and in this case I'll have to
> accept the situation ;-).
>
> Regards,
>
> Boris



-- 
With best wishes
Dmitry
