Received: from postman.ateme.net ([217.167.236.59])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0jik-0001iT-5k
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 17:09:16 +0000
Received: from ateme.fr (pc-179.ateme.net [172.16.16.179])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postman.ateme.net (Postfix) with ESMTP id 7D45B4B8019
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2005 18:08:41 +0100 (CET)
Message-ID: <4210DB19.9000808@ateme.fr>
Date: Mon, 14 Feb 2005 18:08:41 +0100
From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Janot?= <f.janot@ateme.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2_get_inode_nodes(): Data CRC failed on NAND device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a board with samsung K9F5608UOC nand flash and mpc5200 ppc processor.
I run a 2.4.25 kernel (yes I know it's very old) on this board with mtd 
from 20041007 snapshot.

I burn a jffs2 image on the nand with "nandwrite -j" (from nfs). All is 
ok and the filesystem is good but
when I reboot the board or when I remove the power "violently", I get 
somes messages like this :
/Empty flash at 0x009826d8 ends at 0x00982800
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00cc0f90: Read 
0x6e17981a,  calculated 0x4614a389
/And I get one more message each time I reboot the board. But the 
filesystem doesn't seem corrupted.

If I umount / before rebooting, I don't have one more error message at 
the next reboot.

Here is my kernel command line (passed from uboot). Do I forget some 
mount options ?
/Kernel command line: root=/dev/mtdblock3 rw 
ip=172.16.48.19:172.16.16.240:172.16 .254.254:255.255.0.0::eth0:off panic=1
/
Do you have any idea about where the problem could come from ?

Frederic.

PS: sorry for my poor english.
