Received: from [194.149.231.137] (helo=imail4.gazeta.pl)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HXFWr-0004w1-6m
	for linux-mtd@lists.infradead.org; Fri, 30 Mar 2007 07:44:26 -0400
Received: from poczta.gazeta.pl (unverified [172.20.25.75])
	by  (imail4.gazeta.pl) with ESMTP id 22924344-1945724
	for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2007 13:12:40 +0200
Received: from ew6 (unverified [172.20.26.236])
	by av.gazeta.pl (av.gazeta.pl) with ESMTP id 32371-1945724
	for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2007 13:12:18 +0200
Message-ID: <9694708.11151175253142026.JavaMail.webadm@ew6>
Date: Fri, 30 Mar 2007 13:12:16 +0200 (CEST)
From: <pan.kierownik@gazeta.pl>
To: linux-mtd@lists.infradead.org
Subject: [JFFS2]
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm currently trying to use jffs2 on mtd device on our ARM926EJ-S
development board. We have here Intel Sibley 512Mb flash memory,
uClinux with kernel 2.6.19-uc1 and following problem:

    /> unlock /dev/mtd3
    /> eraseall /dev/mtd3
    Erasing 256 Kibyte @ fc0000 -- 98 % complete.
    /> mount -t jffs2 -o noatime /dev/mtdblock3 /mnt
    /> cp -r /bin /mnt
    /> sync
    /> umount /mnt
    /> mount -t jffs2 -o noatime /dev/mtdblock3 /mnt
    <4>JFFS2 warning: (176) check_node_data: MTD point returned len
too short: 1573 instead of 2577.
    <4>JFFS2 warning: (176) check_node_data: MTD point returned len
too short: 1998 instead of 2394.
    ... and so on - message repeated hundreds of time

After mounting file system I can run programs from that partition
without any problem.

I've tried to create jffs2 using mkfs.jffs2 (v1.43) on host:
    mkfs.jffs2 -p -rromfs -e262144 -offs.bin -c1024 -s1024
and then write directly to the flash where mtd3 partition is
located. The same warnings are displayed.

I tried to place jffs2 root file system in flash and start kernel
with following parameters:
    root=/dev/mtdblock3 rw rootfstype=jffs2 noinitrd init=/bin/init
console=ttyJ0 rootflags=noatime

When it comes to mount rootfs, the same check_node_data warnings
occurs and kernel panics. But for now, I just would like to get rid
of these warnings.

Best regards,
Krzysztof
