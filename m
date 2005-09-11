Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EEQIo-0003fT-1V
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2005 07:47:29 -0400
Date: Sun, 11 Sep 2005 13:46:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050911114642.GA11788@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
	<43210C7A.60109@ak.jp.nec.com>
	<20050909072416.GA19251@wohnheim.fh-wedel.de>
	<43225DEB.4070809@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43225DEB.4070809@ak.jp.nec.com>
Cc: James Morris <jmorris@redhat.com>, Ma Yun <sx_yunma@hotmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 10 September 2005 13:15:39 +0900, KaiGai Kohei wrote:
> 
> >Most likely this idea is stupid, but let me have a try anyway.  You
> >could give your xattr/xref objects an inode number - either one per
> >object or a special one shared for all xattr/xref objects.  That would
> >open a new bag of worms, but keep the size down.
> >
> >Would it be possible to work with such an approach?
> 
> It accompanies a so big remodeling, and hope not to do so, if possible.
> 
> I think it is important here to be able to distinguish three kinds of
> raw_node by a reasonable method (1. existing raw_node_ref of inode,
> 2. existing raw_node_ref without inode, 3. new raw_node_ref for XATTR),
> and to be able to refer from the third type of raw_node to
> the jffs2_xattr_(cache|ref) objects.

Yes.  1 and 2 are currently distinguished by next_in_ino being either
either valid or NULL.

> I noticed an idea to resolve it.
> Any objects refered by the last next_in_ino are allocated by slab.
> If we can use kmem_ptr_validate() function, we can discriminate whether
> this pointer indicate xattr_cache/ref or not. Then, we can keep the
> size of jffs2_raw_node_ref.
> (the member of 'owner' will go anyware.)

Sounds scary.  But in principle, you are right.  In case of either 1
or 3, we attach "something" to next_in_ino.  Now we only have to
decide whether "something" is an inode, or the new xattr-struff.

If you add an extra field to jffs2_inode_cache (which also is grossly
misnamed, old mistake), you can do so.  And since inodes are a lot
less frequent than raw nodes, the memory consumption should have
improved quite a bit.

Or you could play some magic like reserving ino 0xffffffff for
xattr_object, 0xfffffffe for xattr_ref, etc. and simply decide by
jffs2_inode_cache->ino having one of the magic numbers.  Then you
would need the extra field only for xattr_obj or xattr_ref.

> The issues of this method are as follows:
> - If there is an adverse effect by existing of non-inode raw_node_ref
>   whose next_in_ino is not NULL, I must resolve this.

Yep.

> - It's necessary to discuss in LKML, since this function is not
>   EXPORT_SYMBOL()ed for kernel loadable modules currently.

Where it won't receive a lot of love.  Do it with some variant of what
I outlined above.

> >>>By itself, this code is not too bad.  But it add a little more crap to
> >>>a function that is aching for a rewrite already.  Not sure.
> >>
> >>Hmm,,, I wrote the above part of codes with referring to existing code.
> >>If the policy is shown, I'll follow it. How should I do ?
> >
> >
> >In a perfect world, you should send a cleanup patch to break
> >jffs2_scan_eraseblock() into several smaller functions.  Have the
> >xattr patch depend on the cleanup.  I might still have an old patch
> >that I could send you for inspiration.
> 
> I have developed this functionality based on mtd-snapshot-20050829.
> It means I should develop this based on mtd-snapshot-XXXX + your
> cleanup patches, isn't it?

No.  You should develop two patches based on current cvs:
[PATCH 1/2] Cleanup of jffs2_scan_eraseblock()
[PATCH 2/2] xattr for jffs2

And you may or may not use my previous attempt as a basis, that's your
decision.

If you simply added further mess to jffs2_scan_eraseblock(), as you do
today, people will see horrible code become even worse.  Who likes
that?
If instead you do a cleanup first, people will see that you helped
make the function much more readable and maintainable.  Anyone
objecting your merge will have a tough time arguing now.

> >Next question: How do you remove the xattr from medium?  How is it
> >garbage collected?
> 
> If my understanding is not wrong, an obsolete XATTR or XREF node
> is garbase collected as raw-node which does not have inode.
> (Becase next_in_ino of XATTR/XREF node is NULL.)

Ah, yes.  Makes sense now, even to stupid people like me.

> >Then why is it required that JFFS2 knows the prefix?
> 
> A permittion checking policy depends on XATTR's prefix.
> For example, only an user has CAP_SYS_ADMIN capability
> can read/write "trusted.*" xattr.  In the "security.*"
> prefix case, this checking was done in LSM module.
> Therefore, filesystem must know XATTR's prefix.

This is just wrong.  I agree that something inside the kernel must
know whether users need specific capabilities to read/write the xattr.
Sure.  But why in hell does it have to be JFFS2?

How do other filesystems deal with this?  ext[23] and reiserfs (v3)
all have xattr, I believe.

> >Still, you can take it as an indication that your reuse-old-fields
> >trick is not obvious to new readers.  A comment explaining this would
> >be useful.  Maybe you already have it further down, in the part I
> >didn't review yet.
> 
> Sorry for tricky coding without comments. I'll pay attention of such
> coding style.

Thanks.  This is one of the reasons for reviews.  You, being the
author, have a bad judgement about what people new to the code can
and cannot easily understand.  You're not new to the code. ;)

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
