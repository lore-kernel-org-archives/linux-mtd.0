Received: from palrel2.hp.com ([156.153.255.234])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169sYx-0001TR-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 18:39:03 +0000
Received: from snah6.verifone.com (snah6.verifone.com [192.30.91.23])
	by palrel2.hp.com (Postfix) with ESMTP id 964385E8
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 10:49:40 -0800 (PST)
Received: from smf-nt-mail1.verifone.com (SMF-NT-MAIL1.verifone.com [10.64.88.34])
	by snah6.verifone.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.0) with ESMTP id KAA27594
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 10:49:50 -0800 (PST)
Message-ID: <614CC7C21856D1118DA30060B06B487302ACC800@SMF-NT-MAIL1.verifone.com>
From: Eric Nelson <eric_n2@verifone.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: beginners mtd/jffs question
Date: Fri, 30 Nov 2001 10:49:40 -0800
MIME-Version: 1.0
Content-Type: text/plain
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

We are starting a project which will use a commercial SBC, x86 based.  I am sold
on MTD/JFFS2, but don't understand exactly what we need to look for.  When I
looked at the database of MTD devices, I just saw some AMD and Intel linear
flash.  Here are my questions:

Isn't it better to use plain NOR linear flash than DOC, because then JFFS2 has
complete control?

Is the DOC/JFFS2 a good solution?  I mean, it seems like w/ the commercial
SBC's, the only options are CompactFlash (Ugh!), or DOC.  Is there some type of
PCMCIA flash that meets MTD?  Are there commercial boards w/ linear MTD flash?
