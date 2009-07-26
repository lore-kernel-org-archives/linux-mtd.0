Received: from mail2.shareable.org ([80.68.89.115])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MV9Ho-00013a-UI
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 19:21:37 +0000
Date: Sun, 26 Jul 2009 20:21:25 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS robustness questions
Message-ID: <20090726192125.GC12916@shareable.org>
References: <200907241600.54640.manningc2@actrix.gen.nz>
	<4A695819.7000705@nokia.com> <4A697DCC.2010302@nokia.com>
	<4A6986FC.6070006@nokia.com> <20090724233936.GP27755@shareable.org>
	<4A6BF7C1.8090405@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A6BF7C1.8090405@nokia.com>
Cc: Charles Manning <manningc2@actrix.gen.nz>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Jamie Lokier wrote:
> >Adrian Hunter wrote:
> >>Sorry to drag this out but it seems like it can be done with symlinks
> >
> >That's right.  It should be powerfail safe.
> >Don't forget to "rm -fr version1" at the end :-)
> >
> >However, if you are looking to use this for atomic update of a
> >directory while there are programs still running which use the
> >directory, it won't work.
> >
> >You can't delete the old directory, because programs might still be
> >inside it...
> 
> Are you sure about that.  I can do this:
> 
> / # mkdir test2
> / # cd test2
> /test2 # cp /bin/bash .
> /test2 # ls -al
> drwxr-xr-x    2 root     root          224 Jan  3 22:20 .
> drwxrwxrwx   25 root     root         1768 Jan  3 22:20 ..
> -rwxr-xr-x    1 root     root       612764 Jan  3 22:20 bash
> /test2 # ./bash -c "sleep 30;echo Done" &
> /test2 # rm bash
> /test2 # cd ..
> / # rmdir test2
> / # ps | grep bash
> 1261 root      2500 S    ./bash -c sleep 30;echo Done 
> / # 
> / # 
> / # Done
> 
> [2] + Done                       ./bash -c "sleep 30;echo Done"

(By the way, Linux has not always allowed an empty but in-use directory
to be rmdir'd, but it does these days).

What I mean is, you can delete the old directory, but it's not always
safe because you might break programs which are depending on the
directory's contents when you do.

For example:

$ mkdir dir1
$ echo "message1" > dir1/message
$ ln -sfT dir1 new
$ mv -T new current

$ sh -c 'cd current; while :; do cat message > /dev/ttyAM0; sleep 1; done' &

==> Writes "message1" to the serial port every second.

$ mkdir dir2
$ echo "message2" > dir2/message
$ ln -sfT dir2 new
$ mv -T new current   # Looks atomic

==> Still writes "message1" to the serial port every second.
==> Maybe that's ok, maybe not.

$ rm -fr dir2         # Old version, no longer in use?

==> The background script Writes "File not found" error every second...
==> Clearly not ok.

If the script is written differently as

  $ sh -c 'while :; do cat current/message > /dev/ttyAM0; sleep 1; done' &

then it works better, changing the message in this example most of time.

It's not obvious, but even that version has an extremely rare race
condition: "cat current/message" does path traversal in the kernel,
which may open "current" just before the symlink changes, then (due to
preemptive scheduling or SMP) look up "message" after that's been
deleted.  It is probably very hard to trigger, but it's a race condition.

And even without that race condition, the method doesn't work in
general.  If it was reading two different files, it could easily see
one file from the old version and one file from the new version for a
moment.  The inconsistency could be harmless or fatal depending on the
application.

It's a hard problem to solve properly, unless you analyse each
application or kill each application before the change and restart
them afterwards.  In which case maybe you don't need the change to be
atomic :-)

Databases solve it with transactions, which are nice to use and
understand, but they introduces coordination problems in a different
way if they aren't used consistently and correctly.

This is why every Linux distro has occasional glitches when package
managers update a running system, and reports of things going wrong
which are too rare to fix, to transient to repeat, and go away on the
next reboot.

-- Jamie
