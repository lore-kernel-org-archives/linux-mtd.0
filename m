Received: from mail-yh0-x22c.google.com ([2607:f8b0:4002:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZj1D-0004nZ-TO
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 15:42:00 +0000
Received: by mail-yh0-f44.google.com with SMTP id f10so8180931yha.17
 for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2014 08:41:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1397228593-17996-1-git-send-email-grmoore@altera.com>
References: <1397228593-17996-1-git-send-email-grmoore@altera.com>
Date: Mon, 14 Apr 2014 21:11:34 +0530
Message-ID: <CAFcVECLH432pP_hCZXpbKCrOO_tV9v2ev4kLNzUjro68BnADkA@mail.gmail.com>
Subject: Re: [PATCH V2] Add support for flag status register on Micron chips.
From: Harini Katakam <harinikatakamlinux@gmail.com>
To: grmoore@altera.com
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, ggrahammoore@gmail.com,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yves Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Insop Song <insop.song@gainspeed.com>, Alan Tull <atull@altera.com>,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Apr 11, 2014 at 8:33 PM,  <grmoore@altera.com> wrote:
> From: Graham Moore <grmoore@altera.com>
>
> Some new Micron flash chips require reading the flag
> status register to determine when operations have completed.
>
> Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> require reading the status register before reading the flag status register.
>
> This patch adds support for the flag status register in the n25q512a1 and n25q00
> Micron QSPI flash chips.
>
> Signed-off-by: Graham Moore <grmoore@altera.com>

<snip>

>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)     \
> @@ -941,6 +999,8 @@ static const struct spi_device_id m25p_ids[] = {
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
>         { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> +       { "n25q512a1",   INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
> +       { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },
>

I understand that "n25q512a1" was added to distinguish between
0x20bb20 and 0x20ba20,
which is essentially 1.8V and 3V parts.
(The actual part numbers are n25q512a11 and n25q512a13 respectively)
But USE_FSR is required for both parts.

Sorry for posting this question here but it seemed relevant:
When such devices differ only in supply voltages (and return different
response to READ ID),
which we don't act on, is there a way to use the same string?

Regards,
Harini
