Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PntZI-00077N-EA
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 14:01:53 +0000
Received: by wwb17 with SMTP id 17so2550271wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 06:01:50 -0800 (PST)
Subject: Re: JFFS2: truncated files after power loss scenario
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Albrecht =?ISO-8859-1?Q?Dre=DF?= <albrecht.dress@arcor.de>
In-Reply-To: <1297017610.1854.3@antares>
References: <1297017610.1854.3@antares>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 16:00:41 +0200
Message-ID: <1297432841.2760.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sven <svenjaborek@gmx.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sorry for delay, I was very busy.

On Sun, 2011-02-06 at 19:40 +0100, Albrecht Dreß wrote:
> Unfortunately, they are more more about ubi & ext4, but I am in
> particular interested in JFFS2's behaviour, so please excuse my
> questions, but it's a really critical point...

OK, but you do realize that proper portable applications should not rely
on JFFS2-specific behavior.

Also, if this is crucial for you, you should not generally rely on the
answer of a random mailing list guy like me, of course :-)

>   Currently, I use the following sequence to write my configs to jffs2
> (both NOR flash and mtd-ram):
> 
> open(scratch, O_RDWR | O_CREAT | O_TRUNC, perms);
OK, if scratch existed, at this point you truncate it. The change goes
to the JFFS2 write buffer. And the write-buffer is flushed by time-out,
or if some other app wrote anything else to the file-system, of if
someone issued sync.

So if power cut happens, you may either end up with intact "scratch" or
with "scratch" truncated to zero.

If you do not want it, you have to first copy "scratch" to
"scratch_saved" and 'fsync()' "scratch_saved".

> write();

OK, you write to "scratch". What is your flash? NAND, NOR? In case of
typical 2KiB per page NAND, you can lose the last 0-8KiB of written data
in the worst case. Not sure how much, depends, and I do not remember the
details well enough.

> fsync();

OK, if you get a power cut now, you are safe, you'll have modified
"scratch".

> close();

Not necessary to do, but does not hurt. 'fsync()' was enough.

> sync();		// #1

The same, not needed. You fsync()'ed "scratch" already.

> rename(scratch, realname);

Now if you have a power cut, you'll either have "scratch" or "realname"
with correct data.

> sync();		// #2

You can just do "fsync(realname)" instead. In case of JFFS2 there is not
big difference, but if you ever migrate to another FS, there will be big
difference.

> As far as I understand the information you cited, this should be safe
> under all circumstances for jffs2.  Is that assumption correct?

Not sure what is your definition of "safe". Step 1 does truncation, I've
explained possible outcome of this above.

> As calling sync() might be a lot more expensive than fsync() if other
> file systems are used simultaneously (I have a vfat fs on a CF card
> open), my question is now if I can safely omit either sync() #1 or #2
> or both?

You do not need 'sync()' #1 at all. And 'sync()' #2 may be turned into
'fsync(realname)'.

> When reading, I first try realname, and if that fails scratch, as to
> cover the case that rename() was killed in mid-air so realname has
> already been removed from the directory, but scratch is still there.
> Can this case happen at all for jffs2?

I think this can happen, AFAIR, rename will just do the change and put
it to the write-buffer, or you can have a power cut while doing re-name.

But you are not safe at the open(O_TRUNC) and write() stages.

I explained the steps of the reliable file (e.g., config file) update
here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change

You can read about UBIFS write-buffer here (JFFS2 write-buffer is almost
the same, but there is only one write-buffer in JFFS2):

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuffer

I mean, the concept is the same, we borrowed it from JFFS2.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
