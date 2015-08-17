Received: from mail-la0-f43.google.com ([209.85.215.43])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRPmh-0000my-0p
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 19:09:27 +0000
Received: by lahi9 with SMTP id i9so84984813lah.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 12:09:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87si7iandq.fsf@belgarion.home>
References: <1439396538-13298-1-git-send-email-robert.jarzmik@free.fr>
 <20150816152924.GA799@laptop.cereza>
 <87si7iandq.fsf@belgarion.home>
Date: Mon, 17 Aug 2015 16:09:04 -0300
Message-ID: <CAAEAJfAmD5VzA4J4+jwmCirmqfAJcvY8Ac45nupZwGVVb38Vhg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: fix random command timeouts
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 August 2015 at 19:18, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> On 12 Aug 06:22 PM, Robert Jarzmik wrote:
>>
>> This fix looks correct. Thanks!
>>
>> Couple questions:
>>
>> 1. In which platform are you seeing this bug?
> zylonite with a pxa310 (ie. internal stacked NAND).
>
>> 2. Is this a regression? (i.e. should we queue it for -stable?)
> No, it's been there for ages I think.
>
>> Also, one might question why we can't just write NDSR right after it's r=
ead,
>> before we wake the IRQ thread or start DMA. It appears this is
>> a requirement of BCH, as per the comment in drain_fifo.
> For irq thread that won't make any difference, the irq handler will finis=
h first
> and clear the bits anyway. For DMA it's better.
>
> And more generaly speaking, I like it better, to clear it once read.
>
>> It would be nice to put a comment explaining why we clear NDSR only
>> before the check to WRCMDREQ. Maybe even copy-pasting something
>> from the commit log?
> If we move it up to something like that :
>         status =3D nand_readl(info, NDSR);
>         nand_writel(info, NDSR, status);
> Then the comment is overkill I think.
>

Well, the comment in drain_fifo says that doing this would break
reads with BCH enabled:

                /*
                 * According to the datasheet, when reading from NDDB
                 * with BCH enabled, after each 32 bytes reads, we
                 * have to make sure that the NDSR.RDDREQ bit is set.
                 *
                 * Drain the FIFO 8 32 bits reads at a time, and skip
                 * the polling on the last read.
                 */

In other words, it seems that we must wake the IRQ thread handler
_before_ we clear RDDREQ, not after.

So unless I'm completely off, the current patch is right, and a comment
would be helpful.

>> I'd like to say "Yay, let's pick it" but I'd like to make sure this is
>> tested on all platforms first (unless you've tested it already).
> I tested on zylonite (where bug occurs) and cm-x300 (where bug never occu=
rs).
>

OK, I'll see about testing your four patches on some Armada 370/XP.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
