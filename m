Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbX1G-0007O4-9f
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 20:07:55 +0000
Subject: Re: marvell_nand driver fails to suspend
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
 <9de339a6-01f9-d3a9-0271-f33933ede35b@zonque.org>
 <20180702092014.0006fee0@xps13>
 <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
 <20180703090557.0ec5cd20@xps13>
 <98a6c329-d0a4-72c7-bb06-34b80738c475@zonque.org>
 <20180706102740.4e7558a2@xps13>
 <f3373d43-6018-f974-2249-a70bd0e720c3@zonque.org>
 <20180706110255.5efda048@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <e669ee7f-f9a4-2d17-ce08-5cc1663206cd@zonque.org>
Date: Fri, 6 Jul 2018 22:07:40 +0200
MIME-Version: 1.0
In-Reply-To: <20180706110255.5efda048@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, July 06, 2018 11:02 AM, Miquel Raynal wrote:
> Daniel Mack <daniel@zonque.org> wrote on Fri, 6 Jul 2018 10:41:35 +0200:
>> On Friday, July 06, 2018 10:27 AM, Miquel Raynal wrote:

>>> This > "keep-config" DT property was just an ugly hack to avoid
>>> implementing ->setup_data_interface() and rely on the Bootloader's
>>> setup. While this work at the slowest speed, it is clearly not as
>>> efficient as tuning the timings at probe time depending on the NAND
>>> chip. I recently changed the DT NAND nodes to 1/ separate the
>>> controller and the NAND chip and 2/ remove superfluous properties
>>> like this one.
>>
>> Do you have patches ready for that?
> 
> They are in the official tree now, the one I pointed below does this
> for armada-38x which is I think the SoC you use?

Nope, it's a PXA300 based board.

> The way you handle the timings looks good. Having selected_chip to
> NULL will force the next call of ->select_chip() (done by the core,
> please check this happens with a printk) to rewrite the NDTR registers
> with valid saved values.

Okay, so we're on the same page. printk()s indicate that the right thing 
happens, too.

And I now figured out what was going on. The IRQ code for the PXA 
platform failed to restore the masks correctly, so the NAND IRQ was dead 
after resume. I'll wrap up my changes and send some patches for the 
marvell_nand driver.


Thanks for bearing with me :)

Daniel
