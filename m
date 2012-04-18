Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKMEk-0006L8-KP
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 04:11:24 +0000
Received: by yenm10 with SMTP id m10so3889102yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 21:11:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120417172948.20ad0701@pixies.home.jungo.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <20120417172948.20ad0701@pixies.home.jungo.com>
Date: Tue, 17 Apr 2012 21:11:10 -0700
Message-ID: <CAN8TOE9+pKgfXAAsDrR_OuW4cpXy8sJuvxChbj_xU_5WhUC5DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shmulik,

On Tue, Apr 17, 2012 at 7:29 AM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> Only verified execution in nand_base.c and nand.h, see below.

Thanks, this is helpful!

> On Mon, 16 Apr 2012 15:35:54 -0700 Brian Norris <computersforpeace@gmail.=
com> wrote:
>> @@ -1371,23 +1376,23 @@ static int nand_read_page_syndrome(struct mtd_in=
fo *mtd, struct nand_chip *chip,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, p, eccsize);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->ecc.prepad) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, chip-=
>ecc.prepad);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.prepad;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, ch=
ip->ecc.prepad);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.prepad;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.hwctl(mtd, NAND_ECC_READSYN);
>> - =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, eccbytes);
>> - =A0 =A0 =A0 =A0 =A0 =A0 stat =3D chip->ecc.correct(mtd, p, oob, NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, eccbytes);
>> + =A0 =A0 =A0 =A0 =A0 =A0 stat =3D chip->ecc.correct(mtd, p, oobbuf, NUL=
L);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (stat < 0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->ecc_stats.failed++;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->ecc_stats.corrected +=
=3D stat;
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D eccbytes;
>> + =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D eccbytes;
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip->ecc.postpad) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, chip-=
>ecc.postpad);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, ch=
ip->ecc.postpad);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.postpad;
>
> Missed convertion of 'oob' in the last line above.
> s/oob/oobbuf/

Yes, good catch. Thanks.

> Same problem in the following lines of 'nand_read_page_syndrome'.
> Should be:
>
> @@ -1393,9 +1393,9 @@ static int nand_read_page_syndrome(struct mtd_info =
*mtd, struct nand_chip *chip,
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Calculate remaining oob bytes */
> - =A0 =A0 =A0 i =3D mtd->oobsize - (oob - chip->oob_poi);
> + =A0 =A0 =A0 i =3D mtd->oobsize - (oobbuf - chip->oob_poi);
> =A0 =A0 =A0 =A0if (i)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, i);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 1482340..be9ee1f 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -363,15 +363,15 @@ struct nand_ecc_ctrl {
>> =A0 =A0 =A0 int (*correct)(struct mtd_info *mtd, uint8_t *dat, uint8_t *=
read_ecc,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *calc_ecc);
>> =A0 =A0 =A0 int (*read_page_raw)(struct mtd_info *mtd, struct nand_chip =
*chip,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int page);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, uint8_t *oob, in=
t page);
>> =A0 =A0 =A0 void (*write_page_raw)(struct mtd_info *mtd, struct nand_chi=
p *chip,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, const uint=
8_t *oob);
>> =A0 =A0 =A0 int (*read_page)(struct mtd_info *mtd, struct nand_chip *chi=
p,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int page);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, uint8_t *oob, in=
t page);
>> =A0 =A0 =A0 int (*read_subpage)(struct mtd_info *mtd, struct nand_chip *=
chip,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint32_t offs, uint32_t len,=
 uint8_t *buf);
>
> No need to pass 'oob' to 'read_subpage'?

No. It seems like 'read_subpage' is already assumed not to read OOB
data; it only has one user, in nand_base.c, and this user has the
condition '!oob'. (My driver simply avoids subpage read/write
entirely, BTW, so I'm not too familiar with subpages.)

Thanks a lot for the review! This lets me know I should take a closer
look at my patch submissions...this pair of patches went through a lot
of revision before sending, so the 'oob' vs. 'oobbuf' thing got a
little convoluted.

Brian
