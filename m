Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HZrJ-0002cE-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2001 00:45:33 +0100
Date: Wed, 4 Jul 2001 01:53:00 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: MTD for Linux <linux-mtd@lists.infradead.org>
cc: Kyle Harris <kharris@nexus-tech.net>, Vipin Malik <vipin.malik@daniel.com>
Subject: On the "safe filesystem" and write() topic
In-Reply-To: <3B32645D.BF65C965@nexus-tech.net>
Message-ID: <Pine.LNX.4.21.0107040109450.16799-100000@godzilla.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I designed the JFFS specifications, log layout and GC method in the first
place and me and Finn put a lot of thought into it while implementing so
please consider some of these late night ramblings:

The initial requirement was that a small partition of configuration files
(the /etc directory to be more specific) should be able to reside in flash
and be completely safe from inconvenient power-outs or crashes.

It is my opinion (of course) that JFFS solves this in a manner as good as
possible given the standard Linux VFS API. This means that when you
rewrite a configuration file, you write the new one to another file and do
a rename over the old once you're ready. Technically JFFS is based on a
log structure consisting of VFS operations, and this is the best you can
do while not involving the application more than what standard VFS gives
you. VFS operations are not "transactions" in the high-level sense though.

In our embedded products this is handled by a configuration handling
daemon similar to linuxconf, which caches parameters and knows how to
rewrite configuration files atomically (just like any other sane Unix
program does it). There is no need for any transactional semantics for
small configuration files. We sell a lot of these products and I certainly
disagree with Vipin's comment on his website that it's impossible to use
JFFS in embedded products :) Log-files are not usually kept in flash and
if they are they don't need anything more advanced than normal rotation
and if a crash occurs, it's no big deal if the last line gets cut off
completely or in the middle...

It is difficult (if not impossible) in any consistant way to handle the
case with random write()'s inside an already existing file. The filesystem
needs to "roll back" to any pre-existing state but it then needs to
know what the desired state would be. What we do now is make sure the
filsystem itself is never corrupt even if a file was under writing.

The problems arise from the vague definition of what the desired state
would be - is it the data before the last write(), and what happens if you
receive a signal ? Writes to mmap'ed pages can't use that mechanism, and
you'll be stuck with using write()'s when you really probably want to use
libc wrappers like fwrite and fprintf.

I agree that if you need a binary database which is big so that you cannot
rewrite it when you update something, you'll need to rethink. Either just
split the database in smaller files, or you'll need a transaction marker
API down to the filesystem (an ioctl pair was suggested somewhere I
think). I don't think trying to tweak write() would lead to anything
generally useful though.

The kernel-level transactional extension would probably be quite difficult
to get consistent also, because Linux VFS does not know about it yet (this
is eventually changing with the integration of the general journalling
layer I guess). I get a headache thinking about it, perhaps it's possible
perhaps it's not; perhaps this code already exist in the other journalling
filesystems, perhaps it does not.

With regards to Kyle's question below though, the answer is certainly that
he can do as he says but use the rename() operation and keep them on a
single partition. There is no need for anything more advanced.. 

(All this assumes other more technical problems are solved of course like
the nasty surprises we've had with some flashes getting bits halfway
erased...)

/BW

On Thu, 21 Jun 2001, Kyle Harris wrote:
> I've read thru several posts and Vipin's jffs_guide. It appears that
> JFFS, at his time, is about the most reliable open source fs for
> embedded systems, even though it still has some problems. When JFFS
> fails, is the filesystem still usable? My question is this. What if you
> save only a small datafile (< 1K) and write it alternately to 2
> different JFFS partitions (or even the same partition). At boot, you
> read from both and get the latest, valid copy. This way if one is bad
> you still have a backup. How reliable would this be? 
