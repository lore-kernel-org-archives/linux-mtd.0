Received: from [209.71.224.24] (helo=mail.webnet.qc.ca)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 1719dl-0001SN-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 18:36:13 +0100
Subject: Re: Can't mount jffs2 on mtdblock0
From: Frederick Lefebvre <flefebvre@irg.ca>
To: Eric Nelson <eric_n2@verifone.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: 
	<614CC7C21856D1118DA30060B06B487302ACC995@SMF-NT-MAIL1.verifone.com>
References: 
	<614CC7C21856D1118DA30060B06B487302ACC995@SMF-NT-MAIL1.verifone.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 26 Apr 2002 13:39:14 -0400
Message-Id: <1019842754.1363.99.camel@zeus>
Mime-Version: 1.0
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

Aren't you missing the mtdblock module?

 
Frederick Lefebvre
flefebvre@irg.ca
Software Developer,
(418)523-4474 #242
Infomedia Research Group (IRG)
Quebec, Canada


On Fri, 2002-04-26 at 13:03, Eric Nelson wrote:
> I started w/ kernel-2.4.19-pre7, and downloaded the mtd from cvs in the last
> couple of days.
> 
> I am using a 32 Meg DOC2000
> 
> I believe I configured the correct options in the kernel, and set up the correct
> devices in dev, including mtdblock0 at 31 0.
> 
> I loaded the following modules:
> mtdcore docecc doc2000 nftl mtdchar docprobe jffs2
> 
> I can cat /dev/mtd and see the DOC 2000
> 
> I built the util files, and used mkfs.jffs2 to build a JFFS2 image.
> 
> I originally saw the nftla, but later ran erase from offset 0, so I don't have
> nftl, but, as I understand it, I don't need it for JFFS2.
> 
> I can cat jffs2.image to and from /dev/mtd0, and see the files with jffs2reader.
> 
> But, when I try:
> mount -t jffs2 /dev/mtdblock0 /mnt
> I get "No such device or address"
> 
> When I ran this command w/ strace, it seemed to mess up as follows:
> ...
> .../sbin/mount.jffs2, ... No such file or directory
> and
> mount("/dev/mtdblock0", "/mnt", "jffs2", 0xnnnnn,0) = -1 ENOSYS Function not
> implemented
>  "               "               "                  = -1 ENXIO No such device or
> address
> 
> Hopefully, I am missing something obvious.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
