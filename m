Received: from gateway-1237.mvista.com ([63.81.120.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MSU0Q-0007El-Oc
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 10:52:39 +0000
Subject: Re: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi nand
	driver support
From: Steve Chen <schen@mvista.com>
To: Artem Bityutskiy <dedekind@infradead.org>
In-Reply-To: <1247980139.11353.194.camel@localhost.localdomain>
References: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25C53608@SJEXCHCCR02.corp.ad.broadcom.com>
	<1247980139.11353.194.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 19 Jul 2009 05:56:24 -0500
Message-Id: <1248000984.3079.130.camel@linux-1lbu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"Leo \(Hao\) Chen" <leochen@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-07-19 at 08:08 +0300, Artem Bityutskiy wrote:
> On Fri, 2009-07-17 at 12:13 -0700, Leo (Hao) Chen wrote:
> > This patch addes bcmring umi nand driver support, with bch ecc algorithm support.
> > 
> > It addes header files, register files, Kconfig option and Makefile
> > entry.
> > 
> > Signed-off-by: Leo Chen <leochen@broadcom.com>
> 
> Hi, the code neat in general, but would it be possible to amend it and
> make more compatible with the Linux coding style?
> 
> See Documentation/CodingStyle
> See scripts/checkpatch.pl
> 

Just to give an example of Artem's comment.  If I run the checkpatch
script on this patch, I get

> scripts/checkpatch.pl add_bcmring_umi_nand_driver_support.patch

WARNING: space prohibited between function name and open parenthesis '('
#157: FILE: arch/arm/mach-bcmring/include/mach/reg_nand.h:47:
+#define REG_NAND_DATA8          __REG8 (REG_NAND_PHYS_DATA8)

WARNING: line over 80 characters
#220: FILE: arch/arm/mach-bcmring/include/mach/reg_umi.h:38:
+#define HW_UMI_BASE       MM_IO_BASE_UMI       /* Unified Memory
Interface Ctrl Register */
...

ERROR: code indent should use tabs where possible
#1849: FILE: include/linux/mtd/nand_bcm_umi.h:227:
+               /* Flip bit */$

ERROR: code indent should use tabs where possible
#1850: FILE: include/linux/mtd/nand_bcm_umi.h:228:
+               nand_bcm_umi_bch_ecc_flip_bit(datap, errorLocation);$

total: 365 errors, 192 warnings, 1707 lines checked

add_bcmring_umi_nand_driver_support.patch has style problems, please
review.  If any of these errors are false positives report them to the
maintainer, see
CHECKPATCH in MAINTAINERS.

Regards,

Steve
