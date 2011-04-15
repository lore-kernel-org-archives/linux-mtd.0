Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAit9-00072q-Fg
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 13:16:44 +0000
Received: by ewy3 with SMTP id 3so874453ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Apr 2011 06:16:41 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
In-Reply-To: <BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Apr 2011 16:13:46 +0300
Message-ID: <1302873226.3220.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-15 at 17:23 +0800, Nicholas wrote:
> Dear Artem,
> 
> Thanks for the information. Indeed it has flexibility to be freed or consumed.
> Due to my case, i need to use maximum memory space while in the
> meantime i also need to write files into nand via ubi.
> 8KB page of nand flash will consume 16MB for a single volume on a
> single UBI MTD.
> 
> 1. Is there any idea to reduce the memory consumption ?

Yes. The main idea is as I described: both UBI and UBIFS have several
multiple PEB-size buffers at attach/mount time. I did not count them,
but I think there may be about 6 of them. All these buffers are
allocated using vmalloc(), so you can easily fine all of them, because
'vmalloc()' is used only for those buffers.

And the basic idea is to not pre-allocate them, but allocate only when
they are needed. This is the first step you can try to do to see how
much you can gain.

E.g., in ubi.h I see the following buffers to optimize:

 * @peb_buf1: a buffer of PEB size used for different purposes
 * @peb_buf2: another buffer of PEB size used for different purposes

In UBIFS

 * @ileb_buf: buffer for commit in-the-gaps method
 * @orph_buf: buffer for orphan nodes
 * @sbuf: a buffer of LEB size used by GC and replay for scanning
 * @lpt_buf: buffer of LEB size used by LPT

May be there are other buffers. I'm sure these all buffers are not
needed simultaneously, may be max. 2-3 of them may be needed
simultaneously sometimes.

And there are many smaller buffers which are pre-allocated with
kmalloc() - you can also try to allocate them on the need only.

But if the allocation fails - you are screwed :-) But this can be
mitigated - there are several ways.

> 2. For smaller buffer allocation, can it be made for several attempts
> of read / write ?

Yes, I believe in many places this is possible. But this is a bit more
difficult to do.

We have another problem - some drivers do not like vmalloc()'ed buffers
because many arm platforms cannot do dma if the buffer was vmalloc()'ed.

So the idea is to switch from vmalloc(PEB_size) to kamalloc() an array
of pages and to vectored I/O (iovec). And in many places you do not
really need RAM for whole PEB, you man allocate smaller buffer and then
iterate and do one small piece of job at the time.

Anyway, you can certainly imporve UBI/UBIFS. It'd be interesting to help
you, but I have no time, and my priority is to solve the unstable bits
problem now. But I can help you by advising and reviewing your work if
you are serious about this.

So, again, if you are serious, start with UBI because it is simpler and
try to see where you can save RAM. Make some patches and send.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
