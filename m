Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW8DG-0003jA-6h
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:19:50 +0000
Received: by mail-pa0-f44.google.com with SMTP id eu11so4086658pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 11:19:29 -0700 (PDT)
Date: Mon, 22 Sep 2014 11:19:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] mtd: physmap_of: Fix ROM support via OF
Message-ID: <20140922181926.GO1193@ld-irv-0074>
References: <1388169775.233775.1410977001530.JavaMail.zimbra@xes-inc.com>
 <1456841230.234377.1410977298299.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456841230.234377.1410977298299.JavaMail.zimbra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 17, 2014 at 01:08:18PM -0500, Aaron Sierra wrote:
> The "ROM" and unknown probe types within the obsolete "direct-mapped"
> probe function used the nonexistent "mtd_rom" probe instead of the
> intended "map_rom".
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Pushed both to l2-mtd.git. Thanks!

Brian
