Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OiMrz-0001qp-Td
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 07:34:04 +0000
Received: from mail75-db3 (localhost.localdomain [127.0.0.1])	by
	mail75-db3-R.bigfish.com (Postfix) with ESMTP id 59AA1A885AD	for
	<linux-mtd@lists.infradead.org>; Mon,  9 Aug 2010 07:34:01 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.252])	by
	mail75-db3.bigfish.com (Postfix) with ESMTP id A95FDF400C2	for
	<linux-mtd@lists.infradead.org>; Mon,  9 Aug 2010 07:33:40 +0000 (UTC)
Received: from az33smr01.freescale.net (az33smr01.freescale.net
	[10.64.34.199])	by az33egw02.freescale.net (8.14.3/8.14.3) with ESMTP
	id o797XR0N029697	for <linux-mtd@lists.infradead.org>;
	Mon, 9 Aug 2010 00:33:27 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id o797iswN024237	for <linux-mtd@lists.infradead.org>;
	Mon, 9 Aug 2010 02:44:55 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/3][MTD] P4080/eLBC: Make Freescale elbc interrupt common
	to elbc devices
Date: Mon, 9 Aug 2010 15:33:22 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A03E044@zch01exm23.fsl.freescale.net>
In-Reply-To: <1281063096-26598-1-git-send-email-tie-fei.zang@freescale.com>
From: Zang Roy-R61911 <r61911@freescale.com>
To: "Zang Roy-R61911" <R61911@freescale.com>, <linux-mtd@lists.infradead.org>
Cc: Lan Chunhe-B25806 <B25806@freescale.com>, linuxppc-dev@ozlabs.org,
	akpm@linux-foundation.org, Gala Kumar-B11780 <B11780@freescale.com>
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
Any comment about this serial patches?
If none, I'd ask Andrew to merge to his mm tree.
Thanks.
Roy
