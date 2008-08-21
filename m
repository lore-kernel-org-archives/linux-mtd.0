Received: from mtagate7.de.ibm.com ([195.212.29.156])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KW4xs-0000QW-Je
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 07:52:17 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate7.de.ibm.com (8.13.8/8.13.8) with ESMTP id m7L7p5A1341960
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 07:51:05 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com
	[9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7L7p55o3481666
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 09:51:05 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7L7p5Ua020165
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2008 09:51:05 +0200
Message-ID: <48AD1E66.40307@de.ibm.com>
Date: Thu, 21 Aug 2008 09:51:02 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: jaredeh@gmail.com
Subject: Re: [PATCH 03/10] AXFS: axfs.h
References: <48AD00E6.2070505@gmail.com>
In-Reply-To: <48AD00E6.2070505@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> +#define AXFS_GET_BYTETABLE_VAL(desc,index) \
> +  axfs_bytetable_stitch(((struct axfs_region_desc)(desc)).table_byte_depth,\
> +  (u8 *)((struct axfs_region_desc)(desc)).virt_addr, index)
> +
> +#define AXFS_GET_NODE_TYPE(sbi,node_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->node_type,\
> +   (node_index))
> +
> +#define AXFS_GET_NODE_INDEX(sbi,node__index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->node_index,\
> +   (node__index))
> +
> +#define AXFS_IS_NODE_XIP(sbi,node_index) \
> +  (AXFS_GET_NODE_TYPE(sbi, (node_index)) == XIP)
> +
> +#define AXFS_GET_CNODE_INDEX(sbi,node_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->cnode_index,\
> +   (node_index))
> +
> +#define AXFS_GET_CNODE_OFFSET(desc,node_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->cnode_offset,\
> +   (node_index))
> +
> +#define AXFS_GET_BANODE_OFFSET(desc,node_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->banode_offset,\
> +   (node_index))
> +
> +#define AXFS_GET_CBLOCK_OFFSET(desc,node_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->cblock_offset,\
> +   (node_index))
> +
> +#define AXFS_GET_INODE_FILE_SIZE(sbi,inode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->inode_file_size,\
> +   (inode_index))
> +
> +#define AXFS_GET_INODE_NAME_OFFSET(sbi,inode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->inode_name_offset,\
> +	(inode_index))
> +
> +#define AXFS_GET_INODE_NUM_ENTRIES(sbi,inode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->inode_num_entries,\
> +	(inode_index))
> +
> +#define AXFS_GET_INODE_MODE_INDEX(sbi,inode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->inode_mode_index,\
> +   (inode_index))
> +
> +#define AXFS_GET_INODE_ARRAY_INDEX(sbi,inode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->inode_array_index,\
> +   (inode_index))
> +
> +#define AXFS_GET_MODE(sbi,mode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->modes,\
> +  (AXFS_GET_INODE_MODE_INDEX(sbi, (mode_index))))
> +
> +#define AXFS_GET_UID(sbi,mode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->uids,\
> +  (AXFS_GET_INODE_MODE_INDEX(sbi, (mode_index))))
> +
> +#define AXFS_GET_GID(sbi,mode_index) \
> +  AXFS_GET_BYTETABLE_VAL(((struct axfs_super *)(sbi))->gids,\
> +  (AXFS_GET_INODE_MODE_INDEX(sbi, (mode_index))))
> +
> +#define AXFS_IS_REGION_COMPRESSED(_region) \
> +    (( \
> +     ((struct axfs_region_desc *)(_region))->compressed_size > \
> +     0 \
> +    ) ? TRUE : FALSE)
> +
> +#define AXFS_PHYSADDR_IS_VALID(sbi) \
> +    (((((struct axfs_super *)(sbi))->phys_start_addr) > 0 \
> +	) ? TRUE : FALSE)
> +
> +#define AXFS_VIRTADDR_IS_VALID(sbi) \
> +    (((((struct axfs_super *)(sbi))->virt_start_addr) > 0 \
> +	) ? TRUE : FALSE)
> +
> +#define AXFS_IS_IOMEM(sbi) \
> +    (((((struct axfs_super *)(sbi))->iomem_size) > 0) ? TRUE : FALSE)
> +
> +#define AXFS_IS_POINTED(sbi) \
> +    (((((struct axfs_super *)(sbi))->mtd_pointed) > 0) ? TRUE : FALSE)
> +
> +#define AXFS_IS_PHYSMEM(sbi) \
> +    (( \
> +      AXFS_PHYSADDR_IS_VALID(sbi) \
> +      && !AXFS_IS_IOMEM(sbi) \
> +      && !AXFS_IS_POINTED(sbi) \
> +    ) ? TRUE : FALSE)
> +
> +#define AXFS_IS_MMAPABLE(sbi,offset) \
> +    ((\
> +       (((struct axfs_super *)(sbi))->mmap_size) > (offset) \
> +    ) ? TRUE : FALSE)
> +
> +#define AXFS_IS_OFFSET_MMAPABLE(sbi,offset) \
> +    (( \
> +       AXFS_IS_MMAPABLE(sbi, offset) && AXFS_VIRTADDR_IS_VALID(sbi) \
> +     ) ? TRUE : FALSE)
> +
> +#define AXFS_IS_REGION_MMAPABLE(sbi,_region) \
> +    (( \
> +      AXFS_IS_MMAPABLE(sbi, ((struct axfs_region_desc *)(_region))->fsoffset) \
> +      && AXFS_VIRTADDR_IS_VALID(sbi) \
> +     ) ? TRUE : FALSE)
> +
> +#define AXFS_IS_REGION_INCORE(_region) \
> +    (((_region)->incore > 0) ? TRUE : FALSE)
> +
> +#define AXFS_IS_REGION_XIP(sbi,_region) \
> +    (( \
> +     !AXFS_IS_REGION_COMPRESSED(_region) && \
> +     !AXFS_IS_REGION_INCORE(_region) && \
> +     AXFS_IS_REGION_MMAPABLE(sbi,_region) \
> +    ) ? TRUE : FALSE)
> +
> +#define AXFS_GET_XIP_REGION_PHYSADDR(sbi) \
> +    (unsigned long)((sbi)->phys_start_addr + (sbi)->xip.fsoffset)
> +
> +#define AXFS_GET_INODE_NAME(sbi,inode_index) \
> +     (char *)( \
> +	(sbi)->strings.virt_addr \
> +	+ AXFS_GET_INODE_NAME_OFFSET(sbi,inode_index) \
> +     )
> +
> +#define AXFS_GET_CBLOCK_ADDRESS(sbi, cnode_index)\
> +    (unsigned long)( \
> +       (sbi)->compressed.virt_addr \
> +       + AXFS_GET_CBLOCK_OFFSET(sbi, cnode_index) \
> +    )
> +
> +#define AXFS_GET_NODE_ADDRESS(sbi,node__index) \
> +    (unsigned long)( \
> +       (sbi)->node_index.virt_addr \
> +       + AXFS_GET_NODE_INDEX(sbi, node__index) \
> +    )
> +
> +#define AXFS_GET_BANODE_ADDRESS(sbi,banode_index) \
> +    (unsigned long)( \
> +       (sbi)->byte_aligned.virt_addr \
> +       + AXFS_GET_BANODE_OFFSET(sbi, banode_index) \
> +    )
> +
> +#define AXFS_FSOFFSET_2_DEVOFFSET(sbi,fsoffset) \
> +    (( \
> +      ((sbi)->phys_start_addr == 0) && ((sbi)->virt_start_addr == 0) \
> +      ) ? (fsoffset) : (fsoffset - (sbi)->mmap_size) \
> +    )
> +
> +#define AXFS_GET_CBLOCK_LENGTH(sbi,cblock_index) \
> +    (u64)( \
> +      (u64)AXFS_GET_CBLOCK_OFFSET(sbi, ((u64)(cblock_index)+(u64)1)) \
> +      - (u64)AXFS_GET_CBLOCK_OFFSET(sbi, (cblock_index)) \
> +    )
> +
> +#ifndef TRUE
> +#define TRUE 1
> +#endif
> +#ifndef FALSE
> +#define FALSE 0
> +#endif
*Shrug*. That part reads scary. Are all those casts and macros really 
needed? Maybe it is worth considering to clean this up a little.
