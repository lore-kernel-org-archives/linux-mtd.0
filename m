Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M66fn-0006As-5o
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 17:31:01 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Mon, 18 May 2009 11:30:40 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <200905150916.54091.sr@denx.de>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: "Stefan Roese" <sr@denx.de>
Cc: Jamie Lokier <jamie@shareable.org>, Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd@lists.infradead.org, Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

I am still seeing corruption even with the write buffer size limited to
8 bytes, but it's greatly limited.  Unfortunately our schedule doesn't
allow me to work on this full-time for the immediate future, so I'm
limited to small chunks of time for now.  Let me know if there is
anything I can do to assist/share since it looks like we both are in
need of fixing this.

At this point, I believe I have characterized the interrupted erase and
interrupted write patterns that are causing the problems, so the next
step I may take is to add the failure conditions into the NOR MTD device
simulator mtdram and see if I can get the same failures.

Let me know if you have any other ideas of approaches.

Here's the patch to change the maximum write buffer size to 8 bytes
(2^3).

Index: drivers/mtd/chips/cfi_probe.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- drivers/mtd/chips/cfi_probe.c	(revision 4477)
+++ drivers/mtd/chips/cfi_probe.c	(working copy)
@@ -18,7 +18,7 @@
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/gen_probe.h>
=20
-//#define DEBUG_CFI
+#define DEBUG_CFI
=20
 #ifdef DEBUG_CFI
 static void print_cfi_ident(struct cfi_ident *);
@@ -251,6 +251,18 @@
 	cfi->cfiq->InterfaceDesc =3D
le16_to_cpu(cfi->cfiq->InterfaceDesc);
 	cfi->cfiq->MaxBufWriteSize =3D
le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
=20
+	//DEBUG - BEGIN - force max write size to 8 bytes (2^3)
+	if (cfi->cfiq->MaxBufWriteSize)
+	{
+		printk("Warning:  Overriding MaxBufWriteSize from 2^%d
to 2^%d\n",
+				cfi->cfiq->MaxBufWriteSize,
+				3
+				);
+		cfi->cfiq->MaxBufWriteSize =3D 3;
+	}
+	//DEBUG - END
+
+
 #ifdef DEBUG_CFI
 	/* Dump the information therein */
 	print_cfi_ident(cfi->cfiq);

Best Regards,

Eric Holmberg
Senior Firmware Engineer
Trimble Construction Services
Westminster, Colorado

> -----Original Message-----
> From: Stefan Roese [mailto:sr@denx.de]=20
> Sent: Friday, May 15, 2009 1:17 AM
> To: Eric Holmberg
> Cc: linux-mtd@lists.infradead.org; dedekind@infradead.org;=20
> Jamie Lokier; Urs Muff; Adrian Hunter
> Subject: Re: UBIFS Corrupt during power failure
>=20
> Hi Eric,
>=20
> On Saturday 18 April 2009 01:49:52 Eric Holmberg wrote:
> > > Yeah, let's wait for Eric's results and then will work on
> > > extending MTD device model with this parameter.
> >
> > As suggested, I patched my 2.6.27 kernel with the latest from
> > http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git=20
> (includes all
> > updates up to and including fhe fix-recovery bug,
> >=20
> http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=3Dco
> mmit;h=3De14
> > 4c1c037f1c6f7c687de5a2cd375cb40dfe71e).
> >
> > I have the unit running with a maximum write buffer of 8=20
> bytes (the NOR
> > flash chip is capable of 64 bytes).
>=20
> How exactly did you do this? In cfi_cmdset_0002.c?
>=20
> > I was seeing 4 different failure scenarios with the base=20
> 2.6.27 code,
> > but now I am only seeing one remaining failure after 30+=20
> hours of power
> > cycling.  I added a stack dump this afternoon that will let=20
> me pinpoint
> > exactly what is happening, but haven't seen the failure, yet.
> >
> > The failure happens when I get two corrupt empty LEB's.  I=20
> believe the
> > scenario is that an erase is interrupted and on the next=20
> boot, while the
> > file system is being recovered, another power failure occurs.
> >
> > I can erase one of the LEB's manually in U-Boot and the file system
> > recovers properly.
> >
> > I'm going to leave the units running over the weekend and=20
> see what is
> > waiting for me Monday morning.
>=20
> Do you have an update for this? What's the current status on=20
> your system now?=20
> Which patches did you apply to work reliably with the Spansion FLASH?
>=20
> I'm asking since we are seeing a similar issue on one of our=20
> boards equipped=20
> with the S29GL512P. This simple script triggers problems upon=20
> the next mount:
>=20
> ---
> mount -t ubifs ubi0:testvolume /mnt
> sync
> reboot -n -f
> ---
>=20
> The next mount will result most of the time in this:
>=20
> UBIFS: recovery needed
> UBIFS error (pid 406): ubifs_scan: corrupt empty space at LEB 3:130320
> UBIFS error (pid 406): ubifs_scanned_corruption: corrupted=20
> data at LEB=20
> 3:130320
> UBIFS error (pid 406): ubifs_scan: LEB 3 scanning failed
> UBIFS error (pid 406): ubifs_recover_leb: corrupt empty space=20
> at LEB 3:32
> UBIFS error (pid 406): ubifs_scanned_corruption: corrupted=20
> data at LEB 3:32
> UBIFS error (pid 406): ubifs_recover_leb: LEB 3 scanning failed
> mount: Structure needs cleaning
>=20
> This is without the patch from this thread included (in=20
> recovery.c). With this=20
> patch included the recovery is successful all the time, as=20
> far as we can see=20
> right now. But I'm wondering if we really need to disable the=20
> write buffer in=20
> the CFI driver or reduce the write buffer to 8.
>=20
> Thanks.
>=20
> Best regards,
> Stefan
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
