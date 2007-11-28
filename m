Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxQaH-0007KV-JI
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 17:20:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by redbean.intranet.gw-instruments.de (Postfix) with ESMTP id C8A08887
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Nov 2007 18:20:43 +0100 (CET)
Date: Wed, 28 Nov 2007 18:20:43 +0100 (CET)
From: Peter Wippich <pewi@gw-instruments.de>
To: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs problem with big endian target 
In-Reply-To: <Pine.LNX.4.63.0711281426370.25328@redbean.intranet.gw-instruments.de>
Message-ID: <Pine.LNX.4.63.0711281810330.25328@redbean.intranet.gw-instruments.de>
References: <Pine.LNX.4.63.0711281426370.25328@redbean.intranet.gw-instruments.de>
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

update to my own posting: 

On Wed, 28 Nov 2007, Peter Wippich wrote:

> Symptom: 
> Looks like file names / inodes get somehow corrupted, e.g. 
> source dir: 
> ls powerpc-603e-linux-rootfs-stripped/etc/
> fstab  group  httpd.conf  inittab  modules.conf  passwd  rc.d  rpc
> 
> on target machine (after mounting, root is on nfs for now):
> ls /mnt/rootfs/etc/
> ls: /mnt/rootfs/etc/http: No such file or directory
> ls: /mnt/rootfs/etc/modu: No such file or directory
> fstab    group    inittab  passwd   rc.d     rpc    

This doesn't seem to be a problem with mkfs.jffs2. I get the same problem 
when I mount an empty mtd partition and copy my system files to it (on the 
target machine). 
After copying everything looks fine.
But when I reboot and mount it again I get the same error as above.

Any ideas ? 

I don't get any jffs2 error messages (debug level set to 1). 

Thank you and best regards, 

Peter 

|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
