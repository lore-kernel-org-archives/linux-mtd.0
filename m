Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMVx6-0005B8-2h
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 06:43:57 +0000
Received: by wicgj17 with SMTP id gj17so135409500wic.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2015 23:43:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201508032346.36032.marex@denx.de>
References: <cover.1438626500.git.hramrach@gmail.com>
 <38c818599e1de5530ba0fe86d262d26d737ee7a2.1438626500.git.hramrach@gmail.com>
 <201508032346.36032.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 4 Aug 2015 08:42:51 +0200
Message-ID: <CAOMqctQf0c4orOQTD1UJiyZdLadg73b98bpxN5a_RuXnEOFpfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] mtd: spi-nor: change return value of read/write
To: Marek Vasut <marex@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paM?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hou Zhiqiang <B48286@freescale.com>, Huang Shijie <shijie.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 August 2015 at 23:46, Marek Vasut <marex@denx.de> wrote:
> On Monday, August 03, 2015 at 08:39:01 PM, Michal Suchanek wrote:
>> Change the return value of spi-nor device read and write methods to
>> allow returning amount of data transferred and errors as
>> read(2)/write(2) does.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> ---
>>  include/linux/mtd/spi-nor.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index e540952..7d782cb 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -185,9 +185,9 @@ struct spi_nor {
>>       int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
>>                       int write_enable);
>>
>> -     int (*read)(struct spi_nor *nor, loff_t from,
>> +     ssize_t (*read)(struct spi_nor *nor, loff_t from,
>>                       size_t len, size_t *retlen, u_char *read_buf);
>> -     void (*write)(struct spi_nor *nor, loff_t to,
>> +     ssize_t (*write)(struct spi_nor *nor, loff_t to,
>>                       size_t len, size_t *retlen, const u_char *write_buf);
>>       int (*erase)(struct spi_nor *nor, loff_t offs);
>
> You realize that if someone does bisect and has only this patch applied,
> the compiler will complain loudly about mismatching data types, right ? :)

Yes, the compiler prints a warning. However, only the return value
which is not used changes so it should not cause any real problem. The
data type in the fsl-quadspi and m25p80 drivers is matched in the
following two patches.

Thanks

Michal
