Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJO6N-0005oK-5q
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 11:58:44 +0000
Date: Sun, 15 Apr 2012 13:58:39 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: mtdchar kernel oops
Message-ID: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think that this patch:
"mtdchar: kill persistently held vfsmount"
http://permalink.gmane.org/gmane.linux.kernel.commits.head/314175

has started causing kernel oops's when running ubiformat. The oops is
occuring in fs/namespace.c's mnt_add_count() line:
        this_cpu_add(mnt->mnt_pcp->mnt_count, n);

with the stack trace:
mntget()
simple_pin_fs()
mtdchar_open()

Cheers,
Joel
