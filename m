Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6Mc9-0002QM-Cf
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 09:27:33 +0000
Received: by rv-out-0708.google.com with SMTP id b17so4059599rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2008 02:27:32 -0700 (PDT)
Message-ID: <bae050c10806110227x364e631ev9ae3deb41114a1dd@mail.gmail.com>
Date: Wed, 11 Jun 2008 17:27:32 +0800
From: Nancy <nancydreaming@gmail.com>
To: Hyphen79 <hyphen79@web.de>
Subject: Re: mtd caching in kernel 2.6
In-Reply-To: <484F909D.6080709@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <484F909D.6080709@web.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/11/08, Hyphen79 <hyphen79@web.de> wrote:
> Hello,
>
> I have a problem with my mtdblock root device with the 2.6 kernel. When
> I write data to a mtd partition,
> which is not the root, the data will be written immediately. But when I
> write something to the root partition,
> it will be cached and written to it after a while (~30sec).
Yes, cause your root is cramdisk, goes to block device layer
mtdblock.c Which is cache designed. Your other partitions works with
JFFS2 or Yaffs2 which goes directly on MTD nand_base.c or similar
file.

What could
> this be and how could I deactivate
> the caching? - the root is a cramdisk, not JFFS2 - and I have no
> problems with the 2.4 kernel.
No, you can't deactiveate the caching. But you can avoid it by using
JFFS2 or YAFFS2 as your rootfs. I think your case have nothing to do
with the kernel version. It should be the same with 2.4 kernel.

-- 
Best wishes,
Nancy
