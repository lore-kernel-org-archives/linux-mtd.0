Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU3b3-0005yx-4J
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 12:23:37 -0400
Subject: Re: [PATCH] [MTD] UBI: rename major_to_info()
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200703211718.50407.alexs@linux.vnet.ibm.com>
References: <200703211718.50407.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 21 Mar 2007 18:21:34 +0200
Message-Id: <1174494094.17249.210.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-21 at 17:18 +0100, Alexander Schmidt wrote:
> The patch renames major_to_info() to major_to_device() to match the new
> struct ubi_device.
>=20
> Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
> ---
>  drivers/mtd/ubi/cdev.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)

Committed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
