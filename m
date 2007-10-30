Received: from ozlabs.org ([203.10.76.45])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1Imei2-0003iw-ER
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 20:12:01 -0400
Date: Tue, 30 Oct 2007 11:10:21 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Valentine Barshak <vbarshak@ru.mvista.com>
Subject: Re: [PATCH] MTD: small physmap_of partition parsing fixes
Message-ID: <20071030001021.GA29263@localhost.localdomain>
References: <20071029202902.GA2200@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071029202902.GA2200@ru.mvista.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 29, 2007 at 11:29:02PM +0300, Valentine Barshak wrote:
> Use of_get_next_child for proper ref counting as suggested by Stephen Rothwell
> and remove add_mtd_partitions from parse_partitions to avoid duplicate
> mtd device registration for RedBoot partitions.
> 
> Signed-off-by: Valentine Barshak <vbarshak@ru.mvista.com>

Oops, yes.  I think the extra add_mtd_partitions() was left over from
an earlier version which always did the add_mtd_partitions() from
within the probe function.

Acked-by: David Gibson <david@gibson.dropbear.id.au>

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
