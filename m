Received: from kynes.gatewest.net ([198.163.227.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZIYO-0003J0-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 21:27:33 +0000
Received: from yahweh (h24-66-30-3.wp.shawcable.net [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g18LcfQ5019375
        for <linux-mtd@lists.infradead.org>; Fri, 8 Feb 2002 15:38:41 -0600
Message-ID: <007701c1b0e8$c90a9620$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: Is realtime logging possible?
Date: Fri, 8 Feb 2002 15:37:19 -0600
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

Our product will have a slow-realtime logging
component in it, and I'm trying to find out if
flash will be capable of handling it.

We'll be logging about 6 bytes once a second into
flash.  The maximum blocking duration for a write
should be 0.1 second or less.

I understand that sector erases in flash take lots
of time, but it's possible to do erases in the 
background, so that if you organize the writes not
to interfere with the erases (always different sectors)
you won't have long blocking issues.

The technical details are:

CDB89712 (rev B) development board.

Flash TE28F320 B Jedec, not CFI
Will later be using C for final product, which is CFI

Kernel is 2.4.6-rmk1-rayl1, and we also have 2.4.16-rmk2
We can upgrade mtd drivers if necessary.


Thanks,
Derek Ross.
