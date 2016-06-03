Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8jm4-0000qK-7a
 for linux-mtd@lists.infradead.org; Fri, 03 Jun 2016 07:44:09 +0000
Date: Fri, 3 Jun 2016 09:43:43 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-cris-kernel@axis.com
Subject: Re: [PATCH] mtd: Remove unused symbol CONFIG_MTDRAM_ABS_POS
Message-ID: <20160603074343.GE3183@axis.com>
References: <20160603000627.GN7555@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160603000627.GN7555@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 03, 2016 at 01:06:27AM +0100, Ben Hutchings wrote:
> This has been unused, except as the condition for a fatal error, since
> commit c13cbf3b5086 ("[MTD] mtdram: Quick cleanup of the driver:") in
> 2.6.13 (!).

Agreed,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
