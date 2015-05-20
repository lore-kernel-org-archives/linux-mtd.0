Date: Wed, 20 May 2015 16:24:09 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 07/12] mtd: nand: add Samsung K9GBG08U0A-M to nand_ids
 table
Message-ID: <20150520142409.GP22054@kwain>
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <1431356341-31640-8-git-send-email-antoine.tenart@free-electrons.com>
 <555792FC.8030407@vanguardiasur.com.ar>
 <20150520140631.GN22054@kwain>
 <555C9584.1030609@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <555C9584.1030609@vanguardiasur.com.ar>
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 11:09:08AM -0300, Ezequiel Garcia wrote:
> On 05/20/2015 11:06 AM, Antoine Tenart wrote:
> > On Sat, May 16, 2015 at 03:57:00PM -0300, Ezequiel Garcia wrote:
> >> On 05/11/2015 11:58 AM, Antoine Tenart wrote:
> >>> Add the full description of the Samsung K9GBG08U0A-M nand chip in the
> >>> nand_ids table.
> >>>
> >>> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> >>> ---
> >>>  drivers/mtd/nand/nand_ids.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> >>> index dd620c19c619..500c33e1db06 100644
> >>> --- a/drivers/mtd/nand/nand_ids.c
> >>> +++ b/drivers/mtd/nand/nand_ids.c
> >>> @@ -50,6 +50,10 @@ struct nand_flash_dev nand_flash_ids[] = {
> >>>  		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
> >>>  		  SZ_8K, SZ_8K, SZ_2M, 0, 6, 640, NAND_ECC_INFO(40, SZ_1K),
> >>>  		  4 },
> >>> +	{"NAND 4GiB 3,3V 8-bit",
> >>> +		{ .id = {0xec, 0xd7, 0x94, 0x76, 0x64, 0x43}, },
> >>> +		  8192, 4096, SZ_1M, LP_OPTIONS, 0, 0, NAND_ECC_INFO(40, SZ_1K),
> >>
> >> You should stick to SZ_8K and SZ_4K here.
> > 
> > Right.
> > 
> >>
> >>> +		  4 },
> >>>  
> >>>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
> >>>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
> >>>
> >>
> >> I found a datasheet here for K9GBG08U0A that claims to support JEDEC
> >> device identification (i.e. 0x90 0x40 and 0xEC 0x40 commands). Have you
> >> tested it? Any reason you are adding full ID instead?
> > 
> > This nand looks like another one defined in this file, so a full ID make
> > sure the right parameters applies here.
> > 
> 
> Oh, so you say the NAND detects the device ID and uses those parameters,
> instead of doing the JEDEC detection?

I just had a look on the datasheet, and I you're right, the nand should
support JDEC. However I get a "No NAND device found" error when
reverting this patch.

It seems nand_flash_detect_jedec() is not reading "JDEC" and is returning
directly. I'm having a look at this.

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
