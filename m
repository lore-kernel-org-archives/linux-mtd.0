Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STBA8-0006JH-AC
 for linux-mtd@lists.infradead.org; Sat, 12 May 2012 12:11:10 +0000
Message-ID: <4FAE5342.8080006@snapgear.com>
Date: Sat, 12 May 2012 22:10:42 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
 <1336752354.2625.99.camel@sauron.fi.intel.com>
In-Reply-To: <1336752354.2625.99.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 05/12/2012 02:05 AM, Artem Bityutskiy wrote:
> On Thu, 2012-05-10 at 16:55 +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> The uclinux.c mapping driver uses ioremap_nocache() to map its physical
>> mapping address to a system virtual address. Problem is that the region
>> it is mapping is not device memory. It is ordinary system RAM. On most
>> non-MMU systems this doesn't matter, and the mapping is always a 1:1
>> translation of the address.
>>
>> But if we want to use the uclinux.c mapping driver on real MMU enabled
>> systems we should be using phys_to_virt() for the translation, since that
>> is really what we are doing. So change it to do that.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>
> How can I compile-test this? Please, suggest a defconfig which compiles.
> I created one but it does not build:
>
> dedekind@blue:~/git/l2-mtd$ make ARCH=m68k CROSS_COMPILE=m68k-linux-
>    CHK     include/linux/version.h
>    CHK     include/generated/utsrelease.h
>    CALL    scripts/checksyscalls.sh
>    CHK     include/generated/compile.h
>    CC      arch/m68k/kernel/time.o
> arch/m68k/kernel/time.c:90:5: error: redefinition of 'arch_gettimeoffset'
> include/linux/time.h:145:19: note: previous definition of 'arch_gettimeoffset' was here
> make[1]: *** [arch/m68k/kernel/time.o] Error 1
> make: *** [arch/m68k/kernel] Error 2
>
> It is attached.

Nothing attached?

In any case I would suggest:

make ARCH=m68k CROSS_COMPILE=m68k-linux- m5208evb_defconfig

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
