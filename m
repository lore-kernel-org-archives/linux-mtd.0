Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOMXz-0007I8-Os
 for linux-mtd@lists.infradead.org; Mon, 01 Sep 2014 08:01:09 +0000
Received: by mail-qg0-f53.google.com with SMTP id z107so4896747qgd.12
 for <linux-mtd@lists.infradead.org>; Mon, 01 Sep 2014 01:00:45 -0700 (PDT)
MIME-Version: 1.0
Sender: christian.riesch@gmail.com
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315DB7BE@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DB7BE@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 1 Sep 2014 10:00:45 +0200
Message-ID: <CABkLObp7h4goCjgFVfXEgXtJ-Mv+gXbUqgxoY23udt9D3tNFKA@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: cfi_cmdset_0002:add fixup for Micron M29EW after
 erase operation
From: Christian Riesch <christian.riesch@omicron.at>
To: bpqw <bpqw@micron.com>
Content-Type: text/plain; charset=UTF-8
Cc: Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Sep 1, 2014 at 4:20 AM, bpqw <bpqw@micron.com> wrote:
> For Micron M29EW,20ms delay is needed after erase operation.

Is there a datasheet/application note/technical note from Micron
describing this issue? Like the TN-13-07 for the other M29EW fixes?
Are all M29EW types affected?

Thanks,
Christian

>
> Signed-off-by: BeanHuo <bpqw@micron.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 5a4bfe3..9b0de91 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -509,6 +509,16 @@ static void cfi_fixup_m29ew_delay_after_resume(struct cfi_private *cfi)
>                 cfi_udelay(500);
>  }
>
> +static void cfi_fixup_m29ew_delay_after_erase(struct cfi_private *cfi)
> +{
> +       /*
> +        * Resolving the Delay After ERASE Issue @low temperature.
> +        * 20ms delay is needed after erase operation.
> +        */
> +       if (is_m29ew(cfi))
> +               cfi_udelay(20000);
> +}
> +
>  struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)  {
>         struct cfi_private *cfi = map->fldrv_priv; @@ -2397,6 +2407,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
>                 ret = -EIO;
>         }
>
> +       cfi_fixup_m29ew_delay_after_erase(cfi);
>         chip->state = FL_READY;
>         DISABLE_VPP(map);
>         put_chip(map, chip, adr);
> --
> 1.7.9.5
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
