Received: from mail-ve0-x22a.google.com ([2607:f8b0:400c:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFRi8-0004hT-Vc
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2013 16:38:13 +0000
Received: by mail-ve0-f170.google.com with SMTP id 15so1564696vea.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2013 09:37:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5220C8C4.5010305@digi.com>
References: <522062B4.4080709@digi.com> <52206C05.8020701@freescale.com>
 <5220AB35.9080409@digi.com> <20130831025344.GA9971@gmail.com>
 <5220B8F6.3080405@digi.com> <20130831033438.GA13704@gmail.com>
 <5220C8C4.5010305@digi.com>
Date: Fri, 30 Aug 2013 13:37:49 -0300
Message-ID: <CAOMZO5CTQZBmvQc4y761kGHWYWRXr7GwVrTuTPE+JU=bmjq62w@mail.gmail.com>
Subject: Re: gpmi-nand driver and jffs2 support
From: Fabio Estevam <festevam@gmail.com>
To: Hector Palacios <hector.palacios@digi.com>
Content-Type: text/plain; charset=UTF-8
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, Marek Vasut <marex@denx.de>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hector,

On Fri, Aug 30, 2013 at 1:31 PM, Hector Palacios
<hector.palacios@digi.com> wrote:
> Ok I merged the linux-next MTD patches.
> This is what I get from the printk:
>
> [    0.841333] [ set_geometry_by_ecc_info ] 36, 28
>
> The partition now partially mounts (I can see a few of the folders and
> files) but I get thousands of errors like these:
>
> [  118.210985] jffs2: mtd->read(0x100 bytes from 0x0) returned ECC error
> [  118.255424] jffs2: mtd->read(0x1ff20 bytes from 0xe0) returned ECC error
> [  118.255561] jffs2: jffs2_scan_inode_node(): CRC failed on node at
> 0x000001ec: Read 0x00000000, calculated 0xa587e8ba
> [  118.255602] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
> found at 0x00000234: 0x1cf7 instead

This error is most likely because you generated a jffs2 rootfs with a
eraseblock size that does not match the one of your NAND device.

Try generating a new rootfs with the correct eraseblock size.

Regards,

Fabio Estevam
