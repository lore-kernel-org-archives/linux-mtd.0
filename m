Received: from mout.web.de ([212.227.17.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfwUl-0005Xc-0A
 for linux-mtd@lists.infradead.org; Fri, 24 May 2013 18:13:39 +0000
Received: from mail-ob0-f172.google.com ([209.85.214.172]) by smtp.web.de
 (mrweb001) with ESMTPSA (Nemesis) id 0Lk8Ow-1U3qmP2WPC-00bc2g for
 <linux-mtd@lists.infradead.org>; Fri, 24 May 2013 20:13:15 +0200
Received: by mail-ob0-f172.google.com with SMTP id tb18so5867574obb.17
 for <linux-mtd@lists.infradead.org>; Fri, 24 May 2013 11:13:14 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 24 May 2013 20:13:14 +0200
Message-ID: <CAASVbFFj2U3L95JbiUf+m6UgFN0nasiMh0wYdMr4rxcJjpvuXg@mail.gmail.com>
Subject: Updating JFFS2 port to eCos for NOR-ECC support
From: Max Seidenstuecker <naturally-aligned@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I am in the process of bringing the current JFFS2 to eCos to support
NOR-ECC flash that is not supported in its current version.

First of all I need to admit that I am unexperienced in Linux kernel
development, so its a steep learning curve with every bit I am
converting.

My concerns are with rw_semaphores, mutexes and the workqueue occuring
in wbuf.c that I am not sure to deal with. Either they can be mapped
onto s.th. similar or be dropped. A rw_sempahore is mapped onto a
normal semaphore with the note: "lets hope we don't deadlock
somewhere." Can we be sure about that? Locks are called from the
workqueue and the thread JFFS2 runs in. I am a little lost here.

eCos JFFS2 does not have a MTD layer, no write-buffer yet, no GC and
the linux specific POSIX ACL, security bits, xattr. I think the linux
specific features can be safely ignored. But what about a GC thread?
The config option in eCos says "Leave this off till it's been
implemented. And don't implement it till icache locking has been made
thread-safe." icache in this case means inode cache, as Andrew Lunn
pointed out: http://sourceware-org.1504.n7.nabble.com/jffs2-garbage-collect=
-td187600.html#a187601
Has this been addressed?

Any advice is greatly appreciated. Maybe thre are good reasons why
JFFS2 in eCos has not been updated in a while. Please let me know
anything you know about it.

--
Beste Gr=FC=DFe / best regards

Max Seidenst=FCcker
