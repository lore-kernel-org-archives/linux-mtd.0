Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eaH7d-0002MG-QP
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 08:25:04 +0000
Date: Sat, 13 Jan 2018 09:24:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Steve deRosier <derosier@gmail.com>
Cc: gudjon@gudjon.org, linux-mtd@lists.infradead.org
Subject: Re: ECC configuration of NAND from Linux (MEMSETOOBSEL)
Message-ID: <20180113092443.6222f2bf@bbrezillon>
In-Reply-To: <CALLGbRJ9SipkxtNiCigrPHQim5C38uq9EVsYK3WS_HN3aW-pqg@mail.gmail.com>
References: <2132429.fBNFCxDbQz@fessender> <20180112154639.63a8d133@bbrezillon>
 <2581607.A7Zl2yeV5U@fessender>
 <CALLGbRJ9SipkxtNiCigrPHQim5C38uq9EVsYK3WS_HN3aW-pqg@mail.gmail.com>
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

On Fri, 12 Jan 2018 18:41:58 -0800
Steve deRosier <derosier@gmail.com> wrote:

> Hi Gudjon,
> 
> On Fri, Jan 12, 2018 at 10:50 AM, Gudjon I. Gudjonsson
> <gudjon@gudjon.org> wrote:
> > > setting you'll have to erase the whole flash and then change the ECC
> > > config in your DT or board file (note that not all drivers support
> > > adjusting the ECC strength/step-size).  
> > I will have to accept that but can you please tell me how to change the
> > ECC strength if my driver supports it? My plan is to use swupdate and
> > update the system using an SD-card that is already installed but I could
> > not find any reference to changing the ECC strength.
> > I am using the Atmel SAMA5d36 CPU and Micron mt29F2G08abaeawp
> > NAND flash.
> >  
> 
> I might be wrong, but I don't think there's any mechanism to change
> the ECC strength on the fly with that processor and flash combination.
> In order to do it, you have to adjust it in your device-tree. I went
> through this in an upgrade scenario on a similar system a few years
> ago and came to the conclusion that it wasn't viable. As a matter of
> background, we had two spots on flash for the kernel (kernel-a,
> kernel-b), and two for a rootfs that was a UBIFS (rootfs-a, rootfs-b).
> Our upgrade procedure was to run on -a, and flash -b.  Next time, run
> on -b and flash on -a, etc... To do it, here's what would have had to
> be done:
> 
> 1. Change the ECC strength in the DT, which then gets appended to the
> the kernel image. Which means when the new kernel boots the new ECC
> takes effect and not before. Note that the kernel that is running is
> using the whatever ECC it was set for.
> 2. Change our update script to _not_ write the ECC bits when it
> flashes... this is critical.
> 3. Now, (assuming running on -a partitions), erase kernel-b, rootfs-b.
> Then flash the new kernel and new rootfs to the -b partitions
> _with_out_ ECC bits!
> 4. Reboot to -b partitions. Note that you're now running a kernel
> supporting the new ECC layout, but without any ECC actually being
> performed.
> 5. Now, erase and reflash -a with the same new kernel and rootfs
> _with_ ECC bits.
> 6. Boot to -a. Now you're running with the new ECC layout and with ECC
> actually being done.
> 
> I'm going from memory, so I might have missed a step or done something
> out of order, but you get the point. Now, why all of the above?  The
> problem is the number of ECC bits that gets flashed is dependent on
> the kernel running flashing it. So, having a kernel running 4 bits
> trying to flash 8, doesn't work.  The solution is by forcing all the
> written ECC bits to 0xffs by turing off the ECC bits when flashing
> with nandwrite. The kernel will read and ignore ECC, no matter the set
> strength, if there's no ECC bits set.

That's not true. If you have all ECC bytes set to 0xff it will simply
not boot (or at least it should not), because the ECC engine will report
errors everywhere.

> So, essentially, you have to
> write the new stuff with the enhanced bits with no bits actually
> written, in order to boot into it and then write it correctly a second
> time.

And this trick only works if your NAND supports subpage writes.

> 
> Additionally, you got to remember to include the boot-loaders, so
> bootstrap+uboot also need to be changed, upgraded, etc.  And, if
> you've got a mix of versions out there, managing them and freely
> allowing upgrades and downgrades becomes a headache too.  It's easier
> if you don't have to boot into the kernel+rootfs and choose an upgrade
> process that leverages u-boot, but our system didn't work that way. I
> also came up with a number of other options, but they're not worth
> detailing here and they were also a pain and risky to implement.
> 
> Basically, it's a major pain and since we were already using the
> recommended minimum for our MT29Fxxxxxx flash, we left it alone. And
> honestly, we haven't had any significant problems with the flash that
> could be attributed to ECC strength.

That is true. Once you have chosen a specific strength, it's not easy
to change it: you have to erase everything and write it again with a
different config.

> 
> All that said - this was a few years ago, and on a 3.8 kernel, running
> bootstrap and u-boot and running the rootfs directly out of flash on
> UBIFS. And we were running our own software update program that wasn't
> very sophisticated. So, your situation may be different and or there
> might be more options available now on newer kernels.
> 
> Hopefully that story helps a bit.
> 
> - Steve
> 
> Steve deRosier
> Cal-Sierra Consulting LLC
> https://www.cal-sierra.com/
