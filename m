Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkJ8t-0005Dr-OW
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 17:36:23 +0000
Received: by wgbdt13 with SMTP id dt13so1317763wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 09:36:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
References: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
Date: Mon, 9 Jan 2012 09:36:14 -0800
Message-ID: <CAN8TOE_5KGaxOtgYn2hSAfaccF9_-fxjzgiSy4d_0HArwZ=wew@mail.gmail.com>
Subject: Re: No oob scheme defined for oobsize 218
From: Brian Norris <computersforpeace@gmail.com>
To: Joo Aun Saw <jasaw@dius.com.au>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 8, 2012 at 10:34 PM, Joo Aun Saw <jasaw@dius.com.au> wrote:
> I'm getting this error and hope someone can help me.
>
> ONFI flash detected
> ONFI param page 0 valid
> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron MT29F8G08AAA)
> No oob scheme defined for oobsize 218
>
> Do I need to define struct nand_ecclayout nand_oob_218? or can I use
> the nand_oob_128 ecc layout?
> I'm running Linux version 3.0.4.

This may depend on what hardware/driver, what type of ECC you're
using, and what filesystem you're using on top of your MTD. It's
possible you can get by with just using a "smaller" ECC layout,
especially if you're not using the OOB area for filesystem data (e.g.,
UBI(FS), which doesn't use OOB). You just won't have as much "free"
OOB area (again, doesn't matter much for UBI(FS)) and your ECC layout
might not reflect the actual positioning of your ECC data.

Brian
