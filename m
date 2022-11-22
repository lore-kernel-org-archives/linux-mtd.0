Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D871C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mU9htFCgl8YNRy8ogm/zUGXf1JjlEjmYFEuNE4CvQjE=; b=WXbHo/rH8kYdNl
	NnvCgKdpo05on7wBf0OncXiE19bZZmy6ligzIbDH5H76bpFUadswYmZWQbuiGNcqWmbVnpOg0+Qmh
	T6CaPwUHCjPDrtO0DgSPuSu/fCB+fFVIEjbfy0I1g/5OcNaKaA9C/ct/b4o5rADv2wI7prrDnRHS4
	lcvX1PoTNc/cmOYOyR4tPbZK/ytVDzmhtG1/g8SrJBllNWXCgOy7Wmfpxn3B5Vpbw32C8xnQu4agd
	ctlbxyc2fRrVjzJS/Eq4jLkWNc6ryk44BjwilhylXGKyfDb9XULxj/Sw2q0TBgjjGb9UVfBRfatMq
	KLMVkcg3azeNE1L9OAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRMM-008Kh9-AO; Tue, 22 Nov 2022 11:22:38 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRMI-008KdF-AG
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 11:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669116154; x=1700652154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8lzinkl+omNwm2wDzsZacfOS4f+dACPzJLiZEPDyu6o=;
  b=d/2ZjeTDkiha1u985dD5O2odjKO8+ilO8603IsDG/7jlf9nXWSWGbPfd
   xqg9bx5wOlgHjoHvXpUueHWczaI5IlxrG3XaUhG2zRswauyEnqkG6ep9g
   NrcEfKXPrgqiQPAHQ7hmLryYmRfUZ1mUB/krElJZa9b6Ikals/8EYonp0
   gQqwWMvV3Ecx8hglsp5sqAjIkQDBfI8vjVpQ1/QylD3E+WhhIfOsCJsof
   65K2I6Bd1rlaa4jktbVE0lOri384Wj7U4k94brKawigsZOeKc5i30ROTm
   4eaFvSI4l65BYpi8n5wqYc8YHDTJ625wzPzy6SvZtZuqVdVfWeBnoK3tB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314941654"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="314941654"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 03:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="704933549"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="704933549"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2022 03:22:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3059C12B; Tue, 22 Nov 2022 13:22:52 +0200 (EET)
Date: Tue, 22 Nov 2022 13:22:52 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Message-ID: <Y3yxDLw3n643Ivf2@black.fi.intel.com>
References: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
 <959a3de3-dd71-acaa-d26b-0e93f3db820a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <959a3de3-dd71-acaa-d26b-0e93f3db820a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_032234_449715_A064ABF7 
X-CRM114-Status: GOOD (  27.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Nov 21, 2022 at 03:03:51PM +0000, Tudor.Ambarus@microchip.com wrote:
> On 10/23/22 09:58, Mika Westerberg wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Add support for this 32MB serial flash.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> > The previous version of the patch can be found here:
> > 
> >   https://lore.kernel.org/linux-mtd/20220922135646.49906-1-mika.westerberg@linux.intel.com/
> > 
> > This version uses SFDP instead as the chip supports it just fine.
> > 
> >  drivers/mtd/spi-nor/gigadevice.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> > index 119b38e6fc2a..29ae4048bb0f 100644
> > --- a/drivers/mtd/spi-nor/gigadevice.c
> > +++ b/drivers/mtd/spi-nor/gigadevice.c
> > @@ -57,6 +57,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
> >                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
> >                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> >                 .fixups = &gd25q256_fixups },
> > +       { "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)
> > +               PARSE_SFDP
> > +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> >  };
> > 
> >  const struct spi_nor_manufacturer spi_nor_gigadevice = {
> 
> Hi, Mika!
> 
> When submitting flash updates or new flash additions, we require contributors
> to do a little test using mtd-utils and to dump the SPI NOR sysfs entries.
> Would you please do that?
> 
> Here's the simple test:
> 
> Run the test_qspi.sh script: 
> #!/bin/sh 
> 
> dd if=/dev/urandom of=./qspi_test bs=1M count=6 
> mtd_debug write /dev/mtd5 0 6291456 qspi_test 
> mtd_debug erase /dev/mtd5 0 6291456 
> mtd_debug read /dev/mtd5 0 6291456 qspi_read 
> hexdump qspi_read 
> mtd_debug write /dev/mtd5 0 6291456 qspi_test 
> mtd_debug read /dev/mtd5 0 6291456 qspi_read 
> sha1sum qspi_test qspi_read 
> 
> The two SHA-1 sums must be the same to pass this test. 

That SPI flash holds the system BIOS and I'm using it remotely now so
there is no way to revive if something goes wrong so I wonder if it is
OK to skip the above step?

> Here's an example on how to dumps the sysfs entries:
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s25hl02gt
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 342a1c0f0090
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080104ff00080114000100ff84000102500100ff81000118e001
> 00ff8700011c580100ff88000106c80100ffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffe720faffffffff7f48eb086b00ff
> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffec
> ec031c608a857a75f766805c8cd6ddfff938c0a1000000000000bc000000
> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3fbc8ffe3fb
> 00650090066500b10065009600650095716503d0716503d000000000b02e
> 000088a489aa716503967165039600000000000000000000000000000000
> 000000000000000000000000000000000000000000000000716505d57165
> 05d50000a015000080080000000800008010000000100000801800000018
> fc65ff0804008000fc65ff0402008000fc65ff0804008008fd65ff040200
> 8008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8fffb0ff8ff0100
> f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100f1ff0100ff0a
> 00fff8ffff0f

These I was able to read:

# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lr256e
# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c86719
# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice
# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp 
53464450060103ff00060110300000ffc8000103900000ff84000102c000
00ff03000102e00000ffffffffffffffffffe520eaffffffff0f44eb086b
003b00bbfeffffffffff00ffffff44eb0c200f5210d800ff4362c9fe82e9
9c58ec6006337a757a7504bdd55c2906740008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
8156d9c8ffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff38ff0ff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffff389b96f0e1a6b2ff

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
