Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQzHB-0006xi-Bk
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 16:27:58 +0000
Received: by mail-oi0-x241.google.com with SMTP id x84so18974172oix.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 08:27:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7e15fb84-296b-e4d6-a965-b47921d5577c@gmail.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <7e15fb84-296b-e4d6-a965-b47921d5577c@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 10 Jan 2017 17:27:35 +0100
Message-ID: <CACna6rz2=w74VXHC0qWZUb8gEa-ucg5cgXDFMB8vmOW8gMxahg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: move TRX parsing code to separated
 function
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

On 10 January 2017 at 17:19, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 01/10/2017 12:50 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> This change simplifies main parsing loop logic a bit. In future it may
>> be useful for moving TRX support to separated module / parser (if we
>> implement support for them at some point).
>> Finally parsing TRX at the end puts us in a better position as we have
>> better flash layout knowledge. It may be useful e.g. if it appears there
>> is more than 1 TRX partition.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>>  drivers/mtd/bcm47xxpart.c | 124 ++++++++++++++++++++++++++++-----------=
-------
>>  1 file changed, 77 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>> index 283ff7e..d7d1b6e 100644
>> --- a/drivers/mtd/bcm47xxpart.c
>> +++ b/drivers/mtd/bcm47xxpart.c
>> @@ -83,6 +83,70 @@ static const char *bcm47xxpart_trx_data_part_name(str=
uct mtd_info *master,
>>       return "rootfs";
>>  }
>>
>> +static int bcm47xxpart_parse_trx(struct mtd_info *master,
>> +                              struct mtd_partition *trx,
>> +                              struct mtd_partition *parts,
>> +                              size_t parts_len)
>> +{
>> +     struct mtd_partition *part;
>> +     struct trx_header header;
>> +     size_t bytes_read;
>> +     int curr_part =3D 0;
>> +     int i, err;
>> +
>> +     if (parts_len < 3) {
>> +             pr_warn("No enough space to add TRX partitions!\n");
>> +             return -ENOMEM;
>> +     }
>> +
>> +     err =3D mtd_read(master, trx->offset, sizeof(header), &bytes_read,
>> +                    (uint8_t *)&header);
>> +     if (err && !mtd_is_bitflip(err)) {
>> +             pr_err("mtd_read error while reading TRX header: %d\n", er=
r);
>> +             return err;
>> +     }
>> +
>> +     i =3D 0;
>> +
>> +     /* We have LZMA loader if offset[2] points to sth */
>> +     if (header.offset[2]) {
>> +             part =3D &parts[curr_part++];
>> +             part->name =3D "loader";
>> +             part->offset =3D trx->offset + header.offset[i];
>> +             i++;
>> +     }
>> +
>> +     if (header.offset[i]) {
>> +             part =3D &parts[curr_part++];
>> +             part->name =3D "linux";
>> +             part->offset =3D trx->offset + header.offset[i];
>> +             i++;
>> +     }
>> +
>> +     if (header.offset[i]) {
>> +             size_t offset =3D trx->offset + header.offset[i];
>> +
>> +             part =3D &parts[curr_part++];
>> +             part->name =3D bcm47xxpart_trx_data_part_name(master, offs=
et);
>> +             part->offset =3D offset;
>
> Why don't you still use bcm47xxpart_add_part() here ?

Good point. I think I got two reasons:
1) Making this function more generic to it can be moved to separated
module/parser as some point (without dependency)
2) Sadly I'm not sure how bcm47xxpart_add_part is useful at all. Do
you think it really simplifies code?

--=20
Rafa=C5=82
