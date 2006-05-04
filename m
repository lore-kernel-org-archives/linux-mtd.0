Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbjFP-00033g-DQ
	for linux-mtd@lists.infradead.org; Thu, 04 May 2006 15:12:27 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 May 2006 20:45:26 +0200
Message-ID: <4B0FFE7A6560A446891539D2F673659559ED38@duebe101.NOE.Nokia.com>
In-Reply-To: <c0c067900605041137r2f90ebc7kd56a24c10c08152@mail.gmail.com>
From: <ext-manjunath.govindashetty@nokia.com>
To: <harik.attar@gmail.com>, <linux-mtd@lists.infradead.org>
Cc: 
Subject: RE: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

I am getting the kernel panic while mounting the partition using jffs2 =
for amd29lV256MH flash.Hence if u have some pointer for this problem =
please suggest. There are two chips on IXP23xx based board

Best Regards


Given below is the log of the error

 erase /dev/mtdblock/4
mtdblock_open
ok
Erase Total 1 Units
mtdblock_release
Unable to handle kernel paging request at virtual address fffffffc
mm =3D 40149380 pgd =3D 40004000
*pgd =3D 00002041, *pmd =3D 00002041, *pte =3D 00000000, *ppte =3D =
00000000
Internal error: Oops: 0

Regards

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of ext Dan
Merillat
Sent: Thursday, 04. May 2006 20:38
To: linux-mtd@lists.infradead.org
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255


On 5/4/06, Nicolas Pitre <nico@cam.org> wrote:
> On Thu, 4 May 2006, Dan Merillat wrote:
>
> > > > Write error in obliterating obsoleted node at 0x00102318: -30
> > >
> > > -30 is -EROFS.
> > >
> > > Did you unlock the flash sectors before mounting JFFS2?
> >
> > I wish it were that simple.
>
> Still, did you unlock the flash sectors?

YES, I unlocked the flash sectors.  Both partiions, all regions.  And
if the WP# line is being dropped/raised it would re-protect all the
sectors, which it's not.  I can run the commandline flash_unlock and
flash_erase (which, of course, trash everything and I have to re-flash
afterwards.)

Also, if the sectors are locked, then it's still a bug to stay in
status register mode.  A read-only flash is a valid configuration, and
should result in a read-only filesystem, not an unusable filesystem.

I verified again and again, I don't know why I got a EROFS and I wish
to god I hadn't pasted it.  No other run has gotten me this result
unless I deliberatly lock the sectors before starting linux.  I just
verified with a very slow erase all, re-upload jffs2 filesystem over
115200 serial, re-flash, crc32 verify the contents, and fill the
remaining flash with 0x0.   U-boot has no problems performing any of
this, so the flash is indeed unlocked.  Then I started linux and ended
up with the same deal, after a write whatever the first read happens
to be returns 0x0080 and gets all sorts of wacky corruption errors.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
