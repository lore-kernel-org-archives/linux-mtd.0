Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMfZn-0008ET-Mq
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 17:00:33 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150717134159.GC10608@kwain> <55A912F0.7080605@vanguardiasur.com.ar>
 <87h9p2is8e.fsf@belgarion.home>
 <CAAEAJfCcdioVQKZs9U3DP6H94BiuQ2qU21DsMKevS5+j+-XEKA@mail.gmail.com>
 <87wpxufw2v.fsf@belgarion.home>
 <CAAEAJfB3caa+DmJN=Pa8brx0uGC11QA29KJb3NQdJjXTgw-yuA@mail.gmail.com>
 <87si81m15m.fsf@belgarion.home>
 <CAAEAJfBMpQ8nf5aLTUqrCsJkMQbnkQTB1yA5MBiJ6R4h6RgupQ@mail.gmail.com>
Date: Tue, 04 Aug 2015 18:56:23 +0200
In-Reply-To: <CAAEAJfBMpQ8nf5aLTUqrCsJkMQbnkQTB1yA5MBiJ6R4h6RgupQ@mail.gmail.com>
 (Ezequiel Garcia's message of "Mon, 3 Aug 2015 10:48:55 -0300")
Message-ID: <87d1z3m1qg.fsf@belgarion.home>
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

>>
>> The issue I see is that :
>>  - there is a bug in the clk driver for pxa3xx I introduced (CKEN_AB)

>>  - and shutting down the GCU clock prevents the NAND from working (I can't
>>  explain that one yet)

Ah actually it's even trickier, but it has nothing to do with the GCU clock,
that was a wrong interpretation of the test sequence.

What actually happens is that on the platform I have, the NAND is sharing the
DFI bus with the Static Memory Controller. Now let's see what happens on
boot-up, knowing that my pxa3xx-nand is a module, not builtin :
 - the kernel boots
 - the core clock initializes
 - the ethernet card initializes (it is on the static memory controller)
 - the kernel finishes the boot sequence
   => the NAND clock is unused
   => as such, the core clock framework disables it

And here is the catch : on the next ethernet access, the system bus will be
stalled forever. The reason behind is that because the bootloader left the
"NDCR_ND_ARB_EN" bit enabled, the DFI bus sees the ethernet register access, and
asks for arbitration; as the NAND clock is down, the arbitration never happens,
and the pxa3xx is stalled forever.

The very same thing happens when you load and unload pxa3xx-nand with a platform
where it was loaded with "enable-arbiter" platform-data, and if that platform
has any driver mapped in the SMC address space (0x0 .. 0x14000000).

If you have an opportunity to load/unload a pxa3xx-nand, I'd be glad to have
someone verify this theory.

The first fix comming to my mind would be to :
 - disable the NDCR_ND_ARB_EN in the pxa3xx core bring up
 - keep enablement in pxa3xx-nand
 - ensure it is disabled on the probe error path or remove of pxa3xx-nand

Cheers.

--
Robert

PS: That also means that the fix I posted for CKENA/CKENB inversion should fix
the issues you see.
