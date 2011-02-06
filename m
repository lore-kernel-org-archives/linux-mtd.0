Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm769-00017v-I5
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 16:04:26 +0000
Received: by ewy20 with SMTP id 20so1806691ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 08:04:23 -0800 (PST)
Subject: Re: JFFS2: truncated files after power loss scenario
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sven <svenjaborek@gmx.de>
In-Reply-To: <1297007247.2084.36.camel@hbox>
References: <1297004384.2084.9.camel@hbox>
	<1297005925.4460.41.camel@localhost>  <1297007247.2084.36.camel@hbox>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 18:03:30 +0200
Message-ID: <1297008210.4460.71.camel@localhost>
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

On Sun, 2011-02-06 at 16:47 +0100, Sven wrote:
> Hi
> 
> > > I took a look at this, because we have seen a truncated configuration file once. I'm not sure what caused this. Perhaps a power loss during write.
> > 
> > How big was this file?
> 
> 9445 bytes.
> 
> > > I wonder about the Inode #42 Version 5 to 9 and about why two Dirent exist(ed) for #ino 42.
> > > Do you think this was caused by a power loss scenario?
> 
> > Please, give more information:
> > 
> > 1. Your flash type, if NAND - page size.
> 
> Need to check this. Page size is 128k i think.

That's eraseblock size, PAGE size must be 2KiB in your case.

> > 2. What do you do to the file in your test - how exactly you change it.
> 
> I did two tests.
> First one is a bash script running an endless loop. It creates new files
> over and over by copying the 9445 bytes size file every time with a new
> filename.
> A power loss with this script running always produced the truncated last
> file. It had the size of 4k or 8k then.

Then it is expected I guess. Your I bet your script opens the file,
truncates it, then writes to it. So when you have a power cut, you can
find your file truncated to 0, 4, or 8KiB, of 9445 bytes. In your case
JFFS2 writes in 4KiB pieces (maximum it can do), this is why you see 4
and 8 KiB.

> The second test reflects more our simple use case. A C-program which
> uses fopen with "w+", and then uses GLib GKeyFile operations to modify a
> key and then store the file again. An fclose follows of course.

I believe your library is truncating the file as well. You can check
this with strace.

If you write a program which just overrides the file without truncation,
you won't see truncations. But of course, yous will see inconsistent
file contents containing, say, 4KiB of new data, and the rest is old
data.

The bottom line is that it is difficult to fix broken applications by
changing JFFS2. The right way to update configuration files is described
here:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change

> Please, could you say something general about what the journaling in
> jffs2+nand should be able to do about power loss scenarios? I could not
> find specs about that.

Oh, no, but JFFS2 is very simple FS. It is almost 100% synchronous, only
last 2KiB are cached in the write-buffer. Se basically, if you cut power
at any point, the maximum you can lose is the last written 2KiB. The
rest is on the flash and cannot be lost.

But any app which relies on this is bad and not portable.

Ask specific questions please.

Please, read this UBIFS piece of doc about proper apps behavior and
expectations about the file-systems:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

There are many docs in the Internet as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
