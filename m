Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oVtP-0002WS-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 21:11:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010925220426.B9581@wohnheim.fh-wedel.de> 
References: <20010925220426.B9581@wohnheim.fh-wedel.de> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: partt partition table parser 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Oct 2001 21:20:54 +0100
Message-ID: <6763.1002054054@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

In general, it looks relatively sane. Can you justify the use of 
CONFIG_MTD_PARTT_INDIRECT? 

What systems use this partition table format?


> +++ mtd/util/mkpartt.c	Tue Sep 25 20:15:58 2001
> +#include "/usr/src/linux/include/linux/mtd/ibmpartt.h"

No. Pull the definitions into the C file or take a copy. Don't look too 
hard at the mkfs.jffs2 code - do as I say, not as I do :)

> +void x_order_32 (__u32 *old32)
> +{
> +	__u32 new32;
> +	__u8 *new8 = (__u8*)&new32;
> +	__u8 *old8 = (__u8*)old32;
> +	new8[0] = old8[3];
> +	new8[1] = old8[2];
> +	new8[2] = old8[1];
> +	new8[3] = old8[0];
> +	*old32 = new32;
> +}

That's going to break. In the kernel, we compile with -fno-strict-aliasing 
just because we've always had evil code there and nobody's yet looked too 
hard at cleaning it up. For userspace, we need to write real C code.

> +		columns = sscanf (buf, " %20s %x %x %x", /* FIXME: Replace 20 with NAME_MAX_LEN */

 "%" #NAME_MAX_LEN "s %x %x %x"

How about making big-endian and little-endian options too, instead of just 
cross-endian?

--
dwmw2
