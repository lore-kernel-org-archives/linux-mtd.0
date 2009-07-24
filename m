Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MURsM-0007FX-CZ
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 21:00:26 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KNB000B9109TR30@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 17:00:09 -0400 (EDT)
Date: Fri, 24 Jul 2009 17:00:09 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: erno@gulp.u--3.com
Subject: Re: UBIFS fails & crashes on SheevaPlug
In-reply-to: <20090723185928.GA1612@gulp.u--3.com>
Message-id: <alpine.LFD.2.00.0907241648450.15794@xanadu.home>
References: <20090723185928.GA1612@gulp.u--3.com>
Cc: debian-arm@lists.debian.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Jul 2009, erno@gulp.u--3.com wrote:

> I also get messages like this on boot:
> 
> [    4.420000] uncorrectable error : <3>uncorrectable error : 
> <3>end_request: I/O error, dev mtdblock0, sector 0
> [    4.430000] Buffer I/O error on device mtdblock0, logical block 0
> [    4.440000] uncorrectable error : <3>uncorrectable error : 
> <3>end_request: I/O error, dev mtdblock0, sector 0
> [    4.440000] Buffer I/O error on device mtdblock0, logical block 0
> [    4.480000] uncorrectable error : <3>uncorrectable error : 
> <3>end_request: I/O error, dev mtdblock0, sector 0
> 
> but I'm hopeful it's because something is trying to automatically
> access the builtin flash which is in limbo state?

This is because something (udev I think) is trying to automatically 
access every block devices including /dev/mtdblock0. In this case, this 
corresponds to the bootloader.  The problem is that the bootrom 
responsible for fetching u-boot from the flash and copy it to ram does 
understand only one type of ECC, and that ECC format is not (yet) 
supported by Linux.  So this is a known issue which you don't have to 
worry about and this have no relation with your UBIFS issues.

Nicolas
