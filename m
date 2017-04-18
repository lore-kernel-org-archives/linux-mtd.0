Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0ReM-0006CD-Eo
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 11:50:28 +0000
Received: by mail-wr0-x243.google.com with SMTP id o21so24417574wrb.3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2017 04:50:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170418113556.54e25231@bbrezillon>
References: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
 <1492287078-22369-2-git-send-email-andrea.adami@gmail.com>
 <d9ef9878-932c-955a-5ba6-c0f0ec03731c@gmail.com>
 <20170417164412.3dc5b457@bbrezillon>
 <CAAQYJAsOJy=SCpBxvrQvfPt6LJ=FjAxDw2gr=5s-vT+8xM-DPQ@mail.gmail.com>
 <20170418113556.54e25231@bbrezillon>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 18 Apr 2017 13:50:03 +0200
Message-ID: <CAAQYJAvRb_A-S9fdiKYKqQM7CcYzUjaJb1ryYPzXrYbxu=eOjw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: sharpsl: add sharpslpart MTD partition parser
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 18, 2017 at 11:35 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Andrea,
>
> On Tue, 18 Apr 2017 10:58:02 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
>
>> Boris,
>> thanks for having read it.
>>
>> On Mon, Apr 17, 2017 at 4:44 PM, Boris Brezillon <
>> boris.brezillon@free-electrons.com> wrote:
>> > Marek, Andrea,
>> >
>> > Before we even start discussing minor improvements (like coding style),
>> > I'd like to discuss the sharp FTL and partition table format, and
>> > decide whether we want to have such an old FTL included in the kernel.
>> >
>> > Actually, that's the very reason I asked Andrea to post his series as
>> > soon as possible even if some things were not perfect.
>> >
>> > I'll try to document myself on the on-flash format of the FTL and
>> > partition table before giving a definitive opinion, but I have the
>> > feeling this ancient FTL is not 100% safe, and by accepting an old
>> > (maybe unreliable?) FTL we are setting a precedent, and refusing other
>> > (broken) proprietary/vendor FTLs will be almost impossible after that.
>> >
>> > Maybe I'm wrong, and this FTL is really safe and can be used on other
>> > devices, that's why I'd like to understand how it works before giving
>> > my opinion.
>> >
>>
>> I can't judge the work done by ARM/Sharp/Linaro 15 years ago...
>> I have only seen this on this PXA Sharp Zaurus SL series.
>>
>> For the records, these are the GPL 2.4 sources
>> https://github.com/LinuxPDA/Sharp_FTL_2.4.20
>
> That's exactly why I said someone should review it, and I'm not talking
> about the code itself, but the FTL+partition-table format.
>
>>
>> >
>> > On Sun, 16 Apr 2017 18:07:47 +0200
>> > Marek Vasut <marek.vasut@gmail.com> wrote:
>> >
>> >> On 04/15/2017 10:11 PM, Andrea Adami wrote:
>> >> > The Sharp SL Series (Zaurus) PXA handhelds have 16/64/128M of NAND
>> flash
>> >> > and share the same layout of the first 7M partition, managed by Sharp
>> FTL.
>> >> >
>> >> > The purpose of this self-contained patch is to add a common parser and
>> >> > remove the hardcoded sizes in the board files (these devices are not
>> yet
>> >> > converted to devicetree).
>> >> > Users will have benefits because the mtdparts= tag will not be
>> necessary
>> >> > anymore and they will be free to repartition the little sized flash.
>> >> >
>> >> > The obsolete bootloader can not pass the partitioning info to modern
>> >> > kernels anymore so it has to be read from flash at known logical
>> addresses.
>> >> > (see http://www.h5.dion.ne.jp/~rimemoon/zaurus/memo_006.htm )
>> >
>> >
>> > Okay, IMO that's not really a good argument to support this partition
>> > parser. As Richard and I already mentioned several times, if your
>> > bootloader is not capable of passing valid mtdparts= you can hardcode
>> > it in the kernel using a default CMDLINE.
>> >
>> We are simply trying to restore the ability for the kernel to read the
>> mtdparts.
>>
>> There are around many kernels and distros (OpenEmbedded, Arch, older 2.x
>> stuff).
>> Some do require to repartition: how can I know how other people partitioned?
>
> By using a 2nd stage bootloader, as you did.
>
>>
>> > Now, I understand that you want to support multiple devices with the
>> > same kernel, and having this partition parser would simplify your job.
>> > I also know you are developing a 2nd stage bootloader (based on
>> > kexec+a minimal initramfs) to address the limitations of the
>> > non-upgradable 1st stage bootloader.
>> >
>> > According to the rest of the description, you already have user-space
>> > tools to manipulate the partition-table and those are aware of the FTL
>> > layer, so I think you have all the basic blocks to get rid of this
>> > in-kernel implementation.
>> >
>> > All you need is a way to extract the partitions from the 2nd stage
>> > bootloader (using some tools you have in your initramfs) and build the
>> > according mtdparts= parameter to pass to kexec when booting the real
>> > kernel (the one used by the system).
>> >
>>
>> We have patched kexecboot long ago to do that.
>> https://github.com/kexecboot/kexecboot/blob/master/machine/zaurus.c
>
> Okay, so that's what I initially understood. You already have a fully
> functional user-space solution.
>
>>
>> This is done with a special kernel (linux-kexecboot) embedding the minimal
>> cpio and acting as 2nd stage bootloader.
>> It passes the mtdparts found in cmdline and does the extra trick of reading
>> it from mtd1 for zaurus.
>> You can even customize the cmdline in /boot/boot.cfg and hack the mtdparts
>> there.
>>
>> Neverthless, what you don't seem to understand is that I cannot force
>> people to use kexecboot or to customize cmdline parts as I like...
>> I do just build kernels and images for testing...I maintain the OE build
>> infrastructure, not one distro.
>
> Well, you can say "if you want to use a mainline kernel, stop using
> this sharp FTL+partition-table and start using a 2nd stage
> bootloader like kexecboot". What do they use right now to boot a new
> kernel (newer than the 2.4 one)?
>
No, because the proper way to reflash the unit is using the provided
infrastructure provided by Sharp: an updatewr.sh, a second kernel with
its initrd, containing the tools.
If one wants, he can just flash his kernel in mtd1 without kexecboot
and save space in the mtd partition..

>>
>> > You tried to explain why it was not doable, but I still don't see
>> > why.
>> > You first said that not all systems had CONFIG_MTD_CMDLINE_PARTS
>> > enabled and that some people were booting distro kernels. Honestly, I
>> > think you have more chances to have CONFIG_MTD_CMDLINE_PARTS in those
>> > distro kernels than having your custom FTL enabled.
>> > Then you tried to explain that with the user-space only solution you
>> > wouldn't be able to support systems where the user had resized the
>> > partitions with the nandlogical tool, and I still don't see why. Maybe
>> > you can give more details to explain why this is impossible.
>>
Th eprqactical problem we got is that for example SL-C3200 needs a
different partitioning in spitz.c in linux-kexecboot,
otherwise kexecboot cannot detect correctly the mtd partitions nor
pass the correct mtdparts=.

>> I don't understand why people should get crazy with the different mtdparts=
>> for each model.
>
> So you agree that passing partition info through the cmdline is a good
> solution?

No. What does make you think that? We didn't have alternatives so we did that.

>
>> IMHO we are restoring a basic functionality, anything weird.
>
> Are you talking about sharp FTL+part-table or the cmdline mtdparts=
> parameter?
>
Talking about the kernel knowing the mtdparts used by the (original)
bootloader and by the maintenance kernel/utils put in nand by Sharp.
CONFIG_MTD_CMDLINE_PARTS is just a workaround in this case: the real
tables are written, we just have to read these as done by Angel bl.

>>
>> >
>> > Just going through all these details to say that, IMO, we should only
>> > consider inclusion of this feature if we think it's safe, because I
>> > think all that is done here can be done from user-space.
>> >
>> Read only is safe.
>>
>
> This is a lie. AFAIU, you have all the necessary tools to update the
> partition table from user-space, so even if you only have read-only
> support in the kernel, one can corrupt it from userspace, and the
> kernel may not be able to recover from this corruption.
>

Why do we care about userland here?
These units can always be factory-restored, they just have to d/l the
full image.


> Honestly, if we want to support this FTL+partition-table-format in the
> kernel, I'd recommend that we add RW support, otherwise you'll keep
> having those external tools.

These tools are not meant for normal use.
The utility for repartitoning is since long included in the installers
so users really ignore the details.

If you think, I can try to readd the Write support but it is a bit
pointless for the purposes of the parser.

Regards
Andrea
