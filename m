Received: from penguin-ext.wise.edt.ericsson.se ([194.237.142.110])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bmg6-0003iW-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 18:29:30 +0100
Received: from mbb4.ericsson.se (mbb4.ericsson.se [136.225.152.56])
	by penguin.wise.edt.ericsson.se (8.11.0/8.10.1/WIREfire-1.3) with ESMTP id f7SHZRv16849
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 19:35:28 +0200 (MEST)
Received: from switchboard.ericsson.se
 (kieraypc01.p.y.ki.era.ericsson.se [147.214.82.33])
 by mbb4.ericsson.se (PMDF V5.2-33 #39350)
 with ESMTP id <0GIS0037TGV2O3@mbb4.ericsson.se> for
 linux-mtd@lists.infradead.org; Tue, 28 Aug 2001 19:35:26 +0200 (MET DST)
Date: Tue, 28 Aug 2001 19:35:25 +0200
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Subject: Re: jffs2 root
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Message-id: <3B8BD65D.F5B7A4FE@inn.ericsson.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT
References: <3B8BD129.4A562C0@inn.ericsson.se>
 <3B8BCB83.64A68A5F@inn.ericsson.se> <25744.999017640@redhat.com>
 <28995.999019042@redhat.com>
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
> > find / -type d -xdev -exec mkdir /mnt/mtd/{} \;
> > find / -type f -xdev -exec cp -dpvf {} /mnt/mtd/{} \;
> 
> $ ldd /bin/bash
>         libtermcap.so.2 => /lib/libtermcap.so.2 (0x40029000)
>         libdl.so.2 => /lib/libdl.so.2 (0x4002d000)
>         libc.so.6 => /lib/i686/libc.so.6 (0x40031000)
>         /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)
> 
> All those are symlinks not real files, hence won't have been copied onto
> your filesystem by the 'find -type f' command.
> 
> --
> dwmw2

obviously :) if only my retarded brain had done "chroot /mnt/mtd/ /bin/bash" 

It works much better when I copy the entire file system. Since all this is
done in script I'am a little confused how I got it to work once.


-- 
Kenneth Johansson	
Ericsson Business Innovation AB   Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@inn.ericsson.se
