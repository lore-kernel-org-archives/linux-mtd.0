From: hansolofalcon@worldnet.att.net (Gregg C Levine)
Date: Sat, 15 Mar 2003 11:14:03 -0500
Subject: Using a DoC
In-Reply-To: <1047742102.1272.0.camel@contact.skynet.coplanar.net>
Message-ID: <000201c2eb0d$e6053b80$4fc9580c@who5>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

(Please see my replies below.)
> -----Original Message-----
> From: Jeremy Jackson [mailto:jerj at coplanar.net]
> Sent: Saturday, March 15, 2003 10:28 AM
> To: Gregg C Levine
> Cc: linux-mtd at lists.infradead.org
> Subject: Re: Using a DoC
>=20
> Have you tried configuring MTD in your Linux kernel?  That is the
next
> step after what you have described.
>=20
> Jeremy
>=20
> On Sat, 2003-03-15 at 03:12, Gregg C Levine wrote:
> > Hello from Gregg C Levine
> > Is there anything special to using a DoC from Linux?
> > I seem to have reached the end of the cave, with this one. For
example
> > I can see the DoC from DOS, and manipulate its contents from DOS,
when
> > there is anything on it.
> >
> > However, I don't have enough information to continue from here.
Plus
> > EMJ tells me that the part in question has since been discontinued
by
> > M-SYS, and I should really purchase from them a grouping of larger
> > size units.
> > -------------------
> > Gregg C Levine hansolofalcon at worldnet.att.net
> > ------------------------------------------------------------
> > "The Force will be with you...Always." Obi-Wan Kenobi
> > "Use the Force, Luke."  Obi-Wan Kenobi
> > (This company dedicates this E-Mail to General Obi-Wan Kenobi )
> > (This company dedicates this E-Mail to Master Yoda )
> >
> >
> >
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/

Hello again from Gregg C Levine
Not surprisingly, yes I did do that. That's how I know that kernel
sees the DoC in on startup. I have even given it the address in memory
where it is, to make it easier to find, rather then using probing
methods.

But the fact is, I am still confused, and lost. Here's one reason:
Script started on Sat Mar 15 02:53:00 2003
root at drwho4:/usr/src/mtd/grub# ../util/doc/loadbios /dev/mtd0
grub_firmware

Open flash device: No such device
root at drwho4:/usr/src/mtd/grub# exit
exit
Script done on Sat Mar 15 02:53:49 2003

That was done early this morning, as I'd like to try putting GRUB on
the device, and seeing what would happen after the boot sequence takes
place, and without the local hard drive installed. I'm just starting
out here, I really feel that M-SYS should have been more supportive of
our efforts, and of the different distributions out there. And as it
happens their Linux tools, can't find the device either.
-------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
