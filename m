Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXAnm-0000UC-87
	for linux-mtd@lists.infradead.org; Tue, 19 Jan 2010 09:55:14 +0000
Date: Tue, 19 Jan 2010 10:50:24 +0100
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Johnny Hung <johnny.hacking@gmail.com>
Subject: Re: mount ramdisk rootfs /etc directory to jffs2 filesystem.
Message-ID: <20100119095024.GD16182@darwin>
References: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb9ecdfa1001190120r593f7799sf566df5a855b8a54@mail.gmail.com>
Cc: kernelnewbies <kernelnewbies@nl.linux.org>, linux-mtd@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

El Tue, Jan 19, 2010 at 05:20:53PM +0800 Johnny Hung ha dit:

> I have build an embedded Linux system and rootfs is a ramdisk. Ramdisk
> rootfs resides in memory so modify files is non-effective after a
> reboot. Some directories in rootfs, like /etc, /usr, ... are contain
> many application configuration files and I want to mount it to jffs2
> flash filesysyem so it will take effect after a reboot. Is it
> possible?

yes, this is possible

> I know the flash has write times limited so the log files
> (syslogd/klogd) should not store in flash. In general, how to deploy
> root file system for embedded linux with flash storage?

- add jffs2 support to your kernel
- create your image using mkfs.jffs2 from mtd-utils
- flash the image
- specify the rootfs partition and type in the bootargs of the kernel

for further information i recommend the lecture of
http://free-electrons.com/doc/flash-filesystems.pdf

depending on your requirements/size of the rootfs partitions UBIFS
might be an option to consider

-- 
Matthias Kaehlcke
Embedded Linux Developer
Barcelona

      El trabajo es el refugio de los que no tienen nada que hacer
                            (Oscar Wilde)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
