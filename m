Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12W3cC-0005JY-00
	for mtd-list@infradead.org; Fri, 17 Mar 2000 20:45:00 +0000
Received: from mbunix.mitre.org ([129.83.20.100] helo=smtpproxy1.mitre.org)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12W3cA-0005JF-00
	for mtd@infradead.org; Fri, 17 Mar 2000 20:44:58 +0000
Received: from avsrv1.mitre.org (avsrv1.mitre.org [129.83.20.58])
	by smtpproxy1.mitre.org (8.9.3/8.9.3) with ESMTP id PAA17179
	for <mtd@infradead.org>; Fri, 17 Mar 2000 15:44:47 -0500 (EST)
Received: from mailsrv1.mitre.org (mailsrv1.mitre.org [129.83.20.6])
	by smtpsrv1.mitre.org (8.9.3/8.9.3) with ESMTP id PAA09949
	for <mtd@infradead.org>; Fri, 17 Mar 2000 15:44:15 -0500 (EST)
Received: from mitre.org ([129.83.41.64]) by mailsrv1.mitre.org
          (Netscape Messaging Server 4.1) with ESMTP id FRL2YL00.QIW for
          <mtd@infradead.org>; Fri, 17 Mar 2000 15:44:45 -0500
Message-ID: <38D29904.DA66D6E@mitre.org>
Date: Fri, 17 Mar 2000 15:43:48 -0500
From: "Mr. Oogie Boogie" <rpreston@mitre.org>
MIME-Version: 1.0
Subject: LILO and booting from DiskOnChip
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hello All,

Sorry to butt in but I hope this is an appropriate group for my
problem. I have a Mighty Mite carrier board with a DiskOnChip 2000. I
am using the Linux v2.2 drivers from M-Systems with kernel v2.2.13.

Simply, when boot/root is set to the DoC, kernel messages during
bootup *do not* appear over the serial line. Strangely, when a boot
floppy (identical kernel) is used with the DoC as root the kernel
messages *do* appear over the serial line. 
 
Has anyone encountered this problem before?

Do you think this is an error with the DoC or kernel?

Any helpful suggestions on how I can fix this?

Thanks for your time,

Ralph A. Preston
The MITRE Corporation
202 Burlington Road, MS E015
Bedford, MA 01730-1420
Work: 781-271-7914  Fax: 781-271-8875  Cell: 617-257-2695


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
