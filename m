Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Je2zu-0003W3-S7
	for linux-mtd@lists.infradead.org; Tue, 25 Mar 2008 06:51:03 +0000
Subject: Re: Powerfail-tests and jffs2-sync-mount
From: "Schlaegl Manfred jun." <manfred.schlaegl@gmx.at>
To: dedekind@infradead.org
In-Reply-To: <1204877376.23706.73.camel@sauron>
References: <1204821719.3426.33.camel@lisa.alm.archives.at>
	<1204870246.23706.53.camel@sauron>
	<1204875955.3476.13.camel@lisa.alm.archives.at>
	<1204877376.23706.73.camel@sauron>
Content-Type: text/plain
Date: Tue, 25 Mar 2008 07:50:58 +0100
Message-Id: <1206427858.3555.12.camel@lisa.alm.archives.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Little late, I know..

Am Freitag, den 07.03.2008, 10:09 +0200 schrieb Artem Bityutskiy:
> On Fri, 2008-03-07 at 08:45 +0100, Schlaegl Manfred jun. wrote:
> > > > Now my question: Are there any non-obvious disadvantages, mounting jffs2
> > > > synchronal, except lower speed and a little(depends on usage) decreased
> > > > flash-life-time (wear-out), or is this anyway the default approach?
> > > 
> > > My understanding of the things is that this should not really matter. I
> > > thought if you have some corruption in asynchronous mode, you should
> > > have them in synchronous too, may its worth trying more synchronous mode
> > > testing?
> > > 
> > I thought it's a matter of file-buffers between the file-operations and
> > jffs2, but these buffer should be flushed on close of the file, so there
> > should be no problem with echo.
> > I think i've to take a look on vfs, perhaps there is some buffering, or
> > (even worst) some reodering of actions.
I did similar tests again, and now I detected no more file-errors or
inconsistencies with async mount. The problem on my oppinion was, that I
analized the fs by taking an image of the real nand-flash(2.6.12), and
analized it with nandsim(2.6.18).
Now I analized the filesystem directly and there were no more errors &
inconsistencies. 

> 
> Actually JFFS2 is synchronous from VFS's point of view. It does not have
> write back for pages and inodes, and every time VFS asks to write
> something, JFFS2 just writes straight away, without any postponing.
> 
> But, JFFS2 has its small internal buffer. Design-wise, it sits somewhere
> at the bottom level of JFFS2, just before the I/O level.
> 
> The buffer (so-called write-buffrer) has size equivalent to NAND page
> size. I think it is 2048 bytes in your case. 
(I've 512 byte pages.)
> All writes go to this
> buffer, and when it becomes full, it is flushed to the flash. This is a
> optimization which makes sure JFFS2 does not waste too much space,
> because without the buffer it would waste space up to the next NAND page
> on each write.
> 
> Thus, when you mount the FS with -a sync, it should flush the write
> buffer every time before returning to user-space.
Instead of a sync-mount I will use a sync-open on critical logfiles. It
should keep the logfile without write-buffers, so that I'll get very
actual logfiles, in case of powerfail.
> 
> So, basically, returning to your original question - there should not be
> too much difference, but I'd expect synchronous mode to be slower. E.g.,
> compare:
> 
> time dd if=/dev/zero of=file
> time tar -xf many_small_files_inside.tar
> 
> on sync and async mounts.
yes, it's a bit slower in case of many "small" writes.

Thank you very much for your help.

Best regards
	Manfred
