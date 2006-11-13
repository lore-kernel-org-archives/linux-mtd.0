Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GjWX1-0003i4-FW
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 02:47:25 -0500
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
From: Artem Bityutskiy <dedekind@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2006 09:46:49 +0200
Message-Id: <1163404009.3925.26.camel@sauron>
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

Hello Haavard,

On Wed, 2006-11-01 at 11:52 +0100, Haavard Skinnemoen wrote:
> I've seen a couple of other people reporting this bug before, so I'm
> just going to offer some observations I've made when trying to debug
> this (I'm not a filesystem developer, so I don't fully understand the
> code).
>=20
> I can successfully mount a jffs2 filesystem on a freshly erased
> AT45DB642x DataFlash chip through the mtd_dataflash driver. However,
> when trying to write something to a file on that filesystem, I get a
> BUG and the messages
>=20
> jffs2_flash_writev(): Non-contiguous write to 00825300
> wbuf was previously 00825300-008253b8
>=20
> Just creating a file without trying to write anything to it works fine.
>=20
> I've inserted a call to dump_stack() and a few debugging printks in
> jffs2_flash_writev() to see what's going on, and I see the following:

So all it seems that you need to to make jffs2_can_mark_obsokete()
return 0 in case of dataflash.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
