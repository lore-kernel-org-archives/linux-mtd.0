Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eHqt-0001f1-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 16:47:47 +0000
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de [10.0.0.13])
	by mail.berlin.imc-berlin.de (8.12.3/8.12.3) with ESMTP id h0UFKWLT030617
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 16:20:32 +0100
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id SAA18782
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 18:18:46 +0100 (CET)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3E395E76.5030401@imc-berlin.de>
Date: Thu, 30 Jan 2003 18:18:46 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD <linux-mtd@lists.infradead.org>
Subject: Data CRC failed on node at ...
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi there,

while booting my system I get a

"jffs2_scan_inode_node(): Data CRC failed on node at 0x003a14e0: Read 
0xdbd307bb, calculated 0x5a8c4838"

now. Maybe since I interrupted an ftp transfer.

What can I do now?

Is there something like a repair tool?
Or can I at least find out which file is corrupted?

Thanks,

Steven
