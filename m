Received: from moutng.kundenserver.de ([212.227.126.185])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aXdF-00038x-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 09:17:57 +0100
Received: from [212.227.126.155] (helo=mrelayng1.kundenserver.de)
	by moutng7.kundenserver.de with esmtp (Exim 3.35 #2)
	id 17aXdE-0005DA-00
	for linux-mtd@lists.infradead.org; Fri, 02 Aug 2002 10:17:56 +0200
Received: from [217.81.41.153] (helo=pc11)
	by mrelayng1.kundenserver.de with asmtp (Exim 3.35 #2)
	id 17aXdE-0007ei-00
	for linux-mtd@lists.infradead.org; Fri, 02 Aug 2002 10:17:56 +0200
Content-Type: text/plain;
  charset="us-ascii"
From: Jens Nixdorf <jens.nixdorf@embesso.com>
To: linux-mtd@lists.infradead.org
Subject: DOC will formatted again and again 
Date: Fri, 2 Aug 2002 10:20:47 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200208021020.47923.jens.nixdorf@embesso.com>
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

Hi,

i've send this posting some days before, but didn't get an answer and=20
also didn't found a solution somewhere else. Therefore i send my=20
question again:

--snip--

now, with your help, my DoC is acknowledged by the system. But the next
problem is underway ;)
Every time the system is booting, it try to format the DoC. It has two
bad blocks, and therefore i think it starts over and over again. How can
i get rid of it? nftl_format from the mtd-utils still doesnt work, it
brings  still the message:

ioctl(MEMGETINFO): Inappropriate ioctl for device

Here is a part of my dmesg-output after a fresh boot:

NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip 2000
NFTL_setup
Formatting block 1964
Error erasing at 0x1eb0000
Error while formatting block 1964
Formatting block 6028
Error erasing at 0x5e30000
Error while formatting block 6028
Cannot calculate an NFTL geometry to match size of 0x853c0.
Using C:1003 H:16 S:34 (=3D=3D 0x85360 sects)
  nftla:<6>NFTL_request
NFTL read request of 0x2 sectors @ 0 (req->nr_sectors =3D=3D 8)
NFTL read request completed OK
NFTL_request
NFTL read request of 0x2 sectors @ 2 (req->nr_sectors =3D=3D 6)
NFTL read request completed OK
NFTL_request
NFTL read request of 0x2 sectors @ 4 (req->nr_sectors =3D=3D 4)
NFTL read request completed OK
NFTL_request
NFTL read request of 0x2 sectors @ 6 (req->nr_sectors =3D=3D 2)
NFTL read request completed OK
  nftla1

--snip--

Thanks in Advance, Jens
