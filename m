Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBWuv-0000FC-Af
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 23:00:02 +0000
Date: Wed, 14 Jan 2015 23:59:34 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Flash filesystem questions
In-Reply-To: <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: Erik Ekman <erik@kryo.se>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 14 Jan 2015, Richard Weinberger wrote:

> On Wed, Jan 14, 2015 at 9:21 PM, Erik Ekman <erik@kryo.se> wrote:
> > Hi all,
> >
> > I am working on a Linux driver for the Intel Turbo Memory Controller (8086:444e)
> > PCIe device. It was sold as a card to speed up the boot and operation of Vista
> > computers a few years ago.
> > More info at http://en.wikipedia.org/wiki/Intel_Turbo_Memory
> >
> > I expected it to have a flash translation layer and expose a block device, but
> > instead I found access to raw flash operations (read, write & erase). I have
> > not found any way to access the OOB data, that is probably handled inside the
> > controller chip.  I have it basically working now, with 4kB pages and 128kB
> > erase blocks, and nandtest runs without errors.
> >
> > The code is here: https://github.com/yarrick/turbomem
> >
> > I am now trying to run a filesystem on top. JFFS2 was not happy with no OOB.
> > I found that the flash in the device only allows one write cycle per erase
> > (which seems normal according to YAFFS2 docs). ubiformat succeeded but then
> > ubiattach fails for me with an assert:
> >
> > UBI: attaching mtd0 to ubi0
> > UBI: scanning is finished
> > UBI assert failed in ubi_io_read at 206 (pid 2743)
> > CPU: 1 PID: 2743 Comm: ubiattach Tainted: G       OE  3.17.7-300.fc21.x
> > Hardware name: LENOVO 7454GKU/7454GKU, BIOS 6DET64WW (3.14 ) 06/23/2010
> >  0000000000000000 000000003491b1e7 ffff880062b43ca0 ffffffff817401ea
> >  ffff880087c78000 ffff880062b43d10 ffffffffa08117fe 8000000000000163
> >  ffff880098163c00 ffffc90004806000 0000000000002000 0000000000006000
> > Call Trace:
> >  [<ffffffff817401ea>] dump_stack+0x45/0x56
> >  [<ffffffffa08117fe>] ubi_io_read+0x35e/0x3f0 [ubi]
> >  [<ffffffffa08069ff>] ubi_read_volume_table+0x11f/0xb90 [ubi]
> >  [<ffffffff8173ea9d>] ? printk+0x72/0x8e
> >  [<ffffffffa08181db>] ubi_attach+0xa4b/0x1470 [ubi]
> >  [<ffffffff811d28cf>] ? __vmalloc_node_range+0x1bf/0x290
> >  [<ffffffffa080aca0>] ubi_attach_mtd_dev+0x890/0x1010 [ubi]
> >  [<ffffffffa07f6c6d>] ? __get_mtd_device+0x1d/0x80 [mtd]
> >  [<ffffffff81745062>] ? mutex_lock+0x12/0x30
> >  [<ffffffffa080bd03>] ctrl_cdev_ioctl+0xc3/0x1f0 [ubi]
> >  [<ffffffff81220ff0>] do_vfs_ioctl+0x2d0/0x4b0
> >  [<ffffffff81221251>] SyS_ioctl+0x81/0xa0
> >  [<ffffffff81135d96>] ? __audit_syscall_exit+0x1f6/0x2a0
> >  [<ffffffff817473a9>] system_call_fastpath+0x16/0x1b
> >
> > Could this problem be because of my driver? Is there some way to configure UBI
> > for to only write once per flash block or is that the default?
> 
> You can a block only write once. Then you have to erase it again.

When I read Erik's original post I interpreted the 'write once per flash 
block' to mean that you can do a single write per block, and that's it.
Given the usage as a speedup component, it would make sense to copy the 
relevant data in one go, since no read/write file system would be 
implemented on the device, there would be no need for page based writes. 
The flash memory most likely doesn't have this limitation but the 
controller could I suppose.

Erik, was that in fact what you meant?

None of the Linux-based read/write file systems can handle the case of 
only being able to do a single write operation to a block. They are all 
based on the fact that you normally can write a page of data at a time.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
