Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYjJh-0003b7-2C
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 15:17:17 +0100
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l8LEEhiQ022239
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2007 10:14:43 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l8LEEhgc465098
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2007 08:14:43 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l8LEEg7E031923
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2007 08:14:42 -0600
Date: Fri, 21 Sep 2007 09:14:41 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: =?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] [MTD] Document erase interface.
Message-ID: <20070921091441.6fa649df@weaponx.rchland.ibm.com>
In-Reply-To: <20070921134143.GH1692@lazybastard.org>
References: <20070921134143.GH1692@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 21 Sep 2007 15:41:44 +0200
J=C3=B6rn Engel <joern@logfs.org> wrote:

> Document mtd erase interface.
>=20
> Signed-off-by: J=C3=B6rn Engel <joern@logfs.org>
> ---
>=20
>  include/linux/mtd/mtd.h |    7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> --- linux-2.6.21logfs/include/linux/mtd/mtd.h~mtd_erase_documentation	200=
7-05-31 13:41:41.000000000 +0200
> +++ linux-2.6.21logfs/include/linux/mtd/mtd.h	2007-09-21 15:43:18.0000000=
00 +0200
> @@ -139,6 +139,13 @@ struct mtd_info {
>  	/* This really shouldn't be here. It can go away in 2.5 */
>  	u_int32_t bank_size;
> =20
> +	/*
> +	 * Erase is an asynchronous operation.  Device drivers are supposed
> +	 * to call instr->callback() whenever the operation completes, even
> +	 * if it completes with a failure.
> +	 * Callers are supposed to pass a callback function and wait for it
> +	 * to be called before writing to the block.
> +	 */
>  	int (*erase) (struct mtd_info *mtd, struct erase_info *instr);

If you're going to go to the trouble, maybe doing it in KernelDoc style
would be better.

josh
