Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2uO-00051o-3I
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:33:40 +0000
Message-ID: <4A7E7B6E.2050808@gmail.com>
Date: Sun, 09 Aug 2009 10:31:58 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: error cross compiling ubi-utils
References: <4A6FFFEE.9070108@aimvalley.nl>
In-Reply-To: <4A6FFFEE.9070108@aimvalley.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/29/2009 10:53 AM, Norbert van Bolhuis wrote:
>
> This happens with current git tree (git://git.infradead.org/mtd-utils.git)
>
> building for HOST (i686, FC6) works fine.
> cross compiling (for powerpc) fails because of this error:
>
> /swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux-gcc
> -Iinclude -Isrc -I../include -D_FILE_OFFSET_BITS=64 -O2 -g -Wall -Wextra
> -Wwrite-strings -Wno-sign-compare -c -o
> /home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils//swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux/ubi-utils/libubi.o
> src/libubi.c -g
> -Wp,-MD,/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils//swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux/ubi-utils/.libubi.c.dep
>
> In file included from include/libubi.h:29,
> from src/libubi.c:33:
> ../include/mtd/ubi-media.h:149: error: expected specifier-qualifier-list
> before '__be32'
> ../include/mtd/ubi-media.h:269: error: expected specifier-qualifier-list
> before '__be32'
> ../include/mtd/ubi-media.h:356: error: expected specifier-qualifier-list
> before '__be32'
> make[1]: ***
> [/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils//swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux/ubi-utils/libubi.o]
> Error 1
> make[1]: Leaving directory
> `/home/nvbolhuis/new_83xx_kernel/ubi_utilities3_cross/mtd-utils/ubi-utils'
> make: *** [subdirs_ubi-utils_all] Error 2
>
> To cross compile I set
> CROSS=/swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/bin/powerpc-e300c3-linux-
>
> and issued make in mtd-utils directory.
>
> The problem is that my powerpc cross compiler (gcc-2.7) doesn't define
> __be32 (nor __be16 and __be64) in
> the standard system headers
> (/swdev/tools/linuxppc/gcc-4.2.4-glibc-2.7/powerpc-e300c3-linux/powerpc-e300c3-linux/sys-include/asm/types.h).
>
>
> For the HOST build "/usr/include/linux/types.h" is used which does
> define __be64/__be32/__be16.
>
> I guess mtd-utils/include/mtd/ubi-media.h should use __u64/__u32/__u16 ?

I believe new kernels export these types via their headers, and you just
have an old kernel. You could try to make mtd-utils be independent of
these types.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
