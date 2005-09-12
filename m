Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EEm7L-00004t-6D
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 07:05:10 -0400
Message-ID: <43255FF5.4020903@ak.jp.nec.com>
Date: Mon, 12 Sep 2005 20:01:09 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050823124649.GB30853@wohnheim.fh-wedel.de>
	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com> <431E772B.9090004@ak.jp.nec.com>
	<20050908194915.GG20668@wohnheim.fh-wedel.de>
	<43210C7A.60109@ak.jp.nec.com>
	<20050909072416.GA19251@wohnheim.fh-wedel.de>
	<43225DEB.4070809@ak.jp.nec.com>
	<20050911114642.GA11788@wohnheim.fh-wedel.de>
	<4324E525.60805@ak.jp.nec.com>
	<20050912064038.GA21304@wohnheim.fh-wedel.de>
In-Reply-To: <20050912064038.GA21304@wohnheim.fh-wedel.de>
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

>>In this plan, jffs2_inode_cahce and jffs2_xattr_datum will be defined as 
>>follows:
>>struct jffs2_inode_cache {
>>    struct jffs2_full_dirent *scan_dents;
>>    uint16_t class; /* =0 means jffs2_inode_cache */
>>    uint16_t state;
>>       :
>>
>>struct jffs2_xattr_datum {
>>    void *dummy;    /* always NULL */
>>    uint16_t class; /* =1 means jffs2_xattr_datum */
>>       :
> 
> 
> You could even make the class a u8.  For inodes, the remaining 8 bits
> would just be reserved space for proper alignment.  If either of your
> xattr object could make use of the extra byte, it would be worth it.
> If not, just ignore my silly idea.

u8 type variable has enough width for discernment, I think.

And, is it possible to name the remaining 8-bit 'flags' than
'reserved' or 'unused' in jffs2_inode_cache/jffs2_xattr_datum ?

In my implementation, 'uint8_t ilist_checked' is added in
jffs2_inode_cache for flag purpose, and 'uint16_t flags' exists
in jffs2_xattr_datum(jffs2_xattr_cache in old name).
If we can stuff those into the remaining 8-bit, each object size
will be reduced by 4-byte, I think.


>>I see, jffs2_scan_eraseblock() is indeed a bit long.
>>Please send your attempt patches at first.
>>I'll try to cleanup it for the basis of XATTR patch.
> 
> 
> It was 34 patches going over all of jffs2, actually.  I guess it's
> easier to send the changed scan.c.  The pseudo-random stuff was
> controversial, so I lost interest after a while.

'34 patches over all of jffs2' is over my expectation, orz.
I prefer to pay attention on only the changed scan.c, if possible...
Please send it to me,


>>>This is just wrong.  I agree that something inside the kernel must
>>>know whether users need specific capabilities to read/write the xattr.
>>>Sure.  But why in hell does it have to be JFFS2?
>>>
>>>How do other filesystems deal with this?  ext[23] and reiserfs (v3)
>>>all have xattr, I believe.
>>
>>Indeed, more upper layer might be able to manage this kind of decision
>>making as you say. But it's transferred to the filesystem currently.
>>All of them (ext2/3, reiser and so on) have own permission checking codes
>>like 'fs/ext2/xattr_trusted.c', and I imitated those implementations.
>>I don't know the reason correctly.
> 
> 
> The code is not exactly easy to follow.  But it appears as if they
> used that stuff for compression.  If prefix is "trusted.", just use an
> e_name_index of 4 and drop the prefix.  It can be reconstructed on
> reads.

Hmm, it's functionality certainly effective for reduction of
memory and medium usage. It's not difficult to implement, I think.
I'll modify the method of storing xattr in next.

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
