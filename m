Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LSSx-0003ig-00
	for mtd-list@infradead.org; Wed, 24 Jan 2001 16:08:11 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LSSv-0003hv-00
	for mtd@infradead.org; Wed, 24 Jan 2001 16:08:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBLKIBMLGPAFMHEJICMEKNCEAA.michalk@awpi.com> 
References: <NEBBLKIBMLGPAFMHEJICMEKNCEAA.michalk@awpi.com> 
To: " Brian Michalk" <michalk@awpi.com>
Cc: mtd@infradead.org
Subject: Re: compiling DOC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 24 Jan 2001 16:07:35 +0000
Message-ID: <19215.980352455@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


michalk@awpi.com said:
>  I tried with 2.4 kernels as well.  I know you guys are busy, but I
> would like a little cookbook help to be able to compile a kernel, and
> then boot off DOC.

Get stock 2.4.0 kernel.
Do this:

CONFIG_MTD=y
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOCPROBE_ADDRESS=0  ( autoprobe)
CONFIG_MTD_DOCPROBE_HIGH=n
CONFIG_MTD_DOCPROBE_55AA=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y


boot with root=/dev/nftla1 (or /dev/nftla2)


If you have to use 2.2, there are patches at 
ftp://ftp.linux-mtd.infradead.org/pub/mtd/patches/

If you apply these, you can then get the latest code from CVS (Don't use 
the ancient tarballs) and drop in the contents of the include/linux/mtd and 
drivers/mtd directories. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
