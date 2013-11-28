Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlvAY-0002nk-KZ
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 06:33:47 +0000
In-Reply-To: <1385580846.2836.1@deneb.(none)>
References: <OFC2D68B7C.CF5FC776-ONC1257C30.00395D40-C1257C30.0039B49A@transmode.se>
 (from joakim.tjernlund@transmode.se on Wed Nov 27 11:30:18 2013)
 <1385580846.2836.1@deneb.(none)>
To: =?ISO-8859-15?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
MIME-Version: 1.0
Subject: Re: JFFS2 Garbage collection issue
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OF5A973EE2.4F616953-ONC1257C31.00236541-C1257C31.0024025D@transmode.se>
Date: Thu, 28 Nov 2013 07:33:19 +0100
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, "Albrecht,
 Harald" <harald.albrecht@elreha.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Albrecht Dre=DF <albrecht.dress@arcor.de> wrote on 2013/11/27 20:34:06:
>=20
> Hi Jocke:
>=20
> Am 27.11.13 11:30 schrieb(en) Joakim Tjernlund:
> > BTW, I guess you got logging to file such as syslog on your system?=20
JFFS2 really don't do well with small incremental writes. I recommend you=20
turn such logging off.
>=20
> Does the delay by the gc process happen only when the jffs2 fs is=20
mounted, or also during the normal operation when many updates occur?

Only at mount AFAIK. During initial scanning lots of GC can be triggered=20
but during normal
operation not so much. The GC algo. is a bit naive and you have to help it =

if you got
lots of small writes. By sending the correct signal to the GC thread you=20
trigger one GC.


>=20
> Background: I had a similar issue as Harald with a NVRAM which is used=20
to hold quickly changing event buffers and logs.  My solution was to wait=20
for the gc process during the startup of the system, before the "main"=20
application is launched.  However, if this could also happen *after* the=20
initial scan has finished, this would be bad news for me, as I then=20
probably would need the SIG(STOP|CONT) approach...
>=20
> Thanks,
> Albrecht.[attachment "attq2f2p.dat" deleted by Joakim=20
Tjernlund/Transmode]=20
