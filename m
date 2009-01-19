Message-ID: <4974CBB3.4020102@oracle.com>
Date: Mon, 19 Jan 2009 10:51:31 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>
Subject: Re: build issue #583 for v2.6.29-rc2-13-gf3b8436 : undefined reference
	to `lpddr_cmdset'
References: <200901191938.08911.toralf.foerster@gmx.de>
In-Reply-To: <200901191938.08911.toralf.foerster@gmx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Toralf Förster wrote:
> Hello,
> 
> the build (.config attached) failed, make ends with :
> ...
>   CC      arch/x86/lib/usercopy_32.o
>   AR      arch/x86/lib/lib.a
>   LD      vmlinux.o
>   MODPOST vmlinux.o
> WARNING: modpost: Found 1 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
>   KSYM    .tmp_kallsyms0.S
>   AS      .tmp_kallsyms0.o
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> drivers/built-in.o: In function `lpddr_probe':
> (.text+0x17a1ae): undefined reference to `lpddr_cmdset'
> make: *** [.tmp_vmlinux1] Error 1


Repeating an email reply from last week:

This patch has been posted, just needs to be merged (hint):
---


Signed-off-by: Alexey Korolev <akorolev@infradead.org>
---
diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
index acd4ea9..5a401d8 100644
--- a/drivers/mtd/lpddr/Kconfig
+++ b/drivers/mtd/lpddr/Kconfig
@@ -12,6 +12,7 @@ config MTD_LPDDR
 	  DDR memories, intended for battery-operated systems.
 
 config MTD_QINFO_PROBE
+	depends on MTD_LPDDR
 	tristate "Detect flash chips by QINFO probe"
 	help
 	    Device Information for LPDDR chips is offered through the Overlay

-- 
~Randy
