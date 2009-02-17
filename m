Received: from cluster-f.mailcontrol.com ([85.115.62.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZY3C-00065R-5J
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 22:04:25 +0000
Received: from salexc1.pace.internal (salts-gw1.pace.co.uk [194.60.90.1])
	by rly24f.srv.mailcontrol.com (MailControl) with ESMTP id
	n1HM3nDM003248
	for <linux-mtd@lists.infradead.org>; Tue, 17 Feb 2009 22:04:19 GMT
Content-class: urn:content-classes:message
Message-ID: <499B33FA.3000505@pace.com>
Date: Tue, 17 Feb 2009 22:02:34 +0000
From: "John Smith" <john.smith@pace.com>
MIME-Version: 1.0
To: <dedekind@infradead.org>
Subject: Re: UBI memory leak after creating and removing volumes
References: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
	<1234884259.17790.271.camel@localhost.localdomain>
In-Reply-To: <1234884259.17790.271.camel@localhost.localdomain>
Content-Type: text/plain;
	format=flowed;
	charset="utf-8"
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


Artem Bityutskiy wrote:
> On Tue, 2009-02-17 at 14:33 +0000, John.Smith@pace.com wrote:
>> After 0, 1000 and 2000 iterations of a test of creating 2 UBI volumes,
>> then removing them, /proc/slab_allocators shows these three items
>> obviously increasing:
>>
>> inode_cache: 327 alloc_inode+0x140/0x148=20=20=20=20=20=20=20=20=20
>> inode_cache: 3329 alloc_inode+0x140/0x148=20=20=20=20=20=20=20=20
>> inode_cache: 6329 alloc_inode+0x140/0x148=20=20=20=20=20=20=20=20
>> (3 objects per iteration)
>>
>> sysfs_dir_cache: 1402 sysfs_new_dirent+0x2c/0xa0=20
>> sysfs_dir_cache: 15402 sysfs_new_dirent+0x2c/0xa0
>> sysfs_dir_cache: 29402 sysfs_new_dirent+0x2c/0xa0
>> (14 objects per iteration)
>>
>> dentry_cache: 669 d_alloc+0x30/0x214=20=20=20=20=20=20=20=20=20=20=20=20=
=20
>> dentry_cache: 3823 d_alloc+0x30/0x214=20=20=20=20=20=20=20=20=20=20=20=
=20
>> dentry_cache: 6823 d_alloc+0x30/0x214=20=20=20=20=20=20=20=20=20=20=20=
=20
>> (3 objects per iteration)
>=20
> Hmm, may be this is related to sysfs? Every time you create or delete
> a volume UBIFS creates/deletes sysfs entries. May be some are forgotten,
> or it messes up kobject refcounting, so the kobjects are never released.
>=20
I agree, they seem to be sysfs things.

>> I don't know how to track these things down fully. But I=20
>> believe they relate to the elevator queue.
>=20
> Hmm? Sorry, did not realize how elevator may be involved into
> UBI volume creation/deletion. You mean when we create a volume,
> userspace udev is called, and creates device node on your host
> FS, which involves elevators? You can try disabling udev then.
>=20
I don't think udev is involved.

This is my understanding:
When an UBI volume is created, a matching MTD device is created.
The MTD device has both character and block device variants.
A block device is typically like a disk, so needs some sort of
queue and elevator algorithm to manage the accesses to the disk.
Typically there is one queue per disk. But in MTD world there
is no real need for a queue and cunning algorithm, so the is
just one queue for all the MTD devices, managed by a kernel thread.

In some sense the sysfs entries corresponding to the queue
should be linked to some toplevel MTD entity, and referenced
from the MTD block devices. Instead the queue seems to be present
in all the mtd block devices, and something doesn't quite work.

Thanks for your replies,

Regards,
John

John Smith

P.S. Please forgive the disclaimer which is probably about to
be appended automatically. I will try to get it removed.
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
