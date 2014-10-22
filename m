Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgq7X-00024T-4I
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 07:14:11 +0000
Received: by mail-ig0-f169.google.com with SMTP id uq10so406116igb.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 00:13:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E6D82@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315E62CB@NTXXIAMBX02.xacn.micron.com>
 <201410150045.53976.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E6D82@NTXXIAMBX02.xacn.micron.com>
Date: Wed, 22 Oct 2014 09:06:51 +0200
Message-ID: <CACna6rxGzOVu+PKFxHeD7fnhG__3kcM-vY=q8OgtSVgZuQzGwA@mail.gmail.com>
Subject: Re: [PATCH 1/1 v2] driver:mtd:spi-nor:fix spi_nor_scan overwrite
 platform ID point
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: bpqw <bpqw@micron.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 October 2014 02:52, bpqw <bpqw@micron.com> wrote:
> For example:
>
> const struct spi_device_id spi_nor_ids[] = {
> ......
> ......
> ......
>         { "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },//former right platform point will be overwrote by this data info.
>         { "n25q128a13",  INFO(0x20bb18, 0x1234, 64 * 1024,  512, SECT_4K) },//this is the right platform data,I want to match this data info.
>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
>         { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },

Your initial commit was really missing some example indeed. It was
trying to understand it for 10 minutes with no luck (until seeing
above case) ;)

I see problem in spi-nor that your patch reveals:
ISSUE: spi-nor accepts any entry from spi_nor_ids with no ext_id
specified as long as the jedec_id matches
I guess reason behind this is to support chips with the same
parameters but different extended IDs. That simplifies the driver and
support for extra chips but may also cause problems like in your case.

So AFAIU your patch tries to force using specific flash info, because
JEDEC based detection fails. In general this is what we try to avoid.
We want to auto-detect flash chips and to relieve platform code / DT.

Could we drop this patch and modify spi-nor to detect your chip
automatically? That would be much cleaner solution to me.
