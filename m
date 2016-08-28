Date: Sun, 28 Aug 2016 18:35:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Zoltan HERPAI <wigyori@uid0.hu>,
 Hauke Mehrtens <hauke@hauke-m.de>, Ralph Sennhauser
 <ralph.sennhauser@gmail.com>, openwrt-devel@lists.openwrt.org
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828183505.65732f08@bbrezillon>
In-Reply-To: <20160828152450.GG1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
 <20160828162059.629f4fdf@bbrezillon>
 <CAAEAJfCL47DxHOYrXEUXaZQNvaPEvN3P9VVGihA-KnJ3dNVU7g@mail.gmail.com>
 <20160828144013.GF1623@makrotopia.org>
 <20160828170054.230dd406@bbrezillon>
 <20160828152450.GG1623@makrotopia.org>
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

On Sun, 28 Aug 2016 17:24:51 +0200
Daniel Golle <daniel@makrotopia.org> wrote:

> Hi Boris,
> 
> On Sun, Aug 28, 2016 at 05:00:54PM +0200, Boris Brezillon wrote:
> > On Sun, 28 Aug 2016 16:40:14 +0200
> > Daniel Golle <daniel@makrotopia.org> wrote:
> >   
> > > On Sun, Aug 28, 2016 at 11:25:54AM -0300, Ezequiel Garcia wrote:  
> > > > On 28 August 2016 at 11:20, Boris Brezillon
> > > > <boris.brezillon@free-electrons.com> wrote:    
> > > > > On Sun, 28 Aug 2016 11:12:50 -0300
> > > > > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> > > > >    
> > > > >> Daniel,
> > > > >>
> > > > >> Let's try to tackle this from a different angle.
> > > > >>
> > > > >> On 27 August 2016 at 16:43, Daniel Golle <daniel@makrotopia.org> wrote:    
> > > > >> > Hi!
> > > > >> >
> > > > >> > In an attempts to fix the flaws of the current set of UBI-related
> > > > >> > patches we are carrying in OpenWrt, I re-wrote the way mounting the
> > > > >> > rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
> > > > >> > which cannot be easily addressed using other means which are already
> > > > >> > available in the kernel is the fact that UBIFS and squashfs-on-UBI
> > > > >> > require different parameters to be set on the cmdline, e.g.
> > > > >> > for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> > > > >> > for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs
> > > > >> >    
> > > > >>
> > > > >> Can you help me understand the problem you are solving here?
> > > > >>
> > > > >> So you currently need to do:
> > > > >>
> > > > >> * for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> > > > >> * for squashfs: ubi.mtd=ubi ubi.block=0,1 root=/dev/ubiblock0_1
> > > > >> rootfstype=squashfs
> > > > >>
> > > > >> [..]    
> > > > >> >
> > > > >> > With those changes, a single set of cmdline parameters is
> > > > >> > sufficient to mount either UBIFS or any other block filesystem
> > > > >> > by creating a ubiblock device:
> > > > >> > ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs
> > > > >> >    
> > > > >>
> > > > >> And you would like to do:
> > > > >>
> > > > >> * for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> > > > >> * for squashfs: ubi.mtd=ubi root=/dev/ubiblock0_1 rootfstype=squashfs    
> > > > >
> > > > > I think Daniel wants something like:
> > > > >
> > > > > ubi.mtd=1 root=ubi0:rootfs
> > > > >
> > > > > or
> > > > >
> > > > > ubi.mtd=1 root=/dev/ubiblock0_1
> > > > >
> > > > > to work for both the UBIFS and squashfs cases.
> > > > >    
> > > > 
> > > > Right. In which case, I was going to propose the same thing
> > > > you just did! It would be simple, and uninvasive to introduce
> > > > something like the parameter you suggested
> > > > "ubi.block=attach_all_ro_vols".    
> > > 
> > > That in addition with the patch referred to in an earlier mail
> > > http://code.bulix.org/fkxrgt-105392
> > > would indeed solve the problem, with the limitation that one needs to
> > > use the {ubi_num}_{vol_id} syntax instead of being able to refer to
> > > the volume name.  
> > 
> > Let me clarify my previous answer: I'm still strongly opposed to this
> > approach (including my less invasive patch). I was just trying to show
> > that your implementation was invasive and could be made less invasive,
> > but it remains a hack, which, unless proven otherwise, is not needed.  
> 
> I agree and merely wanted to discuss the vague direction rather than
> details of the implementation. Using your patch, if it was merged,
> would indeed at least provide a partial alternative.
> 
> Anyway, What more of a proof for the need of such a hack would be needed?
> Facts:
> [1] the bootloader should not need to be aware of the filesystem-type
>     used for Linux' rootfs
> [2] the device-tree explicitely prohibits information on fstypes
> [3] disitributions and users use different filesystem types on top of
>     UBI inside the same volume on the very same board
> [4] two entirely different sets of parameters are needed to mount UBIFS
>     or e.g. SQUASHFS (or any other read-only block filesystem)
> [5] in initramfs should be used for complex boot setups
> 
> From fact [3] and [4] you can imply that either the cmdline needs to be
> adapted based on the filesystem type [6] or a new probing mechanism
> needs to be introduced, either in the kernel [7] or by using an
> initramfs [8].
> [1] and [2] contradict with [6].
> [8] seems the way to go if you consider [5] to be true in that case
> (ie. "this is a complex setup"), which is what this discussion boils
> down to imho.

I think Richard and I agree that [8] is the right answer, because your
use case is way more complex than "mount a FS from this device" (as
explained earlier).

> 
> 
> >   
> > > Currently, we do use 'dynamic' (ie. read-write) volumes even for
> > > squashfs, as otherwise boot takes much longer as the CRC for the
> > > whole volumes needs to be calculated. Having *any* 'static' volumes
> > > also breaks some older versions of U-Boot already supporting UBI.
> > > I'd rather say "attach_all_non_ubifs_vols" and probe the filesystem
> > > type, though that's also not very clean.
> > > Also, one might not want to attach *all* volumes, ie. for a ubootenv
> > > volume, there should not be a ubiblock.
> > > Re-using the volume-name parser from UBIFS to also create the ubiblock
> > > device needed to mount the rootfs seemed to be the most transparent
> > > approach to me.  
> > 
> > So each time you're asking more. AFAIK, JFFS2 was only supporting
> > the /dev/mtdblockX format, without any way to use MTD names. But now you
> > want an improved version that is able to use the UBI format, which is
> > not at all suitable for block-device probing.  
> 
> I've been asking for that ("move the volume name parser from UBIFS to
> UBI for it to be reused elsewhere") from the beginning of this debate.
> To get to your remark: Please look at the actual patches I submitted
> for discussion at the beginning of this thread.

How do you think I could comment on your implementation? Of course I
reviewed your patches, just didn't answer to the patches directly,
because the general approach seemed wrong to me.

I'll comment on them individually if you really want.

> For MTD, refering to partitions by numbers is fine, because those
> numbers are static and merely a result of the partitioning scheme given
> in the device-tree or cmdline mtdparts.

That's only true if you have a single MTD device. But the probe order
is not guaranteed if you mix different devices, so relying on dev
numbers for MTD is just as broken as with UBI devices.

> For UBI, volumes are dynamic and users my delete and create volumes
> during the life-time of a device as they like. Thus, it's not asking
> for more, it's just asking for having the same degree of reliability
> and transparency as when using other storage subsystems.

See above.

> 
> > 
> > To be very clear, on my side this is a NACK.  
> 
> So, for the record, I conclude that those patches will remain
> OpenWrt/LEDE specific and you and others on linux-mtd are opposed to
> the general *approach* (and not just the actual implementation).

How about evaluating the initrd approach? You didn't give any real
arguments beside 'it's more complicated than a command-line parameter'.
But, according to your explanation, you want to do advanced selection of
the rootfs source, so it seems a good candidate for an initrd setup to
me.

Please test that, and come back to us if it's not working.
