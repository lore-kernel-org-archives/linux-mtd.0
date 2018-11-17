Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gO8Jq-0000Ox-1s
 for linux-mtd@lists.infradead.org; Sat, 17 Nov 2018 21:39:59 +0000
Date: Sat, 17 Nov 2018 22:39:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olof Johansson <olof@lixom.net>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Namespace prefix some commands
Message-ID: <20181117223929.20f6852f@xps13>
In-Reply-To: <20181117034327.72638-1-olof@lixom.net>
References: <20181117034327.72638-1-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Olof,

Olof Johansson <olof@lixom.net> wrote on Fri, 16 Nov 2018 19:43:27
-0800:

> PAGE_READ is used by RISC-V arch code included through mm headers,
> and it makes sense to bring in a prefix on these in the driver.
>=20
> drivers/mtd/nand/raw/qcom_nandc.c:153: warning: "PAGE_READ" redefined
>  #define PAGE_READ   0x2
> In file included from include/linux/memremap.h:7,
>                  from include/linux/mm.h:27,
>                  from include/linux/scatterlist.h:8,
>                  from include/linux/dma-mapping.h:11,
>                  from drivers/mtd/nand/raw/qcom_nandc.c:17:
> arch/riscv/include/asm/pgtable.h:48: note: this is the location of the pr=
evious definition
>=20
> Caught by riscv allmodconfig.
>=20
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Boris, do you want to queue this as a fix?

Thanks,
Miqu=C3=A8l
