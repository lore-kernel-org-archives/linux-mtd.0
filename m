Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vaao-0007fe-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 09:37:55 +0100
Received: from localhost (rob@localhost)
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id f9M8l7B23353
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 10:47:07 +0200
Date: Mon, 22 Oct 2001 10:47:07 +0200 (MEST)
From: Robert Kaiser <rob@sysgo.de>
To: linux-mtd@lists.infradead.org
Subject: MTD support for Intel E28F016S3 ?
Message-ID: <Pine.LNX.4.21.0110221043350.13158-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I am trying to implement JFFS/MTD support for the SSV DNPC module.
This module has an Intel E28F016S3 which does not appear to be CFI
compliant. Which chip driver should I use for this one (is there any) ?

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
