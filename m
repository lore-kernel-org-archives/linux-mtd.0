Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173fql-0005NH-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 17:24:03 +0100
From: John Sutton <john@scl.co.uk>
To: Zhiwei Yu <linux_vpn@yahoo.com>, john@scl.co.uk
Subject: Re: grub stuff
Date: Fri, 3 May 2002 16:58:46 +0100
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
References: <20020503025059.96685.qmail@web20401.mail.yahoo.com>
In-Reply-To: <20020503025059.96685.qmail@web20401.mail.yahoo.com>
MIME-Version: 1.0
Message-Id: <02050317250101.14339@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
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

Hi there

That's interesting!  I've been using netbooted diskless clients for some
years but have never bothered to actually put a bootrom in a network card=
 -
 I just write the bootloader onto a floppy.  So I've no experience of
actually booting from a real bootrom, but what you are saying (if I've
understood correctly) is that a real bootrom on an ethercard always gets
first bite of the cherry at boot time?  Regardless of the boot order
you've configured in the BIOS setup screens? or the presence of a "grubbe=
d"
DiskOnChip?

PS and very OT: After years of faffing about with proprietary packet
drivers supplied by ethercard manufacturers and/or hoping to find a
suitable packet driver on Russell Nelson's priceless www.crynwr.com, I
recently discovered rom-o-matic.net.  Take a look at that!  Oh dear, the
time I've been a wasting...

On Fri, 03 May 2002, Zhiwei Yu wrote:
> hi, John=20
>=20
> I am the one posting "Booting from DOC2000 with GRUB
> Loader", and glad to see you still "fighting" grub.=20
> Now I'm using lilo instead. Although grub have a lot
> of benefits, I can't make it work before deadline.:(
> If you work it out, would u please give me some clue?
>=20
> Here is my way to recover DOC chip.  I presumed that
> you have an ethernet card on your board. =20
> 1. Build a ramdisk with root fs, put nftl_format
> inside it
> 2. use mknbi to make ramdisk bootable
> 3. setup a tftp server and bootp server on your
> desktop
> 4. go to etherboot.sourceforge.net to download the
> latest package, find out the bios for ethernet card
> and write it into ethernet card.  After that you can
> choose to boot from local or network.
> 5. boot from network, push your ramdisk to your SBC by
> tftp server
> You can now nftl_format your DOC.  It's a little
> tricky to setup all of it. but quite useful for me who
> don't have floppy and harddisk on the SBC.
>=20
> For further information, pls refer to
> etherboot.sourceforge.net.
>=20
> Best Regards
> Zhiwei Yu
>=20
> __________________________________________________
> Do You Yahoo!?
> Yahoo! Health - your guide to health and wellness
> http://health.yahoo.com
--=20

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
