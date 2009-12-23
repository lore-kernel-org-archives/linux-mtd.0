Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NNTvX-0005Xu-Ks
	for linux-mtd@lists.infradead.org; Wed, 23 Dec 2009 16:19:12 +0000
Received: by fg-out-1718.google.com with SMTP id e21so3270869fga.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Dec 2009 08:19:05 -0800 (PST)
Subject: Re: Few problems in mtd system
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Michael Trimarchi <trimarchi@gandalf.sssup.it>
In-Reply-To: <4B3158B6.30106@gandalf.sssup.it>
References: <290458.39840.qm@web37604.mail.mud.yahoo.com>
	<1261342795.4798.14.camel@maxim-laptop>	<20091221140003.GA13316@logfs.org>
	<1261505034.8347.6.camel@maxim-laptop>
	<4B312CF5.3080709@gandalf.sssup.it>
	<1261518137.8347.17.camel@maxim-laptop>
	<4B3158B6.30106@gandalf.sssup.it>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Dec 2009 18:18:56 +0200
Message-ID: <1261585136.4811.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>, arnd <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-23 at 00:39 +0100, Michael Trimarchi wrote: 
> Hi
> 
> Maxim Levitsky wrote:
> > On Tue, 2009-12-22 at 21:32 +0100, Michael Trimarchi wrote: 
> >   
> >> Maxim Levitsky wrote:
> >>     
> >>> On Mon, 2009-12-21 at 15:00 +0100, Jörn Engel wrote: 
> >>>   
> >>>       
> >>>> On Sun, 20 December 2009 22:59:55 +0200, Maxim Levitsky wrote:
> >>>>     
> >>>>         
> >>>>> I suspect that older non type M cards didn't have such emulation, but
> >>>>> were real nand chips, bacause there are some references on the web about
> >>>>> using XD card as a nand chip replacement.
> >>>>> Such card as I have will really will make very poor nand replacement...
> >>>>>       
> >>>>>           
> >>>> If you want to know whether the cards or the readers are to blame, you
> >>>> can try to buy an old alauda reader on ebay.  It is too slow to be
> >>>> useful for most purposes, but I believe it did give me full access with
> >>>> my cards.
> >>>>
> >>>>     
> >>>>         
> >>>>> Folks, could you review my other questions about bugs in mtd core, and
> >>>>> tell your opinion?
> >>>>>       
> >>>>>           
> >>> I have several problems, more correctly bugs in mtd system I have to fix
> >>> to make my driver work.
> >>>
> >>> Lets start from  the problem I face now.
> >>>
> >>> Problem is that add_mtd_blktrans_dev is called with mtd_table_mutex
> >>> locked, but it calls add_disk which opens the block device if you
> >>> specify that you need partitions on the disk. Open routine 'looks' at
> >>> mtd table using get_mtd_device, and thus deadlocks.
> >>>
> >>> Do you have a clue how to fix that so it won't break anything?
> >>>   
> >>>       
> >> I try to follow the call, can you send the block stack trace?
> >> just change the lock on get_mtd_device with a try_lock and BUG on
> >> if it is taken
> >>     
> > I don't want to crash the system now, but I know exactly the trace:
> > (this is created manually)
> >
> > get_mtd_device
> > blktrans_open
> > __blkdev_get
> > blkdev_get
> > register_disk
> > add_disk
> > add_mtd_blktrans_dev
> > ssfdcr_add_mtd
> > blktrans_notify_add
> >   
> The problem can be introduced by this commit
> 8022c13c27b822cf22f13df10b42aae89cd56bf0
> 
>  mtd: blkdevs: do not forget to get MTD devices
>    
>     Nowadays MTD devices have to be "get" before they can be
>     used. This has to be done with 'get_mtd_device()'. The
>     'blktrans_open()' function did not do this and instead
>     used 'try_module_get()'. Fix this.
>    
>     Since 'get_mtd_device()' already gets the module, extra
>     'try_module_get()' is not needed.
>    
>     This fixes oops when one tries to use mtdblock on top of
>     gluebi.
>    
>     Reported-by: Holger Brunck <holger.brunck@keymile.com>
>     Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> 
> That call the
> 
> -       if (!try_module_get(dev->mtd->owner))
> +       if (!get_mtd_device(NULL, dev->mtd->index))
>                 goto out;
> 
> Regards Michael
> > add_mtd_device - takes the lock
> >   
> How do you define partition? cmdline partition or pdata?
> Look of the probe of other device it calls the add_mtd_partions and no
> the add_mtd_device.
It a bit different.
mtd device is standard nand device.
On top of that there is an FTL (ssfdc) that uses oob area to map
physical to logical sectors.
ssfdc just like mtdblock creates standard block device.

This block device can have any partition table. Usually there is
standard MSDOS partition table with one partition.



> > rsc_register_nand_device - my driver function
> >
> >
> > The point is that that ssfdc specifies:
> >
> > .part_bits = SSFDCR_PARTN_BITS
> >
> > This triggers the open of the block device by block core.
> >
> > Tomorrow I will post full backtrace.
> >
> > Best regards,
> > Maxim Levitsky
> >
> >
> >   
> 
