Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXAGd-0001JA-E2
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 09:21:00 +0000
Received: by pzk30 with SMTP id 30so957221pzk.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jan 2010 01:20:53 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 19 Jan 2010 17:20:53 +0800
Message-ID: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
Subject: mount ramdisk rootfs /etc directory to jffs2 filesystem.
From: Johnny Hung <johnny.hacking@gmail.com>
To: linux-embedded@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, kernelnewbies <kernelnewbies@nl.linux.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ALL,

I have build an embedded Linux system and rootfs is a ramdisk. Ramdisk
rootfs resides in memory so modify files is non-effective after a
reboot. Some directories in rootfs, like /etc, /usr, ... are contain
many application configuration files and I want to mount it to jffs2
flash filesysyem so it will take effect after a reboot. Is it
possible? I know the flash has write times limited so the log files
(syslogd/klogd) should not store in flash. In general, how to deploy
root file system for embedded linux with flash storage?

H. Johnny
