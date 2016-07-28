Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bShoi-0000U0-DX
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 09:41:25 +0000
Message-ID: <1469698833.2405.203.camel@gmail.com>
Subject: Re: 4KB LEB's on QSPI and ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard.weinberger@gmail.com>, Alison Chaiken
 <alison@peloton-tech.com>
Cc: John.Parker@lucyautomation.co.uk, bsistani@micron.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Bean Huo
 =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "(beanhuo)" <beanhuo@micron.com>
Date: Thu, 28 Jul 2016 12:40:33 +0300
In-Reply-To: <CAFLxGvwuQEdnrMd=TgjbaL3BSCoz9NwLe_bGRd2SF3tqM-=p3w@mail.gmail.com>
References: <CAOuSAjewVko+eLcYutzFgsarCPBsWS_AbwLnTmo-hAW9HYVPzg@mail.gmail.com>
 <CAFLxGvwuQEdnrMd=TgjbaL3BSCoz9NwLe_bGRd2SF3tqM-=p3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-07-28 at 09:45 +0200, Richard Weinberger wrote:
> Alison,
> 
> On Thu, Jul 28, 2016 at 3:12 AM, Alison Chaiken <alison@peloton-tech.
> com> wrote:
> > 
> > I'm helping to bring up a board that contains a Micron n25q512ax3
> > Quad
> > SPI-NOR.    As discussed previously at linux-mtd,
> > 
> >                http://lists.infradead.org/pipermail/linux-mtd/2013-
> > July/047665.html
> > 
> > ubifs won't work with the 4 kB erase sectors like those used by
> > this
> > chip, as it fails with
> > 
> >               UBIFS error (ubi0:0 pid 3289): init_constants_early:
> > too
> > small LEBs (3968 bytes), min. is 15360 bytes
> > 
> > We are using a 4.1 PREEMPT_RT_FULL kernel, but as far as I can
> > tell,
> > the relevant code in spi-nor.c and ubifs/super.c is unchanged in
> > recent 4.7.    Therefore, with SECT_4K  as a configuration for this
> > device, ubifs still will not work.
> > 
> > What is the best alternative?
> > 
> > 0. Create a UBI volume, but mount a different kind of flash
> > filesystem
> > on it.   Perhaps a different filesystem is a better choice for
> > QSPI?
> > ubiattach and ubimkvol work fine with the device.  Our use case
> > involves a set of files that will likely only ever be written at
> > system installation time.
> 
> If your rootfs can be read-only you can give ubiblock+squashfs a try.
> 
> > 
> > 1. Remove SECT_4K from the entry in spi_nor_ids[] for the device
> > and
> > use ubifs.   As I understand 548cd3a "mtd: spi-nor: Add quad I/O
> > support for Micron SPI NOR" that added SECT_4K, this removal will
> > make
> > the device slower, but not otherwise cause problems.    The
> > device's
> > datasheet reads,
> > 
> >                 – Subsector erase 4KB uniform granularity blocks
> >                 – Sector erase 64KB uniform granularity blocks
> > 
> > which suggests that removing SECT_4K from spi_nor_ids[] will result
> > in
> > 64KB sector erase blocks rather than 4KB subsector ones that
> > ubiattach
> > detects now.
> 
> Yes, AFAIK SECT_4K is just an optimization to make erases faster
> since you
> erase less bytes.
> 
> > 
> > 2. Something else entirely?
> 
> Depending on how much research want to do you can try massaging UBIFS
> for very small LEBs.
> When you change UBIFS_MIN_LEB_SZ to less than 4k the first thing that
> will explode
> is that an UBIFS data node won't fit in a LEB since UBIFS data chunks
> are 4k.

This is because Linux page cache operates with 4KiB pages so 4KiB was a
natural choice.

> But that could also be reduced...

In theory yes, but it'd add lots of complexity I think. I guess
teaching UBI exposing virtual eraseblock sizes consisting of multiple
physical ones would be easier. Of course the physical ones do not have
to be continuous, so that if one of them goes bad, another could be
picked. There could be one EC/VID header per virtual block, I guess -
less overhead.


> 
