Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmC2-0001rH-96
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 19:05:23 +0000
From: Marek Vasut <marex@denx.de>
To: Harini Katakam <harinikatakamlinux@gmail.com>
Subject: Re: [PATCH V2] Add support for flag status register on Micron chips.
Date: Mon, 14 Apr 2014 20:28:00 +0200
References: <1397228593-17996-1-git-send-email-grmoore@altera.com>
 <CAFcVECLH432pP_hCZXpbKCrOO_tV9v2ev4kLNzUjro68BnADkA@mail.gmail.com>
In-Reply-To: <CAFcVECLH432pP_hCZXpbKCrOO_tV9v2ev4kLNzUjro68BnADkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404142028.00366.marex@denx.de>
Cc: ggrahammoore@gmail.com, grmoore@altera.com,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yves Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Insop Song <insop.song@gainspeed.com>, David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, April 14, 2014 at 05:41:34 PM, Harini Katakam wrote:
> Hi,
> 
> On Fri, Apr 11, 2014 at 8:33 PM,  <grmoore@altera.com> wrote:
> > From: Graham Moore <grmoore@altera.com>
> > 
> > Some new Micron flash chips require reading the flag
> > status register to determine when operations have completed.
> > 
> > Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> > require reading the status register before reading the flag status
> > register.
> > 
> > This patch adds support for the flag status register in the n25q512a1 and
> > n25q00 Micron QSPI flash chips.
> > 
> > Signed-off-by: Graham Moore <grmoore@altera.com>
> 
> <snip>
> 
> >  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)     \
> > 
> > @@ -941,6 +999,8 @@ static const struct spi_device_id m25p_ids[] = {
> > 
> >         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
> >         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
> >         { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> > 
> > +       { "n25q512a1",   INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
> > +       { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },
> 
> I understand that "n25q512a1" was added to distinguish between
> 0x20bb20 and 0x20ba20,
> which is essentially 1.8V and 3V parts.
> (The actual part numbers are n25q512a11 and n25q512a13 respectively)
> But USE_FSR is required for both parts.

Thanks for noticing it, n25q512aX must be aligned with the other parts' naming 
scheme as that's the naming scheme used in micron datasheets.

> Sorry for posting this question here but it seemed relevant:
> When such devices differ only in supply voltages (and return different
> response to READ ID),
> which we don't act on, is there a way to use the same string?

No, they are different chips, so we must not use the same string.

Best regards,
Marek Vasut
