Received: from e32.co.us.ibm.com ([32.97.110.150])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FySYp-00059s-LD
	for linux-mtd@lists.infradead.org; Thu, 06 Jul 2006 08:02:59 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k66C2BeA012434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Thu, 6 Jul 2006 08:02:11 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k66C2Xa8171760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 6 Jul 2006 06:02:33 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k66C2Arf008457
	for <linux-mtd@lists.infradead.org>; Thu, 6 Jul 2006 06:02:10 -0600
Subject: Re: Linux on USB Flash Disk under jffs2.
From: Josh Boyer <jdub@us.ibm.com>
To: efimot@hotmail.ru
In-Reply-To: <8498b79b0607060331r7c00dacbhd4ba7ddc8119822b@mail.gmail.com>
References: <8498b79b0607060331r7c00dacbhd4ba7ddc8119822b@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 06 Jul 2006 07:02:08 -0500
Message-Id: <1152187328.22623.56.camel@weaponx.rchland.ibm.com>
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

On Thu, 2006-07-06 at 14:31 +0400, Efimot wrote:
> I want to put OS Linux on bootable USB Flash Disk.
> 
> Whether has sense to do rootfs under jffs2? Or ext3?
> And if yes, what erase block size to use?

That depends on the USB Flash drive you are talking about.  Most don't
expose the raw flash chips contained within them.  So typically you'd
have to use something like block2mtd to convert the USB mass storage
device to an MTD and then put JFFS2 on top of that.

If that sounds like too much work, you can try ext3 and hope that your
USB flash drive has decent wear-leveling contained within it.

josh
