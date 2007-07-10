Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I89rH-0002Pi-Rg
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 03:10:05 -0400
Subject: Re: [RFC/PATCH] Ubi-Utils: add compare feature
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200707092132.02839.alexs@linux.vnet.ibm.com>
References: <200707092132.02839.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 10 Jul 2007 10:09:48 +0300
Message-Id: <1184051388.3531.72.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alex,

On Mon, 2007-07-09 at 21:32 +0200, Alexander Schmidt wrote:
> this is a new feature for pfiflash, called "--compare". It allows the use=
r
> to simulate a pfiflash session without actually changing the flash
> content. If the flash content is equal to the data in the pfif file,
> pfiflash returns zero. A positive value is returned when the flash
> content differs from the pfi file, which indicates that an update is
> necessary. This feature is useful when a controller mounts an NFS share
> during boot and has to determine if a pfi file stored on this share
> contains a code update. Modified PDD values are also registered by the
> compare feature.
>=20
> The patch is already usable but does not contain a check for modified
> volume type, size or alignment yet. These values need to be read from
> sysfs and compared to the values in the pfi file. I'm sending this out
> to get comments/reviews on what I've done yet.

since I do not use the pfi stuff and it is your team's child, and I
really do not have time now to give it comments or reviews, I'll just
blindly push your patch as soon as you send the final version.

Thank you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
