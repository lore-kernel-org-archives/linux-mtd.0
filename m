Received: from mailrelay1.inwind.it ([212.141.54.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17InjX-0003tL-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 10:51:07 +0100
Received: from ester (62.98.31.20) by mailrelay1.inwind.it (6.5.015)
        id 3CAA37A3032C2D5E for linux-mtd@lists.infradead.org; Fri, 14 Jun 2002 11:50:38 +0200
Message-ID: <002a01c21389$243eadd0$0100a8c0@ester>
Reply-To: "Krypton" <krypton8@inwind.it>
From: "Krypton" <krypton8@inwind.it>
To: <linux-mtd@lists.infradead.org>
References: <001101c21377$9331b6e0$0100a8c0@ester>  <20020614065541.18847.qmail@web21506.mail.yahoo.com>  <18018.1024040857@redhat.com>
Subject: Re: Howto create a new jffs2 
Date: Fri, 14 Jun 2002 11:52:02 +0200
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

> -----> > >> Creating 5 MTD partitions on "SA1100 flash":
> > > >> 0x00000000-0x00020000 : "firmware"
> > > >> 0x00020000-0x00040000 : "params"
> > > >> 0x00040000-0x00140000 : "kernel"
> > > >> 0x00140000-0x00fe0000 : "rootdisk"
> > > >> 0x00fe0000-0x01000000 : "test"
> > > 
> > > > Try, mount -t jffs2 /dev/mtdblock4 <dir>
> > > 
> > > I already have tried this but unsuccesfully.
> > > Error : "No such file or directory"
> > > 
> > > Other suggestions ?
> > 
> > what is the output of "ls -l /dev/mtd*" ?
> > 
> 
> No such file or directory
> 
> 
> Run the MAKEDEV script from the util/ directory of CVS.

Ok now I'm able to mount the partition using
mount -t jffs2 /dev/mtdblock4 <dir>

Thank you very much !

-----
krypton8-AT-inwind-DOT-it
