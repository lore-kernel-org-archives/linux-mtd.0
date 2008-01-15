Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEcBc-0007wG-VN
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 03:10:10 +0000
Date: Tue, 15 Jan 2008 04:01:03 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Roel Kluin <12o3l@tiscali.nl>
Subject: Re: [MTD] potential division by 0 in cfi_build_cmd() and
	cfi_merge_status()?
Message-ID: <20080115030103.GA19407@lazybastard.org>
References: <478BFE1C.1090608@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <478BFE1C.1090608@tiscali.nl>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 January 2008 01:28:12 +0100, Roel Kluin wrote:
> 
> Doing some grepping, I stumbled upon this possible error:
> 
> in include/linux/mtd/cfi.h, lines 302 and 366, resp. functions
> cfi_build_cmd() and cfi_merge_status() there is a division by
> cfi_interleave(cfi):
> 
> chip_mode = map_bankwidth(map) / cfi_interleave(cfi);
> 
> This could be problematic when No CONFIG_MTD_CFI_Ix is selected:
> cfi_interleave will triggers BUG(), but when BUG is disabled, the
> function returns 0, causing a subsequent division by zero.
> 
> When a CONFIG_MTD_CFI_Ix is selected, cfi_interleave(cfi) is either
> defined 1 or defined (cfi)->interleave.
> 
> cfi is a struct cfi_private pointer, with interleave as an int.
> 
> I am not sure whether interleave can ever be 0 in this division when 
> CONFIG_MTD_CFI_Ix is set.
> 
> shouldn't there be an error exit when cfi_interleave(cfi) evaluates
> to 0?

I don't think cfi_interleave(cfi) will ever be 0.  But the functions
definitely look a bit large for inlines.  Anyone having both cfi_probe
and jedec_probe will enjoy twice the kernel footprint from them.
Patches to move that code out-of-line are welcome.

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
