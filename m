Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV45I-0006xw-Dr
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 20:15:29 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 5/9] mtd: pxa3xx_nand: add support for the Marvell
 Berlin nand controller
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425555085-29531-6-git-send-email-antoine.tenart@free-electrons.com>
 <54FA6DFC.1070904@free-electrons.com> <87oao3xvh8.fsf@free.fr>
 <54FCAF6C.7010902@free-electrons.com> <87ioebxhc7.fsf@free.fr>
 <54FD860F.2000008@free-electrons.com>
Date: Mon, 09 Mar 2015 21:15:01 +0100
In-Reply-To: <54FD860F.2000008@free-electrons.com> (Ezequiel Garcia's message
 of "Mon, 09 Mar 2015 08:37:51 -0300")
Message-ID: <877fuqx70a.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

>>> Which flash do you have there?
>> The one with 0xba20 id as I said, which is AFAIK a Numonyx NAND02GR4B2C.
>> 
>
> $ grep "0xBA" drivers/mtd/nand/nand_ids.c
> EXTENDED_ID_NAND("NAND 256MiB 1,8V 16-bit", 0xBA, 256, LP_OPTIONS16),
>
> Seems already supported by the NAND core. The MTD way of probing
> a non-ONFI device is by using the IDs in nand_ids.c. Additional
> configuration (timings in this case) is applied between the nand_scan_ident()
> and nand_scan_tail() calls.

Ok, agreed.

I've seen your answer in the "rework timings setup" mail thread. I think you
have perfectly understood what bothers me :)

Cheers.

-- 
Robert
