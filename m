Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L1lWy-0002Sp-B4
	for linux-mtd@lists.infradead.org; Sun, 16 Nov 2008 17:35:28 +0000
Date: Sun, 16 Nov 2008 18:34:54 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
Message-ID: <20081116173453.GA703@logfs.org>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 November 2008 18:38:53 -0500, Mike Frysinger wrote:
> 
> Rather than having every map/mtd driver doing the same sequence of
> registering partitions and/or devices, implement common parse_mtd().

I just added partitioning support to block2mtd.  Looks like I might
rethink the patch. :)

> @@ -292,6 +292,43 @@ void put_mtd_device(struct mtd_info *mtd)
>  	module_put(mtd->owner);
>  }
>  
> +#include <linux/mtd/partitions.h>

#include in the middle of the code?

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
