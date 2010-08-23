Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OncTT-0008Rf-2H
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 19:14:28 +0000
Received: by fxm12 with SMTP id 12so3983828fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 12:14:26 -0700 (PDT)
Subject: Re: Mounting UBIFS readonly - is it really readonly?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sergei Zhirikov <sfzhi@yahoo.com>
In-Reply-To: <752212.66527.qm@web112313.mail.gq1.yahoo.com>
References: <752212.66527.qm@web112313.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 22:14:21 +0300
Message-ID: <1282590861.16502.104.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2010-08-23 at 11:33 -0700, Sergei Zhirikov wrote:
> I made the changes you suggested earlier to see if/when something is
> written and the results were quite unexpected. Just as I assumed,
> UBIFS remains mounted read-only all the time. But contrary to what I
> expected, none of the functions related to writing is ever called.
> Nevertheless, the timestamp still changes.
> 
> I have also managed to reproduce the issue without involving system
> reboot. If I create a device node equivalent to /dev/console (major 5,
> minor 1) in any directory (on the root UBIFS) and then remount the FS
> read-only, the timestamp of the device node keeps changing upon any
> write operation to the device. The same thing happens when I
> try /dev/tty (major 5, minor 0), but with /dev/null (1,3) or /dev/zero
> (1,5) the timestamp does not change.

This suggests this is not VFS but tty-specific.

> I'm now even more puzzled than I was in the beginning. It looks like
> the VFS decides to update the timestamp for some reason, but does not
> pass that change to UBIFS (perhaps, because it knows the latter is
> read-only). So the updated timestamp exists only cached in memory and
> is never actually written to the FS. I haven't tried to verify that
> theory yet (which shouldn't be difficult).

It's late here and I'm heading to the bed, but while passing by my
computer I've quickly took a look and I can see the following in
drivers/char/tty_io.c:

tty_write() cales do_tty_write() which changes mtime:

inode->i_mtime = current_fs_time(inode->i_sb);

So it looks like this is a feature - ever write to /dev/console changes
mtime. It looks like [amc]time for device nodes are not always FS inode
times, but they may belong to the _driver_ which is represented by the
character device. I guess tty is just very special and this might be
just legacy stuff.

I might be mistaking though, good night :-)

Artem.
