Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWWAj-0006dZ-Bw
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 12:55:21 +0000
Received: by fg-out-1718.google.com with SMTP id l26so262034fgb.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 05:55:20 -0700 (PDT)
Date: Fri, 22 Aug 2008 14:54:40 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 07/10] AXFS: axfs_bdev.c
Message-ID: <20080822125440.GA1396@mx.loc>
References: <48AD010B.6030209@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48AD010B.6030209@gmail.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
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

On Wed, Aug 20, 2008 at 10:45:47PM -0700, Jared Hulbert wrote:
>+/******************************************************************************
>+ *
>+ * axfs_copy_block_data
>+ *
>+ * Description: Helper function to read data from block device
>+ *
>+ * Parameters:
>+ *    (IN) sb - pointer to super block structure.
>+ *
>+ *    (IN) dst_addr - pointer to buffer into which data is to be read.
>+ *
>+ *    (IN) boffset - offset within block device
>+ *
>+ *    (IN) len - length of data to be read
>+ *
>+ * Returns:
>+ *     0 or error number
>+ *
>+ *****************************************************************************/
>+int axfs_copy_block(struct super_block *sb, void *dst_addr, u64 fsoffset,
>+		    u64 len)

mismatch between documentation and implementation WRT the function name ;)


>+{
>+	struct axfs_super *sbi = AXFS_SB(sb);
>+	u64 boffset = AXFS_FSOFFSET_2_DEVOFFSET(sbi, fsoffset);
>+	u64 blocks;
>+	u64 blksize = sb->s_blocksize;
>+	unsigned long dst;
>+	unsigned long src;
>+	sector_t block;
>+	size_t bytes;
>+	struct buffer_head *bh;
>+	u64 copied = 0;
>+
>+	if (len == 0)
>+		return 0;
>+
>+	blocks = len / blksize;
>+	if ((len % blksize) > 0)
>+		blocks += 1;
>+
>+	while (copied < len) {
>+		/* Explicit casting for ARM linker errors. */

did it try to emit some external div()? Is this still needed?
