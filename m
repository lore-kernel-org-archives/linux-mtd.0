Received: from postman.ateme.net ([217.167.236.59])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEQHJ-0002aX-96
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 06:13:30 -0500
Received: from ateme.fr (pc-179.ateme.net [172.16.16.179])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postman.ateme.net (Postfix) with ESMTP id 93CDD4B801A
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 12:13:29 +0100 (CET)
Message-ID: <4242A0D9.1090208@ateme.fr>
Date: Thu, 24 Mar 2005 12:13:29 +0100
From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Janot?= <f.janot@ateme.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Problem mounting mtd after nandwrite
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
                                                                               
 
I have some problem when trying to mount jffs2 partition directly after 
flash it.
Here is what I did :
                                                                               
 
flash_eraseall /dev/mtd4
nandwrite -j /dev/mtd4 img2burn.jffs2
mount -t jffs2 /dev/mtdblock4 /mnt/nand
                                                                               
 
mount returns the following error
mount: Mounting /dev/mtdblock4 on /mnt/nand failed: Invalid argument
                                                                               
 
Note that my root filesystem is mount over NFS
If I reboot the board (in NFS), I am able to mount /dev/mtdblock4 
without problem
                                                                               
 
I used kernel 2.4.25 with mtd driver from 20041007 snapshot and I port 
myself the nand flash driver (samsung K9F5608UOC)
mount program I used comes from busybox 1.0
                                                                               
 
Can you help me deal with this problem ?
Thanks
                                                                                

Frederic
