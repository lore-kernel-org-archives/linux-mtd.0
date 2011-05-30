Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQzAj-0006zs-OY
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 09:54:06 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QQzAg-00020Q-8x
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 11:54:02 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 May 2011 11:54:02 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 May 2011 11:54:02 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubi] Wrong major:minor
Date: Mon, 30 May 2011 11:53:44 +0200
Message-ID: <i1q6u61tl5go0ou25i0dcupco020ea94a3@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 29 May 2011 11:54:36 -0400, Mike Frysinger
<vapier.adi@gmail.com> wrote:
>they're most likely dynamic and there's no safe way you could create
>the nodes ahead of time with a device table.  simply run mdev to take
>care of /dev for you.
>
>you can check /proc/devices to be sure ... anything over 250 is dynamic

Thanks for the infos.

I rebuilt uClinux with Busybox's mdev and added an rc.d script +
symlink. The dev nodes are created, but /dev/ubi0 is missing:
============
>  ubinfo /dev/ubi0 -a
libubi: error!: cannot get information about "/dev/ubi0"
        error 2 (No such file or directory)
ubinfo: error!: unrecognized device node "/dev/ubi0"
============

Here's what I did:

1. make config_menuconfig
    
    Miscellaneous Configuration
        Device Nodes (Dynamic)
    
    BusyBox
    [*] mdev
    [*]   Support /etc/mdev.conf
    [ ]     Support subdirs/symlinks (NEW)
    [ ]     Support command execution at device addition/removal (NEW)
    [ ]   Support loading of firmwares (NEW)

2. vi /usr/src/uClinux-dist-2010R1-RC5/vendors/Rowetel/IP04/mdev
    
    #!/bin/sh
    # Start up file for mdev
    
    case $1 in
            start) echo "Starting mdev...";
            #BAD echo /sbin/mdev > /proc/sys/kernel/hotplug;
            /sbin/mdev -s;
            ;; 
    
            stop) killall -9 mdev;;
            enable) rm -f /etc/rc.d/S20mdev; 
            ln -s /etc/init.d/mdev /etc/rc.d/S20mdev;;
            disable) rm -f /etc/rc.d/S20mdev;;
    
            *) cat <<EOF;;
    
    Syntax: /etc/init.d/mdev [command]
    Available commands:
            start   Start the service
            stop    Stop the service
            enable  Enable service autostart
            disable Disable service autostart
    EOF
    esac

3. vi /usr/src/uClinux-dist-2010R1-RC5/vendors/Rowetel/IP04/Makefile
    
    #Added
    $(ROMFSINST) /etc/init.d/mdev
    $(ROMFSINST) -s /etc/init.d/mdev /etc/rc.d/S20mdev

After rebooting, here are the relevant items in /dev:

crw-rw----    1 root     root       90,   0 Dec 31 16:00 mtd0
crw-rw----    1 root     root       90,   1 Dec 31 16:00 mtd0ro
crw-rw----    1 root     root       90,   2 Dec 31 16:00 mtd1
crw-rw----    1 root     root       90,   3 Dec 31 16:00 mtd1ro
crw-rw----    1 root     root       90,   4 Dec 31 16:00 mtd2
crw-rw----    1 root     root       90,   5 Dec 31 16:00 mtd2ro
brw-rw----    1 root     root       31,   0 Dec 31 16:00 mtdblock0
brw-rw----    1 root     root       31,   1 Dec 31 16:00 mtdblock1
brw-rw----    1 root     root       31,   2 Dec 31 16:00 mtdblock2
crw-rw----    1 root     root       10,  63 Dec 31 16:00 ubi_ctrl

>  cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00001000 "ROMfs"
mtd1: 00800000 00020000 "linux kernel(nand)"
mtd2: 0f800000 00020000 "file system(nand)"

Any idea why mdev doesn't create /dev/ubi0?

Thanks.
