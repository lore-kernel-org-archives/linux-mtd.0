Received: from taurus-1.siol.net ([193.189.160.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uABH-0003Iv-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 12:18:11 +0100
Subject: RE: jffs, jffs2
From: Simon Posnjak <simon@activetools.si>
To: Christopher Hoover <ch@murgatroid.com>
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>
In-Reply-To: <001501c26404$40977630$7e00000a@bergamot>
References: <001501c26404$40977630$7e00000a@bergamot>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Sep 2002 13:18:07 +0200
Message-Id: <1032952690.2913.27.camel@klada.dyndns.org>
Mime-Version: 1.0
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

On Tue, 2002-09-24 at 21:54, Christopher Hoover wrote:
> 
> Use jffs2 over jffs.
> 
> Caveat with 2.5: if your flash has variable-sized blocks (e.g. Intel C3
> flash), you'll need to either use the mtd CVS or patch the 2.5 sources
> accordingly. 
I wasn't to clear: I will be using 2.4.18. The date in TODO file which
is located in fs/jffs2 directory is 2001/03/01 which seams to be a bit
old. What I would like to now is there a newer (stable) version. (What
to pull out of the CVS - HEAD or some other taged version)

> Use mkfs.jffs2 to build the image.
> 
> With blob, just pretend "ramdisk" is "root".  You'll need to have
> configured the proper partitioning into both blob and the sa1100 mtd
> partition code. 
> 
> Write the image by doing "erase ramdisk; xdownload ramdisk; {send the
> file}; flash ramdisk".  The erase is important.    
> 
> One final thing: be sure to configure your blob parameters to tell it
> not to load the ramdisk automatically.  

OK I got this, thank you for your help. Just one more thing:

So to mount an empty mtd partition as jffs/jffs2 all I have to do is to
erase it (using erase utilty from mtd)and then just do mount -t jffs2
/dev/mtdblock5 /somedir. Is this correct?

	Regards Simon
