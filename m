From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: add NAND write verify support
Date: Sat, 11 Aug 2012 14:47:17 +0200
References: <1344700231-12624-1-git-send-email-shijie8@gmail.com>
 <201208110913.54479.marex@denx.de>
 <CAMiH66GbOYDpo-RDUct2nCixaf+9vhmT8Ouz+YPx95Z1+g2B1Q@mail.gmail.com>
In-Reply-To: <CAMiH66GbOYDpo-RDUct2nCixaf+9vhmT8Ouz+YPx95Z1+g2B1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208111447.18076.marex@denx.de>
Cc: fabio.estevam@freescale.com, dedekind1@gmail.com, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> On Sat, Aug 11, 2012 at 3:13 PM, Marek Vasut <marex@denx.de> wrote:
> > Dear Huang Shijie,
> > 
> > Please re-add credit to Fabio. Also, Fabio fixed the subject to be more
> 
> sorry. Should I add "Reported by : Fabio ...." to the patch?

Yes, at least.

> I really appriaciate Fabio's work, but I do not think Fabio's patch is
> more accurate.
> The nand chips can be 2K page, 4K page and 8K page. But most of the
> time, the nand chip is 4K page.
> If we fix the verify_buf to 8K size as Fabio's patch does. It will
> waste much memory.
> This is my concern now. :)

That's all right, but the rest of your patch is Fabio's work, correct me if I'm 
wrong. Just give the guy some credit, he found the flaw and diag'd it.

> My patch maybe not good. So If Fabio also sends out a new patch which
> allocates the verify_buf with the mtd->writesize size.
> I will ack it.

Either way is OK.

[...]

> > Best regards,
> > Marek Vasut
