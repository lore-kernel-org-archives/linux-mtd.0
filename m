Received: from cluster-f.mailcontrol.com ([85.115.62.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZRiP-0004ph-QZ
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 15:18:32 +0000
Received: from salexc1.pace.internal (salts-gw1.pace.co.uk [194.60.90.1])
	by rly24f.srv.mailcontrol.com (MailControl) with ESMTP id
	n1HEWeH2016336
	for <linux-mtd@lists.infradead.org>; Tue, 17 Feb 2009 14:33:30 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBI memory leak after creating and removing volumes
Date: Tue, 17 Feb 2009 14:33:20 -0000
Message-ID: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
From: <John.Smith@pace.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
>
> On Tue, 2009-02-17 at 12:01 +0000, John.Smith@pace.com wrote:
>=20
> > Hello,=20
>=20
> > I am using a 2.6.18 Kernel, patched with MTD from Kernel 2.6.21, and
> > UBI from the mainline kernel a few days later on 1 May 2007.  The
> > whole is running on an embedded MIPS device.
> >
> > I have NAND, and UBI, and gluebi, and jffs2.  I use jffs2, mounted
> > on an mtdblock device. Broadly, it all works.
> >=20
> > I am experiencing a memory leak revealed in recent stress tests.
The
> > stress tests create and delete many UBI volumes, and are are broadly
> > equivelent to the following:
>=20
> Can you please enable /proc/slab_allocators - it tracks all allocators
> and if we have a leak - it may point to the function which is guilty.
>=20
> Recompile the kernel, and you will have a nice instrumentation to find
> memory leak - the /proc/slab_allocators file. Please, play with this.

After 0, 1000 and 2000 iterations of a test of creating 2 UBI volumes,
then removing them, /proc/slab_allocators shows these three items
obviously increasing:

inode_cache: 327 alloc_inode+0x140/0x148=20=20=20=20=20=20=20=20=20
inode_cache: 3329 alloc_inode+0x140/0x148=20=20=20=20=20=20=20=20
inode_cache: 6329 alloc_inode+0x140/0x148=20=20=20=20=20=20=20=20
(3 objects per iteration)

sysfs_dir_cache: 1402 sysfs_new_dirent+0x2c/0xa0=20
sysfs_dir_cache: 15402 sysfs_new_dirent+0x2c/0xa0
sysfs_dir_cache: 29402 sysfs_new_dirent+0x2c/0xa0
(14 objects per iteration)

dentry_cache: 669 d_alloc+0x30/0x214=20=20=20=20=20=20=20=20=20=20=20=20=20
dentry_cache: 3823 d_alloc+0x30/0x214=20=20=20=20=20=20=20=20=20=20=20=20
dentry_cache: 6823 d_alloc+0x30/0x214=20=20=20=20=20=20=20=20=20=20=20=20
(3 objects per iteration)

I don't know how to track these things down fully. But I=20
believe they relate to the elevator queue.

I added some printks to elv_register_queue and __elv_unregister_queue
so the functions are like:

int elv_register_queue(struct request_queue *q)
{
   elevator_t *e =3D q->elevator;

   printk("elv_register_queue: e->kobj.dentry at %p val %p\n",=20
          &e->kobj.dentry, e->kobj.dentry );
=20
   kobject_add(&e->kobj);
   /* Do more stuff */=20=20

   printk("elv_register_queue: e->kobj.dentry at %p val %p AFTER\n",=20
          &e->kobj.dentry, e->kobj.dentry );
}

static void __elv_unregister_queue(elevator_t *e)
{
   printk("__elv_unregister_queue: e->kobj.dentry at %p val %p\n",=20
          &e->kobj.dentry, e->kobj.dentry );

   kobject_uevent(&e->kobj, KOBJ_REMOVE);
   kobject_del(&e->kobj);

   printk("__elv_unregister_queue: e->kobj.dentry at %p val %p AFTER\n",

          &e->kobj.dentry, e->kobj.dentry );
}

When creating and deleting volumes, e->kobj.dentry is always at the
same address.=20

After the register_queue operation, e->kobj.dentry points to a new
dentry. So e->kobj.dentry is getting over-written.

After the unregister_queue operation, e->kobj.dentry is NULL.  The
kobject_del calls sysfs_remove_dir which either does or does not
delete memory according to whether e->kobj.dentry is NULL. So
the second ubi fails.

But I don't know what to do plug the leak.

Regards,
John

John Smith
=20
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
