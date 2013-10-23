Received: from mail-ve0-x232.google.com ([2607:f8b0:400c:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYp7Z-0002X8-ON
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 03:28:35 +0000
Received: by mail-ve0-f178.google.com with SMTP id jy13so137603veb.37
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 20:28:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52673487.40908@freescale.com>
References: <1376978317-28010-1-git-send-email-b32955@freescale.com>
 <20131022233349.GR23337@ld-irv-0074.broadcom.com>
 <52673487.40908@freescale.com>
Date: Tue, 22 Oct 2013 20:28:10 -0700
Message-ID: <CAN8TOE-E4sFi6239fN6gs71KTnDFMwjtTFs059+R82S0k6JBBQ@mail.gmail.com>
Subject: Re: [PATCH for mtd-utils 0/4] about the SLC/MLC
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 22, 2013 at 7:29 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA10=D4=C223=C8=D5 07:33, Brian Norris =D0=B4=B5=C0:
>
>> You're missing flash_erase.c, which still has:
>>
>>         isNAND =3D mtd.type =3D=3D MTD_NANDFLASH ? 1 : 0;
>
> I missed it on purpose.
>
> The "isNAND" is used for the jffs2 to write the cleanmarker.
>
> Since the jffs2 does not support the MLC now, the above line is used to
> check the SLC nand now.
> Only the SLC nand can be written with the cleanmarker.
>
> Am i right?

No, if you look at the code, 'isNAND' is used to help with the bad
block checking. And even for the JFFS2 stuff, all your intentional
omission does is cause MLC to be treated like NOR flash, which is
possibly even worse.

And anyway, the variable name 'isNAND' is currently misleading,
because it now only represents 'isSLC'.

Please fix 'isNAND' to reflect all NAND (SLC or MLC). If you would
like, you can add a separate check to print a nice warning or error
message if the flash is MLC and someone chose flash_erase --jffs2.

Brian
