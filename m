Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI3rn-0002Mc-LE
 for linux-mtd@lists.infradead.org; Tue, 06 Jun 2017 02:05:09 +0000
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
 [209.85.161.169]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v5624Kns008950
 for <linux-mtd@lists.infradead.org>; Tue, 6 Jun 2017 11:04:21 +0900
Received: by mail-yw0-f169.google.com with SMTP id l14so62729612ywk.1
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jun 2017 19:04:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170330183030.14acbb47@bbrezillon>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-2-git-send-email-yamada.masahiro@socionext.com>
 <20170330183030.14acbb47@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Jun 2017 11:04:19 +0900
Message-ID: <CAK7LNARFJfKHNOkOJkbLad0Chqsf=3mMdLJkagNKpc-gQwzsLQ@mail.gmail.com>
Subject: Re: [PATCH v3 32/37] mtd: nand: denali: support hardware-assisted
 erased page detection
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-03-31 1:30 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Thu, 30 Mar 2017 17:15:03 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Recent versions of this IP support automatic erased page detection.
>> If an erased page is detected on reads, the controller does not set
>> INTR__ECC_UNCOR_ERR, but INTR__ERASED_PAGE.  If this feature is
>> supported, the driver can use this information instead of calling
>> nand_check_erased_ecc_chunk().
>>
>> The detection of erased page is based on the number of zeros in the
>> page; if the number of zeros is less than the value in the field
>> ERASED_THRESHOLD, the page is assumed as erased.
>>
>> Set the ERASED_THRESHOLD to (chip->ecc.strength + 1).  This is the
>> worst case where all the bitflips come from the same ECC sector.
>> This field is Reserved for older IP versions, so this commit has
>> no impact on them.
>
> Do you have a way to know the actual number of bitflips in an erased
> ECC block?

There is no way to the actual number of bitflips
except that the driver parses the whole buffer counting bitflips.


> BTW, is the threshold a per-page information or a per ECC
> block information.

Per-page.

Honestly, this hardware feature is not nice
because per-chunk threshold makes sense .




> If you can't know the real number of bitflips I don't think it's safe
> to set the threshold to chip->ecc.strength + 1.

Right.

> You can still use the feature to detect erased pages without any
> bitflips (set ERASED_THRESHOLD to 1), which should be the case most of
> the time, but for cases where you have bitflips I'd recommend using
> nand_check_erased_ecc_chunk() if you can't know the actual number of
> bitflips in the page.
>

You are right.


Probably, this feature can work safely
only when ERASED_THRESHOLD == 1.


I decided to drop this patch from v4 for now,
but I will consider it.


-- 
Best Regards
Masahiro Yamada
