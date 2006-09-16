Received: from mx1.myoutlookonline.com ([69.25.74.59])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GOaFd-0008MD-Ax
	for linux-mtd@lists.infradead.org; Sat, 16 Sep 2006 14:30:33 +0100
From: "Ajay Jain" <ajain@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Subject: OOB Location
Date: Sat, 16 Sep 2006 18:56:11 +0530
Message-ID: <077501c6d993$ae99e920$561fa8c0@pcajain>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: ajain@neomagic.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, 

I have one question regarding JFFS2 on NAND flash. My hardware has a
NAND flash controller, which does automatic error correction. It needs
10 bytes for this, which it stores in the OOB area of each page. JFFS2
also stores some information in this area, from locations 8-15 for a 512
page-size NAND flash. Now the issue is that the storage locations as
used by our hardware and JFFS2 clash. My first hunch is that its a
quirky hardware. My questions is:
Is it possible to use some other location for storing file-system
information. Is there an option, so that JFFS2 can store this
information in some other area? If yes, how to use this. I saw the
'mkfs.jffs2' help, it does not expose any such option. 

Thanks.
Ajay 

 
