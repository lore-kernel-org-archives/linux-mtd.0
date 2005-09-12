Received: from c-24-91-108-216.hsd1.ma.comcast.net ([24.91.108.216]
	helo=ahgu.homeunix.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EEr4s-0003EE-F5
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 12:22:51 -0400
Received: from maaxiang (fwma1.atitech.com [204.176.13.6])
	(authenticated bits=0)
	by ahgu.homeunix.com (8.12.11/8.12.11) with ESMTP id j8CGF5bu045859
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Sep 2005 12:15:05 -0400 (EDT)
	(envelope-from ahgu@ahgu.homeunix.com)
Message-ID: <075201c5b7b6$87f49090$1f1a12ac@atitech.com>
From: "ahgu" <ahgu@ahgu.homeunix.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 12 Sep 2005 12:24:58 -0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Subject: NAND Write fails
Reply-To: ahgu <ahgu@ahgu.homeunix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



 There is problem with the recover function in the latest CVS 2 days ago.
 Instead of using the breakme in the wbuf.c
 I put something like this in the nand.c, the lowest write function.

 after write, in the verification:
 if(data dont match || block==###)
 return error.


 I got the driver to crash in case like this. Has anyone seen this 
condition?

 Also, is there a design document for the wbuf.c? I have trouble
 understanding the jffs2_flash_writev function.

 thanks
 Andrew
