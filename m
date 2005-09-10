Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDwoE-0006hO-3Z
	for linux-mtd@lists.infradead.org; Sat, 10 Sep 2005 00:17:58 -0400
Message-ID: <43225DEB.4070809@ak.jp.nec.com>
Date: Sat, 10 Sep 2005 13:15:39 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>	<20050823124649.GB30853@wohnheim.fh-wedel.de>	<1124801569.29448.13.camel@hades.cambridge.redhat.com>	<430C429B.6040500@ak.jp.nec.com>
	<431E772B.9090004@ak.jp.nec.com>	<20050908194915.GG20668@wohnheim.fh-wedel.de>	<43210C7A.60109@ak.jp.nec.com>
	<20050909072416.GA19251@wohnheim.fh-wedel.de>
In-Reply-To: <20050909072416.GA19251@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: James Morris <jmorris@redhat.com>, Kaigai Kohei <kaigai@ak.jp.nec.com>,
	Stephen Smalley <sds@tycho.nsa.gov>,
	linux-mtd@lists.infradead.org, Ma Yun <sx_yunma@hotmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>>>I p a l n.
>>>
>>>I prefer a longer name.  jffs2_fs_xattr.h would be fine.
>>>jffs2_xattr.h would also, the "_fs" is more redundant that "attr".
>>
>>OK, I'll rename "jffs2_fs_x.h" to "jffs2_xattr.h" and deploy it under
>>"fs/jffs2" as David says.
>
>
> Can you rename it to xattr.h instead?  The prefix has lost its meaning
> in fs/jffs2/.

Indeed, jffs2_XXX.h under fs/jffs2 is a bit redundant.


>>>>#ifdef __ECOS
>>>>#include "os-ecos.h"
>>>>@@ -80,6 +81,7 @@ struct jffs2_raw_node_ref
>>>>	struct jffs2_raw_node_ref *next_phys;
>>>>	uint32_t flash_offset;
>>>>	uint32_t __totlen; /* This may die; use ref_totlen(c, jeb, ) below */
>>>>+	void *owner;
>>>
>>>
>>>This grows a node reference from 16/24 bytes to 20/32 bytes for 32/64
>>>bit architectures.  I'm not entirely happy about that, but don't a
>>>better solution either.
>>
>>Indeed, it's involved the growing of object size.
>>But we must discriminate XATTR node from other non-inode node
>>and indicate jffs2_xattr_cache/jffs2_xattr_ref object from this.
>>I didn't have a good idea more than this.
>>
>>And, I forgot to enclose the declaration of "void *owner"
>>by #ifdef - #endif.
>
>
> True.
>
> Most likely this idea is stupid, but let me have a try anyway.  You
> could give your xattr/xref objects an inode number - either one per
> object or a special one shared for all xattr/xref objects.  That would
> open a new bag of worms, but keep the size down.
>
> Would it be possible to work with such an approach?

It accompanies a so big remodeling, and hope not to do so, if possible.

I think it is important here to be able to distinguish three kinds of
raw_node by a reasonable method (1. existing raw_node_ref of inode,
2. existing raw_node_ref without inode, 3. new raw_node_ref for XATTR),
and to be able to refer from the third type of raw_node to
the jffs2_xattr_(cache|ref) objects.

I noticed an idea to resolve it.
Any objects refered by the last next_in_ino are allocated by slab.
If we can use kmem_ptr_validate() function, we can discriminate whether
this pointer indicate xattr_cache/ref or not. Then, we can keep the
size of jffs2_raw_node_ref.
(the member of 'owner' will go anyware.)

The issues of this method are as follows:
- If there is an adverse effect by existing of non-inode raw_node_ref
   whose next_in_ino is not NULL, I must resolve this.
- It's necessary to discuss in LKML, since this function is not
   EXPORT_SYMBOL()ed for kernel loadable modules currently.

>>>By itself, this code is not too bad.  But it add a little more crap to
>>>a function that is aching for a rewrite already.  Not sure.
>>
>>Hmm,,, I wrote the above part of codes with referring to existing code.
>>If the policy is shown, I'll follow it. How should I do ?
>
>
> In a perfect world, you should send a cleanup patch to break
> jffs2_scan_eraseblock() into several smaller functions.  Have the
> xattr patch depend on the cleanup.  I might still have an old patch
> that I could send you for inspiration.

I have developed this functionality based on mtd-snapshot-20050829.
It means I should develop this based on mtd-snapshot-XXXX + your
cleanup patches, isn't it?
If so, I think my patch should be moditied for new version.
Isn't it fundamental changing ?


>>>>+	xc = jffs2_find_xattr_cache_xid(c, je32_to_cpu(rx->xid));
>>>>+	if (xc) {
>>>>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Duplicate XID
>>
>>Found"
>>
>>>>+		       " on node at 0x%08x XID=%d Later one ignored\n", ofs,
>>
>>xc->xid);
>>
>>>>+		DIRTY_SPACE(PAD(je32_to_cpu(rx->totlen)));
>>>>+		return 0;
>>>>+	}
>>>
>>>
>>>How do you deal with xattr reference counting and lifetime?
>>
>>When xc->xlist is empty, jffs2_xattr_cache type object will be released.
>>jffs2_xattr_ref type object is chained to xc->xlist.
>>list_empty(xc->xlist) means nobady refers this XATTR.
>
>
> ....at which time you also remove the xattr from medium, I assume.  Ok.

Yes. jffs2_mark_node_obsolete() is called at this timing.

> Next question: How do you remove the xattr from medium?  How is it
> garbage collected?

If my understanding is not wrong, an obsolete XATTR or XREF node
is garbase collected as raw-node which does not have inode.
(Becase next_in_ino of XATTR/XREF node is NULL.)


>>>>+	xtype = jffs2_xattr_prefix_to_xtype(rx->data, nlen);
>>>>+	if (JFFS2_XATTRTYPE_INVALID==xtype) {
>>>>+		printk(KERN_NOTICE "jffs2_scan_xattr_node(): Unsupported
>>
>>xattr type"
>>
>>>>+		       " on node at 0x%08x\n", ofs);
>>>>+		USED_SPACE(PAD(je32_to_cpu(rx->totlen)));
>>>>+		return 0;
>>>>+	}
>>>
>>>
>>>Why is it required that JFFS2 knows the type of the xattr?
>>
>>Hmm,,, I added this member to discriminate the prefix of xattr
>>without strncmp(). But it might be a bit ugly design.
>
>
> Then why is it required that JFFS2 knows the prefix?

A permittion checking policy depends on XATTR's prefix.
For example, only an user has CAP_SYS_ADMIN capability
can read/write "trusted.*" xattr.  In the "security.*"
prefix case, this checking was done in LSM module.
Therefore, filesystem must know XATTR's prefix.


>>>>+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct
>>
>>jffs2_eraseblock *jeb,
>>
>>>>+				struct jffs2_raw_xref *rr, uint32_t ofs)
>>>>+{
>>>>+	struct jffs2_raw_node_ref *raw;
>>
>>             - snip -
>>
>>
>>>>+	ref->seqno = je32_to_cpu(rr->seqno);
>>>>+	if (ref->seqno > c->highest_seqno)
>>>>+		c->highest_seqno = ref->seqno;
>>>>+	ref->ic = (void *)je32_to_cpu(rr->ino);
>>>>+	ref->xc = (void *)je32_to_cpu(rr->xid);
>>>
>>>
>>>WTF?!?
>>>
>>>You read a je32 from flash and use that as a pointer?!?
>>>
>>>Please tell me I'm wrong.
>>
>>If we use above emample, we can write it as follows:
>>
>>    ref->i.ino = je32_to_cpu(rr->ino);
>>    ref->x.xid = je32_to_cpu(rr->xid);
>
>
> 	ret->ino = je32_to_cpu(rr->ino);
> 	...
>
>
>>In jffs2_build_xattr_cache(), we find up the jffs2_inode_cache and
>>jffs2_xattr_cache by using ino/xid as a key. Then the correct pointers
>>are stored in ref->ic and ref->xc after jffs2_build_xattr_cache().
>>
>>Is it the situation to use union ?
>
>
> Yes.  Makes more sense now.  Sorry about the tone.
>
> Still, you can take it as an indication that your reuse-old-fields
> trick is not obvious to new readers.  A comment explaining this would
> be useful.  Maybe you already have it further down, in the part I
> didn't review yet.

Sorry for tricky coding without comments. I'll pay attention of such
coding style.

Thanks,
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
