Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fsaZ-0005vO-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 01:08:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001201c1bf2b$c49e6b60$1902a8c0@infoserve.is.net.tw> 
References: <001201c1bf2b$c49e6b60$1902a8c0@infoserve.is.net.tw> 
To: =?big5?B?p/Wr2K71?= <leehiram@giga.net.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: I need your help . 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Feb 2002 01:20:15 +0000
Message-ID: <10715.1014772815@redhat.com>
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

hiram@thyme.com.tw said:
> 3. Turn on "NTFL support " ,"M-Systems Disk-On-Chip 2000 and
> Millennium"," Loopback device support " and " RAM disk support " in the
> kernel (not a module) 

You don't really need loopback or ramdisk support. But they don't hurt.

> 10.  mknod /dev/fla b 62 0   (make a doc device node) 

That's the wrong device node. It would be /dev/nftla, and any partitions 
would be /dev/nftla1, /dev/nftla1 etc. 

 mknod /dev/nftla b 93 0
 mknod /dev/nftla1 b 93 1
 mknod /dev/nftla2 b 93 2

> Sorry, we don,t support UnitSizeFactor of !=1 yet
> Sorry, we don,t support UnitSizeFactor of !=1 yet
> Could not find valid boot record
> Could not mount NFTL device"

This is complaining because the logical erase size of the NFTL format is 
more than a single _physical_ erase block. The code _ought_ to work like 
that, but hasn't been tested. Other people on the mailing list have asked 
before - I'm not sure what their conclusions were. I think I need to test 
this setup myself and commit the code.

--
dwmw2
