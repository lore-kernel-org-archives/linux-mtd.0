Received: from mtiwmhc22.worldnet.att.net ([204.127.131.47])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17czJW-0007Ze-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 03:15:42 +0100
Received: from who ([12.88.85.194]) by mtiwmhc22.worldnet.att.net
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20020809021509.MBMB11089.mtiwmhc22.worldnet.att.net@who>
          for <linux-mtd@lists.infradead.org>;
          Fri, 9 Aug 2002 02:15:09 +0000
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Subject: RE: Avoiding DOC hotplug when Grub fails
Date: Thu, 8 Aug 2002 22:16:19 -0400
Message-ID: <000001c23f4a$c08ea9a0$c255580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200208082158.18411.mark@lakeshoremicro.com>
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
Our correspondent mentions the M-Sys ISA Eval card. I would assume
anyway that the gizmo exists. Can someone also tell me how much this
thing would also cost? I've been attempting to track down a relatively
easy method of evaluating such hardware, and I remembered that most
providers of such hardware also make this cards. If anyone actually has
one that they do not need, plus any blank disks I'd be glad to take it
off their hands.
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org [mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of Mark Meade
> Sent: Thursday, August 08, 2002 10:02 PM
> To: linux-mtd@lists.infradead.org
> Cc: karim@opersys.com
> Subject: Re: Avoiding DOC hotplug when Grub fails
>=20
> Karim Yaghmour wrote:
>=20
> > As far as I can see by browsing this mailing list archive, one
> > has to hotplug the DOC device in order to have the HD come up
> > first if Grub fails in some way after having hijacked int 19h.
> > This is rather inconvenient, to say the least.
>=20
> I've recently found an easier way - with the M-Sys ISA Eval card,
anyway.  I
> assume the PCI card would be similar.
>=20
> On the ISA card, there is a jumper used to set the DoC Address (C800,
D000,
> etc).  If this jumper is removed, the DoC is no longer recognized by
the
> BIOS.
>=20
> If the DoC has int 19h, simply boot without the jumper in place, and
then put
> it back after the hard drive boot has finished.  If you have the MTD
stuff
> compiled as modules, don't do the modprobe until after the jumper is
> replaced.   Works great, plus eliminates the risky procedure of
hotplugging
> the DoC or Eval card.
>=20
> > Why not just hijack int 16h (keyboard) while we're at it, write
> > a small keyboard int handler, and check if the space-bar (or
> > some other key) is held down while Grub is booting? If it is,
> > then Grub invokes the BIOS's original int 19h which then proceeds
> > normally. If it isn't, then Grub continues with its own load
> > procedure.
>=20
> One potential problem is that the low level Grub code that grabs int
19 is
> limited to 512 bytes.  With all the other things that code has to do,
there
> might not be enough room to add another int handler.
>=20
> Mark
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
