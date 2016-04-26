Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av97H-0005pt-RW
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 19:57:52 +0000
Received: by mail-io0-x22d.google.com with SMTP id f89so26817948ioi.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2016 12:57:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160426205344.17ab81cb@bbrezillon>
References: <1461695776-29740-1-git-send-email-zajec5@gmail.com>
 <20160426205344.17ab81cb@bbrezillon>
Date: Tue, 26 Apr 2016 21:57:31 +0200
Message-ID: <CACna6rxf22Gx-0zxMwr2U-QZ=t1jLWGeW1MiyXPAce3zyTbCCw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: fix NULL pointer dereference in
 of_get_nand_ecc_algo
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 26 April 2016 at 20:53, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 26 Apr 2016 20:36:16 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>
>> Our array nand_ecc_algos doesn't specify mappings for all available
>> enum nand_ecc_algo values. The one missing there is NAND_ECC_UNKNOWN
>> as this value is reserved for algorithm not being specified at all.
>> It means we have to be careful when iterating this array and handle
>> NULL values.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>> Hi Boris,
>>
>> Sorry for this crash in nand subsystem :( If you think it's OK you may
>> pick this patch as a fixup for
>> c6e002a7ca9f ("mtd: nand: add support for "nand-ecc-algo" DT property")
>> ---
>>  drivers/mtd/nand/nand_base.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index a5417a0..0eaa9dc 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -4016,6 +4016,8 @@ static int of_get_nand_ecc_algo(struct device_node=
 *np)
>>       err =3D of_property_read_string(np, "nand-ecc-algo", &pm);
>>       if (!err) {
>>               for (i =3D 0; i < ARRAY_SIZE(nand_ecc_algos); i++)
>> +                     if (!nand_ecc_algos[i])
>> +                             continue;
>
> Can we add an "unknown" entry, or start iterating at NAND_ECC_HAMMING
> or NAND_ECC_UNKNOWN + 1 instead of adding this extra test?

Sure, if you think it's better. I'll send V2.

--=20
Rafa=C5=82
