Received: from [61.30.80.237] (helo=serversw.iei.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALk4J-00054G-RS
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 14:09:32 +0000
Message-ID: <018301c3ad14$07225eb0$f80a10ac@rdkevinliaonb>
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <013301c3acf4$8d3033d0$f80a10ac@rdkevinliaonb>
	<1069065133.4490.53.camel@hades.cambridge.redhat.com>
Date: Mon, 17 Nov 2003 22:06:42 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Garbage collection problem for nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

But I did not saw such messages when I used the mtd snapshot 20030720 (I
just updated from snapshot 20030720 to 20031112). I also compared the gc.c
with these two snapshots. But I did not found obvious difference in the
functions that issue the complaint, that is jffs2_find_gc_block and
jffs2_garbage_collect_pass. Therefore I still doubt that there may be
something I did wrong. If the mtd utilities I used were based on snapshot
20030720 but the kernel was 20031112, is it possible for such a situation to
happen? Did you have any other suggestion? Thanks a lot.

Regards,
Kevin

----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Kevin Liao" <kevinliao@iei.com.tw>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, November 17, 2003 6:32 PM
Subject: Re: Garbage collection problem for nand flash


> On Mon, 2003-11-17 at 18:21 +0800, Kevin Liao wrote:
>
> > jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they
all?
> > jffs2: Couldn't find erase block to garbage collect!
> >
> > It seems that the file content is still correct. Does anyone know what's
> > wrong with it? Thanks a lot.
>
> It's a harmless complaint which can probably just be disabled. A short
> while after you write to the flash, we decide to flush the write-buffer.
> We prefer to do that by garbage-collection rather than just by padding
> it out with zeroes.... but as the message says, there's nothing to GC
> from. So we pad it instead.
>
> -- 
> dwmw2
>
>
