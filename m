Received: from [203.81.30.150] (helo=roxus.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AeqpW-0002Za-Ni
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2004 07:13:15 +0000
Received: from roxus.net (roxus.net [127.0.0.1])
	by roxus.net (8.11.6/8.11.6) with ESMTP id i0977NQ09083
	for <linux-mtd@lists.infradead.org>; Fri, 9 Jan 2004 15:07:25 +0800
From: "luoxiao" <luoxiao@roxus.net>
To: linux-mtd@lists.infradead.org
Date: Fri, 9 Jan 2004 15:07:23 +0800
Message-Id: <20040109150723.M52805@roxus.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Subject: best nand flash fs for 2.0.38 kernel?
Reply-To: luoxiao@roxus.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all

I'm currently trying to add nand flash file system support for the linux 
2.0.38 porting on my company's product. I choosed the JFFS but the JFFS2 
because it fits the old 2.0.x kernel. In the processing of porting I met a 
lot of troubles and I thought some of them are caused by bugs of JFFS code 
rather by my porting. So a question is: is the JFFS stable enough for product 
usage? I saw it is still in the fs/ directory of the brand-new 2.6.0 kernel. 
Does this fact mean that the version of JFFS in the 2.6.0 kernel is stable 
enough to use? I've searched the docs and mail archive but it seems that no 
one is using JFFS now. So the question is: what is the best nand flash file 
system for the 2.0.x kernel? 

Any hints are appreciated, thanks!


Xiao Luo
Operating System Dept.
Roxus Tech.
