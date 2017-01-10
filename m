Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cR0RI-0007bM-QL
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 17:42:30 +0000
Received: by mail-wj0-x241.google.com with SMTP id dh1so7943023wjb.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 09:42:07 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: move TRX parsing code to separated
 function
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <7e15fb84-296b-e4d6-a965-b47921d5577c@gmail.com>
 <CACna6rz2=w74VXHC0qWZUb8gEa-ucg5cgXDFMB8vmOW8gMxahg@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <43e94ec1-3abe-5979-f0c6-ba171a795a9a@gmail.com>
Date: Tue, 10 Jan 2017 18:42:04 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6rz2=w74VXHC0qWZUb8gEa-ucg5cgXDFMB8vmOW8gMxahg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/10/2017 05:27 PM, Rafał Miłecki wrote:
> On 10 January 2017 at 17:19, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 01/10/2017 12:50 PM, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This change simplifies main parsing loop logic a bit. In future it may
>>> be useful for moving TRX support to separated module / parser (if we
>>> implement support for them at some point).
>>> Finally parsing TRX at the end puts us in a better position as we have
>>> better flash layout knowledge. It may be useful e.g. if it appears there
>>> is more than 1 TRX partition.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>  drivers/mtd/bcm47xxpart.c | 124 ++++++++++++++++++++++++++++------------------
>>>  1 file changed, 77 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>>> index 283ff7e..d7d1b6e 100644
>>> --- a/drivers/mtd/bcm47xxpart.c
>>> +++ b/drivers/mtd/bcm47xxpart.c
>>> @@ -83,6 +83,70 @@ static const char *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
>>>       return "rootfs";
>>>  }
>>>
>>> +static int bcm47xxpart_parse_trx(struct mtd_info *master,
>>> +                              struct mtd_partition *trx,
>>> +                              struct mtd_partition *parts,
>>> +                              size_t parts_len)
>>> +{
>>> +     struct mtd_partition *part;
>>> +     struct trx_header header;
>>> +     size_t bytes_read;
>>> +     int curr_part = 0;
>>> +     int i, err;
>>> +
>>> +     if (parts_len < 3) {
>>> +             pr_warn("No enough space to add TRX partitions!\n");
>>> +             return -ENOMEM;
>>> +     }
>>> +
>>> +     err = mtd_read(master, trx->offset, sizeof(header), &bytes_read,
>>> +                    (uint8_t *)&header);
>>> +     if (err && !mtd_is_bitflip(err)) {
>>> +             pr_err("mtd_read error while reading TRX header: %d\n", err);
>>> +             return err;
>>> +     }
>>> +
>>> +     i = 0;
>>> +
>>> +     /* We have LZMA loader if offset[2] points to sth */
>>> +     if (header.offset[2]) {
>>> +             part = &parts[curr_part++];
>>> +             part->name = "loader";
>>> +             part->offset = trx->offset + header.offset[i];
>>> +             i++;
>>> +     }
>>> +
>>> +     if (header.offset[i]) {
>>> +             part = &parts[curr_part++];
>>> +             part->name = "linux";
>>> +             part->offset = trx->offset + header.offset[i];
>>> +             i++;
>>> +     }
>>> +
>>> +     if (header.offset[i]) {
>>> +             size_t offset = trx->offset + header.offset[i];
>>> +
>>> +             part = &parts[curr_part++];
>>> +             part->name = bcm47xxpart_trx_data_part_name(master, offset);
>>> +             part->offset = offset;
>>
>> Why don't you still use bcm47xxpart_add_part() here ?
> 
> Good point. I think I got two reasons:
> 1) Making this function more generic to it can be moved to separated
> module/parser as some point (without dependency)
> 2) Sadly I'm not sure how bcm47xxpart_add_part is useful at all. Do
> you think it really simplifies code?

Not really, but at least it's consistent.

-- 
Best regards,
Marek Vasut
