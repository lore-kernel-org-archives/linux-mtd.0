Received: from mtiwmhc23.worldnet.att.net ([204.127.131.48])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17J0g2-0004s1-00
	for <linux-mtd@lists.infradead.org>; Sat, 15 Jun 2002 00:40:22 +0100
Received: from who ([12.88.80.35]) by mtiwmhc23.worldnet.att.net
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20020614233949.EDC5116.mtiwmhc23.worldnet.att.net@who>
          for <linux-mtd@lists.infradead.org>;
          Fri, 14 Jun 2002 23:39:49 +0000
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Subject: RE: why MTD model ? 
Date: Fri, 14 Jun 2002 19:39:37 -0400
Message-ID: <000f01c213fc$bf54fea0$2350580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4611.1024058858@redhat.com>
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

Hello from Gregg C Levine
If by top posting you mean sending you mail, David, and then the other
name, and finally the list, then fine. This one is only to the list. And
I'm just stating a simple fact. Yes, I agree with you, the FAT partition
isn't necessary. The cards just came with it. And no the UMSDOS method
of creating a Linux distribution does not work in the 2.4.x series. I
don't know why. The folks at Slackware never told me. But I am curious
which patches need to be applied within the patch directory of your MTD
collection to the 2.2.17 kernel to make it work?
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@redhat.com] On Behalf Of David
> Woodhouse
> Sent: Friday, June 14, 2002 8:48 AM
> To: Gregg C Levine
> Cc: 'Studying MTD'
> Subject: Re: why MTD model ?
>=20
>=20
> No top-posting here please.
>=20
> hansolofalcon@worldnet.att.net said:
> > I agree David with you on all points, except one. Regarding the
> > reliability of PCMCIA-ATA drives. I have a bunch here right now, and
> > they are proving to be more reliable then the disk drives I keep
> > buying from the same shop. The fact that the manufacturer decided to
> > discontinue them because of size, is irrelevant. The fact that they
> > came with a FAT-12 file system, and a partition to match is also
> > irrelevant.
>=20
> Well, if you're comparing with the reliability of cheap IDE drives,...
:)
>=20
> I haven't really dealt with CompactFlash or PCMCIA-ATA cards much, I'm
only
> repeating what others have reported.
>=20
> But certainly you don't have to keep the partitioning and the FAT file
> system. You can blow it away and just put an ext2 or ext3 file system
on the
> whole device. Although as discussed, ext2 (just like FAT) isn't safe
w.r.t
> power loss and ext3 causes you to wear the flash out far quicker than
you
> need to.
>=20
> I don't think anyone's insane enough to try to run a Linux box with a
FAT
> root file system any more -- does the UMSDOS hack even compile in
recent
> kernels? Without it you won't get device nodes, symlinks, permissions,
etc.
>=20
> --
> dwmw2
>=20
