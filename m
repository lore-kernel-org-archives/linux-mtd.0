Received: from host46-203.pool8538.interbusiness.it ([85.38.203.46]
	helo=dave-tech.it)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ENpPp-0000nT-8K
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2005 06:25:44 -0400
Message-ID: <43464D6A.3050902@dave-tech.it>
Date: Fri, 07 Oct 2005 12:26:50 +0200
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: MTD crash with kernel 2.6.13
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I encountered a problem with MTD with kernel 2.6.13 on ARM architecure. 
It crashes in __wake_up_common function when I try to erase a MTD 
partition on StrataFlash. I've already talked with David Woodhouse over 
#mtd channel and it really seems it is a bug in MTD code (he suggests it 
is due to an uninitialized wait queue). I tried to patch the kernel with 
latest MTD code but the crash still occurs. Here are available the full 
dumps of the console (with and without DEBUG_WAITQ flag): 
http://www.dave-tech.it/download/misc/sw/zefeer/zelk/mtd/

Anybody experienced the same problem? Any suggestions about how to solve it?


Thanks in advance,
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
