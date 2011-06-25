MIME-Version: 1.0
In-Reply-To: <BANLkTimY2+qV_A7gSWOjAk0f54zKRC2wCg@mail.gmail.com>
References: <4E031900.50108@compulab.co.il>
	<1309000666-5242-1-git-send-email-leiwen@marvell.com>
	<BANLkTimY2+qV_A7gSWOjAk0f54zKRC2wCg@mail.gmail.com>
Date: Sat, 25 Jun 2011 20:51:35 +0800
Message-ID: <BANLkTinyjRFdzBzmhnREOTN+B4cCQMyqXg@mail.gmail.com>
Subject: Re: [PATCH] MTD: pxa3xx_nand: enable multiple chip select support
From: Lei Wen <adrian.wenl@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniel,

On Sat, Jun 25, 2011 at 8:32 PM, Daniel Mack <zonque@gmail.com> wrote:
> On Sat, Jun 25, 2011 at 1:17 PM, Lei Wen <leiwen@marvell.com> wrote:
>> Current pxa3xx_nand controller has two chip select which
>> both be workable. This patch enable this feature.
>>
>> Update platform driver to support this feature.
>>
>> Another notice should be taken that:
>> When you want to use this feature, you should not enable the
>> keep configuration feature, for two chip select could be
>> attached with different nand chip. The different page size
>> and timing requirement make the keep configuration impossible.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>
> I tested this on a PXA303 platform with one chipselect only, at at
> least I can say that this patch doesn't seem to cause any regression
> here. But I couldn't test the new feature it adds.
>
> So, FWIW:
>
> Tested-by: Daniel Mack <zonque@gmail.com>

Thanks for testing!

Best regards,
Lei
