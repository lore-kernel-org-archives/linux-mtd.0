Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDUKV-0008J8-8r
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 07:34:00 +0000
Received: by mail-pa0-f53.google.com with SMTP id lj1so8819371pab.40
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 23:33:37 -0800 (PST)
Date: Tue, 11 Feb 2014 23:33:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: Aw: Re: Linux MTD: Per Partition ECC
Message-ID: <20140212073328.GA3500@norris-Latitude-E6410>
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>
 <52FA1B39.2070904@corscience.de>
 <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
 <52FA4E64.8020200@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52FA4E64.8020200@gmail.com>
Cc: star@gmx.li, linux-mtd@lists.infradead.org,
 Andreas =?iso-8859-1?Q?Bie=DFmann?= <andreas.biessmann@corscience.de>,
 biessmann@corscience.de, Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 11, 2014 at 11:23:00AM -0500, Peter Barada wrote:
> On 02/11/2014 10:43 AM, star@gmx.li wrote:
> > It is clear to me, that I can't mix ECC at same time.
> > I would like to switch at a certain point of time.
> >
> > In uboot there is a command (nandecc) which does this for me.
> > But howto do this in linux?
> 
> Currently there is no method to switch ECCs at runtime within Linux w/o
> unloading/reloading the NAND driver module and specify a different ECC. 
> This works great if your rootfs is not NAND-based (where unloading the
> NAND driver can cause it to hang/crash), but in my case I need it to
> work with a NAND-based rootfs.
> 
> It may be possible to burn the bootloader into NAND using MTD_RAW_MODE
> which _should_ disable all ECC for the operation, but in my case the ECC
> generator is internal to the NAND chip itself and this won't work.
> 
> I'm working on a possible solution in my linux-3.0 kernel, to modify
> nand_get_device to take an extra pramater "no_ecc" which keys off
> whether the NAND ops mode (if known) is MTD_OOB_RAW, and if so shut off
> all ECC (including the in-chip ECC my NAND requires).    Then every NAND
> operation will enable/disable ECC while getting the controller lock.

It is renamed to MTD_OPS_RAW, and yes, drivers should support turning
off ECC when using RAW. I don't think anybody has ever considered
supporting raw mode with on-die ECC, though. You can probably do it with
some modest modifications to the NAND layer (esp. to the
chip->{read,write}_*_raw callbacks). I would recommend trying this
before trying to develop per-partition ECC configuration. Others are
trying, but I'm not confident it will go anywhere:

http://lists.infradead.org/pipermail/linux-mtd/2014-February/051896.html

> In the process of using flashtool to burn NAND, it uses write() to burn
> the data portion, and ioctl(MEMWRITEOOB) to burn the OOB area, but this
> causes two writes to the same page, which violates Np for my NAND (i.e.
> only one write per page).  I'm looking at creating a new ioctl entry
> (MEMWRITEDATAOOB?) that takes both the data and oob buffers from
> userspace and then burns them in one operation.

Please do not create a new one. ioctl(MEMWRITE) already exists for this
purpose. It can do page-at-a-time programming of data+OOB, and it even
has a 'mode' field for choosing ECC vs. raw (no-ECC) programming. This
is useful for any flash that doesn't support partial page programming.
The nandwrite utility from mtd-utils supports this in Linux.

Brian
