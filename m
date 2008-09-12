Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeAMO-0006Mx-Sr
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 15:15:01 +0000
Received: by gxk5 with SMTP id 5so19165389gxk.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Sep 2008 08:14:59 -0700 (PDT)
Message-ID: <5c9632b60809120814w59bd4593jbaaffac8e4693888@mail.gmail.com>
Date: Fri, 12 Sep 2008 11:14:58 -0400
From: "Pete Morici" <pete.morici@alumni.purdue.edu>
Sender: pvmorici@gmail.com
To: linux-mtd@lists.infradead.org
Subject: alauda mtd driver
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm attempting to use the mtd version the the alauda driver.  I see
the following output in
 dmesg...

"""
[ 1631.648320] usb 1-1: new full speed USB device using ohci_hcd and address 3
[ 1632.317038] usb 1-1: configuration #1 chosen from 1 choice
[ 1632.372835] /build/buildd/linux-2.6.24/drivers/mtd/nand/alauda.c:
alauda probed
"""

...when I connect the device but no /dev/mtdx device appears as I
would expect.  I'm using a
 MAUSB-10 reader and a 1GB M+ picture card.  My kernel is Ubuntu
'2.6.24-19-generic #1
SMP'.  I noticed in the source it looks like there are only ids for
cards up to 256MB in size could
that be my problem?  or am I missing something else.

Thanks,
-Pete
