Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0LcB-0006Hk-31
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 10:52:38 -0400
Received: from cc ([69.70.1.242]) by VL-MO-MR011.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with SMTP id <0I3200H6S6MG4K@VL-MO-MR011.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 10:51:53 -0400 (EDT)
Date: Thu, 26 Aug 2004 10:51:47 -0400
From: CG <christian@mcdi.com>
To: linux-mtd@lists.infradead.org
Message-id: <004201c48b7c$364abdd0$6b01a8c0@cc>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: MTD utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a problem to compile MTD utilities (mkfs.jffs2, erase, eraseall,
etc.) .  The processor that I use is the AT91RM9200 from Atmel.  Is there
somebody who's using these utilities?  I'll appreciate to have a feedback to
know to compile these tools for my platform.


I modified the makefile to add the CROSS = arm-linux-

I got these errors :
arm-linux-gcc -g -o ftl_format ftl_format.o
/usr/arm-linux/bin/ld: cannot open crt1.o: No such file or directory
collect2: ls returned 1 exit status
make: *** [ftl_format] Error 1

Best regards

Christian
