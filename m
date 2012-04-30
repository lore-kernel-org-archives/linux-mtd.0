Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOvxg-0001J2-37
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:08:40 +0000
Received: by ghbf11 with SMTP id f11so1733435ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2012 12:08:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F9EC11A.7020201@freescale.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-8-git-send-email-computersforpeace@gmail.com>
 <4F9EC11A.7020201@freescale.com>
Date: Mon, 30 Apr 2012 12:08:36 -0700
Message-ID: <CAN8TOE_3kSPhNUN7ETaBDkqvFC9=4xxFLa6O5s-zsCsqEwG4cg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] mtd: IFC NAND: utilize oob_required parameter
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Li Yang <leoli@freescale.com>,
 linux-mtd@lists.infradead.org, Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 30, 2012 at 9:43 AM, Scott Wood <scottwood@freescale.com> wrote=
:
> On 04/27/2012 08:29 PM, Brian Norris wrote:
>> @@ -717,7 +718,8 @@ static void fsl_ifc_write_page(struct mtd_info *mtd,=
 struct nand_chip *chip,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const uint8_t=
 *buf, int oob_required)
>> =A0{
>> =A0 =A0 =A0 fsl_ifc_write_buf(mtd, buf, mtd->writesize);
>> - =A0 =A0 fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
>> + =A0 =A0 if (oob_required)
>> + =A0 =A0 =A0 =A0 =A0 =A0 fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oob=
size);
>> =A0}
>
> This will result in writing junk to the non-ECC OOB bytes as opposed to
> leaving it alone.

Then I'll drop the write_page change from this patch.

Is the read_page change sane?

Did you review the (misspelled) eLBC patch? (patch 06/10)

Thanks.

Brian
