Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D2AGn-0000CU-TP
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 10:42:18 -0500
Date: Fri, 18 Feb 2005 16:42:16 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050218154216.GA5926@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: freeze when mounting fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have also 2.6.10-rc2 kernel here with nodemgmnt.c from actual cvs. I
have a weird constellation here where adding file to /home makes mount
freeze when attepting to mount, regardeless if extra partition or root
partition. What the fuck can that be?

I go it mounted ro once though:

root@scb9328 ~ # mount -t jffs2 -o,ro /dev/mtdblock4 /mnt
Inode #170 was a directory with children - removing those too...
root@scb9328 ~ # Jan  1 02:00:55 scb9328 kern.notice klogd: Inode #170
was a directory with children - removing those too...

I did

root@scb9328 ~ # echo 9 >/proc/sys/kernel/printk
root@scb9328 ~ # 
root@scb9328 ~ # klogd           
root@scb9328 ~ # syslogd
root@scb9328 ~ # tail -f /var/log/messages &

But got no info.

:-( !!!!

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
