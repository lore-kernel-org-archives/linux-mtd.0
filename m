Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMWcm-0007Aa-RF
 for linux-mtd@lists.infradead.org; Wed, 27 Aug 2014 06:22:29 +0000
Received: by mail-ig0-f177.google.com with SMTP id hn18so5700701igb.16
 for <linux-mtd@lists.infradead.org>; Tue, 26 Aug 2014 23:22:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACna6rwb1whM51=wOSWy-60+TogjB+wesMpO6y=pt7q0t4jfFg@mail.gmail.com>
References: <CACna6rwb1whM51=wOSWy-60+TogjB+wesMpO6y=pt7q0t4jfFg@mail.gmail.com>
Date: Wed, 27 Aug 2014 08:22:07 +0200
Message-ID: <CACna6rxxk1j4z6Rf35Wmf4TAd9rDmu2LGwxn4X47s2ED+sNYyQ@mail.gmail.com>
Subject: Re: NAND flashes in Broadcom routers: bad blocks, ECC
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Brian Norris <computersforpeace@gmail.com>
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

On 19 August 2014 20:45, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> I wanted to finally switch from NAND_ECC_NONE to NAND_ECC_SOFT (there
> is no hw ECC) but it appears it won't be that straightforward. The
> problem is NAND implementation in Broadcom's CFE bootloader.
>
> It appears that all the bootloader cares about is if block is good or
> bad. I think it doesn't even use BBT. It simply checks for oob[0x0]
> (or oob[0x5] for small flashes) being 0xff. Then it writes to the
> block or skips it. The bootloader doesn't seem to even calculate ECC
> when writing! So after installing firmware using bootloader all OOB
> content is 0xFF. Of course enableing NAND_ECC_SOFT results in
> uncorrectable errors:
> bcm47xxnflash: NAND_CMD_RNDOUT len:0x0F
> bcm47xxnflash: NAND_CMD_RNDOUT data FF FF FF FF FF FF FF FF FF FF FF
> FF FF FF FF FF
> __nand_correct_data: uncorrectable ECC error
> __nand_correct_data: uncorrectable ECC error
> __nand_correct_data: uncorrectable ECC error
> mtd_read error while reading (offset: 0x60000)!
>
> So I wonder how we could deal with that. Should I somehow detect if
> this is first boot after installation and calculate ECCs on my own?
> Hoping nothing wrong will happen of the first read?

Any ideas?
