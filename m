Received: from mta01.verifone.com ([192.30.91.34]
	helo=verifonedns.verifone.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtZX3-0005cq-WC
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 20:28:32 -0400
Received: from vfintmail1.verifone.com (vfintmail1.verifone.com [192.30.91.84])
	by verifonedns.verifone.com (Postfix) with ESMTP id D2E1E947F1
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Jun 2006 17:28:20 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Creating NAND flash image outside embedded target
Date: Thu, 22 Jun 2006 17:28:13 -0700
Message-ID: <267BDCD982E696419B21B63BF91270310225258A@SMFNTMAIL.verifone.com>
From: "Kevin Starinieri" <Kevin_S1@VERIFONE.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have looked through the mail archives and did not see any subject
threads regarding this.  I am trying to create a NAND flash image
without having to do it on my embedded target. =20

I have created a fake ram mtd device using mtdram driver, using the
following commands on a linux Fedora Core 5 machine:

modprobe mtdcore
modprobe mtdram total_size=3D32768 erase_size=3D16

I then created the necessary mtd block and character devices (mknod) and
then issued:

modprobe mtdblock

I then wanted to partition the fake mtd device and write to it using a
nandwrite utility that I compiled for x86 that is used for samsung arm
s3c2410 nand flash.  But the utility expects the device to be
partitioned and erase regions to be defined.  But, I don't know of
anyway to do this outside of my target.   It seems I need another x86
utility that will create the partitions and erase regions.  Does anyone
know how to create an MTD environment where I can create nand flash
images on my linux Fedora Core 5 box?

kstar
