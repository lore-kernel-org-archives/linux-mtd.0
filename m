Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE004.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoUkQ-0004Vx-1B
	for linux-mtd@lists.infradead.org; Wed, 03 Aug 2011 06:16:06 +0000
From: Li Yang-R58472 <r58472@freescale.com>
To: Liu Shuo-B35362 <B35362@freescale.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH v2] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
Date: Wed, 3 Aug 2011 06:15:56 +0000
Message-ID: <3F607A5180246847A760FD34122A1E051BC8DF@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1310446122-18050-1-git-send-email-b35362@freescale.com>
In-Reply-To: <1310446122-18050-1-git-send-email-b35362@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>-----Original Message-----
>From: Liu Shuo-B35362
>Sent: Tuesday, July 12, 2011 12:49 PM
>To: dwmw2@infradead.org
>Cc: linux-mtd@lists.infradead.org; linuxppc-dev@ozlabs.org; Liu Shuo-
>B35362; Li Yang-R58472
>Subject: [PATCH v2] mtd/nand : workaround for Freescale FCM to support
>large-page Nand chip
>
>From: Liu Shuo <b35362@freescale.com>
>
>Freescale FCM controller has a 2K size limitation of buffer RAM. In order
>to support the Nand flash chip whose page size is larger than 2K bytes, we
>divide a page into multi-2K pages for MTD layer driver. In that case, we
>force to set the page size to 2K bytes. We convert the page address of MTD
>layer driver to a real page address in flash chips and a column index in
>fsl_elbc driver. We can issue any column address by UA instruction of elbc
>controller.
>
>Signed-off-by: Liu Shuo <b35362@freescale.com>
>Signed-off-by: Li Yang <leoli@freescale.com>
>---

Hi David and Artem,

We have fixed the multi-line comment style problem.  Could you help to pick=
 the patch?

- Leo
