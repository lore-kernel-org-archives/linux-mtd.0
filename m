Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byfCE-0002lI-QB
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:21:50 +0000
Received: from mail-lf0-f53.google.com ([209.85.215.53]:32891)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1byfBq-000NPw-U2
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 09:21:25 -0400
Received: by mail-lf0-f53.google.com with SMTP id x79so203689591lff.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 06:21:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <25b5dc82-a5fa-1d0f-8915-60b121a65751@gmail.com>
References: <1475637910-2324-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
 <CAD6G_RT8s5=vDP2bc__SULyxt=NnqZrLDuepcUkxs75HG9=ZQg@mail.gmail.com>
 <25b5dc82-a5fa-1d0f-8915-60b121a65751@gmail.com>
From: Jagan Teki <jagan@openedev.com>
Date: Mon, 24 Oct 2016 18:51:20 +0530
Message-ID: <CAD6G_RSTKULAU6v=W=GS-x10x206oMTjd6kfNhDuNc=jwqN93g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for N25Q256A13
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 tatsuaki.osafune.uv@hitachi.com, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 24, 2016 at 6:39 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 10/24/2016 10:04 AM, Jagan Teki wrote:
>> On Wed, Oct 5, 2016 at 8:55 AM, Nobuhiro Iwamatsu
>> <nobuhiro.iwamatsu.kw@hitachi.com> wrote:
>>> Add Micron N25Q256A13 256Mbit NOR Flash in the list of supported
>>> devices. This chip is the same structure as the N25Q256A but ID
>>> is different.
>>>
>>> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
>>> ---
>>>
>>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index d0fc165..ce67ccd 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -884,6 +884,7 @@ static const struct flash_info spi_nor_ids[] = {
>>>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>> +       { "n25q256a13",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>
>> Since the previous chips follow 'a' notation for bb chips, better to
>> use n25q256a for bb and n25q256 for ba
>
> Do you mind expanding on this? I don't understand the remark.

{ "n25q064",     INFO(0x20ba17,
{ "n25q064a",   INFO(0x20bb17,

What I am saying is n25q256a is should be n25q256 and the new addition
can be n25q256a

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
