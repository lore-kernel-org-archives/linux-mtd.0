Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHnXa-0001wH-8Q
 for linux-mtd@lists.infradead.org; Thu, 23 Nov 2017 09:11:29 +0000
Received: by mail-wm0-x22b.google.com with SMTP id x63so14982694wmf.4
 for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2017 01:11:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171123095735.538118e0@xps13>
References: <CAAfyv37B2yRc7gybNi3hNs=ap52bgqTCrsx4tZe_5LNb7LfzVQ@mail.gmail.com>
 <20171123095735.538118e0@xps13>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 23 Nov 2017 10:11:03 +0100
Message-ID: <CAAfyv35tTTFobGsA1Qr5KB_KyR94YLAiGGezu1eik=8TZfnxqg@mail.gmail.com>
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

On Thu, Nov 23, 2017 at 9:57 AM, Miquel RAYNAL
<miquel.raynal@free-electrons.com> wrote:
> Hi Marek,
>
> +CC: NAND maintainers Boris and Richard
>
>> Hi,
>>
>> I'm trying to add find out how to use OTP area in Macronix
>> MX30LF4G18AC flash. AFAIU it is ONFI based flash and I did some quick
>> hack and I can set/reset flash to go to OTP mode via get/set_features
>> function available in nand_base.c.
>
> Ok, so until now you can enter/leave OTP mode with get/set_features(),
> right ?
Yes exactly. Yesterday I make otp write/read working. Problem was that
otp pages for flash start at offset 0x2 up to 0x1f (at least mine
flash does have such range - 30 pages for otp).
>
>> But for read page I need to send
>> according datasheet:
>> To use the PAGE READ command for reading data from the OTP area, issue
>> the 00h command, and then issue five address cycles: for the first two
>> cycles, the column address; and for the remaining address cycles,
>> select a page in the range of 02h-00h-00h through 1Fh-00h-00h. Lastly,
>> issue the 30h command. The PAGE READ CACHE MODE command is not
>> supported on OTP pages.
>
> This is the description of a normal READ operation, there is nothing
> specific to OTP.
OH ok I did't see it in code I was looking at but from my above
comment it seems that it is because it's working :).
>
>>
>> I did check nand_do_read_ops function but it's not sending e.g. 0x30
>> which should be at the end of command. I'm using 4.1 kernel but
>> checked also 4.14 and no such functionality is added even there.
>> Nobody is using OTP area in nand flashes ;) ? Thanks for any pointers.
>
> I suppose you added some tweaks to enable OTP and use nand_do_read_ops,
> because there is currently no implementation for that in the NAND
> framework (I think there is something in MTD layer though). But must
> importantly, nand_do_read_ops basically calls chip->ecc.read*() which
> is handled by the controller driver, so what driver are you using ?
>
> How (where) did you trace the commands sent to the NAND chip ? For
> instance, if you just looked at the arguments of ->cmdfunc(), it is
> normal not to see any READSTART (0x30) command as it should be added
> automatically later in the function. If the driver implements
> ->cmd_ctrl(), you may see there what exactly is sent to the device.
Yes I checked ->cmdfunc() output. I think my changes would be
beneficial for other so I'll cook some patches and post for review
here.
>
> Thanks,
> Miqu=C3=A8l

thanks and BR,

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
