Subject: Re: address lines
From: David Woodhouse <dwmw2@infradead.org>
To: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
In-Reply-To: <472C694C.7020103@m8.nl>
References: <472C5368.3060306@m8.nl>
	<1194090374.9405.42.camel@pmac.infradead.org> <472C6473.8020502@m8.nl>
	<1194091981.9405.47.camel@pmac.infradead.org> <472C694C.7020103@m8.nl>
Content-Type: text/plain
Date: Sat, 03 Nov 2007 12:29:26 +0000
Message-Id: <1194092966.9405.51.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd-forum <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-11-03 at 13:27 +0100, M8 (Servaes Joordens) wrote:
> How do I enable my own driver file based on sbc_gxx.c? I cannot find
> an configuration option in the kernel by menuconfig.

Copy sbc_gxx.c to create your own driver. Copy the configuration option
in drivers/mtd/maps/Kconfig too, renaming it appropriately and giving it
appropriate dependencies. Add an appropriate line in
drivers/mtd/maps/Makefile, using your new config option and your new
filename.

-- 
dwmw2
