Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JDHqy-0000uY-2I
	for linux-mtd@lists.infradead.org; Fri, 11 Jan 2008 11:15:18 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1763435wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Jan 2008 03:15:10 -0800 (PST)
Message-ID: <f17812d70801110315l545d4a6eu89a0cc775d505278@mail.gmail.com>
Date: Fri, 11 Jan 2008 19:15:10 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Subject: Re: [PATCH] basic pxa3 nand controller support
In-Reply-To: <loom.20080107T001557-159@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <f17812d70712201756h501a80cch8305d40fa479f5cf@mail.gmail.com>
	<loom.20080107T001557-159@post.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jan 7, 2008 8:23 AM, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> eric miao <eric.y.miao <at> gmail.com> writes:
>
> > Early feedback is welcome, thanks!
>
> Hi Eric
>
> Overall the patch looks good, just a few comments.
>
> The patch does not apply cleanly unless I remove the spurious newline before
> line 1284 resulting in the following error:
> patch: **** malformed patch at line 1284: pm_message_t state)
>

I might have modified the patch directly, but not sure. Git will
complain but plain
"patch" should work.

> The DRCMR97 register is not defined anywhere, at lest not in 2.6.24-rc6:
> drivers/mtd/nand/pxa3xx_nand.c:542: error: 'DRCMR97' undeclared (first use in
> this function)
>
> The registers and bit definitions should be moved to pxa-regs.h, not?
>

right, but the trend is not to introduce too many DRCMRxx register definitions
into pxa-regs.h, use DRCMR(xx) is more preferred, so you can modify that
to DRCMR(97) please.

> I had my troubles getting it to work on a custom PXA320 board. I kinda figured
> out what platform data it needs, but still can't seem to get it to work properly:
> pxa3xx-nand pxa3xx-nand: failed to detect flash
>

pxa320 may be connected to external NAND flash, which the driver does not
yet support (only those __builtin_xxx are supported for now), sigh, the reason
is a long story

You may let me know the NAND flash type, so I can check with the driver.

> What kernel does your patch apply to? What CPUs/boards did you try it on? Can
> you provide an example platform integration required to make it work?
>

zylonite/pxa{300,310}, both work. Yes, I'll post the remaining patch next week,
hopefully.

> Cheers
>
> Marcel
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Cheers
- eric
