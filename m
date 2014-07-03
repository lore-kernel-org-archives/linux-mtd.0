Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2ZOG-0005Mt-MZ
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 05:17:01 +0000
Received: by mail-pd0-f172.google.com with SMTP id w10so13151296pde.17
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 22:16:39 -0700 (PDT)
Date: Thu, 3 Jul 2014 15:16:33 +1000
From: Matt Hevern <matt.hevern@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
Message-ID: <20140703051632.GA14079@gmail.com>
References: <20140618044434.GA9331@gmail.com>
 <1404222952.6841.92.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1404222952.6841.92.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 01, 2014 at 04:55:52PM +0300, Artem Bityutskiy wrote:
> On Wed, 2014-06-18 at 14:44 +1000, Matt Hevern wrote:
> > Hi All,
> > 
> > 
> > I am running UBIFS on freescale i.MX28, kernel 2.6.35.3, based on
> > freescale's IMX tree:
> > http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/?h=imx_2.6.35_maintain
> > The flash is NAND, Micron 256MiB (MT29F2G08)
> 
> In your dumps I see that there are errors related to UBIFS not being
> able to find an LEB for the garbage collector. And I remember we fixed
> bugs in this area.
> 
> For example, "6fb4374 UBIFS: fix GC LEB recovery", and there were more.
> Search for 'ubifs_rcvry_gc_commit' in 'git log -p fs/ubifs/recovery.c'.

I merged in the patch you mentioned, along with 350 others which
were on git://github.com/computersforpeace/UBIFS-backports.git on the
'ubifs-v2.6.35' branch (all the patches above Linux 2.6.35.3)
When I attempted to mount the same filesystem, I got a similar error to
last time.
Is it likely this UBIFS filesystem which was manipulated with the previous driver without
all these patches is now corrupt and will require reformatting ?

I'd just like to verify my understanding that that the patches applied are not
going to be able to fix or repair the now corrupt filesystem, but are likely to
prevent the same issue for occuring again ?


Thanks,

Matt


------Current dmesg error, after mount attempt

UBIFS DBG (pid 1141): ubifs_bg_thread: background thread "ubifs_bgt0_5" started, PID 1141
UBIFS error (pid 1139): validate_master: bad master node at offset 20480 error 7
        magic          0x6101831
        crc            0x3bc3dd3d
        node_type      7 (master node)
        group_type     0 (no node group)
        sqnum          156822
        len            512
        highest_inum   376
        commit number  132
        flags          0x2
        log_lnum       3
        root_lnum      152
        root_offs      24648
        root_len       88
        gc_lnum        4294967295
        ihead_lnum     152
        ihead_offs     26624
        index_size     109968
        lpt_lnum       7
        lpt_offs       16857
        nhead_lnum     7
        nhead_offs     18432
        ltab_lnum      7
        ltab_offs      16384
        lsave_lnum     0
        lsave_offs     0
        lscan_lnum     12
        leb_cnt        173
        empty_lebs     0
        idx_lebs       5
        total_free     102400
        total_dirty    4656000
        total_used     15828720
        total_dead     0
        total_dark     837352
UBIFS DBG (pid 1141): ubifs_bg_thread: background thread "ubifs_bgt0_5" stops
