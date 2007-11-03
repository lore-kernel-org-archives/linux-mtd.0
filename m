Subject: Re: address lines
From: David Woodhouse <dwmw2@infradead.org>
To: "M8 (Servaes Joordens)" <Servaes.Joordens@m8.nl>
In-Reply-To: <472C6473.8020502@m8.nl>
References: <472C5368.3060306@m8.nl>
	<1194090374.9405.42.camel@pmac.infradead.org> <472C6473.8020502@m8.nl>
Content-Type: text/plain
Date: Sat, 03 Nov 2007 12:13:01 +0000
Message-Id: <1194091981.9405.47.camel@pmac.infradead.org>
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


On Sat, 2007-11-03 at 13:07 +0100, M8 (Servaes Joordens) wrote:
> cfi_cmdset_001.c: cfi_intelext_point
> cfi_cmdset_001.c: do_point_onechip
> cfi_cmdset_001.c: get_chip
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:0x890a instead
> 
> I expected that prior to error-report a read or write action to the
> flash is done. In that case I should have seen an printk saying
> physmap.c:bank_switching_map_read or
> physmap.c:bank_switching_map_write.

Hm, yes. The 'point' method bypasses the normal access functions, on the
assumption that the entire device is actually directly mappable. 

The sbc_gxx driver to which I referred you sets map->phys = NO_XIP;

Did you?

I don't understand why you're messing with physmap.c when that isn't the
one I told you to use as a template.

-- 
dwmw2
