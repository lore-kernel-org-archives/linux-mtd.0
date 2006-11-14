Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GjzPR-0007iT-8P
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 09:37:14 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GjzP8-0004fB-Af
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 15:36:50 +0100
Received: from cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	([62.242.142.98]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 15:36:50 +0100
Received: from martin by cpe.atm2-0-1021162.0x3ef28e62.banxx2.customer.tele.dk
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 15:36:50 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Access to NOR from Linux - what is required?
Date: Tue, 14 Nov 2006 15:36:22 +0100
Message-ID: <ejck96$7qf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I know this is a rather vague question, but how do I gain access to the 
NOR flash on my board?

Ok, a little more clarification follows: I have a PPChameleon board from 
which I can access the NOR from U-Boot. However, launching Linux will 
only grant me access to the NAND. For the NAND I see there is a 
"drivers/mtd/nand/ppchameleonevb.c" file responsible for setting up a 
lot of stuff.
However, with my knowledge I looked for a "drivers/mtd/nor" directory, 
as well, to see what others have done for their boards. But this does 
not exist. Hence my question...

Moreover, and again due to my lack of knowledge, another question: I use 
my NAND device with a filesystem (JFFS2/YAFFS), but I guess the NOR does 
not have one (and should not have one since I use it from U-Boot). So if 
I succeed to gain access from Linux to the NOR, I/O operations should be 
performed using "dd" or what?

For those who wonders; I need to replace the Linux kernel in the NOR 
from the running Linux - not from U-Boot...

BR,
  Martin Egholm
