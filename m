Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19poog-0000b7-G9
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 13:45:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <002601c367e0$2da6b0a0$73dea8c0@lair>
References: <002601c367e0$2da6b0a0$73dea8c0@lair>
Message-Id: <1061469898.13830.52.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 21 Aug 2003 13:44:59 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: RFC - patch to reduce peak memory usage by disabling
	compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-21 at 14:31 +0200, Øyvind Harboe wrote:
> Reduce RAM usage by removing compression/decompression altogether.

You could make it use a static buffer and serialise compression, and it
really would be only 4KiB you're saving.

I sincerely hope this is done because you're using uncompressible data,
rather than trading about 4KiB of cheap RAM for a doubling in expensive
flash space :)

If you're doing this, I'd prefer to change jffs2_compress() to allocate
its _own_ buffer (or optionally use a static one), then have a simple
definition of jffs2_compress which does nothing in the
!CONFIG_JFFS2_FS_COMPRESSION case. 

You need to handle the case where compression is configured out and a
filesystem created with compressed nodes is encountered -- it looks like
it'll die horribly at the moment.

I'd also like to see individual compression routines selectable, and
also at runtime with something akin to chattr.

-- 
dwmw2
