Date: Sun, 28 Aug 2016 16:20:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Daniel Golle <daniel@makrotopia.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 lede-dev@lists.infradead.org, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Zoltan HERPAI <wigyori@uid0.hu>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 openwrt-devel@lists.openwrt.org
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828162059.629f4fdf@bbrezillon>
In-Reply-To: <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
References: <20160827194326.GA1817@makrotopia.org>
 <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
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

On Sun, 28 Aug 2016 11:12:50 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Daniel,
> 
> Let's try to tackle this from a different angle.
> 
> On 27 August 2016 at 16:43, Daniel Golle <daniel@makrotopia.org> wrote:
> > Hi!
> >
> > In an attempts to fix the flaws of the current set of UBI-related
> > patches we are carrying in OpenWrt, I re-wrote the way mounting the
> > rootfs from UBI in OpenWrt/LEDE works. The main requirement I face
> > which cannot be easily addressed using other means which are already
> > available in the kernel is the fact that UBIFS and squashfs-on-UBI
> > require different parameters to be set on the cmdline, e.g.
> > for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> > for squashfs: ubi.mtd=ubi ubiblock=0,1 root=/dev/ubiblock0_1 rootfstype=squashfs
> >  
> 
> Can you help me understand the problem you are solving here?
> 
> So you currently need to do:
> 
> * for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> * for squashfs: ubi.mtd=ubi ubi.block=0,1 root=/dev/ubiblock0_1
> rootfstype=squashfs
> 
> [..]
> >
> > With those changes, a single set of cmdline parameters is
> > sufficient to mount either UBIFS or any other block filesystem
> > by creating a ubiblock device:
> > ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs,squashfs
> >  
> 
> And you would like to do:
> 
> * for UBIFS: ubi.mtd=ubi root=ubi0:rootfs rootfstype=ubifs
> * for squashfs: ubi.mtd=ubi root=/dev/ubiblock0_1 rootfstype=squashfs

I think Daniel wants something like:

ubi.mtd=1 root=ubi0:rootfs

or

ubi.mtd=1 root=/dev/ubiblock0_1

to work for both the UBIFS and squashfs cases.

> 
> So the only thing you are trying to acomplish, is removal
> of the ubi.block parameter needed to create ubi block devices.
> 
> Is that correct?
> 
> Thanks,
