Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxNWd-00051L-Lj
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 14:04:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by redbean.intranet.gw-instruments.de (Postfix) with ESMTP id 4E26D882
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Nov 2007 14:46:33 +0100 (CET)
Date: Wed, 28 Nov 2007 14:46:33 +0100 (CET)
From: Peter Wippich <pewi@gw-instruments.de>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs problem with big endian target 
Message-ID: <Pine.LNX.4.63.0711281426370.25328@redbean.intranet.gw-instruments.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear, 

I'm stuck with a problem generating a JFFS2 image for a big endian target 
(MPC5200), build machine is i386. 

Symptom: 
Looks like file names / inodes get somehow corrupted, e.g. 
source dir: 
ls powerpc-603e-linux-rootfs-stripped/etc/
fstab  group  httpd.conf  inittab  modules.conf  passwd  rc.d  rpc

on target machine (after mounting, root is on nfs for now):
ls /mnt/rootfs/etc/
ls: /mnt/rootfs/etc/http: No such file or directory
ls: /mnt/rootfs/etc/modu: No such file or directory
fstab    group    inittab  passwd   rc.d     rpc    

I've used the latests snapshot of mtdutils from git (think it was 1.1.0), 
mkfs.jffs -v says revision 1.60. 

Target Linux Version is 2.6.22.1. 

Command line to build jffs2 image:
mkfs.jffs2 -v -b --pad --root=$XROOTSTRIP --output=$XROOT/images/rootfs.jffs2 
--eraseblock=0x20000 --squash

I've also tried to build the image without the -b option and than used 
jffs2dump to convert. Same result. 

Any known issues, hints ??? 

Thank you and best regards, 

Peter 

|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
