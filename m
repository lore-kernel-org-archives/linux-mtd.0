MIME-Version: 1.0
In-Reply-To: <1307445467.11104.80.camel@localhost>
References: <1307440867-18993-1-git-send-email-leiwen@marvell.com>
	<1307440867-18993-2-git-send-email-leiwen@marvell.com>
	<1307445467.11104.80.camel@localhost>
Date: Tue, 7 Jun 2011 20:28:17 +0800
Message-ID: <BANLkTin_Z8ndAjp9vw6QcNb5bT82uoR9ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] MTD: pxa3xx_nand: Fix blank page ECC mismatch
From: Lei Wen <adrian.wenl@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <David.Woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 7, 2011 at 7:17 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-06-07 at 03:01 -0700, Lei Wen wrote:
>> From: Daniel Mack <zonque@gmail.com>
>>
>> This bug was introduced in f8155a40 ("mtd: pxa3xx_nand: rework irq
>> logic") and causes the PXA3xx NAND controller fail to operate with NAND
>> flash that has empty pages. According to the comment in this block, the
>> hardware controller will report a double-bit error for empty pages,
>> which can and must be ignored.
>>
>> This patch restores the original behaviour of the driver.
>>
>> Signed-off-by: Daniel Mack <zonque@gmail.com>
>> Acked-by: Lei Wen <leiwen@marvell.com>
>> Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
>> Cc: David Woodhouse <David.Woodhouse@intel.com>
>> Cc: stable@kernel.org
>
> This was introduced in 2.6.38, so let's make it:
>
> Cc: stable@kernel.org [2.6.38+]
>
Thanks for correcting this.

Best regards,
Lei
