Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZ9yU-0002hO-SU
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2018 07:39:32 +0000
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [bug report] Got "read_pnode: error -22 reading pnode" during
 ubifs mount
Date: Tue, 18 Dec 2018 08:39:13 +0100
Message-ID: <1573903.SDKNkj1vxS@blindfold>
In-Reply-To: <762a7385-0caf-9a5a-ff62-603452fb1bd1@huawei.com>
References: <402695c6-7ba9-abe9-4ccd-ea598ea2511e@huawei.com>
 <1744858.UbCnKIVnxf@blindfold>
 <762a7385-0caf-9a5a-ff62-603452fb1bd1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 18. Dezember 2018, 02:18:22 CET schrieb Hou Tao:
> > The thing is, a fsck.ubifs cannot recover a failed filesystem (failed due to a bug).
> > It may be able to bring it back in a mountable shape but user data will be lost
> > in any case.
> > In your case, the corrupt LPT is not the root cause, recreating it from scratch
> > will not solve anything.
> > 
> Recreating it may will not solve anything, but how about making its space free again
> or trimming the dirty space to a legal valid. I think loss of some data is much more
> acceptable than making the system stop working.

This sounds much more easier than it is.
How can you know that only the LPT is bad?

Such a tool will never provide a fix, all it does it delaying the time until your QA
notices that something is odd.

> >> We have checked ubifs_change_lp() and found it doesn't check whether or not
> >> the new free space or dirty space is less the leb_size, and we will add these
> >> checks during reproduction first.
> >>
> >> So any direction or suggestion for the reproduction & the solution ?
> > 
> > If you are using xattrs, please give the attached patch series a try.
> > This is my current work.
> > 
> > Patchs 1/4 and 2/4 fix the xattr problem. 3/4 and 4/4 enforce new rules
> > for xattrs. Before that, UBIFS supported up to 2^16 xattrs per inode and tried
> > to be smart. It assumed that upon journal replay it can lookup the position of
> > all xattr inodes from the TNC. Since these TNC entries can get garbage collected
> > in the mean while, it fails to find them and the free-space accounting (LPT)
> > goes nuts.
> > 
> I found another fix related with xattr and journal replay: 1cb51a15b576
> "ubifs: Fix journal replay wrt. xattr nodes". It seems that both this fix
> and your new patches are fixing the same problem, right ?

No, these are completely different issues.

> I still don't understand how the free-space accounting is influenced by
> the GC-ed index nodes, could you elaborate on the procedure ?

If you look at the journal reply code you'll see that UBIFS fixes up the free space
accounting.
This is because the counters are allowed to be incorrect, as long UBIFS can fix them
upon replay.
As far as I understood the problem, the fixup code will fail if xattrs can no longer be
located.

> > One solution is to insert xattr inodes also to the journal.
> > Hence the number of xattrs is now stricter limited.
> > On a typical NAND still more than 100...
> > I plan also to add a new xattr-deltion-inode to support deleting xattr inodes
> > in bulk, but this needs changes to the on-disk format.
> >Yes, it will a write-incompatible fix, but can we make the old kernel mounts
> the new images as read-only ?

Sure can we. But this will users still unhappy.

> > One open question is, what to do with UBIFS filesystem which have already more xattrs
> > per inode than the new limit allows?
> Maybe the user can be instructed to use a user-space utility to remove these extra xattrs ?

How would you do this in the field?

Thanks,
//richard
