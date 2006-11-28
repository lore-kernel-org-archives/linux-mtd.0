Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gp4LD-0003qk-Uq
	for linux-mtd@lists.infradead.org; Tue, 28 Nov 2006 14:53:51 +0000
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
From: Artem Bityutskiy <dedekind@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20061128125810.306e7d54@dhcp-252-105.norway.atmel.com>
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<1163404009.3925.26.camel@sauron>
	<20061128125810.306e7d54@dhcp-252-105.norway.atmel.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 28 Nov 2006 14:36:17 +0200
Message-Id: <1164717377.576.29.camel@sauron>
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

On Tue, 2006-11-28 at 12:58 +0100, Haavard Skinnemoen wrote:
> +#define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE)	=
\
> +				    && !jffs2_dataflash(c))

Please, make sure the DataFlash driver does has MTD_BIT_WRITEABLE bit
set at c->mtd->flags instead

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
