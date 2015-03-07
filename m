Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUN0g-0006gU-G4
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2015 22:15:51 +0000
Received: by igkb16 with SMTP id b16so12267161igk.1
 for <linux-mtd@lists.infradead.org>; Sat, 07 Mar 2015 14:15:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Date: Sat, 7 Mar 2015 23:15:28 +0100
Message-ID: <CACna6ryrDT7OUAr81ebcVdnX0-_fwA24hU9FeVyFRF-BusEaMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
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

On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> wrote:
> +static int brcmnand_waitfunc(struct mtd_info *mtd, struct nand_chip *this)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       struct brcmnand_host *host = chip->priv;
> +       struct brcmnand_controller *ctrl = host->ctrl;
> +       unsigned long timeo = msecs_to_jiffies(100);
> +
> +       dev_dbg(ctrl->dev, "wait on native cmd %d\n", ctrl->cmd_pending);
> +       if (ctrl->cmd_pending &&
> +                       wait_for_completion_timeout(&ctrl->done, timeo) <= 0) {
> +               unsigned long cmd = brcmnand_read_reg(ctrl, BRCMNAND_CMD_START)
> +                                       >> brcmnand_cmd_shift(ctrl);
> +
> +               dev_err_ratelimited(ctrl->dev,
> +                       "timeout waiting for command %u (%ld)\n",
> +                       host->last_cmd, cmd);

I think that using host->last_cmd in the above message is really
misleading. Please consider following:

[    2.061139] [brcmnand_cmdfunc:1151] command:0x90 native_cmd:0x07
[    2.067123] brcmstb_nand 18028000.nand: send native cmd 7 addr_lo 0x40
[    2.168395] brcmstb_nand 18028000.nand: timeout waiting for command 144 (7)
[    2.175321] brcmstb_nand 18028000.nand: intfc status f0000000
[    2.181051] nand: device found, Manufacturer ID: 0x92, Chip ID: 0xf1
[    2.187370] nand: Eon NAND 128MiB 3,3V 8-bit
[    2.191632] nand: 128 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    2.199192] brcmstb_nand 18028000.nand: detected 128MiB total,
128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-8
[    2.199192]
[    2.210724] Scanning device for bad blocks
[    2.214812] brcmstb_nand 18028000.nand: send native cmd 1 addr_lo 0x0
[    2.318394] brcmstb_nand 18028000.nand: timeout waiting for command 144 (1)

As you can see, first there was a brcmnand_cmdfunc call with 0x90
(NAND_CMD_READID). It was translated into internal command 0x07
(CMD_DEVICE_ID_READ).

Then there was a call to brcmnand_read_by_pio which resulted in
sending internal command 0x01 (CMD_PAGE_READ). This one overwrote
previous command. So the timeout wasn't about 144 (0x90) anymore.

I suggest replacing that with something like
"timeout waiting for internal command 0x%02x\n", cmd
