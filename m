Received: from e35.co.us.ibm.com ([32.97.110.133])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvMBk-0006AJ-OM
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 22:33:14 +0100
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j6KLWseR571628
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 17:32:57 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j6KLWrvk432426
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 15:32:53 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j6KLWrE2014687
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 15:32:53 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: rolf liu <rolfliu@gmail.com>
In-Reply-To: <2db32b72050720114074d1badb@mail.gmail.com>
References: <2db32b72050720114074d1badb@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 20 Jul 2005 16:32:47 -0500
Message-Id: <1121895167.12397.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: suddently, can't use "cp jffs2.img /dev/mtd0" anymore
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-07-20 at 11:40 -0700, rolf liu wrote:
> Yesterday, I can use "cp jffs2.img  /dev/mtd0" to copy the jffs2 image
> to mtd. Today, I applied the cvs snapshot of mtd to kernel and
> compiled it. Suddenly, the "cp" command stops working.
> 
> it tells me:
> MTD do_write_buffer(): software timeout
> cp: writing '/dev/mtd0' : Input/output error
> 
> any idea?

Did you erase the chip before writing to it like that again?  If not,
you'll need to do:

flash_eraseall /dev/mtd0

Then try your copy again.

josh
