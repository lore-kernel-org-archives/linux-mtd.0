Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFisi-0006fY-0i
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 09:21:28 +0000
Received: from mail154-va3 (localhost [127.0.0.1])	by
 mail154-va3-R.bigfish.com (Postfix) with ESMTP id 6E66C401E7	for
 <linux-mtd@lists.infradead.org>; Thu,  5 Apr 2012 09:21:25 +0000 (UTC)
Received: from VA3EHSMHS027.bigfish.com (unknown [10.7.14.246])	by
 mail154-va3.bigfish.com (Postfix) with ESMTP id CD79E60050	for
 <linux-mtd@lists.infradead.org>; Thu,  5 Apr 2012 09:21:23 +0000 (UTC)
From: Kushwaha Prabhakar-B32579 <B32579@freescale.com>
To: Wood Scott-B07421 <B07421@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Query mtd-utils v1.4.9 : flash_erase.c
Date: Thu, 5 Apr 2012 09:21:22 +0000
Message-ID: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

 I checked latest mtd-utils ver 1.4.9 for file flash_erase.c.=20

It usage MEMGETOOBSEL ioctl to get OOB information from the driver. But thi=
s ioctl may returns error for big NAND chips.=20
The reason of failure would be the following condition at linux/driver/mtd/=
mtdchar.c
 if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))

MEMGETOOBSEL has been obsolete. then Why mtd-utils still using it.

Also, I don't think flash_erase.c supports MTD_OOB_AUTO. Although its suppo=
rt is already part of Linux kernel.=20

Regards,
Prabhakar
