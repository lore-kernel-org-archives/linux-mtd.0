From: hansolofalcon@worldnet.att.net (Gregg C Levine)
Date: Wed, 12 Mar 2003 11:02:50 -0500
Subject: Problems building contents of snapshot 3-9-2003
In-Reply-To: <200303121106.59051.tglx@linutronix.de>
Message-ID: <001101c2e8b0$d5c5e6c0$91c7580c@who5>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

(Reply below original.)
> -----Original Message-----
> From: linux-mtd-admin at lists.infradead.org [mailto:linux-mtd-
> admin at lists.infradead.org] On Behalf Of Thomas Gleixner
> Sent: Wednesday, March 12, 2003 5:07 AM
> To: Gregg C Levine; linux-mtd at lists.infradead.org
> Subject: Re: Problems building contents of snapshot 3-9-2003
>=20
> On Wednesday 12 March 2003 08:30, Gregg C Levine wrote:
> > Hello from Gregg C Levine
> > Well, I am now closer to my working problem's solution. But now a
new
> > problem, or problems has surfaced. And here's a C&P of the
problems:
> > Script started on Tue Mar 11 23:06:53 2003
> > root at drwho4:/usr/src/mtd# make
> I'm not sure, if the out of kernel build is really up to date.
>=20
> Could you try to use patchin.sh from patches directory and do make
xImage,
> make modules from your kernel directory ? That works for sure.
> Please use latest CVS code, as we have fixed some leakes yesterday.
>=20
> --
> Thomas
> ____________________________________________________________________
> ____
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx at linutronix.de
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Hello again from Gregg C Levine
Um, no it does not. It breaks in two specific places. The filesystems
for jff, and jff2. So, then what now? I'll keep trying. Indeed, when I
bring up my Linux box, I'll even update the former snapshot to the
current contents of CVS, today. However, this is beginning to feel old
and annoying. When I started with this, I did think everything was
fixed.


-------------------
Gregg C Levine hansolofalcon at worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."  Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
