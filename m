Received: from mailrelay1.inwind.it ([212.141.54.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IQ60-000223-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 09:36:44 +0100
Received: from ester (62.98.48.144) by mailrelay1.inwind.it (6.5.015)
        id 3CAA37A3031F01BE for linux-mtd@lists.infradead.org; Thu, 13 Jun 2002 10:36:16 +0200
Message-ID: <003101c212b5$95362790$0100a8c0@ester>
Reply-To: "Krypton" <krypton8@inwind.it>
From: "Krypton" <krypton8@inwind.it>
To: <linux-mtd@lists.infradead.org>
Subject: first jffs2 boot problem
Date: Thu, 13 Jun 2002 10:37:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Someone could help me to understand what is happening ?





Proper ARM zImage ID found. Booting...

Uncompressing Linux.......................................................
done, booting the kernel.


-removed lines-

VFS: Mounted root (jffs2 filesystem).


Freeing init memory: 52K


-removed lines-

INIT: version 2.78 booting



Configuring dynamic linker.../sbin/ldconfig: warning: can't open /lib (No
such file or directory), skipping


/sbin/ldconfig: warning: can't open /lib (No such file or directory),
skipping


/sbin/ldconfig: can't rename /etc/ld.so.cache~ (No such file or directory)


Done.


Configuring kernel modules.../etc/rc.d/rc.sysinit: /usr/sbin/depmod: No such
file or directory


Done.


/etc/rc.d/rc.sysinit: /bin/hostname: No such file or directory


/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory


/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory


/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory


/etc/rc.d/rc.sysinit: /bin/cp: No such file or directory


/etc/rc.d/rc.sysinit: /bin/mount: No such file or directory


/etc/rc.d/rc.sysinit: /bin/cp: No such file or directory


/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory


/etc/rc.d/rc.sysinit: /var/run/utmp: Input/output error


/etc/rc.d/rc.sysinit: /bin/mkdir: No such file or directory


/etc/rc.d/rc.sysinit: /bin/mkdir: No such file or directory


/etc/rc.d/rc.sysinit: /bin/mkdir: No such file or directory


/etc/rc.d/rc.sysinit: /bin/touch: No such file or directory


/etc/rc.d/rc.sysinit: /bin/chgrp: No such file or directory


/etc/rc.d/rc.sysinit: /bin/chmod: No such file or directory


/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory


/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory


/etc/rc.d/rc.sysinit: /bin/rm: No such file or directory


/etc/rc.d/rc.sysinit: /sbin/ifconfig: No such file or directory


/etc/rc.d/rc.sysinit: /usr/sbin/inetd: Permission denied


/etc/rc.d/rc.sysinit: /sbin/syslogd: No such file or directory


/etc/rc.d/rc.sysinit: /var/log/dmesg: No such file or directory
