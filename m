Received: from e33.co.us.ibm.com ([32.97.110.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU0lF-0003XD-Ph
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 13:21:56 +0000
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e33.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2LDLciK014546
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 09:21:38 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2LDLc2p039746
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 07:21:38 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2LDLcsK026305
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 07:21:38 -0600
Subject: Re: Clarification on multiple mtdram devices - HowTo
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: MikeW <mw_phil@yahoo.co.uk>
In-Reply-To: <loom.20070321T130947-321@post.gmane.org>
References: <loom.20070319T162102-206@post.gmane.org>
	<loom.20070321T130947-321@post.gmane.org>
Content-Type: text/plain
Date: Wed, 21 Mar 2007 08:21:28 -0500
Message-Id: <1174483288.3416.35.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-21 at 12:39 +0000, MikeW wrote:
> 
> Found out about doing this here:
> http://electrons.psychogenic.com/modules/wordpress/rants/
> 2005/08/28/13/linux-on-the-go-exploring-ipaq-options.html
> 
> (I would like a section doing this properly on the MTD website FAQ
> written by an authoritative person - please !)
> >>>>>
> To start we load a few modules, creating a fake 32M flash device
>  in RAM and ensure we have appropriate /dev/ entries:
> 
> # modprobe mtdcore
> # modprobe mtdram total_size=32768 erase_size=256
> # mkdir /dev/mtdblock ; for i in 0 1 2 3 ;
>  do mknod /dev/mtdblock/$i b 31 $i; done
> 
> Then we write the contents of one of the JFFS2 images
> to the MTD RAM device, and take a look:
> 
> # dd if=gpe-image-h3600-20050407124742.rootfs.jffs2 of=/dev/mtdblock/0
> # mkdir -p /mnt/ipaq/
> # mount -t jffs2 /dev/mtdblock/0 /mnt/ipaq
> # cd /mnt/ipaq; ls;

This is about creating a single MTD with mtdram and effectively using
that for loopback.  You had asked about creating multiple MTDs with
mtdram.  So does this fully answer your question, or?

/me is a bit confused.

josh
