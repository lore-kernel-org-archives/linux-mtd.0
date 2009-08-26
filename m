Received: from exchange07.timesys.com ([209.114.137.35])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgQ1K-0004pp-8l
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 21:27:10 +0000
Subject: Re: Creating an ext3 partition on an mtd device
From: Justin Waters <justin.waters@timesys.com>
To: Mark Ryden <markryde@gmail.com>
In-Reply-To: <dac45060908261244wbfc744apec0d5195a0f1dbcf@mail.gmail.com>
References: <dac45060908261244wbfc744apec0d5195a0f1dbcf@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 26 Aug 2009 17:26:37 -0400
Message-ID: <1251321997.10982.101.camel@jjw-linux>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mark,

On Wed, 2009-08-26 at 15:44 -0400, Mark Ryden wrote:
> Hello,
> 
> I want to create an ext2 partition on an mtd device.

No, you don't.

See: http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd

and

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_raw_vs_ftl

>  I tried to create a partition with fdisk /dev/mtdblock2
>  The device is /dev/mtdblock2p1
>  but: mkfs.ext3 /dev/mtdblock2p1  fails
> 
>  What should I do ? Is it right in this case to use fdisk at all ?

Unless you have some hard requirement for EXT2, you are much better off
using a flash file system, like ubifs or jffs2.  Check out
http://www.linux-mtd.infradead.org for more info.

> Regards,
> Mark Ryden

- Justin Waters
