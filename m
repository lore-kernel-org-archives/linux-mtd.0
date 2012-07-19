Received: from mail87.messagelabs.com ([216.82.250.19])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SrfCF-0007Xd-8P
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2012 01:06:28 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Thu, 19 Jul 2012 11:06:20 +1000
Subject: RE: UBIFS fails to mount on second boot
Message-ID: <6871BC8982B258468985EE735D2C57524B09D0EECF@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
 ,<1340806219.3070.23.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
 ,<1340977577.3070.207.camel@sauron.fi.intel.com>
 ,<6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
 <6871BC8982B258468985EE735D2C575243C0F088B7@ntcex01.corp.netcomm.com.au>
 ,<1342240778.3209.12.camel@brekeke>
 <6871BC8982B258468985EE735D2C57524B09D0EECD@ntcex01.corp.netcomm.com.au>,
 <1342596070.31927.14.camel@brekeke>
In-Reply-To: <1342596070.31927.14.camel@brekeke>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Jul 2012 17:21:10 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:
> You should have the fix in your mailbox, and for that fix I'd be
> greatful to have your "Tested-by:".=20

Thanks, got it. Applied and tested - the bug seems to be
gone.

> From 5978233c1e065c3d01bd88f4bf3598cc293ea611 Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> Date: Sat, 14 Jul 2012 14:33:09 +0300
> Subject: [PATCH] UBIFS: fix a bug in empty space fix-up
...
>=20
> -=09/* Fixup the current log head */
> -=09err =3D fixup_leb(c, c->lhead_lnum, c->lhead_offs);
> +=09/* Fixup the log head contains the only a CS node at the beginning *=
/
> +=09err =3D fixup_leb(c, c->lhead_lnum,
> +=09=09=09ALIGN(UBIFS_CS_NODE_SZ, c->min_io_size));
>  =09if (err)

Tested-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>

Thanks again for your efforts.

Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
