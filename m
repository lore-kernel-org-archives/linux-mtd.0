Received: from tyo200.gate.nec.co.jp ([210.143.35.50])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fcv6q-0001gm-4S
	for linux-mtd@lists.infradead.org; Sun, 07 May 2006 22:04:33 -0400
Received: from tyo202.gate.nec.co.jp ([10.7.69.202])
	by tyo200.gate.nec.co.jp (8.13.6/8.13.4) with ESMTP id k4824OhX001031
	for <linux-mtd@lists.infradead.org>;
	Mon, 8 May 2006 11:04:24 +0900 (JST)
Message-ID: <445EA6D4.5000909@ak.jp.nec.com>
Date: Mon, 08 May 2006 11:03:00 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <445C476A.2090506@ak.jp.nec.com>
	<20060507171601.GA7990@wohnheim.fh-wedel.de>
In-Reply-To: <20060507171601.GA7990@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: jmorris@redhat.com, sds@tycho.nsa.gov, lorenzo@gnu.org,
	russell@coker.com.au, linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Jörn. Thanks for your comments.

> On Sat, 6 May 2006 15:51:22 +0900, KaiGai Kohei wrote:
>> +
>> +static struct posix_acl *jffs2_acl_from_medium(const void *value, size_t size)
>> +{
>> +	const char *end = (char *)value + size;
> 
> This cast appears to be unnecessary.  Gcc has an extention that allows
> arithmetic on void* pointers.  The behaviour is just as if the pointer
> was casted to unsigned long and back - quite useful.

Hmm, I'll review the implementation and reduce the unnecessary casts.


>> +	ver = je32_to_cpu(((jffs2_acl_header *)value)->a_version);
> 
> In this case, it might make sense to create a local variable:
> 	jffs2_acl_header *header = value;
> 	...
> 	ver = je32_to_cpu(header->a_version);
> 
> If only a single field is used from the header, this is a matter of
> taste.  If it occurs more often, the local variable helps with
> readability.

The most of posix-acl implementation on jffs2 is mede with referring
to ext2/3's implementation. The jffs2_acl_header structure is reflection
of ext2_acl_header.
I also think using local variable is good idea for readability. I'll fix it.


>> +	value = (char *)value + sizeof(jffs2_acl_header);
> 
> Can be removed.
> 
>> +	for (i=0; i < count; i++) {
>> +		jffs2_acl_entry *entry = (jffs2_acl_entry *)value;
> 
> This cast can be removed.  void* can implicitly be cast to any pointer
> type.  Also, would it be possible to move this variable to the
> beginning of the function and use it for the version check?

jffs2_acl_header is used for version checking, not jffs2_acl_entry.
Thus, it's not possible to use version checking. But I'll remove
unnecessary cast.

>> +	jffs2_acl = (jffs2_acl_header *)kmalloc(sizeof(jffs2_acl_header)
> 
> kmalloc() returns a void*, so no explicit cast is needed.
> 
>> +	return (char *)jffs2_acl;
> 
> And this function returns void*, so this explicit cast isn't needed
> either.

I agreed. Those should be reduced.

> #ifndef JFFS2_ACL_H
> #define JFFS2_ACL_H
> ...
> #endif
> 
>> +#ifdef __KERNEL__
>> +#ifdef CONFIG_JFFS2_FS_POSIX_ACL
   ... <snip> ...
>> +#endif	/* CONFIG_JFFS2_FS_POSIX_ACL */
>> +#endif	/* __KERNEL__ */
> 
> The kernel is in a fairly bad shape wrt. seperating userspace
> interface and in-kernel headers.  dwmw2 is currently trying to sort
> things out.  Splitting this part into a seperate file would make his
> job a bit easier.

Because 'acl.h' was shared by mkfs.jffs2 at previous version of xattr
patches. But the __KERNEL__ ifdef block is unnecessary now.
I'll remove it.

>> @@ -107,11 +109,16 @@ struct jffs2_inode_cache {
>>  		temporary lists of dirents, and later must be set to
>>  		NULL to mark the end of the raw_node_ref->next_in_ino
>>  		chain. */
>> +	u8 class;	/* It's used for identification */
>> +	u8 flags;
>> +	uint16_t state;
>>  	struct jffs2_inode_cache *next;
>>  	struct jffs2_raw_node_ref *nodes;
>>  	uint32_t ino;
>>  	int nlink;
>> -	int state;
>> +#ifdef CONFIG_JFFS2_FS_XATTR
>> +	struct list_head ilist;
>> +#endif
>>  };
> 
> Why does this field depend on CONFIG_JFFS2_FS_XATTR, while the above
> doesn't?  It looks as if splitting state into several fields is a
> generic cleanup and can be merged independently of xattr support.

If ilist would be always enabled, it will enforce any users the amount
of 2 * sizeof(void *) bytes memory usage increase per inode_cache
whether they hope to use xattr or not regardless of.
Thus, this field is defined with depending on CONFIG_JFFS2_FS_XATTR.

About the state variable, I splited it into three variable unconditionaly
because it didn't have such a bad effect (if int has 32-bit width).

Thanks,

[Current TODO list]
* Fix the declaration of jffs2_acl_header and so on by using 'struct'
   instead of 'typedef' in kernel space.
- Fix the declaration of jffs2_acl_header and so on by using 'struct'
   instead of 'typedef' in user space header.
* Add documentation about xattr_sem into README.Locking.
* Call jffs2_garbage_collect_xattr_datum/ref() from gc.c directly
   instead of jffs2_garbage_collect_xattr()
- Use unidirection list beween inode_chache and xattr_ref, instead of
   list_head.
- Add '#include <linux/list.h>' into xattr.h.
- Unify each file header part with any jffs2 files.
- Remove a senseless comment. ("/* forward refence */")
- Remove unneccesary pointer casts.
- Remove unneccesary '#ifdef __KERNEL__' on acl.h

*: It has already prepared, but I've not publicated yet.
-: It has not prepated yet. I should work from now.

-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
