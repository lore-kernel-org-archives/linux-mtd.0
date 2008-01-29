Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JK0UX-0000qu-IC
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 00:07:55 +0000
Date: Wed, 30 Jan 2008 00:07:19 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] [JFFS2] JFFS2 doesn't use OOB at MLC NAND/OneNAND
Message-ID: <20080129230702.GB32157@lazybastard.org>
References: <20080129083630.GA31954@party>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080129083630.GA31954@party>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 January 2008 17:36:30 +0900, Kyungmin Park wrote:
> 
> It's revised patch from 
> http://patchwork.ozlabs.org/linux-mtd/patch?id=15260
> 
> Just remove one line
> +#define MTD_CAP_MLC_NANDFLASH	(MTD_WRITEABLE)
> 
> If you don't any rejct please apply this one.

Looks good to me.
Acked-by: Joern Engel <joern@logfs.org>

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
