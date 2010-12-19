Received: from mail-bw0-f43.google.com ([209.85.214.43])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PUNKH-00061H-1A
	for linux-mtd@lists.infradead.org; Sun, 19 Dec 2010 17:45:41 +0000
Received: by bwz14 with SMTP id 14so2470097bwz.30
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Dec 2010 09:45:39 -0800 (PST)
Subject: Re: [PATCH v2 1/6] mtd: add writebufsize field to mtd_info struct
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1292539339-25111-2-git-send-email-agust@denx.de>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-2-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 19:45:31 +0200
Message-ID: <1292780731.13362.16.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-12-16 at 23:42 +0100, Anatolij Gustschin wrote:
> This field will be used to indicate the write buffer size
> of the MTD device. UBI will set it's minimal I/O unit size
> (min_io_size) to the indicated write buffer size. By this
> change we intend to fix failed recovery of UBIFS partitions
> we currently observe on NOR flash when mounting the partition
> after unclean unmount.
> 
> Currently the min_io_size is set to mtd->writesize (which is 1
> byte for NOR flash). But flash programming is often done from
> prepared write buffer containing multiple bytes and is performed
> in one programming operation which could be interrupted by a power
> cut or a system reset causing corrupted (partially written) areas
> in a flash sector. Knowing the size of potentially corrupted areas
> UBIFS scanning and recovery algorithms are able to perform
> successful recovery.
> 
> In case of NOR flash minimal I/O size must be equal to the
> maximal size of the write buffer used by embedded flash
> programming algorithm. In case of NAND flash mtd->writebufsize
> should be equivalent to mtd->writesize.
> 
> The subsequent patches will add mtd->writebufsize initialization
> where needed.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

I've tweaked your commentary a bit and pushed to l2-mtd-2.6.git, please,
check.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
