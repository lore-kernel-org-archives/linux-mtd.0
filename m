Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV1oB-0003j7-7z
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 17:49:39 +0000
Received: by padfb1 with SMTP id fb1so65134667pad.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 10:49:18 -0700 (PDT)
Date: Mon, 9 Mar 2015 10:49:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Message-ID: <20150309174905.GU18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
 <CACna6rxEU08d4DC0_mX3ett=KGZWpyyT-MqGQ+_wBSPGkaD0WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rxEU08d4DC0_mX3ett=KGZWpyyT-MqGQ+_wBSPGkaD0WQ@mail.gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, sbranden@broadcom.com,
 Hauke Mehrtens <hauke@hauke-m.de>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 08, 2015 at 01:44:02AM +0100, Rafał Miłecki wrote:
> On 7 March 2015 at 18:39, Rafał Miłecki <zajec5@gmail.com> wrote:
> > It seems that brcmnand_ctlrdy_irq never fires on my device. Just like
> > controller was never generating any IRQ.
> >
> >
> > I started comparing your driver with OpenWrt's bcm_nand.c (which
> > should be very similar to Broadcom's SDK NAND driver for ARM). Below
> > are few things I've noticed.
> >
> > 1) In bcm_nand.c IRQ handler also doesn't seem to be fired (or very rarely).
> 
> Oh, wait, I was wrong there. So in bcm_nand.c IRQ handler fires very
> often, just not during the early phase (RESET, READID), when we don't
> use IRQs. During standard read/program/etc IRQ is commonly used.
> 
> So maybe all we're missing in case of brcmstb_nand.c is
> enabling/acking/disabling IRQ?

Yes, that's likely the main problem.

> It seem that my controller 6.01 has:
> 
> 1) Following IRQs:
> DIREC_READ_MISS
> ERASE_COMPLETE
> COPYBACK_COMPLETE
> PROGRAM_COMPLETE
> CONTROLLER_RDY
> RDBSY_RDY
> ECC_UNCORRECTABLE
> ECC_CORRECTABLE

Right, that's the standard set of NAND interrupts. This driver only uses
CONTROLLER_RDY, BTW.

> 2) Registers for reading/acking above IRQs:
> 0xf00 DIREC_READ_MISS
> 0xf04 ERASE_COMPLETE
> 0xf08 COPYBACK_COMPLETE
> 0xf0c PROGRAM_COMPLETE
> 0xf10 CONTROLLER_RDY
> 0xf14 RDBSY_RDY
> 0xf18 ECC_UNCORRECTABLE
> 0xf1c ECC_CORRECTABLE
> (if 0x1 is set, it means IRQ was raised, writing 0x1 ack-es it)
> 
> 3) Register 0x408 for enabling/disabling IRQs:
> 0x00000004 DIREC_READ_MISS
> 0x00000008 ERASE_COMPLETE
> 0x00000010 COPYBACK_COMPLETE
> 0x00000020 PROGRAM_COMPLETE
> 0x00000040 CONTROLLER_RDY
> 0x00000080 RDBSY_RDY
> 0x00000100 ECC_UNCORRECTABLE
> 0x00000200 ECC_CORRECTABLE

(2) and (3) look pretty similar to the Cygnus chips. We should probably
end up using the same solution for both. Several related to the Cygnus
project are on CC.

One problem for Cygnus is that some of the other bits in their register
0x408 deal with non-interrupt-related functionality (endianness and
clocks), so it might not make the cleanest design to handle this with an
irqchip driver.

Brian
