Message-ID: <55799DFC.3000304@toshiba.co.jp>
Date: Thu, 11 Jun 2015 23:41:00 +0900
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: nand: support for Toshiba BENAND (Built-in ECC NAND)
References: <1433920119-16303-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <CAFLxGvx7epkW9OA5PotBWbQr-FH_9uCMUZAtRP0oX16WcyiWLQ@mail.gmail.com>
In-Reply-To: <CAFLxGvx7epkW9OA5PotBWbQr-FH_9uCMUZAtRP0oX16WcyiWLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/06/10 16:50, Richard Weinberger wrote:
> On Wed, Jun 10, 2015 at 9:08 AM, KOBAYASHI Yoshitake
> <yoshitake.kobayashi@toshiba.co.jp> wrote:
>> This patch enables support for Toshiba BENAND.
>> Toshiba BENAND is a SLC NAND solution that automatically generates ECC
>> inside NAND chip. Newer generation SLC NAND devices of today need multi-bit
>> hardware ECC by NAND controller in SoC. BENAND solution is ECC free,
>> has high performance and backward compatibility in NAND chip trend.
>
> Do you have performance numbers?
> How fast is it compared to a decent HW ECC engine?

Comparing with 24nm SLC NAND, BENAND is few percent faster in write and
more than 5 percent faster in read. But the result depends on usecase
and compared device. I will delete the last sentence.

> Did you see my On-Die ECC series and Brian's comments on it?
> https://lkml.org/lkml/2015/3/25/310
> I suspect some of his comments will apply to you as well.

Thanks for the suggestion.
I would like to post the current driver first to make it open, then
consider how to apply his comments. Because I made a big mistake.

-- <snip> --
>> +obj-$(CONFIG_MTD_NAND_BENAND)  += nand_benand.o
>
> nand_benand.c is not part of this patch.
> Forgot a git add? :-)

Oh!.. I will repost it.
