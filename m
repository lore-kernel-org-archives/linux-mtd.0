From: robert.chiodini-1@ksc.nasa.gov (Bob Chiodini)
Date: 13 Mar 2003 07:32:20 -0500
Subject: Unable to open console /start init - more info (jffs2)
In-Reply-To: <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com>
References: <003901c2e7ef$6ef75c60$150a0ac0@jbmsoft.com>
 <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com>
Message-ID: <1047558740.1646.229.camel@tweedy.ksc.nasa.gov>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-11 at 14:30, Brian T. wrote:

> kmod: failed to exec /sbin/modprobe -s -k ram, errno = 2
> kmod: failed to exec /sbin/modprobe -s -k rom, errno = 2

What are these?  Could it be that there are a kernel modules missing?

As an aside, on a recent 2.4.20 install on an MZ 104 board, /dev/systty
is a link to tty0 and support for virtual terminals is compiled into the
kernel.

I also pass console=ttyS0,19200n8 to the kernel at boot up.


Bob...
-- 
Bob Chiodini <robert.chiodini-1@ksc.nasa.gov>
