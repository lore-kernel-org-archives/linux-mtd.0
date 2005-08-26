Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8kZj-00011O-Fw
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 16:13:26 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j7QKDGnR128164
	for <linux-mtd@lists.infradead.org>; Fri, 26 Aug 2005 16:13:16 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j7QKDQTJ345512
	for <linux-mtd@lists.infradead.org>; Fri, 26 Aug 2005 14:13:26 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j7QKDFq0007800
	for <linux-mtd@lists.infradead.org>; Fri, 26 Aug 2005 14:13:16 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050826102512.GA23886@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Aug 2005 15:12:29 -0500
Message-Id: <1125087149.26481.12.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-08-26 at 12:25 +0200, Jörn Engel wrote:
> Trivial patch.  Anyone complaining about this is free to write a
> better one.  Can I commit?

So now with this 1:1 mapping, a user is limited to using a 64 MiB chip
if the physical block size is 32 KiB?  I know there are NAND chips out
there that use such a block size and are larger than 64MiB.  Do we
really want to stop supporting all of these devices?  

Even MTD devices using 128 KiB eraseblocks are limited to approximately
341 MiB in total size.  Remember, with NOR flash multiple devices of the
exact same type can be mapped as a single device as long as they are
physically contiguous in memory space.

And these numbers are based on a 32 bit machine, where sizeof(struct
jffs2_eraseblock) is 48 bytes.  On a 64 bit machine, even smaller
devices are supported since the structure goes up to 68 bytes.

Of course, these are all based on my math being correct.  Which of
course it might not be since sleep is a precious, precious thing at the
moment.

josh
