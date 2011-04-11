Received: from mxout1.idt.com ([157.165.5.25])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9H79-0005aj-GJ
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 13:25:12 +0000
Received: from mail.idt.com (localhost [127.0.0.1])
	by mxout1.idt.com (8.13.1/8.13.1) with ESMTP id p3BDP8b3026531
	for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2011 06:25:08 -0700
Received: from corpml1.corp.idt.com (corpml1.corp.idt.com [157.165.140.20])
	by mail.idt.com (8.13.8/8.13.8) with ESMTP id p3BDP794006044
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 06:25:08 -0700 (PDT)
Received: from CORPEXCH1.na.ads.idt.com (localhost [127.0.0.1])
	by corpml1.corp.idt.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	p3BDP7W14487 for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 06:25:07 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: After writing successfully a NAND block is this reliable ar reading
	as a NOR sector?
Date: Mon, 11 Apr 2011 06:25:05 -0700
Message-ID: <AEA634773855ED4CAD999FBB1A66D0760190B688@CORPEXCH1.na.ads.idt.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

Am interested in using MT29F2G08AABWP NAND Flash memory for a new
embedded design and I couldn't find a clear specification regarding how
reliable is the NAND flash vs. NOR for reading operation.

If I program successfully a NAND block, read back and verify
successfully the information and never erase or program that particular
block again, can I assume that block will remain a good block and the
information written there is safe for READING, roughly as safe as a NOR
sector?

Is it any reason to keep in NAND copies of Kernel, bootloader or RFS? Is
it a standard practice in the industry to keep copies in NAND even
though we do not erase/program those during the normal operation?=20
=20

Thank you,
Andrei
