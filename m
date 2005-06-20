Received: from [217.110.67.40] (helo=srv-gateway.pilz.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DkKb6-0000zD-MU
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2005 07:37:52 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <OF52603195.4EAEE2B4-ONC1257026.003D06DE-C1257026.003ECCE0@pilz.de>
From: Heinz Haeberle <H.Haeberle@pilz.de>
Date: Mon, 20 Jun 2005 13:26:00 +0200
MIME-Version: 1.0
Content-type: text/plain;
	charset=US-ASCII
Cc: uclinux-dev@uclinux.org
Subject: Deadlock: JFFS2 with uClinux kernel 2.6.6-uc0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have found a deadlock situation with jffs2 on linux 2.6.6-uc0 (do not
know what
version jffs2 that is, there aren't any version infos in the jffs2 dir)
The situation happens while continuously creating, writing and deleting a
couple#
(= 20 in my case)  files. It happens about once per day.

I have tracked down the problem to the following level:

The jffs2 garbage collectors stack trace shows the following calls:
========================================================
....(don't find anything usefull)
schedule
__wait_on_freeing_inode                     (aparently waits for the inode
gets unlocked)
find_inode_fast
iget_locked
jffs2_garbage_collect_live
jffs2_garbage_collect_pass                    (does a: down(&c->alloc-sem))
....


The application kernel stack trace (application is doing the unlink):
========================================================
....(don't find anything usefull)
__down
__down_failed (should not be a fail according to source comments)
jffs2_do_clear_inode                                 (does a:
down(&c->alloc_sem))
jffs2_clear_inode
clear_inode
generic_delete_inode
generic_drop_inode
iput
sys_unlink                                                      (does a:
lock inode sema)


So the situation happens that the GC happens to what for the unlike to
unlock the inode sema
while the unlike is waiting for the alloc-sema to be availabe. Which never
happens since the
GC is still owning it.

I can solve the issue with by disabling the garbage collector. Is there any
other known solution
or is it fixed in newer versions anyhow?

Heinz
