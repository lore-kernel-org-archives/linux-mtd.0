Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16s5bF-0001iE-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 18:28:10 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g31HRj97016324
        for <linux-mtd@lists.infradead.org>; Mon, 1 Apr 2002 11:27:52 -0600
Message-ID: <015901c1d9a2$973ef720$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: Can cfi_cmdset.c functions be called by anybody?
Date: Mon, 1 Apr 2002 11:27:51 -0600
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

Part of our flash application will be a real-time
logger.  The real time component will be limited
to certain periods of operation, but when it's running,
it will require about 5 bytes/second to be written
to a fixed circular buffer.

This would be simplified if I were able to directly
use the functions from cfi_cmdset_0001.c.

Are the functions available for any application to
use, or are they only available for device drivers?

Thanks,
Derek Ross.
