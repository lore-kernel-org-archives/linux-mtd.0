Received: from mail-relay-1.tiscali.it ([213.205.33.41])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D54TE-0005kj-3A
	for linux-mtd@lists.infradead.org; Sat, 26 Feb 2005 11:07:09 -0500
Received: from [127.0.0.1] (84.222.10.52) by mail-relay-1.tiscali.it
	(7.1.021.3) id 4202030C0039ED34 for linux-mtd@lists.infradead.org;
	Sat, 26 Feb 2005 17:06:49 +0100
Message-ID: <42209E97.2070201@flp-consultant.it>
Date: Sat, 26 Feb 2005 17:06:47 +0100
From: Paolo Tagliavini <ptagliavini@flp-consultant.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: writing jffs2 file system trought JTAG
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all ,

I'm working on ARM920 based embedded system. Linux kernel is 2.4.20.
This system mount a 64 Mbyte Samsung NAND flash.
My simple questions are:
    Is it  possible write in nand flash  the jffs2 image , made with 
mkfs.jffs2 , using JTAG interface ?
    Is there any way to handle nand bad block dowloadind jffs2 image 
trought JTAG interface ?

Best regards

Paolo Tagliavini
