Received: from sccrmhc03.attbi.com ([204.127.202.63])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184OdR-00010b-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 17:45:33 +0100
Received: from c1396309-a.innocent.com ([12.235.89.101])
          by sccrmhc03.attbi.com
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20021023171501.LFZM16403.sccrmhc03.attbi.com@c1396309-a.innocent.com>
          for <linux-mtd@lists.infradead.org>;
          Wed, 23 Oct 2002 17:15:01 +0000
Message-Id: <5.1.0.14.2.20021023101434.021da080@mail.attbi.com>
Date: Wed, 23 Oct 2002 10:15:00 -0700
To: linux-mtd@lists.infradead.org
From: Eugene Surovegin <ebs@innocent.com>
Subject: Re: mtdblock_ro and ext2 yields panic: block not locked
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 08:49 AM 10/23/2002, you wrote:

>The panic comes via the INIT_REQUEST macro in mtdblock_request, but
>only after half a dozen requests or so.  The requests appear to be
>associated with the execve at the end of the kernel boot process.
>
>I also get this with yesterday's CVS.
>
>Ideas?  I don't think this is an MTD problem per se, but I'm stumped
>nonetheless.


mtdblock_ro is buggy. It uses nr_sectors instead current_nr_sectors while 
processing request.

I sent a patch to MTD maintainer several weeks ago - nothing happened.

Thanks,


  Eugene Surovegin <mailto:ebs@innocent.com>
