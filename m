Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IcxAk-0000AX-H8
	for linux-mtd@lists.infradead.org; Wed, 03 Oct 2007 06:53:28 +0100
Subject: Re: [PATCH 0/4 try3] ubi-utils: migrate to new libubi
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200710021416.02621.alexs@linux.vnet.ibm.com>
References: <200710021416.02621.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 03 Oct 2007 08:49:29 +0300
Message-Id: <1191390569.4399.0.camel@sauron>
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

On Tue, 2007-10-02 at 14:16 +0200, Alexander Schmidt wrote:
> This patchset migrates the remaining tools (pddcustomize, ubimirror and
> pfiflash) to the new libubi.
>=20
> Changes since try2: I use PATH_MAX from limits.h now instead of a
> self-defined value
>=20
> Changes since try1: I have discarded the libubi_common files, device
> paths are now integrated in every utility.
>=20
> I've tested the new version with the scripts in ubi-utils/scripts/ubi_*
> and everything works fine.

Thanks! Committed.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
