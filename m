Subject: Re: [PATCH] Bug on atmel_nand HW ECC : OOB info not correctly written
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <1223793748.7110.13.camel@ubuntu>
References: <1223793748.7110.13.camel@ubuntu>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2008 15:01:01 +0100
Message-Id: <1223906461.6770.604.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2008-10-12 at 08:42 +0200, Richard Genoud wrote:
> The functions that write the OOB info (on hardware ECC only) use the
> HW_SYNDROME method.
> This is not correct : the start position is "pos = eccsize + chunk"
> and should be eccsize.
> So, the standard (nand_write_oob_std) function should be used.
> This patch corrects this by using NAND_ECC_HW instead of
> NAND_ECC_HW_SYNDROME.
> 
> This has only been tested on small pages nand flash.
> (if anyone can test it on large pages that would be great).
> 
> kernel version : 2.6.27-rc2 (current git mtd-2.6)
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Håvard?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
