Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkUDm-0000nb-6p
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 05:26:07 +0000
Received: by wgbdt13 with SMTP id dt13so1705897wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 21:26:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+0Dg4rZVcW2jJP6EbXsh+OAvCB3vPA_az8bz2hGrEmeOrnm6A@mail.gmail.com>
References: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
 <CAN8TOE_5KGaxOtgYn2hSAfaccF9_-fxjzgiSy4d_0HArwZ=wew@mail.gmail.com>
 <CA+0Dg4rZVcW2jJP6EbXsh+OAvCB3vPA_az8bz2hGrEmeOrnm6A@mail.gmail.com>
Date: Mon, 9 Jan 2012 21:26:00 -0800
Message-ID: <CAN8TOE8+_CE67aM8D_3mCZpLbBdsvpOWTyvX+5UP6LY9ewX-YQ@mail.gmail.com>
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

Hi,

Please reply below any quotations and only repeat what is necessary,
according to the etiquette notes #4 and #6 on:
http://www.infradead.org/~dwmw2/email.html

On Mon, Jan 9, 2012 at 4:16 PM, Joo Aun Saw <jasaw@dius.com.au> wrote:
> I'm running UBI(FS) on top of it, so I don't need the OOB area. In
> this case, what's the best way to work around this problem? Should I
> use a smaller ECC layout or disable ECC?

Do not disable ECC, but a smaller ECC layout probably will work OK.
It's not perfect, but I don't know of any common UBIFS-related
features that would make use of the layout anyway.

> How is the ECC layout defined, as in what decides how big the
> eccbytes, eccpos, oobfree should be?

This is why I mentioned that your answer depends on "hardware/driver
and what type of ECC you're
using". Either mention your specs or try studying the defaults in
nand_base.c and maybe the definition in include/linux/mtd/mtd.h.
Layout structs basically should describe what offsets within the OOB
are used by ECC (in eccpos), how much OOB is used by ECC (eccbytes),
and the position and length of OOB segments that are unused by ECC and
bad block markers (oobfree struct).

Brian
