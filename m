Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUPKR-0006VJ-Tc
 for linux-mtd@lists.infradead.org; Sun, 08 Mar 2015 00:44:24 +0000
Received: by igdh15 with SMTP id h15so12771023igd.3
 for <linux-mtd@lists.infradead.org>; Sat, 07 Mar 2015 16:44:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <CACna6rzkEQu+LYchckFpLLxkvyMYK7N84nrGu8p0rjRsRbFzfg@mail.gmail.com>
Date: Sun, 8 Mar 2015 01:44:02 +0100
Message-ID: <CACna6rxEU08d4DC0_mX3ett=KGZWpyyT-MqGQ+_wBSPGkaD0WQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>,
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

On 7 March 2015 at 18:39, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> It seems that brcmnand_ctlrdy_irq never fires on my device. Just like
> controller was never generating any IRQ.
>
>
> I started comparing your driver with OpenWrt's bcm_nand.c (which
> should be very similar to Broadcom's SDK NAND driver for ARM). Below
> are few things I've noticed.
>
> 1) In bcm_nand.c IRQ handler also doesn't seem to be fired (or very rarel=
y).

Oh, wait, I was wrong there. So in bcm_nand.c IRQ handler fires very
often, just not during the early phase (RESET, READID), when we don't
use IRQs. During standard read/program/etc IRQ is commonly used.

So maybe all we're missing in case of brcmstb_nand.c is
enabling/acking/disabling IRQ?

It seem that my controller 6.01 has:

1) Following IRQs:
DIREC_READ_MISS
ERASE_COMPLETE
COPYBACK_COMPLETE
PROGRAM_COMPLETE
CONTROLLER_RDY
RDBSY_RDY
ECC_UNCORRECTABLE
ECC_CORRECTABLE

2) Registers for reading/acking above IRQs:
0xf00 DIREC_READ_MISS
0xf04 ERASE_COMPLETE
0xf08 COPYBACK_COMPLETE
0xf0c PROGRAM_COMPLETE
0xf10 CONTROLLER_RDY
0xf14 RDBSY_RDY
0xf18 ECC_UNCORRECTABLE
0xf1c ECC_CORRECTABLE
(if 0x1 is set, it means IRQ was raised, writing 0x1 ack-es it)

3) Register 0x408 for enabling/disabling IRQs:
0x00000004 DIREC_READ_MISS
0x00000008 ERASE_COMPLETE
0x00000010 COPYBACK_COMPLETE
0x00000020 PROGRAM_COMPLETE
0x00000040 CONTROLLER_RDY
0x00000080 RDBSY_RDY
0x00000100 ECC_UNCORRECTABLE
0x00000200 ECC_CORRECTABLE
