Received: from law10-oe36.law10.hotmail.com ([64.4.14.93] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3YOp-0007VH-P9
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 10:35:47 +0000
From: "Kishore" <kishoreseera@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 17 Mar 2004 16:14:03 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-ID: <Law10-OE36FQG101s7h0004dbba@hotmail.com>
Subject: Unable to boot linux NetSC520 demo board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Groups,

                   I'm trying to port Linux onto NetSC520 demo board with
Elan SC520 microcontroller for the past two weeks. I built a bzImage using
the snapgear linux version 2.4. the size of the kernel Image is 604k and
jffs2 is 3.1Mb. I'm using lstart16.abs from AMD as the linux start up. I
loaded the kernel Image at address 0 and jffs2.img at address 100000 of the
flash memory. when I run the linux from the target, it is not booting up
properly. It is getting crashed in the bootsect.S file itself. I saw the
message archieve and saw some of them talking about porting linux onto
NetSC520 board and successfully booting directly from flash. Can anybody pls
help me in solving my problem and help me booting the linux from flash. Also
pls suggest me, the changes which I need to do for the bzImage.

with Regards,
Kishore.S.Kumar
