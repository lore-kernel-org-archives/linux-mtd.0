Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ce5bB-0000z2-F8
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2017 19:50:51 +0000
Date: Wed, 15 Feb 2017 20:50:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] mtd: brcmnand: Check flash write protect pin status
Message-ID: <20170215205022.794e9eb3@bbrezillon>
In-Reply-To: <CAC=U0a3z+9SUO5RYxrKiZxbPgrNFY8AyRPO=1Nfv6UbHa4SQ5g@mail.gmail.com>
References: <1487089424-4354-1-git-send-email-kdasu.kdev@gmail.com>
 <20170215095119.3412108a@bbrezillon>
 <CAC=U0a3z+9SUO5RYxrKiZxbPgrNFY8AyRPO=1Nfv6UbHa4SQ5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 15 Feb 2017 13:51:15 -0500
Kamal Dasu <kdasu.kdev@gmail.com> wrote:


> 
> >
> > I still have a hard time understanding what the problem is with this
> > commit message. Can you try to clarify that?
> >  
> 
>  Software assumed that setting/resetting the NAND_WP controller
> register would assert/de-assert the #WP pin instantaneously from the
> flash parts perspective, and was proceeding to erase/program. Nand
> driver was not verifying flash status byte for  WP. In rigorous
> testing we found this was causing rare data corruptions with erase
> and/or subsequent programming. So to make sure the flash part is ready
> to accept erase/program commands was to send status read command and
> read back the WP bit status from the flash whenever we change the pin
> state. I will clarify this in the commit message as well.

I prefer this explanation ;-).

[...]

> 
> >>       mb(); /* flush previous writes */
> >>       brcmnand_write_reg(ctrl, BRCMNAND_CMD_START,
> >>                          cmd << brcmnand_cmd_shift(ctrl));
> >> @@ -2462,14 +2517,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
> >>       /* Disable XOR addressing */
> >>       brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
> >>
> >> -     if (ctrl->features & BRCMNAND_HAS_WP) {
> >> -             /* Permanently disable write protection */
> >> -             if (wp_on == 2)
> >> -                     brcmnand_set_wp(ctrl, false);
> >> -     } else {
> >> -             wp_on = 0;
> >> -     }
> >> -
> >>       /* IRQ */
> >>       ctrl->irq = platform_get_irq(pdev, 0);
> >>       if ((int)ctrl->irq < 0) {
> >> @@ -2522,6 +2569,14 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
> >>                       }
> >>
> >>                       list_add_tail(&host->node, &ctrl->host_list);
> >> +
> >> +                     if (ctrl->features & BRCMNAND_HAS_WP) {
> >> +                             /* Permanently disable write protection */
> >> +                             if (wp_on == 2)
> >> +                                     brcmnand_set_wp(host, false);
> >> +                     } else {
> >> +                             wp_on = 0;
> >> +                     }  
> >
> > Hm, this is not really related to the change you describe in your
> > commit message. This should probably go in a separate commit.
> >  
> 
> It is related to the change since this code moved within the probe
> function due the new  brcmnand_set_wp() prototype. So has to be part
> of the same commit.

You could change the prototype of brcmnand_set_wp() in the first patch
(+ move in the call where appropriate in the probe function and patch
brcmnand_wp() to pass host instead of ctrl), and then rework the
brcmnand_set_wp() implementation in a second patch.
