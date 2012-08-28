Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6BNK-0007VI-MR
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 02:17:55 +0000
Message-ID: <503C2AB5.30108@freescale.com>
Date: Tue, 28 Aug 2012 10:19:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>	
 <1343514565-8983-2-git-send-email-festevam@gmail.com>	
 <1345734503.2848.247.camel@sauron.fi.intel.com>	
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
 <1346081158.2848.363.camel@sauron.fi.intel.com>
In-Reply-To: <1346081158.2848.363.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 marex.vasut@denx.de, kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B408=E6=9C=8827=E6=97=A5 23:25, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Thu, 2012-08-23 at 11:36 -0400, Huang Shijie wrote:
>>> Why this driver redefined ->block_markbad() at all, it is not suppose=
d
>> For hardware reason, in mx23, the bad block mark is stored in the
>> first byte of the nand page;
>> in mx28/mx50/mx6q, the bad block mark is stored in the first byte of t=
he OOB.
>>
>> That's why the driver redefined the ->block_markbad().
> OK. Would you please tell about the driver some more, I am particularly
> interested how th mx23 case works.
>
> * So the bad block marker is the first byte of the eraseblock set to 0?
yes.

> * What if the user data stars with zero? Or you hide the first NAND pag=
e
>    from the user?

Please see the picture in the common_nfc_set_geometry().
It's a real nand page layout.
The `M` is metadata, it's about 10 byte len.
The bad block marker is stored in the metadata, not the the
  `data` section which save the user's data.

We do not hide the first NAND page.

> * Can you point me to the code where you check if the eraseblock is bad
>    or not at the initialization time (sorry, I could find myself,
>    by trying to save time).
>
Please see the mx23_boot_init().

When mx23 reads a new nand chip in the first time, it will scan all
the nand chip. If it finds a bad block, it will call the=20
nand->block_markbad() which
is just the gpmi_block_markbad(). the gpmi_block_markbad() will mark the=20
first byte
of the nand page to 0 (the mx23 does not support the `swap` feature). So=20
NAND boot mode,
the ROM of mx23 will check the first byte of the NAND page, if it finds=20
a 0, it knows that
this is a bad block.

thanks
Huang Shijie
