Received: from mxout2.netvision.net.il ([194.90.9.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188Ob7-00048o-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Nov 2002 17:31:42 +0000
Received: from ras5-p176.jlm.netvision.net.il ([62.0.148.176])
 by mxout2.netvision.net.il
 (iPlanet Messaging Server 5.2 HotFix 0.8 (built Jul 12 2002))
 with ESMTP id <0H50004NOI2DQN@mxout2.netvision.net.il> for
 linux-mtd@lists.infradead.org; Sun, 03 Nov 2002 20:01:26 +0200 (IST)
Date: Sun, 03 Nov 2002 20:02:56 -0300
From: Joseph Teichman <af671@osfn.org>
Subject: Problems with GRUB & nftl_format
To: linux-mtd@lists.infradead.org
Message-id: <1036364578.1604.12.camel@localhost.localdomain>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
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


I have a Virgin Webplayer with a doc2000. I had completely hosed the doc
after trying to write somebody's image to the doc. So, I did an erase
all and used nftl_format to set up the doc again. I used fdisk to
partition it and set up an ext2 file system. Then, I used doc_loadbios
tool to install GRUB. GRUB Installed successfully, and it works, but at
the same time, it seems to have hosed up the doc again. The only thing
that I can do is to reformat the doc, which of course overwrites GRUB,
leaving back to square one. I am using a 2.4.19 kernel, with the latest
cvs grab of mtd-linux. Can anyone tell me what is happening and how I
can work around it?
Thanks,
Joe
