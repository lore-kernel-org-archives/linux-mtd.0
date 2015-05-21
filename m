Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvKhr-0008Dd-0L
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:15:51 +0000
Received: by iepj10 with SMTP id j10so1931537iep.3
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 00:15:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520184532.GH11598@ld-irv-0074>
References: <1431952494-6403-1-git-send-email-zajec5@gmail.com>
 <20150520184532.GH11598@ld-irv-0074>
Date: Thu, 21 May 2015 09:15:28 +0200
Message-ID: <CACna6rwrVG8oikHEJs=DCjd3f1B=Rh6KH9OHqJn8=DV75c7egw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: add support for typed parsers splitting
 partitions
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Gabor Juhos <juhosg@openwrt.org>, Felix Fietkau <nbd@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 May 2015 at 20:45, Brian Norris <computersforpeace@gmail.com> wrote:
> I haven't reviewed this entirely yet, but my build tests complained:
>
> On Mon, May 18, 2015 at 02:34:53PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index cafdb88..d583d6d 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
> [...]
>> @@ -775,6 +781,72 @@ int parse_mtd_partitions(struct mtd_info *master, c=
onst char *const *types,
>>       return ret;
>>  }
>>
>> +int mtd_parse_typed_partitions(struct mtd_info *slave,
>> +                            enum mtd_partition_type type,
>> +                            struct mtd_partition **pparts,
>> +                            struct mtd_part_parser_data *data)
>
> drivers/mtd/mtdpart.c:784:5: warning: no previous prototype for =E2=80=98=
mtd_parse_typed_partitions=E2=80=99 [-Wmissing-prototypes]
>  int mtd_parse_typed_partitions(struct mtd_info *slave,
>      ^
> drivers/mtd/mtdpart.c:784:5: warning: symbol 'mtd_parse_typed_partitions'=
 was not declared. Should it be static? [sparse]

Sure, I'll fix that, just let me wait to see if there are any other
comments to this patch.
