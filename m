Received: from nimbus19.internetters.co.uk ([209.61.216.65])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2TK2-0002LC-5d
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2004 07:30:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by cambridge.braddahead.com (Postfix) with ESMTP id D50375ABEA
	for <linux-mtd@lists.infradead.org>;
	Wed,  1 Sep 2004 12:30:30 +0100 (BST)
From: Alex Bennee <kernel-hacker@bennee.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1094038230.29012.246.camel@cambridge.braddahead.com>
Mime-Version: 1.0
Date: Wed, 01 Sep 2004 12:30:30 +0100
Content-Transfer-Encoding: 7bit
Subject: Handling non-uniform erase blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are using Am29LV160D flash chips on our SH based board. The chip has
a series on small blocks at the top or bottom of the address range for
use in bootstrap code or configuration storage.

When I set up my partitions I get this report:

Creating 4 MTD partitions on "India1 FLASH":
0x00000000-0x00010000 : "Boot Code"
0x00010000-0x001e0000 : "Kernel"
0x001e0000-0x001fc000 : "FPGA"
mtd: partition "FPGA" doesn't end on an erase block -- force read-only
0x001fc000-0x00200000 : "Config"

Which indicates the treats the device as having a series of equal sized
erase blocks so it can't erase the small blocks on their own. Is this a
limitation of the mtd CFI code? Has anyone attempted to address this
issue?

I can have a look at implementing support if needed but before I do I
thought it worth checking with the list. I'm afraid I got no joy out of
google.

-- 
Alex, Kernel Hacker: http://www.bennee.com/~alex/

"The C Programming Language -- A language which combines the flexibility
of assembly language with the power of assembly language."
