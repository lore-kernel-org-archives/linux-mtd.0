Received: from penguin-ext.wise.edt.ericsson.se ([194.237.142.110])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bmKb-0003h5-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 18:07:17 +0100
Received: from mbb4.ericsson.se (mbb4.ericsson.se [136.225.152.56])
	by penguin.wise.edt.ericsson.se (8.11.0/8.10.1/WIREfire-1.3) with ESMTP id f7SHDEv11800
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 19:13:15 +0200 (MEST)
Received: from switchboard.ericsson.se
 (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
 by mbb4.ericsson.se (PMDF V5.2-33 #39350)
 with ESMTP id <0GIS0036PFU2O3@mbb4.ericsson.se> for
 linux-mtd@lists.infradead.org; Tue, 28 Aug 2001 19:13:14 +0200 (MET DST)
Date: Tue, 28 Aug 2001 19:13:13 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Subject: Re: jffs2 root
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Message-id: <3B8BD129.4A562C0@inn.ericsson.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT
References: <3B8BCB83.64A68A5F@inn.ericsson.se> <25744.999017640@redhat.com>
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

David Woodhouse wrote:
> 
> kenneth.johansson@inn.ericsson.se said:
> >  What dose this mean?? It mounts jffs2 and I know /sbin/init is there.
> > The exact same kernel booting a ramdisk then mounting jffs2 works and
> > a diff of /sbin/init shows it to be correct.
> 
> Odd. Are you 100% sure you haven't got 'init=' on the command line?


yes this is what happens with init=/bin/bash

--------
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 56k init 4k openfirmware
Starting userspace with /bin/bash
Starting userspace with /sbin/init 
Kernel panic: No init found.  Try passing init= option to kernel.
---------


I have booted from jffs2 one time (the first time I tried) but I had syslogd
starting in the init script and jffs2 creates data everytime something
happens that syslogd saves that creates more log ... Well I could not do much
before the disk was full so I did this steps.

erased the flash with erase /dev/mtd/0 0 128  (I have 8MB flash)

mounted /dev/mtdblock/0 on /mnt/mtd

Created the filesystem with (yes I know cp has -x option)

find / -type d -xdev -exec mkdir /mnt/mtd/{} \;
find / -type f -xdev -exec cp -dpvf {} /mnt/mtd/{} \;

It is not possible to boot from the result of this.

???

-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se
