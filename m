Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zumb-00075T-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 15:49:01 +0100
Message-ID: <2702075D4DE2B043BF5EB82E9CFAD45B0BD37A@mail1.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Memory leak problem with JFFS2 
Date: Wed, 31 Jul 2002 10:48:54 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi David,

I took some time to track down the memory leak that happens after =
umount.
First I compiled JFFS2 as a module and loaded/unloaded it doing a
mount/umount in between.  No BUG occured, meaning that no slab object =
is
still allocated when I unload the module.  Then I investigated around =
the
kmalloc/kfree, but I found nothing.  I put traces and counters each =
time a
kmalloc / kfree was called, and the number of kmalloc and kfree is =
balanced.
Therefore, I can conclude than the memory leak is not an allocated =
object
still allocated at umount time and is not a kmalloc without kfree =
neither.
Do you have any other idea about it?  This is not very likely to be the
mount / umount mechanism that could cause the leak, I tried mounting =
and
unmounting NFS and the memory usage before and after does not change.=20

Between, we still don't know why doing a sync after an "rm" command =
triggers
the garbage collector.  Do you have any other clue about it?

Fr=E9d=E9ric Giasson


|-----Original Message-----
|From: David Woodhouse [mailto:dwmw2@infradead.org]
|Sent: Wednesday, July 10, 2002 5:48 AM
|To: Frederic Giasson
|Cc: linux-mtd@lists.infradead.org
|Subject: Re: Memory leak problem with JFFS2=20
|
|
|
|fgiasson@mediatrix.com said:
|>  So to confirm that the leak comes from the fact of doing repeated
|> mount/umount, I setup a third test which is exactly like the first
|> test, except that I removed mount and umount commands. That time =
free
|> memory usage remained constant, which make me think that the leak is
|> probably related to memory incorrectly freed at umount time.
|> Nevertheless, the third test also hanged, after 170 loops, at copy
|> command.=09
|
|Strange. Most JFFS2 memory allocations are done through=20
|dedicated slabs,=20
|rather than with kmalloc(). Can you reproduce this with JFFS2=20
|as a module,=20
|unloading and reloading the module each time the file system=20
|is unmounted?=20
|That should cause a BUG() if any slab objects are still=20
|allocated when you=20
|try to unload the module.=20
|
|If it's a kmalloc(). there are few enough of them that it should be=20
|possible to track it down.
|
|>  That time free memory usage remained constant, which make me think
|> that the leak is probably related to memory incorrectly freed at
|> umount time.  Nevertheless, the third test also hanged, after 170
|> loops, at copy command.		=20
|
|That shouldn't ever happen. Where was it spending the time?=20
|(SysRq-P is=20
|your friend). If you can reproduce with debugging and show what it's=20
|actually _doing_ during this time, that would be useful.
|
|>  Between, note that the sync command sprinkled in the test loops are
|> there to speed up the process.  In fact, I observed that doing a =
sync
|> after a file erasure triggers the gc and wait for it to complete its
|> task, so when I write data to JFFS2 after it does not need to =
garbage
|> collect in the mean time.  This makes write times to JFFS2 much more
|> deterministic.=20
|
|Interesting. I'm not entirely convinced I know why that=20
|happens. sync()=20
|shouldn't really do anything at all.
|
|>  I am using linux kernel 2.4.19 pre 7, and JFFS2 code from CVS as =
per
|> May 14th, 2002.  By the way, does anybody can tell me if=20
|there is some
|> sorts of branches or labels in JFFS2 CVS, other that time stamps?  =
Is
|> there a label per linux release, for instance?=20
|
|There is occasionally a branch made for really experimental=20
|code, like when=20
|we started on NAND support. At the moment there aren't any=20
|such branches.=20
|All we have is the development on the trunk, and the=20
|jffs2-2_4-branch which=20
|contains the same code as is in Marcelo's 2.4.19-rc2.=20
|
|For anyone using JFFS2 in production, I would recommend using=20
|that version,=20
|rather than the trunk code.=20
|
|--
|dwmw2
|
|
