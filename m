Received: from mtiwmhc14.worldnet.att.net ([204.127.131.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18FcHc-0002uP-00
	for <linux-mtd@lists.infradead.org>; Sat, 23 Nov 2002 15:33:24 +0000
Received: from who ([12.88.120.18]) by mtiwmhc14.worldnet.att.net
          (InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP
          id <20021123160321.HPSJ21264.mtiwmhc14.worldnet.att.net@who>
          for <linux-mtd@lists.infradead.org>;
          Sat, 23 Nov 2002 16:03:21 +0000
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Subject: RE: Problem in using DOC2000
Date: Sat, 23 Nov 2002 11:03:54 -0500
Message-ID: <000001c29309$eca01ca0$1278580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20021123155340.81672.qmail@web41009.mail.yahoo.com>
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
You will need to supply us with more information with your project. Such
as, what motherboard does it use, and what distribution you are using.
And yes it might be a conflict. The first IDE drive in a Linux system,
is typically /dev/hda. Most DOCs are typically set to /dev//hdd, so as
to use the IDE chain that the CD drive is attached to.
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org [mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of tin man chan
> Sent: Saturday, November 23, 2002 10:54 AM
> To: linux-mtd@lists.infradead.org
> Subject: Problem in using DOC2000
>=20
> Hi,
>=20
> I have compiled a linux kernel 2.4.19 with mtd driver
> built-in and wish to use such kernel to probe the DOC
> and use the DOC to boot my PC later by transferring
> the kernel to DOC. However, after I insert the DOC
> chip to the socket and start my PC, the PC will hang
> in the booting message "Loading linux............."
>=20
> Is it related to my PC BIOS? Or IDE harddisk conflict
> with DOC? Any comment or idea? Thanks.
>=20
> William
>=20
>=20
>=20
>=20
> _________________________________________________________
> =A4H=AE=F0=A5=E6=A4=CD=BC=F6=BDu#9351 =B8=DC=A1u=A4=CD=A1v=B4N=A6=B3
> http://hk.yahoo.com/promotions/personals/9351
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
