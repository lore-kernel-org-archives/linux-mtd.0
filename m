Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QTGv6-0000tI-0m
	for linux-mtd@lists.infradead.org; Sun, 05 Jun 2011 17:15:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by redbean.intranet.gw-instruments.de (Postfix) with ESMTP id
	EBA9C2E48A for <linux-mtd@lists.infradead.org>;
	Sun,  5 Jun 2011 18:40:03 +0200 (CEST)
Date: Sun, 5 Jun 2011 18:40:03 +0200 (CEST)
From: Peter Wippich <pewi@gw-instruments.de>
To: linux-mtd@lists.infradead.org
Subject: nandwrite with raw oob data 
Message-ID: <alpine.LSU.2.00.1106051821580.26001@redbean.intranet.gw-instruments.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear all,

I run into the same problem as outlined here before:
http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html

Going a little bit deeper it looks to me that writing any nand flash data 
with raw (precomputed ECC) OOB data is not possible at all with a recent 
Kernel and nandwrite version.

What happens here is that nandwrite will set MTD_MODE_RAW when noecc is 
specified. Doing so will force the kernel driver to write OOB data only on 
a normal write. Obviously this will fail when someone is trying to write 
normal data to flash in MODE_RAW.

Question: is this realy the intended behaviour ???

It may be easy to fix this on kernel level, but may be there is some good 
reason I don't know to do it as it is. And I don't want to break things.

Any comments welcome.

Thank you and Cheers,

Peter
