Received: from mexforward.lss.emc.com ([128.222.32.20])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEANy-0005AG-Ay
	for linux-mtd@lists.infradead.org; Sun, 13 Jan 2008 21:29:03 +0000
From: Foster_Brian@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Redboot FIS entry upgrade from Linux
Date: Sun, 13 Jan 2008 16:26:02 -0500
Message-ID: <64385436BC51BF448208008A36316D6701B1EB4E@CORPUSMX70B.corp.emc.com>
In-Reply-To: <FF584854D6FFE547AB2F7515A798AC3A4E3A9955@venus.imagineil.tv>
References: <FF584854D6FFE547AB2F7515A798AC3A4E3A9955@venus.imagineil.tv>
To: <jacob@imaginecommunications.com>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Jacob Avraham
> Sent: Sunday, January 13, 2008 11:31 AM
> To: linux-mtd@lists.infradead.org
> Subject: Redboot FIS entry upgrade from Linux
>=20
> Hi,
>=20
> Say I have a zImage or ramdisk image as a file listed in FIS,
> which I use to  "fis load" from Redboot.
> Now I want to upgrade an image from Linux, so in addition to
> writing into the specific mtd partition I need to update the FIS
> directory entry checksum value.
>=20
> Are there any utils to facilitate that?
> Or maybe such where not developed because it's not a good idea?
>=20
> Thanks,
>=20
> Jacob
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Perhaps Linux 'fconfig' is what you are looking for:

http://andrzejekiert.ovh.org/software.html.en

Brian
