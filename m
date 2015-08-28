Received: from mail-lb0-f171.google.com ([209.85.217.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVSPo-0005Sb-NB
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 22:46:33 +0000
Received: by lbbsx3 with SMTP id sx3so37743505lbb.0
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2015 15:46:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87io8435q4.fsf@belgarion.home>
References: <1440356741-24308-1-git-send-email-robert.jarzmik@free.fr>
 <20150824150847.GA8497@laptop.cereza>
 <87io8435q4.fsf@belgarion.home>
Date: Fri, 28 Aug 2015 19:46:09 -0300
Message-ID: <CAAEAJfDCUGDbssCkQEazcJLuvJWjbSxKDix9ts4peSZ8Xk1ZOA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on removal
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Robert,

On 24 August 2015 at 15:24, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> Should we worry about having two definitions for the same bit?
>> Would it be too ugly to mix the two meaning? Something like this:
>>
>> /* This bit has two different meanings on NFCv1 and NFCv2 */
>> #define NDCR_STOP_ON_UNCOR_ARB_CNTL (0x1 << 19)
> I don't find that very pretty, but if you want I can put that in the patc=
h
> instead.
>

Yeah, it's far from pretty.

OK, another idea. How about this:

#define NFCV2_NDCR_STOP_ON_UNCOR (0x1 << 19)
#define NFCV1_NDCR_ARB_CNTL      (0x1 << 19)

Or maybe I'm just bike-shedding here? I figured it's important
to document the bit has different meanings in different
hardware versions.

Anyway, just submit a v2 with whatever you feel it's less ugly.

>>> @@ -1784,6 +1787,8 @@ static int pxa3xx_nand_remove(struct platform_dev=
ice *pdev)
>>>              free_irq(irq, info);
>>>      pxa3xx_nand_free_buff(info);
>>>
>>
>> I think a comment here explaining how this disables DFI arbitration and
>> how clearing it grants DFI access to SMC only.
>>
>> While here, we might want to document how the whole arbiter applies to
>> PXA only, since the DFI bus is shared there.
> Ok, for v2. I take it that DFI bus is not shared on Armada, lucky you.

Right, seems not shared.

> Maybe
> something like :
>
> /*
>  * In the pxa3xx case, the DFI bus is shared between the SMC and NFC. In =
order
>  * to prevent a lockup of the system bus, the DFI bus arbitration is gran=
ted
>  * to SMC upon driver removal. This is done by setting the x_ARB_CNTL bit=
,
>  * which also prevents the NAND to have access to the bus anymore.
>  */
>

That'll work. Feel free to send a v2.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
