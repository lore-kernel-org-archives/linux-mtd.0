Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjiH6-0005Ol-Jy
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 08:09:18 +0000
Subject: Re: [PATCH 0/3] ubifs: add lz4hc compression
To: Hyunchul Lee <hyc.lee@gmail.com>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Hyunchul Lee <cheol.lee@lge.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5766cc86-d4cc-230c-9d3c-073d9b8d6ec5@nod.at>
Date: Fri, 3 Mar 2017 09:08:51 +0100
MIME-Version: 1.0
In-Reply-To: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hyunchul Lee,

Am 28.02.2017 um 06:16 schrieb Hyunchul Lee:
> From: Hyunchul Lee <cheol.lee@lge.com>
> 
> This patch set is for adding support for lz4hc compression.  lz4hc's
> compression ratio is comparable to zlib, but its compression/decompression
> speed is faster than zlib[1].

Do you have performance numbers that show the speedup on a common embedded
system with NAND?

> Another compression type cannot be added any more in respect that type of
> ubifs_inode's compr_type is "unsigned:2" and there are 4 compression
> types.  There may be overflow in assignment to compr_type, and prevision 
> version of ubifs is trying to decompress file with wrong compression type.

As Artem noted this is only an in-memory struct.

What happens when you compress a file with lz4hc and try to access this
UBIFS file with an older kernel?
AFAICT ubifs_iget() will notice and return -EINVAL but please double check.

Thanks,
//richard
