Received: from cluster-f.mailcontrol.com ([85.115.62.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZOfL-00071e-3V
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 12:03:10 +0000
Received: from meyexc1.pace.internal (salts-gw1.pace.co.uk [194.60.90.1])
	by rly29f.srv.mailcontrol.com (MailControl) with ESMTP id
	n1HC0Svq000403
	for <linux-mtd@lists.infradead.org>; Tue, 17 Feb 2009 12:02:50 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: UBI memory leak after creating and removing volumes
Date: Tue, 17 Feb 2009 12:01:23 -0000
Message-ID: <F21E92E7B38A1F4D9211341290F7569807EED1AE@salexc1.pace.internal>
From: <John.Smith@pace.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,=20
I am using a 2.6.18 Kernel, patched with MTD from Kernel 2.6.21, and
UBI from the mainline kernel a few days later on 1 May 2007.  The
whole is running on an embedded MIPS device.

I have NAND, and UBI, and gluebi, and jffs2.  I use jffs2, mounted on
an mtdblock device. Broadly, it all works.

I am experiencing a memory leak revealed in recent stress tests.  The
stress tests create and delete many UBI volumes, and are are broadly
equivelent to the following:

( cat /proc/meminfo ;=20
  i=3D0;=20
  while [ ${i} -lt 100 ] ; do=20
     ubimkvol -d 0 -n 15 -N ubi-vol -s 1000 ;=20
     ubirmvol -d 0 -n 15 ;=20
     i=3D$((i+1)) ;=20
  done ;=20
  cat /proc/meminfo ) | grep Slab

which shows slab memory increasing 80KB over 100 iterations.

Also:
 ( cat /proc/meminfo ;=20
   i=3D0;=20
   while [ ${i} -lt 100 ] ; do=20
      ubimkvol -d 0 -n 15 -N ubi-vol1 -s 1000 ;=20
      ubimkvol -d 0 -n 16 -N ubi-vol2 -s 1000 ;=20
      ubirmvol -d 0 -n 16 ;=20
      ubirmvol -d 0 -n 15 ;=20
      i=3D$((i+1)) ;=20
   done ; cat /proc/meminfo ) | grep Slab

which shows slab memory increasing 300KB for 100 iterations.

I encountered the second case first, and have explored. It seems there
is a single elevator queue associated with the mtdblock devices. The
sysfs items associated with the queue of the first ubi volume are not
being released.

I see a related effect by creating two ubi volumes, deleting the
first, and inspecting the entries in the /sys/block/mtdblock*
directories:

/ # ubimkvol -d 0 -n 15 -N ubi-vol-1 -s 10000
/ # ls  /sys/block/mtdblock7
dev        holders    queue      range      removable  ...

/ # ubimkvol -d 0 -n 16 -N ubi-vol-2 -s 10000
/ # ls  /sys/block/mtdblock8
dev        holders    queue      range      removable  ...

/ # ubirmvol -d 0 -n 15
/ # ls  /sys/block/mtdblock8
dev        holders    range      removable  ...

Notice that the "queue" entry has disappeared.

Have I introduced problems mixing and matching the kernel?

Can you give any hints as to how to fix the leak? I am guessing that
there are multiple copies of data structures associated with the
elevator queue, and this is a bit wrong.  But updating the kernel as a
whole is not really viable.

Regards
John

John Smith
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
