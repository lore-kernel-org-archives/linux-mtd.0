Received: from huva.hittite.isp.9tel.net ([62.62.156.28])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al9OT-0001HC-P9
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 16:15:21 +0000
Received: from jennifer (14.170.62.62.internet9t.9massy1-1-ro-bas-2.9tel.net
	[62.62.170.14])
	by huva.hittite.isp.9tel.net (Postfix) with ESMTP id D3B889BF44
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jan 2004 17:15:00 +0100 (CET)
From: "Philippe" <philippe@accuitee.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 26 Jan 2004 17:15:13 +0100
Message-ID: <000001c3e427$947bbaa0$247dfea9@jennifer>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1075129659.24024.86.camel@hades.cambridge.redhat.com>
Subject: RE : DOC2k booting speed ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thank you for your quick answer

> Grub's drivers are not particularly optimised. Why use an initrd rather
> loaded by the bootloader, rather than having the kernel itself access
> the device? That should be much faster, and wouldn't even need to whole
> device to be read at startup.

As I cannot use JFFS2 with the DOC, I use an initrd to put the whole system
in ramdrive without having the doc mounted. 
I did it to avoid filesystem failures. 

Is there another way to 
 1) boot from the DOC, 
 2) build up the OS filesystem 
 3) umount the DOC ? -> protect filesystem in case of unexpected powerdown

I saw many things about pivot_root but didn't found any simple example to
get started.

Thank you.
