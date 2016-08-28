Date: Sun, 28 Aug 2016 16:32:36 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 openwrt-devel@lists.openwrt.org,
 Richard Weinberger <richard@nod.at>, lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Zoltan HERPAI <wigyori@uid0.hu>, Hauke Mehrtens <hauke@hauke-m.de>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH/RFC 0/3] UBI: unify mouting rootfs based on cmdline
 parameter
Message-ID: <20160828143236.GE1623@makrotopia.org>
References: <20160827194326.GA1817@makrotopia.org>
 <CAAEAJfA5zgJDGm=Vdewxb8nh-n-7Ez-HWGCORHyGvD_ku1YxLA@mail.gmail.com>
 <20160828162059.629f4fdf@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160828162059.629f4fdf@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 28, 2016 at 04:20:59PM +0200, Boris Brezillon wrote:
> I think Daniel wants something like:
> 
> ubi.mtd=1 root=ubi0:rootfs

Yes, this is what I want :)

> 
> or
> 
> ubi.mtd=1 root=/dev/ubiblock0_1

This would already be a bit worse, as then I need to refer to the
rootfs volume using the vol_id rather than its name...

> 
> to work for both the UBIFS and squashfs cases.
> 
> > 
> > So the only thing you are trying to acomplish, is removal
> > of the ubi.block parameter needed to create ubi block devices.
> > 
> > Is that correct?
> > 
> > Thanks,
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
