Received: from mail145.messagelabs.com ([216.82.242.163])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LQEHN-0004Ur-UY
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2009 05:08:32 +0000
Received: from [192.168.65.100] (arasv [192.168.65.100])
	by mail.magtech.com.au (Postfix) with ESMTP id B268619438F
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jan 2009 16:08:26 +1100 (EST)
Message-ID: <497950CC.4020901@magtech.com.au>
Date: Fri, 23 Jan 2009 16:08:28 +1100
From: Aras Vaichas <arasv@magtech.com.au>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: how to disable jffs2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I want to update a root filing system which is jffs2 on NAND.

If I just go ahead and erase then nandwrite to my nand I tend to get 
random errors which sometimes cause failures..

I posted details of this earlier, but did not get a reply:
http://lists.infradead.org/pipermail/linux-mtd/2009-January/024311.html

Is it possible to somehow switch off the jffs2 on the root partition so 
I can reflash the chip?

If I re-mount the rootfs as read-only, is the jffs2 still able to write 
to the nand chip?

Aras

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
