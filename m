Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQBv4-00070q-Ja
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 10:09:04 +0000
Received: by lbbpu9 with SMTP id pu9so42567215lbb.3
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 03:08:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPcvp5HB7m47ZTqQ0fE7EV42kNWO=i1EQaysNtgXw6V+oWoUdA@mail.gmail.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
 <CAPcvp5HB7m47ZTqQ0fE7EV42kNWO=i1EQaysNtgXw6V+oWoUdA@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 14 Aug 2015 12:08:00 +0200
Message-ID: <CAOMqctQOU91hbt+2O0qQe3tjMn=3pSYE8E4xPpeS3iGG2A5h8w@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: add read loop
To: Andrew Murray <amurray@embedded-bits.co.uk>
Cc: Hou Zhiqiang <B48286@freescale.com>, Huang Shijie <shijie.huang@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMLA==?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 12:02, Andrew Murray <amurray@embedded-bits.co.uk> wrote:
> On 14 August 2015 at 10:23, Michal Suchanek <hramrach@gmail.com> wrote:
>> mtdblock and ubi do not handle the situation when read returns less data
>> than requested. Loop in spi-nor until buffer is filled or an error is
>> returned.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index e0ae9cf..246fac7 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -738,14 +738,22 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>>         if (ret)
>>                 return ret;
>>
>> -       ret = nor->read(nor, from, len, buf);
>> +       while (len) {
>> +               ret = nor->read(nor, from, len, buf);
>> +               if (ret <= 0)
>> +                       goto read_err;
>> +
>> +               BUG_ON(ret > len);
>> +               *retlen += ret;
>
> Is *retlen initialized to 0 anywhere?

It's initialized in mtdcore and passed into mtd->_read.

Yes, the interface is really awkward.

int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
             u_char *buf)
{
        int ret_code;
        *retlen = 0;


Thanks

Michal
