From: hansolofalcon@worldnet.att.net (Gregg C Levine)
Date: Mon, 10 Mar 2003 20:27:07 -0500
Subject: Suggestions for using a DoC with Linux and a 2.4.20 kernel
In-Reply-To: <1047340255.2207.10.camel@gobbles>
Message-ID: <000101c2e76d$55323340$e3c8580c@who5>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

For my message please see at the bottom!
> -----Original Message-----
> From: linux-mtd-admin at lists.infradead.org [mailto:linux-mtd-
> admin at lists.infradead.org] On Behalf Of Russ Dill
> Sent: Monday, March 10, 2003 6:51 PM
> To: Gregg C Levine
> Cc: linux-mtd at lists.infradead.org
> Subject: Re: Suggestions for using a DoC with Linux and a 2.4.20
kernel
>=20
> On Mon, 2003-03-10 at 15:04, Gregg C Levine wrote:
> > Hello from Gregg C Levine
> > I have a statement to make, then the question
> > Okay here's the statement:
> > I have a system running that was freshly installed, and I have a
> > kernel being built from fresh source code. This is an unpatched
2.4.20
> > kernel.
> >
> > Now the question:
> > How do I go about setting things up, so that the kernel can see
the
> > DoC on startup, and then work with it? I have turned on the MTD
> > settings in the kernel, and for the DoC driver as well.
> > I can supply further information, including name of distribution,
and
> > even supplier of DoC, as well, if needed.
>=20
> are you using the modules? or is it build into the kernel?
>=20
> modules:
>=20
> modprobe doc2000
> modprobe doc_probe (at this point it should identify the doc)
>=20
> then load whatever you need to talk to the doc, like mtdchar,
mtdblock,
> nftl, etc
>=20
> If its built into the kernel, it should detect on boot.
>=20
> if you are using nftl, you should have access to it at /dev/nftla,
and
> the partitions at /dev/nftla1, /dev/nftla2, etc. nftl is a
transition
> layer that makes NAND flash look like a normal block device. It does
> wear leveling, bad sector handling, partial writes, etc so that
things
> like ext2 and vfat can exist on the NAND flash.
>=20
> Most of the mtd utils will talk to it via the char device,
/dev/mtd0,
> such as doc_loadbios (usually for installing grub), erase,
nftl_format,
> etc
>=20
> If you are using jffs2 on NAND (I'm not sure about this one, because
> I've never tried it) you probably want /dev/mtdblock0.
>=20
> Additional info would probably be helpful, like what steps you are
> taking, and what messages you are getting.
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Hello again from Gregg C Levine
Right now I am doing a recompile of my kernel, after patching it,
using the patches found in that directory of today's snapshot.
=20
So far, I am working my way through. Only the DoC ones were built as
modules.
More, as I work my way through. This is a new aspect of working with
Linux, so I am quite literally groping in the dark here.
Ladies and Gentlemen: Because I suspect there are others out there,
who have gone through this, I would greatly appreciate a response from
everyone else who has had these problems happen to them before.
-------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
