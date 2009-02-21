Received: from cluster-b.mailcontrol.com ([85.115.56.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lb03c-0007i8-PV
	for linux-mtd@lists.infradead.org; Sat, 21 Feb 2009 22:10:51 +0000
Received: from meyexc1.pace.internal (salts-gw1.pace.co.uk [194.60.90.1])
	by rly06b.srv.mailcontrol.com (MailControl) with ESMTP id
	n1LMAj30012698
	for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2009 22:10:46 GMT
Content-class: urn:content-classes:message
Message-ID: <49A07284.3070201@pace.com>
Date: Sat, 21 Feb 2009 21:30:44 +0000
From: "John Smith" <john.smith@pace.com>
MIME-Version: 1.0
To: <dedekind@infradead.org>
Subject: Re: UBI memory leak after creating and removing volumes
References: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
	<1234885159.17790.280.camel@localhost.localdomain>
In-Reply-To: <1234885159.17790.280.camel@localhost.localdomain>
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously I said:

> On Tue, 2009-02-17 at 12:01 +0000, John.Smith@pace.com wrote:
> > I am using a 2.6.18 Kernel, patched with MTD from Kernel 2.6.21, and
> > UBI from the mainline kernel a few days later on 1 May 2007.  The
> > whole is running on an embedded MIPS device.
> >

The problem is still present on current versions of Linux. I have
tested on 2.6.28.6 using QEMU to make a virtual x86.

With these settings in the kernel .config file:
   CONFIG_MTD=3Dy
   CONFIG_MTD_BLKDEVS=3Dy
   CONFIG_MTD_MTDRAM=3Dy
   CONFIG_MTD_UBI=3Dy

then a sequence of calls of the form

for ((i=3D0; i<100; i++)) ; do
   ubimkvol -d 0 -n 2 -N vol2 -s 1000
   ubimkvol -d 0 -n 3 -N vol3 -s 1000
   ubirmvol -d 0 -n 3
   ubirmvol -d 0 -n 2
done
cat /proc/meminfo | grep Slab

shows Slab increasing by about 1.6kB per iteration

The problem can also be demonstrated using MTD modules,
without using UBI. If I build two MTD simulated devices
as kernel modules using these settings in .config:
   CONFIG_MTD_MTDRAM=3Dm
   CONFIG_MTD_NAND_NANDSIM=3Dm

then

   insmod mtdram.ko
   insmod nandsim.ko
   rmmod  nandsim.ko
   rmmod  mtdram.ko

shows a similar leak of about 1.6kB.


The leak does not happen if the calls are not nested. So
   insmod mtdram.ko
   rmmod  mtdram.ko
   insmod nandsim.ko
   rmmod  nandsim.ko
and
   ubimkvol -d 0 -n 2 -N vol2 -s 1000
   ubirmvol -d 0 -n 2
   ubimkvol -d 0 -n 3 -N vol3 -s 1000
   ubirmvol -d 0 -n 3
do not leak.

The leak does not happen if
# CONFIG_MTD_BLKDEVS is not set.

 From /proc/slabinfo it seems that we are leaking sysfs_dir_cache
objects.

John

John Smith

p.s. some automatic system is about to add a silly disclaimer. Ingore it...
This E-mail and any attachments hereto are strictly confidential and intend=
ed solely for the addressee. If you are not the intended addressee please n=
otify the sender by return and delete the message. You must not disclose, f=
orward or copy this E-mail or attachments to any third party without the pr=
ior consent of the sender. Pace plc is registered in England and Wales (Com=
pany no. 1672847) and our Registered Office is at Victoria Road, Saltaire, =
West Yorkshire, BD18 3LF, UK. Tel +44 (0) 1274 532000 Fax +44 (0) 1274 5320=
10. <http://www.pace.com>
Save where otherwise agreed in writing between you and Pace (i) all orders =
for goods and/or services placed by you are made pursuant to Pace's standar=
d terms and conditions of sale which may have been provided to you, or in a=
ny event are available at http://www.pace.com/uktcsale.pdf (ii) all orders =
for goods and/or services placed by Pace are subject to Pace's standard ter=
ms and conditions of purchase which may have been provided to you, or in an=
y event are available at http://www.pace.com/uktcpurch.pdf. All other incon=
sistent terms in any other documentation including without limitation any p=
urchase order, reschedule instruction, order acknowledgement, delivery note=
 or invoice are hereby excluded.



This message has been scanned for viruses by BlackSpider MailControl - www.=
blackspider.com
