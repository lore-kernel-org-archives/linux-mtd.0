Received: from mta06ps.bigpond.com ([144.135.25.138])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ILxT-0001nT-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 05:11:39 +0100
Received: from itsdr.qits.net.au ([144.135.25.87]) by
          mta06ps.bigpond.com (Netscape Messaging Server 4.15 mta06ps Apr
          29 2002 13:22:02) with SMTP id GXMMB000.7OK for
          <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 14:11:24 +1000
Subject: Problems booting from DOC2000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Jun 2002 14:13:31 +1000
content-class: urn:content-classes:message
Message-ID: <26A2FD9AA493164F98D51AB846340698020CEE@itsdr>
From: "George Rathbone" <george@qits.net.au>
To: <linux-mtd@lists.infradead.org>
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

Hi all,

I am having problems booting from a DOC 2000. I am currently using a
2.4.18=20
kernel with an mtd snapshot of 20020531. Now I can get the DOC
recognised
booting from floppy and can install everything OK. However, when I try
to=20
use the lilo-mtd from the snapshot to boot from the kernel, I get the
following
error:

  Uncompressing linux...
        crc error
        -- System halted


The target platform is an Ampro LB/486i with DOC sizes of 16MB or 32MB.
The DOC
has one partition (recognised as /dev/nftla1) which is formatted as
ext2. The=20
lilo config is:
    boot=3D/dev/nftla1
    compact
    install=3D/boot/boot.b
    map=3D/boot/System.map
    disk=3D/dev/nftla
    bios=3D0x80
    image=3D/boot/bzImage-2.4.18-FP
        label=3DFP-Linux
        root=3D/dev/nftla1
        append=3D"init=3D/bin/ash"
        read-only

Basically it seems that lilo(?) is not reading the kernel image from the
DOC
correctly at load time. This same kernel works fine booting from the
floppy
disk. The only change in the kernel from the floppy is the boot device
being set to (93,1) and the ramdisk set to 0.

Any help would be much appreciated.

George
