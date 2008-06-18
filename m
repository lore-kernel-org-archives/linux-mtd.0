Received: from smtpout.cs.fsu.edu ([128.186.122.75] helo=mail.cs.fsu.edu)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8zGG-0005dl-3X
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 15:07:48 +0000
Received: from [192.168.16.174] (unknown [192.168.16.174])
	by mail.cs.fsu.edu (Postfix) with ESMTP id 47C3EF2946
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Jun 2008 11:09:39 -0400 (EDT)
Message-ID: <48592600.4040309@cs.fsu.edu>
Date: Wed, 18 Jun 2008 11:13:04 -0400
From: Sarah Diesburg <diesburg@cs.fsu.edu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: diskonchip md2202-d256
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My research group is experimenting with diskonchip, and we have two of
the DoC 2000 256MB DIPs.  We eventually would like to mount ext3 on top
of inftl in Linux.  We are using a 2.6.25.6 kernel, and we have grabbed
the latest mtd utilities from the git repository.

We have had a hard time coming by a how-to with the latest kernels and
modules, so I wanted to post our proposed methodology here.  Does the
following sequence of events look right?

1. modprobe diskonchip

2. go into the mtd-utils directory and run the "MAKEDEV" script to
create the /dev/mtd* entries and the /dev/inftla entries.

3. ntfl_format -i /dev/mtd0

4. modprobe inftl

5. fdisk /dev/inftla and partition as a disk

6. mkfs.ext3 /dev/inftla

7. mount -t ext3 /dev/inftla /mnt

Thanks for your help!

-- Sarah


-- 
Sarah Diesburg
Florida State University
"I've got so many kernels I can start making popcorn!"
