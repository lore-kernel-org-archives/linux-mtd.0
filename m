Received: from smtp-vbr7.xs4all.nl ([194.109.24.27])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MW3yT-0007qn-DZ
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 07:53:25 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr7.xs4all.nl (8.13.8/8.13.8) with ESMTP id n6T7rI8J017444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Jul 2009 09:53:19 +0200 (CEST)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4A6FFFEE.9070108@aimvalley.nl>
Date: Wed, 29 Jul 2009 09:53:18 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: error cross compiling ubi-utils
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This happens with current git tree (git://git.infradead.org/mtd-utils.git)

building for HOST (i686, FC6) works fine.
cross compiling (for powerpc) fails because of this error:

/swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux-gcc -Iinclude -Isrc -I../include -D_FILE_OFFSET_BITS=64 -O2 -g -Wall -Wextra 
-Wwrite-strings -Wno-sign-compare -c -o 
/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils//swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux/ubi-utils/libubi.o 
src/libubi.c -g 
-Wp,-MD,/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils//swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux/ubi-utils/.libubi.c.dep
In file included from include/libubi.h:29,
                  from src/libubi.c:33:
../include/mtd/ubi-media.h:149: error: expected specifier-qualifier-list before '__be32'
../include/mtd/ubi-media.h:269: error: expected specifier-qualifier-list before '__be32'
../include/mtd/ubi-media.h:356: error: expected specifier-qualifier-list before '__be32'
make[1]: *** 
[/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils//swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux/ubi-utils/libubi.o] 
Error 1
make[1]: Leaving directory `/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils/ubi-utils'
make: *** [subdirs_ubi-utils_all] Error 2

To cross compile I set CROSS=/swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux-
and issued make in mtd-utils directory.

The problem is that my powerpc cross compiler (gcc-2.7) doesn't define __be32 (nor __be16 and __be64) in
the standard system headers
(/swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/powerpc-e300c3-linux/sys-include/asm/types.h).

For the HOST build "/usr/include/linux/types.h" is used which does define __be64/__be32/__be16.

I guess mtd-utils/include/mtd/ubi-media.h should use __u64/__u32/__u16 ?
