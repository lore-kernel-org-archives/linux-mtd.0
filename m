Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGzxm-00060m-7v
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 22:20:14 +0000
Received: by wgbdt14 with SMTP id dt14so604115wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 15:20:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348563927-9131-1-git-send-email-matthieu.castet@parrot.com>
References: <1348563927-9131-1-git-send-email-matthieu.castet@parrot.com>
Date: Wed, 26 Sep 2012 15:20:11 -0700
Message-ID: <CAN8TOE-h1VrbNg6ZqwQdhLaQ18E4-=_Lw+biuhGONUS5HCx-4g@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for the windbond w25q256 chip
From: Brian Norris <computersforpeace@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 25, 2012 at 2:05 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 5257345..4eb99c6 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -168,6 +168,7 @@ static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
>  {
>         switch (JEDEC_MFR(jedec_id)) {
>         case CFI_MFR_MACRONIX:
> +       case 0xEF /* winbond */:
>                 flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
>                 return spi_write(flash->spi, flash->command, 1);
>         default:

Just checking: Winbond didn't use their known manufacturer ID (0xDA)
for this chip? Do they have other chips that support/need 4-byte
addressing and use 0xDA?

Brian
