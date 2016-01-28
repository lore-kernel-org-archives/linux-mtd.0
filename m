Received: from smtp4-g21.free.fr ([212.27.42.4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOtlp-0002Pa-MX
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 21:06:26 +0000
Subject: Re: RFC on large number of hacks in mtd core files
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Sebastian Frias <sf84@laposte.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
 <CAMuHMdVEVmf_kSknPSkYUBkaemfcXP6HXorkjEayC6zR5-s_yw@mail.gmail.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <56AA82AD.2020808@free.fr>
Date: Thu, 28 Jan 2016 22:05:49 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVEVmf_kSknPSkYUBkaemfcXP6HXorkjEayC6zR5-s_yw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28/01/2016 19:05, Geert Uytterhoeven wrote:

> On Mon, Jan 25, 2016 at 6:34 PM, Mason <slash.tmp@free.fr> wrote:
>
>> OK, here's my second attempt at presenting the information.
>> I'm grateful if anyone has comments regarding the changes
>> in core files, or even the driver itself.
> 
> One general comment: all these #ifdef CONFIG_TANGOX / #else / #endif
> constructs do not cope well with multi-platform kernels.
> The same is true for the CONFIG_MTD_NAND_BBM.

First of all, thanks for taking a look at the awful patch
I sent. I just want to stress that I have no intention of
submitting anything like this.

Perhaps it would help if I asked specific questions.

About devices/m25p80.c : the header mentions
"MTD SPI driver for ST M25Pxx (and similar) serial flash chips"

I don't know anything about SPI. Is SPI the bus connecting
Flash chips to the Flash controller?

If Brian's comment that I can ignore changes outside mtd/nand
is correct, then I should only need to focus on
mtd/nand/nand_base.c and mtd/nand/nand_ids.c

What about those NAND_MFR defines?

+#define NAND_MFR_ESMT		0x92
+#define NAND_MFR_MIRA		0xc8

I see that include/linux/mtd/nand.h has

#define NAND_MFR_EON            0x92

ESMT apparently stands for
Elite Semiconductor Memory Technology Inc
Apparently ESMT bought Eon a few months ago.
http://technews.co/2015/11/11/taiwans-elite-semiconductor-to-absorb-rival-eon-silicon/

So I guess it's expected that these two manufacturers
share the same ID?

As for the MIRA ID... Looks like this patch is relevant:
http://lists.infradead.org/pipermail/linux-mtd/2014-December/056765.html
+#define NAND_MFR_GIGADEVICE	0xc8


BTW, did you guys see the awful bug in the nand_ids.c part?
Several whitespace-only strings were added, with the intent
of writing them at run-time! But I'll bet the compiler uses
the same array for all of them.

Regards.
