Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EEdth-0001Du-2E
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2005 22:18:23 -0400
Message-ID: <4324E525.60805@ak.jp.nec.com>
Date: Mon, 12 Sep 2005 11:17:09 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
	<20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
	<43210C7A.60109@ak.jp.nec.com>
	<20050909072416.GA19251@wohnheim.fh-wedel.de>
	<43225DEB.4070809@ak.jp.nec.com>
	<20050911114642.GA11788@wohnheim.fh-wedel.de>
In-Reply-To: <20050911114642.GA11788@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

>>It accompanies a so big remodeling, and hope not to do so, if possible.
>>
>>I think it is important here to be able to distinguish three kinds of
>>raw_node by a reasonable method (1. existing raw_node_ref of inode,
>>2. existing raw_node_ref without inode, 3. new raw_node_ref for XATTR),
>>and to be able to refer from the third type of raw_node to
>>the jffs2_xattr_(cache|ref) objects.
> 
> 
> Yes.  1 and 2 are currently distinguished by next_in_ino being either
> either valid or NULL.
> 
> 
>>I noticed an idea to resolve it.
>>Any objects refered by the last next_in_ino are allocated by slab.
>>If we can use kmem_ptr_validate() function, we can discriminate whether
>>this pointer indicate xattr_cache/ref or not. Then, we can keep the
>>size of jffs2_raw_node_ref.
>>(the member of 'owner' will go anyware.)
> 
> 
> Sounds scary.  But in principle, you are right.  In case of either 1
> or 3, we attach "something" to next_in_ino.  Now we only have to
> decide whether "something" is an inode, or the new xattr-struff.
> 
> If you add an extra field to jffs2_inode_cache (which also is grossly
> misnamed, old mistake), you can do so.  And since inodes are a lot
> less frequent than raw nodes, the memory consumption should have
> improved quite a bit.

I prefer this kind of approach than other one. It's simple solution.
I'm afraid of breaking something to be assumed implicitly by reserving
some inode-numbers.

And, how about such an idea ?
Currently, the variable of 'state' in jffs2_inode_cache is defined
as int type, but the range of this variable is between 0 and 6.
In general case, 'int' has 32-bit width.  It's so much for this field.

For example, we can redefine the 'state' as 16-bit width variable,
and insert a new 16-bit width variable to discriminate own object.
If acceptable, it can also keep the memory comsumption for jffs2_inode_cache.

In this plan, jffs2_inode_cahce and jffs2_xattr_datum will be defined as follows:
struct jffs2_inode_cache {
     struct jffs2_full_dirent *scan_dents;
     uint16_t class; /* =0 means jffs2_inode_cache */
     uint16_t state;
        :

struct jffs2_xattr_datum {
     void *dummy;    /* always NULL */
     uint16_t class; /* =1 means jffs2_xattr_datum */
        :

>>>In a perfect world, you should send a cleanup patch to break
>>>jffs2_scan_eraseblock() into several smaller functions.  Have the
>>>xattr patch depend on the cleanup.  I might still have an old patch
>>>that I could send you for inspiration.
>>
>>I have developed this functionality based on mtd-snapshot-20050829.
>>It means I should develop this based on mtd-snapshot-XXXX + your
>>cleanup patches, isn't it?
> 
> 
> No.  You should develop two patches based on current cvs:
> [PATCH 1/2] Cleanup of jffs2_scan_eraseblock()
> [PATCH 2/2] xattr for jffs2
> 
> And you may or may not use my previous attempt as a basis, that's your
> decision.

I see, jffs2_scan_eraseblock() is indeed a bit long.
Please send your attempt patches at first.
I'll try to cleanup it for the basis of XATTR patch.


>>>Then why is it required that JFFS2 knows the prefix?
>>
>>A permittion checking policy depends on XATTR's prefix.
>>For example, only an user has CAP_SYS_ADMIN capability
>>can read/write "trusted.*" xattr.  In the "security.*"
>>prefix case, this checking was done in LSM module.
>>Therefore, filesystem must know XATTR's prefix.
> 
> 
> This is just wrong.  I agree that something inside the kernel must
> know whether users need specific capabilities to read/write the xattr.
> Sure.  But why in hell does it have to be JFFS2?
> 
> How do other filesystems deal with this?  ext[23] and reiserfs (v3)
> all have xattr, I believe.

Indeed, more upper layer might be able to manage this kind of decision
making as you say. But it's transferred to the filesystem currently.
All of them (ext2/3, reiser and so on) have own permission checking codes
like 'fs/ext2/xattr_trusted.c', and I imitated those implementations.
I don't know the reason correctly.

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
