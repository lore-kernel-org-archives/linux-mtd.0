Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTwU8-00064i-5n
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 18:28:45 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on removal
References: <1440356741-24308-1-git-send-email-robert.jarzmik@free.fr>
 <20150824150847.GA8497@laptop.cereza>
Date: Mon, 24 Aug 2015 20:24:03 +0200
In-Reply-To: <20150824150847.GA8497@laptop.cereza> (Ezequiel Garcia's message
 of "Mon, 24 Aug 2015 12:08:47 -0300")
Message-ID: <87io8435q4.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Should we worry about having two definitions for the same bit?
> Would it be too ugly to mix the two meaning? Something like this:
>
> /* This bit has two different meanings on NFCv1 and NFCv2 */
> #define NDCR_STOP_ON_UNCOR_ARB_CNTL (0x1 << 19)
I don't find that very pretty, but if you want I can put that in the patch
instead.

>> @@ -1784,6 +1787,8 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
>>  		free_irq(irq, info);
>>  	pxa3xx_nand_free_buff(info);
>>  
>
> I think a comment here explaining how this disables DFI arbitration and
> how clearing it grants DFI access to SMC only.
>
> While here, we might want to document how the whole arbiter applies to
> PXA only, since the DFI bus is shared there.
Ok, for v2. I take it that DFI bus is not shared on Armada, lucky you. Maybe
something like :

/*
 * In the pxa3xx case, the DFI bus is shared between the SMC and NFC. In order
 * to prevent a lockup of the system bus, the DFI bus arbitration is granted
 * to SMC upon driver removal. This is done by setting the x_ARB_CNTL bit,
 * which also prevents the NAND to have access to the bus anymore.
 */

Cheers.

-- 
Robert
