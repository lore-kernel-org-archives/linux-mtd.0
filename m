Received: from mail22.messagelabs.com ([193.109.255.115])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VUUa-00075k-S0
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 12:00:40 +0100
Received: from stevejunior (unknown [192.168.200.17])
	by netstar.stirling-dynamics.com (Postfix) with SMTP id E6E959802
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jun 2003 11:59:49 +0100 (BST)
Message-ID: <000f01c33bd2$2a579660$11c8a8c0@stevejunior>
From: "Stephen Brown" <sbrown@stirling-dynamics.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 26 Jun 2003 12:00:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: quick question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

what do you all think about this:

http://www.m-sys.com/content/products/product.asp?PID=17&FILE=DOCIdePro&FAM=
doc

if I used this as a standard IDE device does this mean that I wouldn't
require any MTD drivers for linux and just use the standard IDE?

if so could I format this as EXT2 fs and contain my ROOT file system on it?
or would I still run the risk of power failure disk error etc?

 I mean I can load my ROOT fs into memory so thats not a problem, see the
thing is at the moment I can't get the MTD drivers to work with the onboard
'Msys D-O-C' on an Ampro p5e module, reason being is Ampro use part of the
FLASH to store the bios for the ampro board and have specific tools for
formatting etc, so I boot from a dos partition using 'LoadLin' or I can boot
from a Harddrive connected to the IDE, so in my case maybe the 'IDE PRO' is
an alternative , also to save recompiling the kernel for the p5e maybe..

anyways let me know what you think,

kind regards

stephen


________________________________________________________________________
This e-mail has been scanned for all viruses by Star Internet. The
service is powered by MessageLabs. For more information on a proactive
anti-virus service working around the clock, around the globe, visit:
http://www.star.net.uk
________________________________________________________________________
