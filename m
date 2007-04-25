Subject: Re: [PATCH 2/5] jffs2: Add LZO compression support to jffs2
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1172690012.16062.138.camel@localhost.localdomain>
References: <1172690012.16062.138.camel@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 25 Apr 2007 13:35:57 +0100
Message-Id: <1177504557.2755.216.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-crypto@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-28 at 19:13 +0000, Richard Purdie wrote:
> Add LZO1X compression/decompression support to jffs2.
> 
> LZO's interface doesn't entirely match that required by jffs2 so a 
> buffer and memcpy is unavoidable.
> 
> Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

> Index: linux/fs/jffs2/compr_lzo.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux/fs/jffs2/compr_lzo.c	2007-02-28 18:12:31.000000000 +0000
> @@ -0,0 +1,120 @@
> +/*
> + * JFFS2 LZO Compression Interface
> + *
> + * Copyright (C) 2007 Nokia Corporation. All rights reserved.
> + *
> + * Author: Richard Purdie <rpurdie@openedhand.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
> + * 02110-1301 USA
> + *
> + */

Please use the same licence, and the same boilerplate, as the rest of
the JFFS2 code.

-- 
dwmw2
