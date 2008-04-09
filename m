Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjjOv-00071i-2l
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 23:08:21 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: "'Nicolas Pitre'" <nico@cam.org>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
	<Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
	<009801c89a95$09ae4680$1d0ad380$%Tjernlund@transmode.se>
	<alpine.LFD.1.00.0804091901270.2947@xanadu.home>
In-Reply-To: <alpine.LFD.1.00.0804091901270.2947@xanadu.home>
Subject: RE: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
Date: Thu, 10 Apr 2008 01:08:18 +0200
Message-ID: <00a101c89a96$9969d180$cc3d7480$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: sv
Cc: haokexin@gmail.com, 'Alexey Korolev' <akorolev@infradead.org>,
	=?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Nicolas Pitre [mailto:nico@cam.org]
> Sent: den 10 april 2008 01:02
> To: Joakim Tjernlund
> Cc: 'Alexey Korolev'; 'J=F6rn Engel'; haokexin@gmail.com; =
dwmw2@infradead.org; akpm@linux-
> foundation.org; linux-mtd@lists.infradead.org
> Subject: RE: [PATCH] Fix of broken state in CFI driver caused by =
FL_SHUTDOWN
>=20
> On Thu, 10 Apr 2008, Joakim Tjernlund wrote:
>=20
> > > -----Original Message-----
> > > From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On
> Behalf
> > > Of Alexey Korolev
> > > Sent: den 4 april 2008 14:22
> > > To: J=F6rn Engel
> > > Cc: nico@cam.org; haokexin@gmail.com; dwmw2@infradead.org; =
akpm@linux-foundation.org; linux-
> > > mtd@lists.infradead.org
> > > Subject: Re: [PATCH] Fix of broken state in CFI driver caused by =
FL_SHUTDOWN
> > >
> > > Hi
> > >
> > >
> > >  CFI driver in 2.6.24 kernel is broken. Not so intensive =
read/write operations cause incomplete
> writes
> > > which lead to kernel panics in JFFS2.
> > >  We investigated the issue - it is caused by bug in FL_SHUTDOWN =
parsing code. Sometimes chip
> returns -
> > > EIO as if it is in FL_SHUTDOWN state when it should wait in =
FL_PONT (error in order of
> conditions).
> > >
> > > The following patch fixes the bug in state parsing code of CFI.
> > > Also I've added comments to notify developers if they want to add =
new case in future.
> > > Please include it.
> > >
> > > Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> > > Reviewed-By: Joern Engel <joern@logfs.org>
> >
> > Acked-By: Joakim Tjernlund <Joakim.Tjenrlund@transmode.se>
> >
> > Guys, I think you should sent this directly to Linus as David seems
> > unavailable ATM. It should really go into 2.6.25
>=20
> It is already in mainline.  See commit fb6d080c.

Oh, good. Never saw any mail about it on the list, sorry for the noise.

     Jocke
