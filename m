Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDedN-0003xH-MZ
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 20:43:14 +0000
Received: by mail-wm0-x236.google.com with SMTP id l126so273617764wml.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Dec 2015 12:42:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
Date: Mon, 28 Dec 2015 17:42:50 -0300
Message-ID: <CAAEAJfC4YWVC=WWTBnKrnNZypC+CKR+D59+LY7j-haTch4yevA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] mtd: nand_bbt: introduce independent nand BBT
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, fransklaver@gmail.com,
 Peter Pan <peterpandong@micron.com>, beanhuo@micron.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 karlzhang@micron.com
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

This is looking a lot better, thanks for the good work!

On 15 December 2015 at 02:59, Peter Pan <peterpansjtu@gmail.com> wrote:
> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
>
> Separate struct nand_chip from BBT code can make current BBT shareable.
> We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> Struct nand_bbt contains all the information BBT needed from outside and
> it should be embedded into NAND family chip struct (such as struct nand_c=
hip).
> NAND family driver should allocate, initialize and free struct nand_bbt.
>
> Below is mtd folder structure we want:
>         mtd
>         =E2=94=9C=E2=94=80=E2=94=80 Kconfig
>         =E2=94=9C=E2=94=80=E2=94=80 Makefile
>         =E2=94=9C=E2=94=80=E2=94=80 ...
>         =E2=94=9C=E2=94=80=E2=94=80 nand_bbt.c

Hm.. I'm not sure about having nand_bbt.c in drivers/mtd.
What's wrong with drivers/mtd/nand ?

In fact, I  was thinking we could go further and clean up the directories a=
 bit
by separating core code, from controllers code, from SPI NAND code:

drivers/mtd/nand/
drivers/mtd/nand/controllers
drivers/mtd/nand/spi

Makes any sense?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
