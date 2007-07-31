Received: from bear.ext.ti.com ([192.94.94.41])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFgjT-0002bk-HH
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 21:41:09 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Testing of CPRM on SD Card
Date: Tue, 31 Jul 2007 07:10:14 +0530
Message-ID: <0A50DBE80DD6674E94F7269DC964A7B6441418@dbde01.ent.ti.com>
In-Reply-To: <20070730161114.053bef44@the-village.bc.nu>
From: "Sriram, Kannan" <ksriram@ti.com>
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>, "Midhun A" <midhunagni@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Alan Cox [mailto:alan@lxorguk.ukuu.org.uk]
> Sent: Tuesday, July 31, 2007 12:11 AM
> To: Midhun A
> Cc: Sriram, Kannan; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.arm.linux.org.uk; linux-mtd@lists.infradead.org
> Subject: Re: Testing of CPRM on SD Card
>=20
> On Mon, 30 Jul 2007 20:23:42 +0530
> "Midhun A" <midhunagni@gmail.com> wrote:
>=20
> > Hey All,
> >
> >     Thanks a lot for the replies. I have the development keys. But
the
> > algorithm and some intellectual property needs to be licenced from
the
> > 4C entity guys to implement it. As of now I just want to test the
CPRM
> > functionality. So licensing the algo for a prototype testing is a
huge
> > cost.
>

If you have the development keys, then you should typically have the
dummy "secret constant" used in the C2 algorithm as well. Contrary to
popular belief, the C2 algorithm by itself is not proprietary, just the
256 byte secret constant used inside the C2 algorithm. Also, if you want
to just "test" CPRM, you have all the stuff you need (not the real
stuff, but stuff that you can validate using your development keys) in
the name of dummy keys. Some sample input/ output data as well as
related dummy keys and the C2 algorithms are all available at the 4C
website for free download.

I had once (long ago) validated CPRM purely using stuff downloaded from
4C (free download). But my setup was not Linux; rather on a DSP
simulator platform, and was "low level".

But if you are looking for a quick test using a real SD-card, then like
I said, your development keys won't help. You need a real set of valid
"production keys" and these I bet are very hard to get!
=20
> Good good, the higher the better and the less this evil stuff gets
used.
