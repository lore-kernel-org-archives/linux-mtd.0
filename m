Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1e1-0002pv-KL
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:11:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Russ.Dill@asu.edu
In-Reply-To: <1055322613.886.2.camel@russ>
References: <3EE6EBA0.3080508@intracom.gr>
	 <1055321465.2097.9.camel@passion.cambridge.redhat.com>
	 <3EE6EF42.7030405@intracom.gr>
	 <1055322260.2097.13.camel@passion.cambridge.redhat.com>
	 <1055322613.886.2.camel@russ>
Message-Id: <1055322739.2097.15.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 10:12:19 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Pantelis Antoniou <panto@intracom.gr>
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 10:10, Russ Dill wrote:
> you could simplify this by making it so that writes can only occur
> starting at 0 sequentially onward (I think this is doable by not
> implementing seek)

Not the case for block devices. With the mtd_blkdevs helper stuff I
implemented a week or so ago, you just provide 'readsector()' and
'writesector()' routines.

-- 
dwmw2
