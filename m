Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSg1N-0006BH-Jt
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 07:46:22 +0000
Received: by mail-oi0-x230.google.com with SMTP id l72so52051382oig.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2016 00:45:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOuSAjewVko+eLcYutzFgsarCPBsWS_AbwLnTmo-hAW9HYVPzg@mail.gmail.com>
References: <CAOuSAjewVko+eLcYutzFgsarCPBsWS_AbwLnTmo-hAW9HYVPzg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 28 Jul 2016 09:45:59 +0200
Message-ID: <CAFLxGvwuQEdnrMd=TgjbaL3BSCoz9NwLe_bGRd2SF3tqM-=p3w@mail.gmail.com>
Subject: Re: 4KB LEB's on QSPI and ubifs
To: Alison Chaiken <alison@peloton-tech.com>
Cc: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 John.Parker@lucyautomation.co.uk, bsistani@micron.com
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

Alison,

On Thu, Jul 28, 2016 at 3:12 AM, Alison Chaiken <alison@peloton-tech.com> w=
rote:
> I'm helping to bring up a board that contains a Micron n25q512ax3 Quad
> SPI-NOR.    As discussed previously at linux-mtd,
>
>                http://lists.infradead.org/pipermail/linux-mtd/2013-July/0=
47665.html
>
> ubifs won't work with the 4 kB erase sectors like those used by this
> chip, as it fails with
>
>               UBIFS error (ubi0:0 pid 3289): init_constants_early: too
> small LEBs (3968 bytes), min. is 15360 bytes
>
> We are using a 4.1 PREEMPT_RT_FULL kernel, but as far as I can tell,
> the relevant code in spi-nor.c and ubifs/super.c is unchanged in
> recent 4.7.    Therefore, with SECT_4K  as a configuration for this
> device, ubifs still will not work.
>
> What is the best alternative?
>
> 0. Create a UBI volume, but mount a different kind of flash filesystem
> on it.   Perhaps a different filesystem is a better choice for QSPI?
> ubiattach and ubimkvol work fine with the device.  Our use case
> involves a set of files that will likely only ever be written at
> system installation time.

If your rootfs can be read-only you can give ubiblock+squashfs a try.

> 1. Remove SECT_4K from the entry in spi_nor_ids[] for the device and
> use ubifs.   As I understand 548cd3a "mtd: spi-nor: Add quad I/O
> support for Micron SPI NOR" that added SECT_4K, this removal will make
> the device slower, but not otherwise cause problems.    The device's
> datasheet reads,
>
>                 =E2=80=93 Subsector erase 4KB uniform granularity blocks
>                 =E2=80=93 Sector erase 64KB uniform granularity blocks
>
> which suggests that removing SECT_4K from spi_nor_ids[] will result in
> 64KB sector erase blocks rather than 4KB subsector ones that ubiattach
> detects now.

Yes, AFAIK SECT_4K is just an optimization to make erases faster since you
erase less bytes.

> 2. Something else entirely?

Depending on how much research want to do you can try massaging UBIFS
for very small LEBs.
When you change UBIFS_MIN_LEB_SZ to less than 4k the first thing that
will explode
is that an UBIFS data node won't fit in a LEB since UBIFS data chunks are 4=
k.
But that could also be reduced...

--=20
Thanks,
//richard
