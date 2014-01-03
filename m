Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VytV4-0004Uq-P9
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 01:24:35 +0000
Received: by mail-ig0-f182.google.com with SMTP id c10so35117514igq.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2014 17:24:13 -0800 (PST)
Date: Thu, 2 Jan 2014 17:24:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V3 1/8] mtd: docg3: Use devm_*() functions
Message-ID: <20140103012408.GC5631@ld-irv-0074>
References: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007901cf01db$8362f580$8a28e080$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'Robert Jarzmik' <robert.jarzmik@free.fr>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 10:40:52AM +0900, Jingoo Han wrote:
> Use devm_*() functions to make cleanup paths simpler.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed all patches except for 2 and 7 to l2-mtd.git.

Brian
