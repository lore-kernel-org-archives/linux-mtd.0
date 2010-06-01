Received: from moutng.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJONr-0005a3-ON
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 10:07:44 +0000
From: Thorsten =?iso-8859-15?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: How stable is jffs2 summarize option?
Date: Tue, 1 Jun 2010 12:07:41 +0200
References: <201005311503.42629.muehlfelder@enertex.de>
	<1275384788.25797.17.camel@macbook.infradead.org>
	<OF6BA924CE.75C9F3A4-ONC1257735.0035A313-C1257735.00360683@transmode.se>
In-Reply-To: <OF6BA924CE.75C9F3A4-ONC1257735.0035A313-C1257735.00360683@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201006011207.41709.muehlfelder@enertex.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 01 June 2010 11:50:06 schrieb Joakim Tjernlund:
> > On Tue, 2010-06-01 at 11:26 +0200, Thorsten M=FChlfelder wrote:
> > > and what do you think about switching to yaffs2? I know it is develop=
ed
> > > elsewhere, but it seems to be a good alternative to jffs2+summary and
> > > probably switching is easier than to ubifs.
> >
> > Why would you think that switching to something that isn't part of the
> > Linux kernel would be easier than switching to ubifs? That seems... odd.
>
> Yes, if ubifs doesn't fit, perhaps have a look at the recently added
> logfs?
>
>     Jocke
>
> BTW, I once tried JFFS2 summary and it didn't make much of a difference f=
or
> us.

JFFS2 summary has reduced the mount time of my 500 MB root partition from=20
around 50 seconds to 10 seconds.

yaffs2 has a mount time of ~3 seconds and it seems it has faster read acces=
s=20
because whole boot time is reduced by ~30 seconds (compared to jffs2=20
summary).

I did not try ubifs yet.

AFAIK LogFS is still experimental?
