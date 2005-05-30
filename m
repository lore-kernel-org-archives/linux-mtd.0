Received: from mail.skymv.com ([66.120.210.140] helo=exchange2003.ad.skymv.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DcpKs-0003iT-Gk
	for linux-mtd@lists.infradead.org; Mon, 30 May 2005 14:50:03 -0400
From: Blair Barnett <bbarnett@circumnavnetworks.com>
To: Jonas <jdietsche@fsforth.de>
In-Reply-To: <429AEC25.4000309@fsforth.de>
References: <B1091462CF5479489B1D8FE818330D2C80F27E@exchange2003.ad.skymv.com>
	<429AEC25.4000309@fsforth.de>
Content-Type: text/plain
Message-Id: <1117478995.24559.12.camel@blairs-desktop>
Mime-Version: 1.0
Date: Mon, 30 May 2005 11:49:56 -0700
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand write problem
Reply-To: blair@circumnavnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jonas,

Thanks for giving us explicit details...

On Mon, 2005-05-30 at 03:34, Jonas wrote:
> Hi blair,
> > I believe you need to use the -p (pad) option to nandwrite.
> > Please let us see your nandwrite command line.
> This is what I tried:
> 
> # ./nandwrite --jffs2 /dev/mtd/2 jffs2.img
> Use -f option to enforce legacy placement on autoplacement enabled mtd 
> device
What version of nandwrite (nandwrite -V) do you have? Version 1.30
supports -f.
> 
> # ./nandwrite -f /dev/mtd/2 jffs2.img
> ./nandwrite: illegal option -- f
> 
> # ./nandwrite -f --jffs2 /dev/mtd/2 jffs2.img
> ./nandwrite: illegal option -- f
> 
> # ./nandwrite -p /dev/mtd/2 jffs2.img
> this takes a long time until it is finished.
If your JFFS2 image has any size to it, I would expect it to take some
time.
> 
> then I mount it with
> # mount -t jffs2 /dev/mtdblock/2 /mnt/
> and get a lot of
> CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
> 
> Copy the image with nandwrite is the correct and only way? Or is there 
> another possibility?
I've seen the CLEANMARKER errors before. How did you create the JFFS2
partition?

Check out this thread for a little more detail:
http://lists.infradead.org/pipermail/linux-mtd/2005-March/012045.html

Good luck! 

-blair
