Received: from nextgig-5.customer.nethere.net ([209.132.102.165] helo=soda.nextgig.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161to8-0003hn-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 18:21:44 +0000
Received: from DMANESAJIAN (†
	by soda.nextgig.com (8.11.3/8.11.3) with SMTP id fA8IUZ196767
	for <linux-mtd@lists.infradead.org>; Thu, 8 Nov 2001 10:30:35 -0800 (PST)
From: "Daniel Manesajian" <dmanesajian@nextgig.com>
To: <linux-mtd@lists.infradead.org>
Subject: StrataFlash and patching 2.2.16
Date: Thu, 8 Nov 2001 10:34:03 -0800
Message-ID: <CAEBIEGNEOADOFPNEPJJOEEBCDAA.dmanesajian@nextgig.com>
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

Hi list,

This is my first post here. I've been looking at MTD for a few days now as a
solution for getting the Intel Advanced StrataFlash working under Linux.

I've downloaded the latest code from CVS and read the document
"mtd-jffs-HOWTO.txt". I've also started looking through the source code. I
hoping someone can help me with a few questions. First of all, will MTD
support the StrataFlash "out of the box" or will I have to write an MTD
driver for it? Second, I'm running kernel version 2.2.16 and don't see a
corresponding patch at ftp://ftp.infradead.org/pub/mtd/patches. On the MTD
web page it did mention a patch for 2.2.16 but is this kernel no longer
supported? If not is my only option to upgrade my kernel (this isn't very
feasible due to an external vendor's kernel modifications)?

Thank you for your help.

Daniel Manesajian
