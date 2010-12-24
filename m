Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVxvZ-0001Jd-1b
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 03:02:46 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: Ming Lei <tom.leiming@gmail.com>
Subject: Re: Issue : jffs2 and ecc layout
Date: Fri, 24 Dec 2010 16:02:36 +1300
References: <ActfCy0cZc3bW9yIT5u5fx8oZO9GQw==>
	<2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
In-Reply-To: <AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201012241602.36582.manningc2@actrix.gen.nz>
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Ghorai, Sukumar" <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 23 December 2010 21:24:35 Ming Lei wrote:
> Hi,
>
> 2010/9/28 Ghorai, Sukumar <s-ghorai@ti.com>:
> > Hi,
> > I was using the following ecc layout which is not working to mount the
> > jffs2 File-system. I was in 2.6.32 kernel and working; but same layout =
is
> > not working with latest 2.6 kernel.
> >
> > Observation is that - no read request issued to the driver (say omap2.c=
).
> >
> > # mount -t jffs2 /dev/mtdblock4 /mnt/nand
> > [=A0=A0 32.505218] cannot read OOB for EB at 00000000, requested 8 byte=
s,
> > read 0 bytes, error -22 mount: Mounting /dev/mtdblock4 on /mnt/nand
> > failed: Input/output error
>
> I meet the issue too, kernel is  2.6.37-rc6-next-20101217+, and board is
> beagle B5.
>
> Is there any way to fix or workaround the issue?
>
>
> thanks,

THis might be due to the way the omap2.c driver is now screwed up so that i=
t=20
does not read when not u32 aligned.

Try this:
http://www.spinics.net/linux/lists/linux-omap/msg42422.html

Please report back if that fixes the problem for you.

=2D- Charles
