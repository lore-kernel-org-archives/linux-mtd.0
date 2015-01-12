Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAmsV-0007IW-BK
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 21:50:28 +0000
Received: by mail-yk0-f174.google.com with SMTP id 10so10395456ykt.5
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jan 2015 13:50:06 -0800 (PST)
Date: Mon, 12 Jan 2015 13:50:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Steve deRosier <derosier@gmail.com>
Subject: Re: WP# line on flash chip?
Message-ID: <20150112215002.GF9759@ld-irv-0074>
References: <CALupW3AMWWs57nKEy1OsP_3ZLLH_US1ZPua+s8-qOWLVcnRd_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALupW3AMWWs57nKEy1OsP_3ZLLH_US1ZPua+s8-qOWLVcnRd_g@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 08, 2015 at 09:59:37AM -0800, Steve deRosier wrote:
> I can't find any way to add this pin to our device tree, nor do I see
> any evidence for support in either our atmel_nand driver or in
> higher-level MTD stuff like nand_base.
> 
> Does the support for this exist and am I simply missing finding it, or
> is it not there at all (expected)?

I believe it does not exist yet.

I've seen a driver for a controller which has WP# control built directly
into its register space. This driver would just toggle WP# before/after
each PROGRAM_PAGE and ERASE operation. Not beautiful, but it works. I'd
expect this might be nicer to do with larger granularity -- i.e., only
toggle twice per mtd_write() even for larger transfers, in nand_base.c.

> Assuming it's not there, and assuming I actually add it, is this a
> feature that the MTD maintainers would allow to go upstream? I'm
> assuming it's not a unique feature to this chip and that other chips
> may have it.

We don't often get asked for permission here, but I appreciate the
sentiment :)

The idea sounds fine to me. One obstacle is that we don't have a
standardized "NAND" device tree node that nand_base can use. We have a
few standardized properties, but they're mostly handled per-driver. But
anything done to improve that is welcome.

Regards,
Brian
