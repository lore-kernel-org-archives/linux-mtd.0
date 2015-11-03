Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztesw-0006c1-Q7
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 16:56:40 +0000
Received: by wmeg8 with SMTP id g8so20195703wme.1
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2015 08:56:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5638E074.5070800@ge.com>
References: <5638E074.5070800@ge.com>
Date: Tue, 3 Nov 2015 13:56:16 -0300
Message-ID: <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
Subject: Re: nand_flash_detect_onfi error
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Renaud Barbier <renaud.barbier@ge.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On 3 November 2015 at 13:27, Renaud Barbier <renaud.barbier@ge.com> wrote:
> In the file drivers/mtd/nand/nand_base.c, in function
> nand_flash_detect_onfi  reading the ONFI data can be run up to 3 times
> when there is a CRC error detected in the onfi data:
>
> The function call chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1); is located
> outside the first for loop:
>
> chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> for (i =3D 0; i < 3; i++) {
>         for (j =3D 0; j < sizeof(*p); j++)
>                 ((uint8_t *)p)[j] =3D chip->read_byte(mtd);
>         if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) =3D=3D
>                         le16_to_cpu(p->crc)) {
>                 break;
>         }
> }
>
> This results in a read beyond buffer error if the data have to be read
> more than once.
>
> This error can also be found in U-boot and barebox.
>

Hi Renaud,

NAND_CMD_PARAM is supposed to read one parameter page,
plus the two redundant parameter pages as well. That's why the NAND core
code reading sizeof(parameter page) x 3 bytes safely.

If you take a look at the ONFI 3.0 spec you'll see the parameter page
is specified to be 767 bytes long, i.e. three redundant parameter pages
can be read.

If you are seeing this kind of bug with a NAND controller, then you need
to extend your CMD_PARAM read to fetch all the copies of the parameter page=
.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
