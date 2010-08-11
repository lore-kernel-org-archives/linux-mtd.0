Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oj1KQ-0002gU-HE
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2010 02:46:08 +0000
Received: from mail170-tx2 (localhost.localdomain [127.0.0.1])	by
	mail170-tx2-R.bigfish.com (Postfix) with ESMTP id 56AC73287AD	for
	<linux-mtd@lists.infradead.org>; Wed, 11 Aug 2010 02:46:04 +0000 (UTC)
Received: from TX2EHSMHS020.bigfish.com (unknown [10.9.14.249])	by
	mail170-tx2.bigfish.com (Postfix) with ESMTP id 20D312004E	for
	<linux-mtd@lists.infradead.org>; Wed, 11 Aug 2010 02:46:04 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP id
	o7B2jkPZ023985	for
	<linux-mtd@lists.infradead.org>; Tue, 10 Aug 2010 19:45:51 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o7B2wkHE001006	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 21:58:47 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/3][MTD] P4080/eLBC: Make Freescale elbc interrupt common
	to elbc devices
Date: Wed, 11 Aug 2010 10:45:41 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A056382@zch01exm23.fsl.freescale.net>
In-Reply-To: <1281063096-26598-1-git-send-email-tie-fei.zang@freescale.com>
From: Zang Roy-R61911 <r61911@freescale.com>
To: "Zang Roy-R61911" <R61911@freescale.com>, <linux-mtd@lists.infradead.org>
Cc: Lan Chunhe-B25806 <B25806@freescale.com>, linuxppc-dev@ozlabs.org,
	akpm@linux-foundation.org, Gala Kumar-B11780 <B11780@freescale.com>,
	Wood Scott-B07421 <B07421@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: Zang Roy-R61911=20
> Sent: Friday, August 06, 2010 10:52 AM
> To: linux-mtd@lists.infradead.org
> Cc: linuxppc-dev@ozlabs.org; akpm@linux-foundation.org; Gala=20
> Kumar-B11780; Lan Chunhe-B25806
> Subject: [PATCH 1/3][MTD] P4080/eLBC: Make Freescale elbc=20
> interrupt common to elbc devices
>=20
> From: Lan Chunhe-B25806 <b25806@freescale.com>
>=20
> Move Freescale elbc interrupt from nand dirver to elbc driver.
> Then all elbc devices can use the interrupt instead of ONLY nand.
>=20
> Signed-off-by: Lan Chunhe-B25806 <b25806@freescale.com>
> Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>
> ---
> send the patch to linux-mtd@lists.infradead.org
> it has been posted to linuxppc-dev@ozlabs.org and do not get=20
> any comment.
>=20
>  arch/powerpc/Kconfig               |    7 +-
>  arch/powerpc/include/asm/fsl_lbc.h |   34 +++++-
>  arch/powerpc/sysdev/fsl_lbc.c      |  254=20
> ++++++++++++++++++++++++++++++------
>  3 files changed, 253 insertions(+), 42 deletions(-)
Who is response to review the nand driver in mtd list?
Please help to  comment on this serial patch.
Thanks.
Roy
