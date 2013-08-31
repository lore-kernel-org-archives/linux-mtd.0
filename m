Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFe1Y-0000aV-AN
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2013 05:47:05 +0000
Received: by mail-pd0-f178.google.com with SMTP id w10so2651844pde.23
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 22:46:42 -0700 (PDT)
Date: Sat, 31 Aug 2013 13:51:45 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Message-ID: <20130831175144.GA27878@gmail.com>
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
 <5220C8C4.5010305@digi.com>
 <CAOMZO5CTQZBmvQc4y761kGHWYWRXr7GwVrTuTPE+JU=bmjq62w@mail.gmail.com>
 <5220CB56.7040505@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5220CB56.7040505@digi.com>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 30, 2013 at 06:41:58PM +0200, Hector Palacios wrote:
> Hi Fabio,
> 
> On 08/30/2013 06:37 PM, Fabio Estevam wrote:
> >Hi Hector,
> >
> >On Fri, Aug 30, 2013 at 1:31 PM, Hector Palacios
> ><hector.palacios@digi.com> wrote:
> >>Ok I merged the linux-next MTD patches.
> >>This is what I get from the printk:
> >>
> >>[    0.841333] [ set_geometry_by_ecc_info ] 36, 28
> >>
> >>The partition now partially mounts (I can see a few of the folders and
> >>files) but I get thousands of errors like these:
> >>
> >>[  118.210985] jffs2: mtd->read(0x100 bytes from 0x0) returned ECC error
> >>[  118.255424] jffs2: mtd->read(0x1ff20 bytes from 0xe0) returned ECC error
> >>[  118.255561] jffs2: jffs2_scan_inode_node(): CRC failed on node at
> >>0x000001ec: Read 0x00000000, calculated 0xa587e8ba
> >>[  118.255602] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
> >>found at 0x00000234: 0x1cf7 instead
> >
> >This error is most likely because you generated a jffs2 rootfs with a
> >eraseblock size that does not match the one of your NAND device.
> 
> No. I used 128k erase block that matches my NAND. I also checked
> that I can mount the jffs2 partition correctly using my v2.6.35
> kernel, so the partition seems to be correctly written.
> 

Keep the JFFS2_FS_DEBUG is 0.
and test it again.

thanks
Huang Shijie
