Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jn37G-0000mB-2q
	for linux-mtd@lists.infradead.org; Sat, 19 Apr 2008 02:47:50 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1170553wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Apr 2008 19:47:48 -0700 (PDT)
Message-ID: <6934efce0804181947s16bd8874uf17b3528c8dab229@mail.gmail.com>
Date: Fri, 18 Apr 2008 19:47:48 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?UTF-8?Q?Anders_Grafstr=C3=B6m?=" <grfstrm@users.sourceforge.net>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
In-Reply-To: <48091C7A.1070709@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4807B552.7090501@users.sourceforge.net>
	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
	<20080418163536.GD31520@shareable.org>
	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
	<48091C7A.1070709@users.sourceforge.net>
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > A solution might be an small delay before a
> > write suspends the erase.
> >
>
>  udelay(100) right before the suspend command seems to work for me.
>  It reduces the suspend count to about 1700 and no errors reported
>  by JFFS2.

good.

Not sure how/if that sort of fix can be merged.

So you didn't see this kind of problem with older kernels?

>  I ran this routine in a standalone test program from u-boot:
>
>  void test_flash_erase_suspend(void)
>  {
>  }
>
>  The delay loop doing 3500 loops seems to be the critical one.

Interesting.  I'm going to talk with some people...

>  Most of the time I get something like this, which I assume
>  means 'Operation abort'.
>
>  Status 00a000a0

Yes, bit 5 is erase error.  You've got to expect data to be bad under
those circumstances.

>  Status 00a00080
>  aa690000

you have 2 parts in parallel, right?  So the chip on the high order
word is expected to be garbage, erase error and all.  But the lower
word chip confuses me, that shouldn't happen.

Alexey, what do you think?
