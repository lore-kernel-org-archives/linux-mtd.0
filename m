Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6UmB-0000Az-Lq
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 09:24:36 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D6UcU-00007u-8h
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 15:14:34 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2005 15:14:34 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2005 15:14:34 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 02 Mar 2005 15:13:33 +0100
Message-ID: <d04hdb$8k1$1@sea.gmane.org>
References: <d01lkf$v0d$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <d01lkf$v0d$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: Re: Cannot remove child "XXX", ino #13, because it doesn't exist
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

> After removing a directory containing a lot of files, I get lots of the 
> following messages on reboot (one for each of the files I removed):

> Cannot remove child "file10.txt", ino #13, because it doesn't exist

> It keeps returning even after rebooting...
Some more information:

The problem arose after creating a directory in my JFFS2 NAND fs, and 
creating some 1000 (small) files in it. After rebooting I removed the 
entire directory, and at the next reboot I got the error.

I'm running a 2.4.20 kernel but with mtd updated.

I didn't do the mtd update myself - this was handled by my board/linux 
vendor, but scanning the mtd-directory structure I found that the newest 
file in the structure seems to be "drivers/mtd/nand/s3c2410.c" from 
2004-10-12:

$Id: s3c2410.c,v 1.5 2004/10/12 10:10:15 bjd Exp $

The remainder of the files are dated somewhat similar...

Maybe this can clarify some things?

BR,
  Martin Egholm
