MIME-Version: 1.0
In-Reply-To: <20131104135112.GG2516@localhost>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382137374-21251-13-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131103230337.GF5896@gmail.com> <20131104135112.GG2516@localhost>
Date: Tue, 5 Nov 2013 10:44:38 -0800
Message-ID: <CAN8TOE_qkjdRRGM28yRcgKBPq0D0r=yWrZocju4SNdUzCGE52A@mail.gmail.com>
Subject: Re: [PATCH v2 12/27] mtd: nand: pxa3xx: Use a completion to signal
 device ready
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Huang Shijie <shijie8@gmail.com>, Willy Tarreau <w@1wt.eu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 4, 2013 at 5:51 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On Sun, Nov 03, 2013 at 06:03:39PM -0500, Huang Shijie wrote:
>> On Fri, Oct 18, 2013 at 08:02:39PM -0300, Ezequiel Garcia wrote:
>> > --- a/drivers/mtd/nand/pxa3xx_nand.c
>> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> > @@ -196,7 +197,13 @@ struct pxa3xx_nand_info {
>> >     int                     use_ecc;        /* use HW ECC ? */
>> >     int                     use_dma;        /* use DMA ? */
>> >     int                     use_spare;      /* use spare ? */
>> > -   int                     is_ready;
>> > +
>> > +   /*
>> > +    * The is_ready flag is accesed from several places,
>> > +    * including an interruption hander. We need an atomic
>> > +    * type to avoid races.
>> > +    */
>> > +   atomic_t                is_ready;
>> Do we really need to change it to atomic_t?
>>
>> IMHO, the write is also a atomic operation.

Atomicity is not an opinion :)

> I see. Well, if reading and setting an int type is atomic
> (at least on ARM), then of course we don't need the atomic_t.
>
> On the other side, it really shouldn't hurt too much and
> it emphasize the fact that it's accesed from the IRQ handler
> and the other callbacks (such as waitfunc).
>
> So, I'm still inclined to keeping it atomic.
>
> Does it sound stupid?

No, it is not stupid. If nothing else, it is self-documenting, telling
the world that this variable is accessed in racy situations, forcing
developers to pay closer attention to it. And atomicity means more
than simply "indivisible" (i.e., a single load instruction) in this
context; I believe it helps prevent other non-thread-safe
optimizations from being made by the compiler.

That being said, the jury is still out on the need for the atomic flag
+ 2 completions in the first place (I brought this up a while ago but
failed to follow up), but I'll hold my comments to the v3 patch.

Brian
