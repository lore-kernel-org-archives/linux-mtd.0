Received: from pacific.moreton.com.au ([203.143.235.130]
	helo=dorfl.internal.moreton.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19J3gN-0002EC-RW
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 04:57:28 +0100
Received: from snapgear.com (goober.internal.moreton.com.au [192.168.160.212])
	h4N3vDkb021348	for <linux-mtd@lists.infradead.org.>;
	Fri, 23 May 2003 13:57:13 +1000 (EST)
	(envelope-from gerg@snapgear.com)
Message-ID: <3ECD9C30.7090804@snapgear.com>
Date: Fri, 23 May 2003 13:57:36 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [ANNOUNCE] MTD driver for DiskOnChip Millennium Plus and INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi All,

I would like to announce a patch set to support the M-System's
Disk-On-Chip Millennium Plus parts, and their new INFTL (Inverse
NAND Flash Translation Layer).

You can get the patch at either of these sites:

  ftp://ftp.snapgear.org/pub/patches/mplus-20030414.patch.gz
  http://www.uclinux.org/pub/uClinux/misc/mplus-20030414.patch.gz

This patch is against standard Linux 2.4.20 kernel.

The Millennium Plus flash devices are a new family of NAND
flash devices from M-Systems, not unlike the 2000 or Millennium
devices. INFTL is a new improved NFTL. The fundamental difference
is that it stores its chains in inverted order.

There is also some modified mtd utilities that go along with
this driver code at:

  ftp://ftp.snapgear.org/pub/patches/mtd-utils-20030414.tar.gz
  http://www.uclinux.org/pub/uClinux/misc/mtd-utils-20030414.tar.gz

It has an updated nftl_format capable of formating a device
with an INFTL layer or NFTL. There is also some code that
allows programming an IPL on a Millennium Plus device.

The INFTL support is based wholey on the existing MTD NFTL
support. So the same limitations do apply to using INFTL.
Additionally given the current INFTL and Millenium Plus support
is very new there are a number of limitations that will be
rectified in future releases.
 

The currnet limitations include:
 

     1. Both the NFTL and INFTL layers use the same Linux major number.
        So this means that only one of the NFTL or INFTL layers can be
        compiled or loaded into the Linux kernel at any one time.
     2. The INFTL layer can only use a single BDTL parition, even if the
        device is setup with more.
     3. Only 32MiB Millenium Plus devices have been tested.

Feedback welcome:-)

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude          EMAIL:  gerg@snapgear.com
SnapGear Pty Ltd                               PHONE:    +61 7 3435 2888
825 Stanley St,                                  FAX:    +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia              WEB:   www.SnapGear.com
