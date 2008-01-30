Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKBcr-00054n-TR
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 12:01:16 +0000
Received: by py-out-1112.google.com with SMTP id p76so380054pyb.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jan 2008 04:01:08 -0800 (PST)
Message-ID: <87a5b0800801300401o1b0b631dt55cefaeb31b2da22@mail.gmail.com>
Date: Wed, 30 Jan 2008 12:01:08 +0000
From: "Will Newton" <will.newton@gmail.com>
To: "Bryan Wu" <bryan.wu@analog.com>
Subject: Re: [PATCH 1/1] [MTD/MAPS] Blackfin BF5xx Maps: Handle the case where
	flash memory and ethernet mac/phy are mapped onto the same async bank
In-Reply-To: <1201687364-32178-1-git-send-email-bryan.wu@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1201687364-32178-1-git-send-email-bryan.wu@analog.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <michael.frysinger@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jan 30, 2008 10:02 AM, Bryan Wu <bryan.wu@analog.com> wrote:

switch_to_flash is calling SSYNC():

> +static void switch_to_flash(struct flash_save *save)
> +{
> +       local_irq_save(save->flags);
> +
> +       gpio_set_value(enet_flash_pin, 0);
> +       SSYNC();
> +
> +       save->ambctl0 = bfin_read_EBIU_AMBCTL0();
> +       save->ambctl1 = bfin_read_EBIU_AMBCTL1();
> +       bfin_write_EBIU_AMBCTL0(BFIN_FLASH_AMBCTL0VAL);
> +       bfin_write_EBIU_AMBCTL1(BFIN_FLASH_AMBCTL1VAL);
> +       SSYNC();
> +}
> +
> +static void switch_back(struct flash_save *save)
> +{
> +       bfin_write_EBIU_AMBCTL0(save->ambctl0);
> +       bfin_write_EBIU_AMBCTL1(save->ambctl1);
> +       SSYNC();
> +
> +       gpio_set_value(enet_flash_pin, 1);
> +
> +       local_irq_restore(save->flags);
> +}
> +
> +static map_word bf5xx_read(struct map_info *map, unsigned long ofs)
> +{
> +       int nValue = 0x0;
> +       map_word test;
> +       struct flash_save save;
> +
> +       switch_to_flash(&save);
> +       SSYNC();

Is it necessary to SSYNC() here as well?

> +       nValue = readw(map->virt + ofs);
> +       SSYNC();
> +       switch_back(&save);
> +
> +       test.x[0] = (u16)nValue;
> +       return test;
> +}
> +
> +static void bf5xx_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
> +{
> +       unsigned long i;
> +       map_word test;
> +
> +       if ((unsigned long)to & 0x1) {
> +               for (i = 0; i < len / 2 * 2; i += 2) {
> +                       test = bf5xx_read(map, from + i);
> +                       put_unaligned(test.x[0], (__le16 *)(to + i));
> +               }
> +       } else {
> +               for (i = 0; i < len / 2 * 2; i += 2) {
> +                       test = bf5xx_read(map, from + i);
> +                       *((u16*)(to + i)) = test.x[0];
> +               }
> +       }
> +
> +       if (len & 0x1) {
> +               test = bf5xx_read(map, from + i);
> +               *((u8*)(to + i)) = (u8)test.x[0];
> +       }
> +}
> +
> +static void bf5xx_write(struct map_info *map, map_word d1, unsigned long ofs)
> +{
> +       u16 d;
> +       struct flash_save save;
> +
> +       d = (u16)d1.x[0];
> +
> +       switch_to_flash(&save);
> +
> +       SSYNC();

Also here?

> +       writew(d, map->virt + ofs);
> +       SSYNC();
> +
> +       switch_back(&save);
> +}
