Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eajvv-0001mn-0Y
 for linux-mtd@lists.infradead.org; Sun, 14 Jan 2018 15:10:53 +0000
Date: Sun, 14 Jan 2018 16:10:28 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Steve deRosier <derosier@gmail.com>
Cc: gudjon@gudjon.org, linux-mtd@lists.infradead.org
Subject: Re: ECC configuration of NAND from Linux (MEMSETOOBSEL)
Message-ID: <20180114161028.61f357d7@bbrezillon>
In-Reply-To: <CALLGbRLXXO_ZyDahNyohh+Fs1adbYEcMoxA3+7FRWfUJpua5tg@mail.gmail.com>
References: <2132429.fBNFCxDbQz@fessender> <20180112154639.63a8d133@bbrezillon>
 <2581607.A7Zl2yeV5U@fessender>
 <CALLGbRJ9SipkxtNiCigrPHQim5C38uq9EVsYK3WS_HN3aW-pqg@mail.gmail.com>
 <20180113092443.6222f2bf@bbrezillon>
 <CALLGbRLXXO_ZyDahNyohh+Fs1adbYEcMoxA3+7FRWfUJpua5tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steve,

On Sat, 13 Jan 2018 09:34:52 -0800
Steve deRosier <derosier@gmail.com> wrote:

> Hi Boris,
> 
> On Sat, Jan 13, 2018 at 12:24 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Fri, 12 Jan 2018 18:41:58 -0800
> > Steve deRosier <derosier@gmail.com> wrote:
> >  
> >> Hi Gudjon,
> >>
> >> On Fri, Jan 12, 2018 at 10:50 AM, Gudjon I. Gudjonsson
> >> <gudjon@gudjon.org> wrote:  
> >> > > setting you'll have to erase the whole flash and then change the ECC
> >> > > config in your DT or board file (note that not all drivers support
> >> > > adjusting the ECC strength/step-size).  
> >> > I will have to accept that but can you please tell me how to change the
> >> > ECC strength if my driver supports it? My plan is to use swupdate and
> >> > update the system using an SD-card that is already installed but I could
> >> > not find any reference to changing the ECC strength.
> >> > I am using the Atmel SAMA5d36 CPU and Micron mt29F2G08abaeawp
> >> > NAND flash.
> >> >  
> >>
> >> I might be wrong, but I don't think there's any mechanism to change
> >> the ECC strength on the fly with that processor and flash combination.
> >> In order to do it, you have to adjust it in your device-tree. I went
> >> through this in an upgrade scenario on a similar system a few years
> >> ago and came to the conclusion that it wasn't viable. As a matter of
> >> background, we had two spots on flash for the kernel (kernel-a,
> >> kernel-b), and two for a rootfs that was a UBIFS (rootfs-a, rootfs-b).
> >> Our upgrade procedure was to run on -a, and flash -b.  Next time, run
> >> on -b and flash on -a, etc... To do it, here's what would have had to
> >> be done:
> >>
> >> 1. Change the ECC strength in the DT, which then gets appended to the
> >> the kernel image. Which means when the new kernel boots the new ECC
> >> takes effect and not before. Note that the kernel that is running is
> >> using the whatever ECC it was set for.
> >> 2. Change our update script to _not_ write the ECC bits when it
> >> flashes... this is critical.
> >> 3. Now, (assuming running on -a partitions), erase kernel-b, rootfs-b.
> >> Then flash the new kernel and new rootfs to the -b partitions
> >> _with_out_ ECC bits!
> >> 4. Reboot to -b partitions. Note that you're now running a kernel
> >> supporting the new ECC layout, but without any ECC actually being
> >> performed.
> >> 5. Now, erase and reflash -a with the same new kernel and rootfs
> >> _with_ ECC bits.
> >> 6. Boot to -a. Now you're running with the new ECC layout and with ECC
> >> actually being done.
> >>
> >> I'm going from memory, so I might have missed a step or done something
> >> out of order, but you get the point. Now, why all of the above?  The
> >> problem is the number of ECC bits that gets flashed is dependent on
> >> the kernel running flashing it. So, having a kernel running 4 bits
> >> trying to flash 8, doesn't work.  The solution is by forcing all the
> >> written ECC bits to 0xffs by turing off the ECC bits when flashing
> >> with nandwrite. The kernel will read and ignore ECC, no matter the set
> >> strength, if there's no ECC bits set.  
> >
> > That's not true. If you have all ECC bytes set to 0xff it will simply
> > not boot (or at least it should not), because the ECC engine will report
> > errors everywhere.
> >  
> 
> Well, I'm glad you say it shouldn't work that way, because I happen to
> agree that it shouldn't. However, I can unequivocally confirm that on
> at least one Atmel processor with one specific NAND with kernel
> version 3.8, it does indeed work this way in practice. It's very clear
> from the behavior that ECC-configured, but with the OOB area being
> 0xffs is being interpreted as "I have no ECC data, so don't bother
> trying to do ECC". Now, obviously if there are bit-flips, what is read
> is invalid and can cause random operations. Which, unfortunately, is
> how I know what the behavior is.

You're right, it seems that this test [1], which is meant detect erased
pages, has the side effect of completely disabling ECC correction when
ECC bytes are all set to 0xff, which is obviously wrong!

> 
> I do not know if newer kernels behave this way on the platform in
> question. I solved the configuration and process issues long ago and
> so I never had to debug the problem on the newer 4.4 and 4.9 kernels
> the product uses.

I confirm that this trick does not work in mainline :-).

> 
> >> So, essentially, you have to
> >> write the new stuff with the enhanced bits with no bits actually
> >> written, in order to boot into it and then write it correctly a second
> >> time.  
> >
> > And this trick only works if your NAND supports subpage writes.  
> 
> The layout of the SLC NAND doesn't allow for subpage writes. It has a
> 2k-byte + 64 byte OOB page, with a BS of 64 pages. Standard operation
> is as expected: must erase in blocks, may program individual pages. It
> is possible to choose to write the 2k byte page with or without ECC
> and leave the erased 0xFFs in the OOB. This can be confirmed by
> working directly with the NAND using u-boot's nand commands. The NAND
> itself is non-ECC, and the PMECC controller on the processor only
> handles the algorithms. So what to write, including the OOB is all
> constructed in-software, written to the program page cache and then
> the command to write is issued. So, even without subpage writes, it's
> quite easy to write the data without writing the OOB.
> 
> And, remember - we're not writing the same page twice.  First write,
> with the erased OOB, of the rootfs in this case is to mtd7, and the
> second write, the one with the correct new ECC data to the OOB, is to
> mtd6. Perhaps thats the misunderstanding here.

Indeed, I thought you were overwriting already programmed pages.

> 
> I'm not trying to be argumentative, I'm just saying what does indeed
> happen on this specific platform I worked with. I shared the details
> of my experience as the OP has a similar platform, but what I
> experienced may or may not be applicable to his case. I wanted to
> explain _why_ it is such a pain. And that changing the ECC strength
> can not be undertaken lightly.

It's clearly a pain to change the ECC config after the products have
been shipped.

Regards,

Boris
