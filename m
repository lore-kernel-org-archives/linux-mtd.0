From: hansolofalcon@worldnet.att.net (Gregg C Levine)
Date: Mon, 17 Mar 2003 14:56:19 -0500
Subject: New problem with DoC
In-Reply-To: <A05D1A08-587E-11D7-ADC7-000393AD6294@regolith.co.uk>
Message-ID: <000201c2ecbf$47ab1be0$88a7580c@who5>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

<Please see below! Jasmine you too!>
> -----Original Message-----
> From: Jasmine Strong [mailto:jasmine at regolith.co.uk]
> Sent: Monday, March 17, 2003 8:45 AM
> To: Gregg C Levine
> Subject: Re: New problem with DoC
>=20
>=20
> On Monday, Mar 17, 2003, at 02:42 Europe/London, Gregg C Levine
wrote:
>=20
> > Hello from Gregg C Levine
> > It seems to be my day for problems with this configuration. Using
the
> > "doc_loadbios" program found in the util directory of the mtd
> > collection, I've managed to write the firmware to the DoC, one was
the
> > one labeled "DOC2.FFF", and the other one was "doc42.exb", both
were
> > copied from the disk provided by M-SYS that's version 4.2 of their
> > series of tools.
>=20
> Uh.  last I saw, doc_loadbios didn't understand .exb files.
>=20
> You should be using the Grub firmware anyway.
>=20
> -Jas.
Hello again from Gregg C Levine
Thanks folks. That worked. Funny thing, these devices, the solutions
suggested by the manufacturer didn't work. Which is what I expected.=20

Whereas the MTD method for reviving it, or even a new one for
installing the Grub Firmware worked. It still looks for the /boot
directory, and the menu.lst file. But at least it works.=20

Next question, how do I put that one, the /boot directory, and the
menu.list as when I would use a normal Grub booting arrangement in to
the DoC? Oh, and a custom kernel as well.
-------------------
P.S. David is my message formatting acceptable?

-------------------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
