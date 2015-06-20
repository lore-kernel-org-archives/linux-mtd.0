Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6ODB-00039M-TW
 for linux-mtd@lists.infradead.org; Sat, 20 Jun 2015 19:13:54 +0000
Received: by igblr2 with SMTP id lr2so32183402igb.0
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2015 12:13:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434639539-7517-1-git-send-email-anuragku@xilinx.com>
References: <1434639539-7517-1-git-send-email-anuragku@xilinx.com>
Date: Sat, 20 Jun 2015 21:13:31 +0200
Message-ID: <CACna6ryyXEwQ81NYhBY19X11qWP0RSepriBr5RgB_mWeXxtxdA@mail.gmail.com>
Subject: Re: [RFC PATCH] mtd: spi-nor: Added flag check for quad io protocol
 for micron flash parts
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, harinik@xilinx.com,
 Anurag Kumar Vulisha <anuragku@xilinx.com>,
 Ben Hutchings <ben@decadent.org.uk>, David Woodhouse <dwmw2@infradead.org>,
 svemula@xilinx.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 anirudh@xilinx.com, "grmoore@altera.com" <grmoore@altera.com>,
 Huang Shijie <shijie.huang@intel.com>, punnaia@xilinx.com,
 Brian Norris <computersforpeace@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I don't really have enough knowledge to comment QUAD IO, I'll just
include some general comments.

On 18 June 2015 at 16:58, Anurag Kumar Vulisha
<anurag.kumar.vulisha@xilinx.com> wrote:
> micron flash parts by default operates in extended spi protocol,which accepts
> command on single line and can accept address & data on one,two and four lines
> depending on the command sent.In set_quad_enable() we are enabling the quad io
> protocol for micron flash parts by updating the EVCR register,in this method the
> flash expects the command,address and data to be transmitted on all four data
> lines which may not be supported on all qspi controllers.So READ_1_1_4 command
> does not necessarily go out using those bus widths.
>
> So i have added SPI_QUAD_IO_PROTOCOL flag,which should be checked before enabling
> the quad io protocol.

Above description is a bit of pain to read & understand. Long
sentences, lacking spaces after interpunction signs, small letters in
"micron", "spi" etc., lines over 72 chars. You really could do better
:)


> @@ -55,6 +55,7 @@ struct flash_info {
>  #define        SPI_NOR_DUAL_READ       0x20    /* Flash supports Dual Read */
>  #define        SPI_NOR_QUAD_READ       0x40    /* Flash supports Quad Read */
>  #define        USE_FSR                 0x80    /* use flag status register */
> +#define SPI_QUAD_IO_PROTOCOL   0x100   /* use quad io protocol */

All defines use tab so follow this way (don't use space instead).
