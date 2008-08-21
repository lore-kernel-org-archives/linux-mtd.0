Received: from gateway-1237.mvista.com ([63.81.120.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW9wQ-00080r-Dw
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 13:11:07 +0000
Subject: Re: [PATCH 03/10] AXFS: axfs.h
From: Daniel Walker <dwalker@mvista.com>
To: jaredeh@gmail.com
In-Reply-To: <48AD00E6.2070505@gmail.com>
References: <48AD00E6.2070505@gmail.com>
Content-Type: text/plain
Date: Thu, 21 Aug 2008 06:10:58 -0700
Message-Id: <1219324258.23311.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@AM.SONY.COM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-08-20 at 22:45 -0700, Jared Hulbert wrote:
> +#define AXFS_GET_BYTETABLE_VAL(desc,index) \
> +  axfs_bytetable_stitch(((struct
> axfs_region_desc)(desc)).table_byte_depth,\
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

I think it would be much cleaner to do all these similar macro's as
static inline functions.

Daniel
