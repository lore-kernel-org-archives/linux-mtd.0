Received: from mail-la0-f48.google.com ([209.85.215.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSAs4-0002NB-Pm
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 21:26:09 +0000
Received: by lahi9 with SMTP id i9so11116114lah.2
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 14:25:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440009015-3765-3-git-send-email-robert.jarzmik@free.fr>
References: <1440009015-3765-1-git-send-email-robert.jarzmik@free.fr>
 <1440009015-3765-3-git-send-email-robert.jarzmik@free.fr>
Date: Wed, 19 Aug 2015 18:25:46 -0300
Message-ID: <CAAEAJfBA1wwowb=ZMfJ7ZERPGij39AdBse9-o=HNEbgpkiGaHw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] mtd: nand: pxa3xx-nand: fix random command
 timeouts
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

On 19 August 2015 at 15:30, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> When 2 commands are submitted in a row, and the second is very quick,
> the completion of the second command might never come. This happens
> especially if the second command is quick, such as a status read after
> an erase.
>
> The issue is that in the interrupt handler, the status bits are cleared
> after the new command is issued. There is a small temporal window where
> this happens :
>  - the previous command has set the command done bit
>  - the ready for a command bit is set
>  - the handler submits the next command
>    - just then, the command completes, and the command done bit is still
>      set
>  - the handler clears the "previous" command done bit
>  - the handler exits
>
> In this flow, the "command done" of the next command will never trigger
> a new interrupt to finish the status command, as it was cleared for both
> commands.
>
> Fix this by clearing the status bit before submitting a new command.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index d1a4c336de1d..d6c696798811 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -675,8 +675,14 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *de=
vid)
>                 is_ready =3D 1;
>         }
>
> +       /*
> +        * Clear all status bit before issuing the next command, which
> +        * can and will alter the status bits and will deserve a new
> +        * interrupt on its own. This lets the controller exit the IRQ
> +        */
> +       nand_writel(info, NDSR, status);
> +

Actually, the comment I had in mind was more about why
we *cannot* clear the NDSR register before waking the
IRQ thread.

But this is a nitpick: I don't care much :-)

>         if (status & NDSR_WRCMDREQ) {
> -               nand_writel(info, NDSR, NDSR_WRCMDREQ);
>                 status &=3D ~NDSR_WRCMDREQ;
>                 info->state =3D STATE_CMD_HANDLE;
>
> @@ -697,8 +703,6 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *dev=
id)
>                         nand_writel(info, NDCB0, info->ndcb3);
>         }
>
> -       /* clear NDSR to let the controller exit the IRQ */
> -       nand_writel(info, NDSR, status);
>         if (is_completed)
>                 complete(&info->cmd_complete);
>         if (is_ready)
> --
> 2.1.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
