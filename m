Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JesNA-0004NO-LE
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 13:42:29 +0000
Subject: Re: corrupted ubi after reboot while busy
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080327070541.GA10446@cloud.net.au>
References: <20080327070541.GA10446@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Thu, 27 Mar 2008 15:39:38 +0200
Message-Id: <1206625178.3856.38.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2008-03-27 at 18:05 +1100, Hamish Moffatt wrote:
> I'm trying UBI for the first time; I have the kernel 2.6.24 with UBI
> backported from 2.6.25-rc7.
>=20
> I created a static volume (on NAND) and wrote a JFFS2 image to it with=20
> ubiupdatevol. mount succeeded, but the image was built wrongly so the
> jffs2 garbage collector thread to fix it.
Strange, the volume should be read-only, what could the GC thread do to
it?

>  I then rebooted the system
> while this was running (using a proper reboot, which succeeded).
>=20
> After rebooting, I can't attach the UBI volume at all:
>=20
> Jan  1 00:16:34 elaraboot user.err kernel: [  994.310000] UBI error: vali=
date_vid_hdr: inconsistent VID header at PEB 664                        =20
> Jan  1 00:16:34 elaraboot user.err kernel: [  994.320000] UBI error: cann=
ot attach mtd7                                                          =20
> Jan  1 00:16:34 elaraboot user.err kernel: [  994.320000] UBI error: cann=
ot initialize UBI, error -22=20

Could you please enable UBI debugging (just UBI debugging, not any of
debugging messages), and try to attach the MTD device again? Then send
me the UBI output which you may take with dmesg?

> I don't understand how a corrupt volume can cause the whole UBI to be
> unusable?

In this case UBI finds that the VID header contains some "insane" data,
it's not just corruption which would be detected by CRC checking (which
is OK in your case). This is why UBI refuses to keep going. This might
me a bug though, the debugging should help.

> As an aside, is a static volume not read-only?
It should be, but I never tried.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
