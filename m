Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRriM-0001J6-Lv
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:58:51 +0000
Received: by pabyb7 with SMTP id yb7so144240584pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:58:29 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:58:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Axel Lin <axel.lin@ingics.com>
Cc: Roger Quadros <rogerq@ti.com>, Frans Klaver <frans.klaver@xsens.com>,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: omap_elm: Fix module alias
Message-ID: <20150819005823.GT60523@google.com>
References: <1439902993.15765.1.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439902993.15765.1.camel@ingics.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 09:03:13PM +0800, Axel Lin wrote:
> Remove extra space after the "platform:" prefix and make the alias matches
> driver name.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Pushed to l2-mtd.git
