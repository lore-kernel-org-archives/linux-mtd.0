Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YX4Wx-0004cC-OH
 for linux-mtd@lists.infradead.org; Sun, 15 Mar 2015 09:08:20 +0000
Date: Sun, 15 Mar 2015 10:07:52 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Scian <andrea.scian@dave.eu>
Subject: Re: [PATCH 1/2] mtd: nand: use a lower value for badblockbits when
 working with MLC NAND
Message-ID: <20150315100752.3458ccfe@bbrezillon>
In-Reply-To: <1425643938-24749-2-git-send-email-rnd4@dave-tech.it>
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
 <1425643938-24749-2-git-send-email-rnd4@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: rnd4@dave-tech.it, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrea,

On Fri,  6 Mar 2015 13:12:17 +0100
rnd4@dave-tech.it wrote:

> From: Andrea Scian <andrea.scian@dave.eu>
> 
> MLC NANDs have more bit flips that SLC. When looking for bad block
> marker we have a lot of false positive if we check for the whole byte. To
> avoid this tolerate a few (4 here) bit flips for byte.

I'm not sure sure we want to accept 4 bitflips for all MLC NANDs. IMHO
this value should be chip dependent.
I know there is currently no way to retrieve this information, so here
are two suggestions:

1/ make this value depend on the required NAND ecc strength
(badblockbits = ecc_strength / 10 ?)
2/ let each controller change this value after nand_scan_ident
depending on the detected chip until we find a generic solution to
select this value

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
