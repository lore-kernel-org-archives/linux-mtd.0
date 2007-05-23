Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqlzI-0006b7-BW
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 04:14:31 -0400
Received: from toronto.xi-lite.net (localhost.localdomain [127.0.0.1])
	by toronto.xi-lite.net (Postfix) with ESMTP id 6F16465821A
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 May 2007 08:14:09 +0000 (GMT)
Received: from mail.xi-lite.com (unknown [193.34.35.248])
	by toronto.xi-lite.net (Postfix) with ESMTP id 5D02C65821A
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 May 2007 08:14:09 +0000 (GMT)
Message-ID: <4653F6DE.1090105@parrot.com>
Date: Wed, 23 May 2007 10:10:06 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 sumtool bug ?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In sumtool, in pad_block_if_less_than, we pad and write to a new 
eraseblock if "(data_ofs + req > erase_block_size - datasize)".
But datasize = req + the size of the summary node.

So we pad and write to a new eraseblock if there is not the space for 
the summary node and (the node we are wanting to write) * 2.

Why the condition isn't "(data_ofs > erase_block_size - datasize)" ?


thanks,

Matthieu


PS : about summary, could the sumtool change the order of the nodes to 
avoid to waste too much space. For example if the eraseblock is 16KB and 
we have 4 nodes of 4KB. Sumtool will put in the first eraseblock 3 
nodes, 4KB will be wasted for the sumary node. In this wasted 4KB, we 
could have put smaller nodes.

PS2 : How the kernel implementation does ? Does it try to minimize 
summary overhead, by managing to minimize the summary node size ?
