Received: from cmsout02.mbox.net ([165.212.64.32])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0l5V-000295-59
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 14:04:37 -0400
Message-ID: <053c01c48c60$4976ad80$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc><045201c48c4b$8407dc40$fd0ba8c0@briantpc>
	<Pine.LNX.4.61.0408271203050.2901@xanadu.home>
Date: Fri, 27 Aug 2004 13:04:24 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> No, they aren't equivalent.
>
> >From linux/asm-i386/bitops.h in 2.6.8:
>
> /**
>   * __ffs - find first bit in word.
>   * @word: The word to search
>   *
>   * Undefined if no bit exists, so code should check against 0 first.
>   */
> static inline unsigned long __ffs(unsigned long word)
> {
>          __asm__("bsfl %1,%0"
>                  :"=r" (word)
>                  :"rm" (word));
>          return word;
> }
>

Ok,

So MTD is no longer compatable with the current 2.4 tree?  I just unpacked
it and didn't see it in linux/asm-i386/bitops.h .  Am I looking in the wrong
place?

-Brian
