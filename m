Received: from ie-in-x0234.1e100.net ([2607:f8b0:4001:c03::234]
 helo=mail-ie0-x234.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U6Ysk-0006WR-M0
 for linux-mtd@lists.infradead.org; Sat, 16 Feb 2013 03:56:11 +0000
Received: by mail-ie0-f180.google.com with SMTP id bn7so5543730ieb.39
 for <linux-mtd@lists.infradead.org>; Fri, 15 Feb 2013 19:56:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1360684037.12703.117.camel@sauron.fi.intel.com>
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>
 <1359349039-11510-2-git-send-email-b32955@freescale.com>
 <1360684037.12703.117.camel@sauron.fi.intel.com>
Date: Sat, 16 Feb 2013 11:56:09 +0800
Message-ID: <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 12, 2013 at 11:47 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2013-01-28 at 12:57 +0800, Huang Shijie wrote:
>> +       {"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 },
>> +       {"SmartMedia 256MiB 3,3V ROM",  {0, 0x5b}, 512, 256, 0x4000,
>> NAND_ROM},
>
> Sorry for a possibly stupid question, but what does it buy you adding
> another "0" to all the entries? I see you add another table, which you
> look up if the "traditional" table does not work. Why you need to add
> these zeroes?

The zeros are for the maf_id.

The dev_id is the second byte of the 8-byte id data.

thanks
Huang Shijie


>
> --
> Best Regards,
> Artem Bityutskiy
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
