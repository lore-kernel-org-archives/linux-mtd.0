Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHnzp-0000Ux-Hz
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 09:40:39 +0000
Received: by mail-wr0-x233.google.com with SMTP id r2so10563497wra.13
 for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2017 01:40:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171123103034.11f26063@xps13>
References: <CAAfyv37B2yRc7gybNi3hNs=ap52bgqTCrsx4tZe_5LNb7LfzVQ@mail.gmail.com>
 <20171123095735.538118e0@xps13>
 <CAAfyv35tTTFobGsA1Qr5KB_KyR94YLAiGGezu1eik=8TZfnxqg@mail.gmail.com>
 <20171123103034.11f26063@xps13>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 23 Nov 2017 10:40:13 +0100
Message-ID: <CAAfyv355+-cPhxJsDMBYs9k9_MLbz7WQhJvEXYSqy0peybCMUA@mail.gmail.com>
Subject: Re: macronix ONFI nand flash OTP support
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Boris Brezillon <Boris.Brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Thu, Nov 23, 2017 at 10:30 AM, Miquel RAYNAL
<miquel.raynal@free-electrons.com> wrote:
> Hi Marek,
>
>> >>
>> >> I did check nand_do_read_ops function but it's not sending e.g.
>> >> 0x30 which should be at the end of command. I'm using 4.1 kernel
>> >> but checked also 4.14 and no such functionality is added even
>> >> there. Nobody is using OTP area in nand flashes ;) ? Thanks for
>> >> any pointers.
>> >
>> > I suppose you added some tweaks to enable OTP and use
>> > nand_do_read_ops, because there is currently no implementation for
>> > that in the NAND framework (I think there is something in MTD layer
>> > though). But must importantly, nand_do_read_ops basically calls
>> > chip->ecc.read*() which is handled by the controller driver, so
>> > what driver are you using ?
>> >
>> > How (where) did you trace the commands sent to the NAND chip ? For
>> > instance, if you just looked at the arguments of ->cmdfunc(), it is
>> > normal not to see any READSTART (0x30) command as it should be added
>> > automatically later in the function. If the driver implements
>> > ->cmd_ctrl(), you may see there what exactly is sent to the
>> > device.
>> Yes I checked ->cmdfunc() output. I think my changes would be
>> beneficial for other so I'll cook some patches and post for review
>> here.
>
> Can you just tell us what controller driver are you using ?
I'm using omap2 controller (hope that is right answer :))
>
> You may want to have a look at [1], which hare the MTD hooks that I
> guess you could fill with you OTP related read/writes. I think you
> will also need some tweaks in nanddump (or a nandotpdump thing) to
> ease the validation of the implementation.
Yes I know about that. I saw that but implementation for NAND is
missing so maybe make sense to fill it so it will work out of the box?
>
> [1]
> http://elixir.free-electrons.com/linux/latest/source/include/linux/mtd/mt=
d.h#L314
>
> Thank you,
> Miqu=C3=A8l
>

BR,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
