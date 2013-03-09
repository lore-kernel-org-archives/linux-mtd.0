Received: from mail-ie0-x22f.google.com ([2607:f8b0:4001:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UELhm-00017k-UZ
 for linux-mtd@lists.infradead.org; Sat, 09 Mar 2013 15:29:03 +0000
Received: by mail-ie0-f175.google.com with SMTP id c12so3153724ieb.20
 for <linux-mtd@lists.infradead.org>; Sat, 09 Mar 2013 07:29:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20130303155226.GA1976@edkhil>
References: <20130303155226.GA1976@edkhil>
Date: Sat, 9 Mar 2013 12:29:00 -0300
Message-ID: <CALF0-+UGapoPTWdVG4W=5nzHT9NJU2z65g=zi2Dj2=JVA0_u2w@mail.gmail.com>
Subject: Re: plat-nand DT support
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Alexander Clouter <alex@digriz.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: hsweeten@visionengravers.com, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, blogic@openwrt.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

Sorry for the delay.

On Sun, Mar 3, 2013 at 12:52 PM, Alexander Clouter <alex@digriz.org.uk> wrote:
>
> https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/mach-orion5x/board-ts7800.c

I'm not too familiar with this whole bus_register_notifier() business.
So, I can't really answer if this looks sane. However, I have
a few things to say see below.

> https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/boot/dts/orion5x-ts7800.dts
>

This device tree node looks okay.

>
> [2] could also support the NAND used by arch/arm/mach-ep93xx/ts72xx.c but
> the whole SoC has not         been ported to DT
>

Okey, here I think you're going in the wrong direction.
The current trend -and there are very good reasons for this-
is to NOT litter arch/arm/mach-foo/ but rather put drivers handling in drivers/
where they rightfully belong.

In other words, the right direction is to write a nand driver if you need one.
For instance, I find a bit mixed up to have functions like
ts7800_nand_write/read_buf() in your board.c file.

BTW, it could be great if you could upstream your work.
Also, it could be much easier for you to get support and answers if you
try to upstream.

Hope this helps,
-- 
    Ezequiel
