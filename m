Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3YYN-0002bu-5z
 for linux-mtd@lists.infradead.org; Sat, 05 Jul 2014 22:35:31 +0000
Received: by mail-pd0-f170.google.com with SMTP id z10so3413488pdj.15
 for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2014 15:35:08 -0700 (PDT)
Date: Sat, 5 Jul 2014 15:35:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Joaquim Duran <jduran.gm@gmail.com>
Subject: Re: MTD traces on operation with filesystem
Message-ID: <20140705223502.GA4083@norris-Latitude-E6410>
References: <CANdawSFXV7irURe37uejLd+WUSyMEJirsYam9mxrozvQPR2i0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANdawSFXV7irURe37uejLd+WUSyMEJirsYam9mxrozvQPR2i0g@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joaquim,

On Thu, Jul 03, 2014 at 02:04:39PM +0200, Joaquim Duran wrote:
> To print traces, we've changed the variable 'mtd_debug_verbose' to
> 0x7. With this configuration, we get traces when we access to the
> flash when using the /dev/mtdblockX' device file, like:
> 
> dd if=uImage of=/dev/mtdblock3 bs=131072
[...]
> but not if I do write operation using the file system:
> 
> dd if=/dev/urandom of=test.txt bs=1024 count=4096

What filesystem are you using? What is your 'mount' command?

My guess is that you are not *actually* utilizing mtdblock for your
filesystem, but are relying on legacy behavior by which /dev/mtdblockX
gets translated to the appropriate MTD (not a block device).

See the notes here:

  http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

And the comments in mount_mtd() (drivers/mtd/mtdsuper.c):

	/* try the old way - the hack where we allowed users to mount
	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
	 */

If this is the case, then mtdblock.c's tracing will not help you.

You're probably have better luck either tracing the calls to your
mtd->write() function itself. e.g., if you're using NAND, you'll have to
modify nand_write() in drivers/mtd/nand/nand_base.c.

(NB: as of kernel v3.3, commit eda95cbf75193808f62948fb0142ba0901d8bee2,
it should be easier to trace this, since we introduced a mtd_write()
wrapper function.)

Hope that helps.

Brian
