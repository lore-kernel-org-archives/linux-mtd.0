Received: from mtiwmhc24.worldnet.att.net ([204.127.131.49] helo=mtiwmhc21.worldnet.att.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dxMy-0001mS-00
	for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2002 19:23:16 +0100
Received: from who ([12.88.87.81]) by mtiwmhc21.worldnet.att.net
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20020811182242.VHYT8052.mtiwmhc21.worldnet.att.net@who>
          for <linux-mtd@lists.infradead.org>;
          Sun, 11 Aug 2002 18:22:42 +0000
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Subject: RE: Help with Dreamcast flash devices
Date: Sun, 11 Aug 2002 14:24:08 -0400
Message-ID: <000101c24164$4e3dc040$5157580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200208111908.06874.mtd@mcmen.demon.co.uk>
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
Funny... I bought my DC console, on, or around the beginning of December
of last year, superficially for trying out either Linux, or say another
related OS, on it. So far, I have tracked down the usual collection of
resources, including several pages on a site that I find mentioned on
the ECOS pages, at Sources Red Hat. Have you had any luck getting your
DC to startup using Linux? And can you send me a CD, to try out, if I
were to supply my hard mail address? E-mail me off list with your
details. I regret that I can not actually support your flash problems.
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org [mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of adr
> Sent: Sunday, August 11, 2002 2:08 PM
> To: linux-mtd@lists.infradead.org
> Subject: Help with Dreamcast flash devices
>=20
> I wonder if someone here might help me.
>=20
> I am one of the (too) small team of developers on the Linux on
Dreamcast
> project (http://sourceforge.net/projects/linuxdc). I am currently
working on
> developing a driver for the flash memory devices available for this
machine.
>=20
> Someone else started work on this months ago, but nothing has been
done for
> ages, so I'm hacking at it now.
>=20
> The flash memory on the DC is "smart" - ie it's attached to an 8-bit
> micro-controller. The device communicates with the rest of the system
via a
> high speed serial ("maple") protocol. The flash is not mapped into the
sh4
> (main cpu) physical memory at all. (http://mc.pp.se/dc/vms/index.html
leads
> to more information for those interested).
>=20
> Well, the long and the short of it is that I am somewhat at sea here.
Are
> there any similar mtd devices I can look at?
>=20
> Is there an explanation anywhere of how mapping works and how to
'virtual' map
> something which isn't in the physical map at all?
>=20
> Any other ideas (random or now) about how to make this work? Currently
the
> driver fails on mapping.
>=20
> Adrian
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
