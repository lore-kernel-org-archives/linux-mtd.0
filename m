Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cAIx-0005cm-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 19:43:11 +0100
Received: from penguin-ext.wise.edt.ericsson.se ([194.237.142.110])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15cAOg-0007j6-00
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2001 19:49:07 +0100
Received: from mbb4.ericsson.se (mbb4.ericsson.se [136.225.152.56])
	by penguin.wise.edt.ericsson.se (8.11.0/8.10.1/WIREfire-1.3) with ESMTP id f7TIn1v14597
	for <mtd@infradead.org>; Wed, 29 Aug 2001 20:49:04 +0200 (MEST)
Received: from switchboard.ericsson.se
 (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
 by mbb4.ericsson.se (PMDF V5.2-33 #39350)
 with ESMTP id <0GIU00156EXP2F@mbb4.ericsson.se> for mtd@infradead.org; Wed,
 29 Aug 2001 20:49:01 +0200 (MET DST)
Date: Wed, 29 Aug 2001 20:49:01 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Subject: warning or debug text ?
To: "mtd@infradead.org" <linux-mtd@lists.infradead.org>
Message-id: <3B8D391D.F0272295@inn.ericsson.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT
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

in cfi_cmdset_0002.c I hit this line a lot when I created the feedback loop
with the log file on a jffs2 partition.. I don't see is so often now but
still is it needed??

   printk("Waiting for chip to read, status = %d\n", chip->state);

It's a few printk in this file that has nothing indication the type of the
message and no text informing the user on what subsystem it's comming from.

In the mtd subsystem it's ALOT of this. Should I just add KERN_DEBUG to
everything ?? It's not nice to get stuff on the console when it's only a
warning or debug info.


-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se
