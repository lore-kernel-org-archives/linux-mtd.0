Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MZPjE-00076p-GJ
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 13:43:32 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, ashishpareek
	<bless2ashish@rediffmail.com>
Date: Fri, 7 Aug 2009 08:43:13 -0500
Subject: RE: Nand partition > 2Gb issue
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D7C48F874@dlee01.ent.ti.com>
References: <1249643953.S.5973.39700.f5mail-147-128.rediffmail.com.1249644127.19245@webmail.rediffmail.com>
	<4A7C2B79.6060308@linutronix.de>
In-Reply-To: <4A7C2B79.6060308@linutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Sebastian Andrzej Siewior
> Sent: Friday, August 07, 2009 9:26 AM
> To: ashishpareek
> Cc: davinci-linux-open-source@linux.davincidsp.com; linux-
> mtd@lists.infradead.org
> Subject: Re: Nand partition > 2Gb issue
>=20
> ashishpareek wrote:
> >
> >
> > On Fri, 07 Aug 2009 16:49:13 +0530 wrote
> >  >Hi,
> >  >
> >  >I am using 2.6.18 Kernel and i want to know what changes i need to do
> to
> >
> >  >have 2GB partition (blocks >8192) solved.Could any one help me?
>=20
> linux-mtd ist the correct list to ask.
>=20
> 2 GiB should work I think. Adrian Hunter posted patches for >=3D4 GiB cal=
led
> "MTD: update internal API to support 64-bit device size".
[Sandeep] This support is already in the davinci GIT kernel and has been te=
sted as well
>=20
> >  >
> >  >Ashish
>=20
> Sebastian
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
