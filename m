Received: from mtiwmhc22.worldnet.att.net ([204.127.131.47])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IXdw-0002YF-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 17:40:16 +0100
Received: from who ([12.88.80.86]) by mtiwmhc22.worldnet.att.net
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20020613163939.YMQU13408.mtiwmhc22.worldnet.att.net@who>
          for <linux-mtd@lists.infradead.org>;
          Thu, 13 Jun 2002 16:39:39 +0000
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Subject: RE: why MTD model ? 
Date: Thu, 13 Jun 2002 12:39:25 -0400
Message-ID: <000501c212f8$e18563c0$5650580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020613161907.87873.qmail@web21503.mail.yahoo.com>
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
As I understand the whole notion behind the MTD collection, the Disk On
Chip devices, corresponds to what you are thinking of. However there is
a module which allows ordinary machine memory to be used for the same
purpose as another MTD array, for testing an application. Please note
that I have not tested any of these theories, nor actually seen a DOC in
action. (A board running, but booting from a DOC, as opposed to other
hardware.)
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org [mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of Studying MTD
> Sent: Thursday, June 13, 2002 12:19 PM
> To: David Woodhouse
> Cc: linux-mtd
> Subject: Re: why MTD model ?
>=20
> Can somehow we treat(emulate) memory device as a block
> device and treat memory device like a hard disk ?
>=20
> --- David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > studying_mtd@yahoo.com said:
> > >  i am curious why we need MTD model ?
> > > Can we use ordinary linux driver model for memory
> > devices ?
> >
> > To what 'ordinary Linux driver model' are you
> > referring?
> >
> > --
> > dwmw2
> >
> >
> >
> >
> ______________________________________________________
> > Linux MTD discussion mailing list
> >
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20
> __________________________________________________
> Do You Yahoo!?
> Yahoo! - Official partner of 2002 FIFA World Cup
> http://fifaworldcup.yahoo.com
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
