Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkF0y-0004Rk-2x
	for linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 09:26:00 +0000
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K7Y002NTA6NAW@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 18:25:35 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K7Y00EGXA6J0O@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 18:25:35 +0900 (KST)
Date: Mon, 29 Sep 2008 14:58:02 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: RE: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
In-reply-to: <1222417176.5012.17.camel@sauron>
To: 'David Woodhouse' <dwmw2@infradead.org>
Message-id: <000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=koi8-r
Content-transfer-encoding: quoted-printable
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
	<1222417176.5012.17.camel@sauron>
Cc: linux-mtd@lists.infradead.org, 'Kyungmin Park' <kmpark@infradead.org>,
	'lkml' <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi David,

   Please do comment on this patch.=20

   "Not to expose whole OOB" suggestion by Kyungmin should be fine , but
looking for your suggestion.

With Regards
Gangheyamoorthy.A.P

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: Friday, September 26, 2008 1:50 PM
To: Amit Kumar Sharma
Cc: Kyungmin Park; apgmoorthy; linux-mtd@lists.infradead.org; Kyungmin =
Park;
lkml; David Woodhouse
Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.


On Fri, 2008-09-26 at 13:31 +0530, Amit Kumar Sharma wrote:
> Hi Artem
>=20
> we have following erro message  if we maintain 64 bytes=20
> eccpos.
>=20
> /flash_eraseall -j /dev/mtd4
> ./flash_eraseall: /dev/mtd4: unable to get NAND oobinfo
>=20
> ./nandwrite -j /dev/mtd2 /jffs2.img
> MEMSETOOBSEL: Inappropriate ioctl for device
>=20
> but i think as OneNAND has hw ecc controller so Jffs2 will=20
> not face any problem
> still i think mtd should consider for 128 bytes eccpos for=20
> 4K page size.

Well, anyway, in Linux ABI is a holy cow, you cannot change it.
That is a tough rule. Old user-space binaries have to always
works.

Thus you may do one of:
1. Invent a new ioctl for 4KiB page NANDs
2. Add sysfs support
3. Just do not expose whole OOB as Kyungmin suggested

But I think assume dwmw2 would need to comment on this and
tell which approach would agree on.

--=20
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
