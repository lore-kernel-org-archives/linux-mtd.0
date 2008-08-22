Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWabX-0004jR-DN
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 17:39:19 +0000
Received: by yx-out-1718.google.com with SMTP id 3so396916yxi.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 10:39:19 -0700 (PDT)
Message-ID: <6934efce0808221039o3ea57e35ka24a617621e2646e@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:39:18 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
Subject: Re: [PATCH 07/10] AXFS: axfs_bdev.c
In-Reply-To: <20080822125440.GA1396@mx.loc>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD010B.6030209@gmail.com> <20080822125440.GA1396@mx.loc>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> mismatch between documentation and implementation WRT the function name ;)
oops.

>>+{
>>+      struct axfs_super *sbi = AXFS_SB(sb);
>>+      u64 boffset = AXFS_FSOFFSET_2_DEVOFFSET(sbi, fsoffset);
>>+      u64 blocks;
>>+      u64 blksize = sb->s_blocksize;
>>+      unsigned long dst;
>>+      unsigned long src;
>>+      sector_t block;
>>+      size_t bytes;
>>+      struct buffer_head *bh;
>>+      u64 copied = 0;
>>+
>>+      if (len == 0)
>>+              return 0;
>>+
>>+      blocks = len / blksize;
>>+      if ((len % blksize) > 0)
>>+              blocks += 1;
>>+
>>+      while (copied < len) {
>>+              /* Explicit casting for ARM linker errors. */
>
> did it try to emit some external div()? Is this still needed?

exactly.  I haven't heard otherwise, it was a Freescale ARM11 build
that had the issue... I don't have the set up.
