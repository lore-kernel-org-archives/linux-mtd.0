Received: from mgw-x4.nokia.com ([131.228.20.27])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BuA3y-0004jm-Kr
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2004 09:19:46 -0400
Date: Mon, 9 Aug 2004 16:11:59 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Wu Jian Feng <jianfengw@mobilesoft.com.cn>
Message-ID: <20040809131158.GA6838@angel.research.nokia.com>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
	<1091962414.1438.977.camel@imladris.demon.co.uk>
	<20040809015950.GA20408@mobilesoft.com.cn>
	<1092033702.1438.2169.camel@imladris.demon.co.uk>
	<1092049678.4383.5149.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1092049678.4383.5149.camel@hades.cambridge.redhat.com>
Cc: 
Subject: Re: [BUG] 2.6.8-rc3 slab corruption (jffs2?)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 09, 2004 at 12:07:59PM +0100, ext David Woodhouse wrote:
> Don't bother, thanks. I found the problem, in the part_erase() code.
> Waiting for the culprit to wake up and fix it... :)

I also see the Slab corruption and it is very reproducible with
something like:

  flash_eraseall -j /dev/mtd0
  mount -t jffs2 /dev/mtdblock0 /mnt
  cp -a /usr /mnt

I am using Nand flash and 2.6.8-rc3-omap1. Once the fs is filled
enough I see typically following:

  Slab corruption: start=c3a31980, len=64
  Redzone: 0x5a2cf071/0x5a2cf071.
  Last user: [<c0185fd0>](nand_erase_nand+0x1fc/0x210)
  000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 09 6b
  Prev obj: start=c3a31934, len=64
  Redzone: 0x5a2cf071/0x5a2cf071.
  Last user: [<00000000>](0x0)
  000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
  010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
  Next obj: start=c3a319cc, len=64
  Redzone: 0x170fc2a5/0x170fc2a5.
  Last user: [<c00fcddc>](jffs2_alloc_full_dirent+0x18/0x1c)
  000: 8c 68 80 c3 30 11 a3 c3 0d 00 00 00 a1 0c 00 00
  010: 46 4d 28 9e 08 44 62 44 72 69 76 65 72 2e 70 6d

Jarkko Lavinen
