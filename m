Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=localhost.onz.COM)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XxZA-0002xW-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 06:23:04 +0100
Received: from nt40server (nt40server [192.168.1.101])
	by localhost.onz.COM (8.11.6/8.11.6) with SMTP id g6Q5MVk22919
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 22:22:32 -0700
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <linux-mtd@lists.infradead.org>
Subject: What happened to 64-bit support?
Date: Thu, 25 Jul 2002 22:22:31 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFGEONDJAA.acurtis@onz.com>
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

I have had a chance to continue working on my Read-Only problem and have
discovered that the flash is getting mounted as if it was ROM. Our system is
configured with 4-16bit Strata flash devices and should be using the CFI
interface. It appears that the flash is being recognized as CFI compliant
bus fails the buswidth test.

Using the latest CVS code I recompiled with DEBUG, genprobe...() reports
that it does not support buswidth of 8. jedec_probe...() did not work. It
did appear to work with the ROM mapped to RAM option but this also the
reason that it is always mounted Read-Only.

I retrieved linux-2_4-branch from CVS, it appears that this does not have
64-bit bus support either. Looking at cfi_probe(), the case statement does
not support buswidth of 8.

Where can I find the 64-bit patches?
