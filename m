Received: from modemcable166.48-200-24.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0jEN-0001sz-LR
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 12:05:36 -0400
Date: Fri, 27 Aug 2004 12:05:31 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Brian T <btuch@usa.net>
In-Reply-To: <045201c48c4b$8407dc40$fd0ba8c0@briantpc>
Message-ID: <Pine.LNX.4.61.0408271203050.2901@xanadu.home>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
	<045201c48c4b$8407dc40$fd0ba8c0@briantpc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Aug 2004, Brian T wrote:

>> drivers/mtd/mtdlink.o: In function `cfi_intelext_partition_fixup':
>> drivers/mtd/mtdlink.o(.text+0x76c6): undefined reference to `__ffs'
>> make: *** [vmlinux] Error 1
>>
>
> Hmmm,
>
> Looks like _ffs is defined in :
>
> [root@Smog include]# grep -l -r "__ffs" *
> asm-ia64/topology.h
> asm-ia64/bitops.h
> asm-ppc64/bitops.h
>
> but in asm-i386/bitops.h it is defined as ffs()
>
> So, should there be a macro rule for ffs->__ffs for compiling for i386?

No, they aren't equivalent.

>From linux/asm-i386/bitops.h in 2.6.8:

/**
  * __ffs - find first bit in word.
  * @word: The word to search
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
static inline unsigned long __ffs(unsigned long word)
{
         __asm__("bsfl %1,%0"
                 :"=r" (word)
                 :"rm" (word));
         return word;
}


Nicolas
