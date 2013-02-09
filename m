Received: from mail-vc0-f169.google.com ([209.85.220.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U4JJn-00055q-5y
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2013 22:54:48 +0000
Received: by mail-vc0-f169.google.com with SMTP id n10so3105951vcn.14
 for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2013 14:54:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1302022239300.8751@axis700.grange>
References: <Pine.LNX.4.64.1212310952190.23808@axis700.grange>
 <Pine.LNX.4.64.1302022239300.8751@axis700.grange>
Date: Sat, 9 Feb 2013 14:54:43 -0800
Message-ID: <CAN8TOE_uc=_ja64jWtEF2TTo7rqYaasShrQ+iPyZHBaGOv5oFw@mail.gmail.com>
Subject: Re: [PATCH] mtd: fix uninitialised mtd map name
From: Brian Norris <computersforpeace@gmail.com>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 2, 2013 at 1:48 PM, Guennadi Liakhovetski
<g.liakhovetski@gmx.de> wrote:
> Do I see it right, that this patch didn't make it into the kernel on time
> for 3.8? Could you please, make sure it makes it to 3.9?

It looks like an independent but identical patch made it in for 3.8-rc7:

commit 7dfe4be351e81656ca1068e5d4ead235c7ba94b1
Author: Baruch Siach <baruch@tkos.co.il>
Date:   Sun Dec 23 13:10:50 2012 +0200

    mtd: physmap_of: fix cmdline partition method w/o linux, mtd-name

    Commit d68cbdd4fb (mtd: physmap_of: allow to specify the mtd name for retro
    compatiblity) broke cmdline partitioning using dev_name() in the
kernel command
    line.  of_property_read_string() does not touch mtd_name when
linux,mtd-name is
    not present in the device tree, which causes map.name to be set to a random
    value.  Fix this by initializing mtd_name to NULL.

    Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
    Signed-off-by: Baruch Siach <baruch@tkos.co.il>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

Brian
