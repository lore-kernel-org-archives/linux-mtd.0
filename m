Received: from fmmailgate01.web.de ([217.72.192.221])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G24hC-0000LO-3M
	for linux-mtd@lists.infradead.org; Sun, 16 Jul 2006 07:22:01 -0400
Received: from smtp07.web.de (fmsmtp07.dlan.cinetic.de [172.20.5.215])
	by fmmailgate01.web.de (Postfix) with ESMTP id E13F38D18F9
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Jul 2006 12:47:15 +0200 (CEST)
Received: from [87.123.216.123] (helo=oelilaptop)
	by smtp07.web.de with asmtp (TLSv1:EXP1024-RC4-SHA:128)
	(WEB.DE 4.107 #114) id 1G249b-0002ak-00
	for linux-mtd@lists.infradead.org; Sun, 16 Jul 2006 12:47:15 +0200
From: Christian Oelschlegel <c.oelschlegel@web.de>
To: linux-mtd@lists.infradead.org
Subject: Support for command set 0003 not present
Date: Sun, 16 Jul 2006 12:46:24 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200607161246.24661.c.oelschlegel@web.de>
Sender: c.oelschlegel@web.de
Reply-To: c.oelschlegel@web.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi together,

I have tried to find the solution in old Threads, but there wasn't sometimes 
the question but never the Answer.

The pcmciamtd module will be loaded but then the kernel log shows me the 
following:

Jul 16 11:55:14 localhost kernel: [17184337.632000] pccard: PCMCIA card 
inserted into slot 0
Jul 16 11:55:14 localhost kernel: [17184337.632000] cs: memory probe 
0xa0000000-0xa0ffffff: clean.
Jul 16 11:55:14 localhost kernel: [17184337.636000] pcmcia: registering new 
device pcmcia0.0
Jul 16 11:55:15 localhost kernel: [17184338.280000] pcmciamtd: PCMCIA Flash 
memory card driver $Revision: 1.55 $
Jul 16 11:55:15 localhost kernel: [17184338.312000] Found: Intel I28F016S3
Jul 16 11:55:15 localhost kernel: [17184338.312000] intel VALUE SERIES 100  04  
COPYRIGHT INTEL CORPORATION 1995: Found 2 x8 devices at 0x0 in 16-bit bank
Jul 16 11:55:15 localhost kernel: [17184338.392000] Support for command set 
0003 not present
Jul 16 11:55:15 localhost kernel: [17184338.392000] gen_probe: No supported 
Vendor Command Set found
Jul 16 11:55:15 localhost kernel: [17184338.420000] CFI: Found no intel VALUE 
SERIES 100  04  COPYRIGHT INTEL CORPORATION 1995 device at location zero

What is wrong here.

I'm just using mtd the first time here so try to explain a little bit more.

Thank you to all who want to help me.

Oelison.
