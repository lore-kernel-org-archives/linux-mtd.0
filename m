Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DdnSH-0005CD-Mf
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 07:01:43 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 02 Jun 2005 19:01:04 +0800
Message-Id: <1117710064.23635.100.camel@server21>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: jffs2, intel flash and i.MX21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working with i.Mx21 and intel strata nor flash. I wish to use jffs2
and I have got a readymade jffs2 file sytem for nor flash from may be
freescale/motorola. I am told that this file system is supposed to be
mounted by the kernel when it boots up. However it does happen so and
system does not boot at all. Can anybody please tell me what's wrong.

I have enabled mtd, jffs2 and intel flash support with bus size of 32.
The intel flash driver cfi_cmdset_0001.c is also there.

Can anybody please give me a clue 

1)	how can I debug that 
2) 	which part of the kernel should I look into i.e where do I found the
code to mount the jffs2 in the kernel tree
3) what might be missing in the kernel config
4) any other idea?


-- 
Munira Ahmed
