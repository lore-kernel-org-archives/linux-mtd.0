Date: Sun, 28 Aug 2016 16:40:14 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 openwrt-devel@lists.openwrt.org,
 Richard Weinberger <richard@nod.at>, lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828144013.GF1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
 <20160828162059.629f4fdf@bbrezillon>
 <CAAEAJfCL47DxHOYrXEUXaZQNvaPEvN3P9VVGihA-KnJ3dNVU7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAEAJfCL47DxHOYrXEUXaZQNvaPEvN3P9VVGihA-KnJ3dNVU7g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 28, 2016 at 11:25:54AM -0300, Ezequiel Garcia wrote:
> On 28 August 2016 at 11:20, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Sun, 28 Aug 2016 11:12:50 -0300
> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >
> >> Daniel,
> >>
> >> Let's try to tackle this from a different angle.
> >>
> >> On 27 August 2016 at 16:43, Daniel Golle <daniel@makrotopia.org> wrote:
> >> > Hi!
> >> >
> >> > In an attempts to fix the flaws of the current set of UBI-related
> >> > patches we are carrying in OpenWrt, I re-wrote the way mounting the
> >> > rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
> >> > which cannot be easily addressed using other means which are already
> >> > available in the kernel is the fact that UBIFS and squashfs-on-UBI
> >> > require different parameters to be set on the cmdline, e.g.
> >> > for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> >> > for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs
> >> >
> >>
> >> Can you help me understand the problem you are solving here?
> >>
> >> So you currently need to do:
> >>
> >> * for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> >> * for squashfs: ubi.mtd=ubi ubi.block=0,1 root=/dev/ubiblock0_1
> >> rootfstype=squashfs
> >>
> >> [..]
> >> >
> >> > With those changes, a single set of cmdline parameters is
> >> > sufficient to mount either UBIFS or any other block filesystem
> >> > by creating a ubiblock device:
> >> > ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs
> >> >
> >>
> >> And you would like to do:
> >>
> >> * for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> >> * for squashfs: ubi.mtd=ubi root=/dev/ubiblock0_1 rootfstype=squashfs
> >
> > I think Daniel wants something like:
> >
> > ubi.mtd=1 root=ubi0:rootfs
> >
> > or
> >
> > ubi.mtd=1 root=/dev/ubiblock0_1
> >
> > to work for both the UBIFS and squashfs cases.
> >
> 
> Right. In which case, I was going to propose the same thing
> you just did! It would be simple, and uninvasive to introduce
> something like the parameter you suggested
> "ubi.block=attach_all_ro_vols".

That in addition with the patch referred to in an earlier mail
http://code.bulix.org/fkxrgt-105392
would indeed solve the problem, with the limitation that one needs to
use the {ubi_num}_{vol_id} syntax instead of being able to refer to
the volume name.
Currently, we do use 'dynamic' (ie. read-write) volumes even for
squashfs, as otherwise boot takes much longer as the CRC for the
whole volumes needs to be calculated. Having *any* 'static' volumes
also breaks some older versions of U-Boot already supporting UBI.
I'd rather say "attach_all_non_ubifs_vols" and probe the filesystem
type, though that's also not very clean.
Also, one might not want to attach *all* volumes, ie. for a ubootenv
volume, there should not be a ubiblock.
Re-using the volume-name parser from UBIFS to also create the ubiblock
device needed to mount the rootfs seemed to be the most transparent
approach to me.

> 
> After all, this is what mtdblock does, so it wouldn't be
> a too revolutionary approach.

True.

> -- 
> Ezequiel García, VanguardiaSur
> www.vanguardiasur.com.ar
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
