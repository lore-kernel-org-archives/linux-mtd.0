From: David Woodhouse <dwmw2@infradead.org>
To: rhea@matrix-vision.de
In-Reply-To: <200401271413.09390.rhea@matrix-vision.de>
References: <Pine.LNX.4.31.0401271245140.5630-100000@phoenix.one.melware.de>
	 <200401271413.09390.rhea@matrix-vision.de>
Content-Type: text/plain
Message-Id: <1075210722.1633.77.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 13:38:43 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Armin <armin@melware.de>
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 14:13 +0100, Howard Gray wrote:
> Sorry, I missed this posting originally, otherwise I wouldn't have top posted. 

You weren't top-posting, were you? By 'top-posting' I refer to the
abominable practice of writing a confusing upside-down mail, by placing
your own reply _above_ the mail to which you're replying. It's generally
accompanied by quoting a _complete_ copy of the original mail, rather
than only those parts which are needed for context. 

> I have also seen the problems you mentioned. Please see my mail "Problem 
> deleting files with NAND/JFFS2 and a possible solution" posted today. The 
> "solution" appears to cure these problems too, at least for me.

It should do, yes.

> Garbage collection is started by the kupdated/bdflush daemon or when
> there are not enough free blocks to carry out another file operation
> or by the sync command.

Also by the dedicated JFFS2 kernel thread, to make space for new writes
slightly ahead of time, before we actually have to garbage collect in
the context of a process which is attempting to write.

>  Or you can kick it by sending SIGHUP to the GC process. But in your 
> case the GC won't clean up your bad blocks until some other file really needs 
> the space, so it doesn't matter how long you wait. You could try filling up 
> your FLASH with data and then erasing it again. That'll do it. 

I'm thinking of prioritising the blocks we complain about, so they get
garbage collected sooner despite the fact that they haven't really got
much space wasted in them. It is purely a cosmetic issue though.

> Older versions of the GC were started by a 2 second timer but that seems to 
> have been abondoned in favour of kupdated (but you can still find some 
> refrences to it in the code, which foxed me for a while...).

Patches accepted :)

-- 
dwmw2
