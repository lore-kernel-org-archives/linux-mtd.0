Received: from zmaj.etf.bg.ac.yu ([147.91.8.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mzgK-0002U1-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 16:08:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by zmaj.etf.bg.ac.yu (Postfix) with ESMTP id 21BC44627C
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 17:18:03 +0100 (CET)
Received: from burzum.etf.bg.ac.yu (burzum.etf.bg.ac.yu [147.91.9.13])
	by zmaj.etf.bg.ac.yu (Postfix) with ESMTP id 3DFBA46235
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 17:17:50 +0100 (CET)
Date: Mon, 18 Mar 2002 17:17:50 +0100
From: Veselin Mijuskovic <panzer@etf.bg.ac.yu>
To: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 + GRUB/LILO booting problems
Message-ID: <20020318161750.GA22895@etf.bg.ac.yu>
References: <Pine.LNX.4.44.0203181034060.13911-100000@server.superbt.com> <23171.1016467069@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23171.1016467069@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse [Mon, Mar 18, 2002 at 03:57:49PM +0000, Re: DOC2000 + GRUB/LILO booting problems]:
> 
> ilatypov@superbt.com said:
> >  I agree it might be impossible for the kernel to mount a partition
> > formatted within NFTL layer if NFTL data structures in the beginning
> > of the flash chip are overwritten.  But I don't know the exact details
> > of the NFTL layer myself. 
> 
> It would be impossible. The two erase blocks at the beginning of the NFTL 
> are required. 
> 
> >  The GRUB bootloader needs around 96K at minimum.  NFTL layer can be
> > set up after the bootloader only.  It seems the start of the NFTL
> > layer will be detected automatically by the kernel.  In my
> > understanding, the kernel will simply search for a signature in every
> > erase unit of the chip to find the beginning of NFTL layer.
> 
> Correct. The best way to do this is to use the DOS dformat program to 
> reserve that 96KiB, then put Grub in afterwards. We should probably work 
> out how to make the .EXB file format that DFORMAT uses, so we can actually 
> use DFORMAT to program Grub too.
> 

	Thanks, but the question remains the same: why GRUB can't recognize the
partition on my DOC2000 (After booting from DOC2000 I come up with the 'grub>'
prompt but it says that it can't find any partition on dc0 (which is detected OK)),
and the kernel booted from the hard disk does and can with no problems at all
access /dev/nftla1. Can there be any problem with the GRUB patch? I've co
it from the CVS on March 13th (yeah, bad luck!) along with the rest of the MTD
code (but used the MTD kernel code from the stock 2.4.18) as well as the GRUB
source itself.

	And why does LILO behaves the same?

Cheers,
-- 
 | \|/ Panzer (a.k.a Veselin Mijuskovic), Unix SysAdmin 
/|\ |  Computer Centre, School of Electical Engineering, University of Belgrade
-------------------------------------------------------------------------------
       Unix is very friendly, it's just picky about who its friends are
