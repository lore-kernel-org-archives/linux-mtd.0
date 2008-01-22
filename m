Received: from mail153.messagelabs.com ([216.82.253.51])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHKZW-0004sZ-2W
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 14:58:00 +0000
Received: from az33exr02.mot.com (az33exr02.mot.com [10.64.251.232])
	by motgate4.mot.com (8.12.11/Motorola) with ESMTP id m0MEvqh4011796
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 07:57:52 -0700 (MST)
Received: from az10vts04.mot.com (az10vts04.mot.com [10.64.251.245])
	by az33exr02.mot.com (8.13.1/Vontu) with SMTP id m0MEvpt7002370
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 08:57:51 -0600 (CST)
Received: from ct11exm60.ds.mot.com (CT11EXM60.am.mot.com [10.177.8.44])
	by az33exr02.mot.com (8.13.1/8.13.0) with ESMTP id m0MEvn3w002344
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jan 2008 08:57:50 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: problem with 2k page NAND with squashfs
Date: Tue, 22 Jan 2008 09:57:48 -0500
Message-ID: <A2EC06CB0E393B4C8EB220B286B7083E05897220@ct11exm60.ds.mot.com>
In-Reply-To: <20080122084910.2939d94a@weaponx>
References: <A2EC06CB0E393B4C8EB220B286B7083E05897213@ct11exm60.ds.mot.com>
	<20080122084910.2939d94a@weaponx>
From: "Adams Richard-W36112" <rgadams@motorola.com>
To: "Josh Boyer" <jwboyer@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Tue, 22 Jan 2008 09:15:29 -0500
> "Adams Richard-W36112" <rgadams@motorola.com> wrote:
>=20
> >  I have an arm-based embedded system running a 2.6.10 kernel. I'm=20
> > using a squashfs file system (read only) on the Flash device. The=20
> > system was working fine with a 512 byte page Flash part. I started=20
> > having problems when I upgraded to a 2048 byte page Flash=20
> part. When I=20
> > mount the squash file system, it can successfully find the super=20
> > block, but squashfs fails (unable to read inode [5ff3:120]) when it=20
> > try's to finish the mount. My suspicions are that with the older=20
> > kernel (2.6.10) it may not fully support the larger page=20
> devices. Is=20
> > there an achieve of patches that are applicable for a=20
> 2.6.10 kernel? I=20
> > tried to look through the mailing list archive, but without=20
> a search=20
> > tool and not knowing what month I'm looking for the task=20
> became tedious.
>=20
> http://linux-mtd.infradead.org/source.html#kernelversions
>=20
> 2.6.10 pre-dates git even, so you are likely stuck doing=20
> diffs from kernel tarballs.
>=20
> josh
>=20

Before I went through the effort I wanted to check with the list to see
if anyone knows that there is or isn't an issue with the 2k NAND page
size on this vintage kernel.
