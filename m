Received: from gate.epygi.de ([212.126.211.241])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sii4-0001A3-0n
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 13:50:36 +0100
Received: from pcstephan (pc-stephan.epygi.de [10.20.0.32])
	by gate.epygi.de (8.12.9/8.12.9) with SMTP id h7TCo8hK016850
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Aug 2003 14:50:08 +0200 (METDST)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Date: Fri, 29 Aug 2003 14:50:08 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJEECKDHAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: FW: "du" returns wrong values on yaffs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

in MTD list there are more filesystem guys so I copy this one from YAFFS list...

Stephan

> -----Original Message-----
> From: Stephan Linke [mailto:Stephan.Linke@epygi.de]
> Sent: Freitag, 29. August 2003 14:48
> To: manningc2@actrix.gen.nz; Yaffs List
> Subject: RE: "du" returns wrong values on yaffs
> 
> 
> Hi,
> 
> Now there's something strange:
> The "du" I use (busybox) still returnes strange values. The reason is that it assumes a block size of 512 bytes and 
> doesn't care for the file block size returned by lstat. "du" simply divides by 2 to get the number of 1k blocks (already 
> a wrong calculation I guess).
> 
> Filesystems like cramfs and jffs show a similiar stupid behavior. They sai that their block size is PAGE_CACHE_SIZE or 
> PAGE_SIZE (4k in our case) but use a hard coded 512 to calculate the block count.
> It looks to me like there's something wrong in most of the filesystem inodes...
> 
> Thanx, Stephan
> 
> 
> > -----Original Message-----
> > From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> > Sent: Mittwoch, 20. August 2003 06:03
> > To: Stephan Linke; Yaffs List
> > Subject: Re: "du" returns wrong values on yaffs
> > 
> > 
> > On Tuesday 19 August 2003 21:39, Stephan Linke wrote:
> > > Hi,
> > > we are using "du" to detect the amount of space occupied by some of our
> > > files to keep us from running out of space. Unfortunately YAFFS returns a
> > > block count of zero.
> > >
> > Stepahn I found and ??corrected?? a problem, though I don't know it is 100% 
> > yet. THis is in cvs. 
> > 
> > At best du only provides an estimate and does not account for various other 
> > overheads (eg. bad blocks, reserved blocks). statfs() , as used by 'df', 
> > gives a better indicator of free space.
> > 
> > Stephan: please try the new yaffs_fs and see if this helps. 
> > 
> > -- Charles
> > 
