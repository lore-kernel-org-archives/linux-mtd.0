Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBAr-0002uH-5g
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:30:05 +0000
Received: by yx-out-1718.google.com with SMTP id 3so4498yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:30:04 -0700 (PDT)
Message-ID: <6934efce0808210730y77db925cg263c957abb056fea@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:30:03 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: carsteno@de.ibm.com
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <48AD42AE.4030107@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
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

> I like the general approach of it. It's much more flexible than the ext2
> extension I've done, and the possibility to select XIP vs. compression per
> page is really really neat. I can imagine that people will prefer this over
> the ext2 implementation on s390. It is unclear to me how the "secondary
> block device" thing is supposed to work. Could you elaborate a bit on that?

First off we don't yet support direct_access(), but I am planning on that soon.

Sure.  For a system that has say a NOR Flash and a NAND or a embedded
MMC, one can split a filesystem image such that only the XIP parts of
the image are on the NOR while the compressed bits are on the NAND /
eMMC.  The NOR part is accessed as directly addressable memory, while
the NAND would use mtd->read() and the eMMC would use block device
access API's.  In this case I would call this NAND or eMMC the
"secondary device" because the primary device is the NOR.

Assuming my NOR was at /dev//mtd2 and my NAND at /dev/mtd5.  I would
call the following to mount such a system:

mount -t axfs -o second_dev=/dev/mtd5 /dev/mtd2 /mnt/axfs
