Received: from mail-oa0-x229.google.com ([2607:f8b0:4003:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VglOW-0001Xe-HT
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 01:06:53 +0000
Received: by mail-oa0-f41.google.com with SMTP id g12so1470590oah.14
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 17:06:31 -0800 (PST)
Date: Wed, 13 Nov 2013 17:06:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/12] mtd: Remove superfluous name casts
Message-ID: <20131114010627.GK9468@ld-irv-0074.broadcom.com>
References: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
 <1384283245-9419-3-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384283245-9419-3-git-send-email-geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 08:07:15PM +0100, Geert Uytterhoeven wrote:
> map_info.name is "const char *"
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org

Pushed to l2-mtd.git/next. Thanks!

Brian
