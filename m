Received: from motgate.mot.com ([129.188.136.100])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOJ2Q-0001zU-W8
	for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2003 15:54:11 +0000
Received: from il06exr06.mot.com (il06exr06.mot.com [129.188.137.136])
	by motgate.mot.com (Motorola/Motgate) with ESMTP id hAOFqZZx008203
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Nov 2003 08:52:36 -0700 (MST)
Received: from labs.mot.com (udomsvc2.labs.mot.com [173.23.250.2])
	by il06exr06.mot.com (Motorola/il06exr06) with ESMTP id hAOFpZ6u019313
	for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2003 09:52:20 -0600
Received: from udomsvc5.labs.mot.com (udomsvc5.labs.mot.com [173.23.250.5])
	hAOFpZeT022481       for <linux-mtd@lists.infradead.org>;
	Mon, 24 Nov 2003 09:51:35 -0600 (CST)
Received: from atdc00536 by ims1.labs.mot.com
 (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0HOV00E145DZRX@ims1.labs.mot.com> for
 linux-mtd@lists.infradead.org; Mon, 24 Nov 2003 09:51:35 -0600 (CST)
Date: Mon, 24 Nov 2003 09:51:35 -0600
From: Don Hiatt <don@motorola.com>
To: linux-mtd@lists.infradead.org
Message-id: <FPEBLIAFGDEEOHHAGOKBAEGPCDAA.don@motorola.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: DiskOnChip 2000 conflicts with Native CFI?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have SA1110 board (based on Intrinsyc's cerfboard) that I am
trying to get a 384MB DOC (2000, in DIP package) to work with.
The DOC leaves on CS2 so has an base address of 0x10000000 and is
attached to the address bus shifted up 2 lines as per M-SYS tech
note. For the life of me, I am unable to get this thing working.
My question is, it appears that the CFI interface uses the same
major/minor number as the DOC (90,0). Is it possible to use CFI
and DOC at the same time? When I rebuild the kernel (2.4.9 with all
the ARM patches) and configure it to look for the DOC at 0x10000000
it does not seem to see the DOC.

I would certainly appreciate any and all comments or suggestions. :)

Cheers,

don
