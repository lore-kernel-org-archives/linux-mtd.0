Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7MV-0007pP-Ii
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:37:20 +0000
Received: by pacwv17 with SMTP id wv17so34479318pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:36:56 -0700 (PDT)
Date: Thu, 28 May 2015 16:36:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: James Cowgill <james410@cowgill.org.uk>
Subject: Re: [PATCH] mtd-utils: make hashtable_iterator functions static inline
Message-ID: <20150528233651.GB17945@ld-irv-0074>
References: <1429201976-13558-1-git-send-email-james410@cowgill.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429201976-13558-1-git-send-email-james410@cowgill.org.uk>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2015 at 05:32:56PM +0100, James Cowgill wrote:
> GCC 5 changed the default C standard to gnu11 which changed the behavior of the
> inline keyword. This causes mtd-utils to fail to build with duplicate
> definition errors involving hashtable_iterator_key and
> hashtable_iterator_value.
> 
> This patch fixes the build by making the functions static inline and removing
> the extra definitions in hashtable_itr.c.
> 
> Signed-off-by: James Cowgill <james410@cowgill.org.uk>

Applied an identical patch from another contributor. Thanks!

Brian
