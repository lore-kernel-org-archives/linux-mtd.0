Received: from mail-we0-f173.google.com ([74.125.82.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyz2Q-0002AN-93
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2013 06:47:07 +0000
Received: by mail-we0-f173.google.com with SMTP id x54so246876wes.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2013 23:46:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1373900152-26885-2-git-send-email-pekon@ti.com>
References: <1373900152-26885-1-git-send-email-pekon@ti.com>
 <1373900152-26885-2-git-send-email-pekon@ti.com>
Date: Tue, 16 Jul 2013 12:16:36 +0530
Message-ID: <CAGBQFKSqcDmJcdgLWdtxZmgjmjMnLgJXUARSu0NgNVpUGSRa7g@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] mtd: nand: omap: optimized chip->ecc.correct() for
 H/W ECC schemes
From: avinash philip <avinashphilipk@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: arnd@arndb.de, dedekind1@gmail.com, tony@atomide.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, benoit.cousson@linaro.org,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Mon, Jul 15, 2013 at 8:25 PM, Pekon Gupta <pekon@ti.com> wrote:
> chip->ecc.correct() is used for detecting and correcting bit-flips during read
> operations. In omap2-nand driver this is done usingt following functions:
>
> - omap_correct_data(): for H/W based HAM1_ECC schemes
>         (Un-Touched in current patch)
>
> - omap_elm_correct_data(): for H/W based BCHx_ECC scheme
>         Current implementation of this function is not scalable for newer ECC
>         schemes because:
>         - It depends on a specific byte-position in OOB area (reserved as 0x00)
>           to differentiates between programmed-pages and erased-pages.
>           This reserved byte-position cannot be accomodated in all ECC schemes.
>         - Current code is not scalable for future ECC schemes due to tweaks for
>           BCH4_ECC and BCH8_ECC at multiple places.
>         - It checks for bit-flips in Erased-pages using check_erased_page().
>           This is over-work, as sanity of Erased-page can be verified by just
>           comparing them to a pre-defined ECC-syndrome for all_0xFF data.

This is correct if the erased page read back didn't have any bit flips.
If erased page result in bit flips, then this method will end up in
un-correctable
error. Can you please confirm you taken care erased page bit flips in this
modification?

I think below discussion would help.

https://lkml.org/lkml/2012/11/22/590

Thanks
Avinash
