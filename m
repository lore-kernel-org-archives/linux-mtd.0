Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Z3K6-0002Og-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 05:11:46 +0000
Received: from nt40server ([192.168.1.101])
	by Dual166.localdomain (8.9.3/8.9.3) with SMTP id VAA22727
	for <linux-mtd@lists.infradead.org>; Thu, 7 Feb 2002 21:21:08 -0800
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <linux-mtd@lists.infradead.org>
Subject: Flash left in a write mode
Date: Thu, 7 Feb 2002 21:22:20 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFMEBBDEAA.acurtis@onz.com>
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

I have observed a problem where the flash is left in a write mode even after
the file-system is unmounted. (Intel Strata flash, cmdset_0001.c)

The problem is this: if the flash is written to and then the system is
immediately rebooted, the flash is left in a write state. (if you read it
you get status information not flash contents.) If you then try to boot off
of this device, it will fail. If you read the flash, with a "dd" command for
instance, then you can reboot successfully.

I am surprised that this problem has not been reported. It should be an easy
fix. (something that I will handle in BIOS code until it is patched.)

Thanks
