Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byf1Q-0003Hu-Ir
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:10:40 +0000
Received: by mail-wm0-x244.google.com with SMTP id d128so9778485wmf.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 06:10:16 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add support for N25Q256A13
To: Jagan Teki <jagan@openedev.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
References: <1475637910-2324-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
 <CAD6G_RT8s5=vDP2bc__SULyxt=NnqZrLDuepcUkxs75HG9=ZQg@mail.gmail.com>
Cc: tatsuaki.osafune.uv@hitachi.com,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <25b5dc82-a5fa-1d0f-8915-60b121a65751@gmail.com>
Date: Mon, 24 Oct 2016 15:09:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAD6G_RT8s5=vDP2bc__SULyxt=NnqZrLDuepcUkxs75HG9=ZQg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/24/2016 10:04 AM, Jagan Teki wrote:
> On Wed, Oct 5, 2016 at 8:55 AM, Nobuhiro Iwamatsu
> <nobuhiro.iwamatsu.kw@hitachi.com> wrote:
>> Add Micron N25Q256A13 256Mbit NOR Flash in the list of supported
>> devices. This chip is the same structure as the N25Q256A but ID
>> is different.
>>
>> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
>> ---
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..ce67ccd 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -884,6 +884,7 @@ static const struct flash_info spi_nor_ids[] = {
>>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>> +       { "n25q256a13",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> 
> Since the previous chips follow 'a' notation for bb chips, better to
> use n25q256a for bb and n25q256 for ba

Do you mind expanding on this? I don't understand the remark.


-- 
Best regards,
Marek Vasut
