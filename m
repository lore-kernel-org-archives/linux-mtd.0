Received: from mtiwmhc11.worldnet.att.net ([204.127.131.115])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192wXL-000561-LL
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 18:05:31 +0100
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 8 Apr 2003 13:02:14 -0400
Message-ID: <004a01c2fdf0$9b9f9360$06a0580c@who5>
MIME-Version: 1.0
In-Reply-To: <1049789725.18045.79.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: 'David Woodhouse' <dwmw2@infradead.org>
Subject: RE: Is this normal?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(See Below!)
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of David Woodhouse
> Sent: Tuesday, April 08, 2003 4:15 AM
> To: Gregg C Levine
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Is this normal?
>=20
> On Tue, 2003-04-08 at 04:23, Gregg C Levine wrote:
> > so replaced its flakey M-SYS firmware with the GRUB based one.
> > Since I have Lilo installed on the drive, as well as a currently
> > inactive grub, I half expected to see the Lilo multiple kernel
boot
> > prompt. Instead I saw the grub menu that I have placed there.
>=20
> That is indeed normal. Since you removed the M-Systems firmware,
there's
> nothing to make the DiskOnChip appear as a 'normal' hard drive via
the
> BIOS 'normal' INT 13h disc access routines. So LILO cannot possibly
> work.
>=20
> > Now the question remains: Any suggestions, again, for constructing
> > that image to place on the DOC-2000? And how would I tell the
computer
> > to boot it, or the resident hard drive?
>=20
> You are, as ever, very difficult to comprehend. What image to place
on
> the DOC2000? Format it (with the Grub firmware) with DFORMAT, or
with
> nftl_format if you must, make an ext2 file system on /dev/nftl, and
have
> Grub's boot menu boot from the ext2 file system.... what are you
> missing?
>=20
> --
> dwmw2

Hello from Gregg C Levine
Basically yes. When I wrote the message that you're confused about it
was very early in the morning here, and at that time I don't even
pretend to make myself clear to others. I apologize.=20
How do I go about formatting it with the Grub firmware in place?   And
since I am leaning towards formatting it with an ext2 file system, how
do I go about attaching it to the device name you chose. And then have
it come up on the Grub's boot menu boot from the ext2 file system.=20
Yes, that's what I was missing.=20
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
