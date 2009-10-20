Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0HPE-0006v3-Ot
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 16:17:57 +0000
Date: Wed, 21 Oct 2009 01:17:50 +0900 (JST)
Message-Id: <20091021.011750.71092490.anemo@mba.ocn.ne.jp>
To: hartleys@visionengravers.com
Subject: Re: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901E2481C@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com>
	<20091021.002941.41633716.anemo@mba.ocn.ne.jp>
	<BD79186B4FD85F4B8E60E381CAEE190901E2481C@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Oct 2009 12:08:00 -0400, "H Hartley Sweeten" <hartleys@visionengravers.com> wrote:
> >> Also, cleanup the #ifdef CONFIG_MTD_PARTITIONS stuff by using
> >> mtd_has_partitions().
> >
> > And this cleanup cause build errors when CONFIG_MTD_PARTITIONS was not
> > set.  A separate patch might be better for such cleanup.
> 
> Hmm..  Not sure why that would cause a build error.  Regardless, I will
> remove that change from this patch.

Thank you.  The build errors are something like:

physmap.c:53: error: 'struct physmap_flash_info' has no member named 'nr_parts'
physmap.c:174: error: 'part_probe_types' undeclared (first use in this function)

---
Atsushi Nemoto
