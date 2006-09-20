Received: from smtp-relay.tamu.edu ([165.91.22.120] helo=sr-4-int.cis.tamu.edu)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQ4yV-0006ZF-8u
	for linux-mtd@lists.infradead.org; Wed, 20 Sep 2006 17:31:03 +0100
Received: from localhost (localhost.tamu.edu [127.0.0.1])
	by sr-4-int.cis.tamu.edu (Postfix) with ESMTP id A7EC74999
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Sep 2006 11:30:29 -0500 (CDT)
Received: from hobbiton.cs.tamu.edu (smtp.cs.tamu.edu [128.194.138.66])
	by sr-4-int.cis.tamu.edu (Postfix) with ESMTP id 282454513
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Sep 2006 11:30:27 -0500 (CDT)
Received: from sun (sun.cs.tamu.edu [128.194.138.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hobbiton.cs.tamu.edu (Postfix) with ESMTP id DBFF882B95
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Sep 2006 11:30:26 -0500 (CDT)
Date: Wed, 20 Sep 2006 11:30:26 -0500 (CDT)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: linux-mtd@lists.infradead.org
Subject: Multiple writes to NAND OOB...
Message-ID: <Pine.GSO.4.58.0609201121180.26525@sun>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have the following question regarding multiple writes to OOB data:

Is it possible to write to the OOB data of the same page multiple times ?
If so, does it mean that the bytes being written are to different
locations(offsets) of the OOB because a byte cannot be rewritten in NAND
unless its block is erased ?

thanks,
-siddharth

_____________________________________________________________________
     Unix is user friendly - its just picky about its friends.
_____________________________________________________________________
