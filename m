Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sAWq-000224-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 23:43:56 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g31Mhs97011446
        for <linux-mtd@lists.infradead.org>; Mon, 1 Apr 2002 16:43:54 -0600
Message-ID: <01f601c1d9ce$b9a1e5d0$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: Are erase suspends possible?
Date: Mon, 1 Apr 2002 16:44:04 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hello,

I was looking through the code in 
cfi_cmdset_0001.c, and it appears that
erase suspends are not implemented. Is
this correct?

Suspends are needed by my logging routine, 
in which I'll be writing several bytes per 
second to flash in a circular buffer of blocks.
I will have to erase the next block in
the sequence while writing to the current 
block, to keep the logging as continuous
as possible.

Thanks,
Derek Ross.
