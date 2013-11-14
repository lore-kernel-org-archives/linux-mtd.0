Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VglXH-0001ja-1x
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 01:15:56 +0000
Received: by mail-ob0-f172.google.com with SMTP id wm4so1420458obc.17
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 17:15:33 -0800 (PST)
Date: Wed, 13 Nov 2013 17:08:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 03/12] mtd: pasemi_nand.c: Remove superfluous name cast
Message-ID: <20131114010844.GL9468@ld-irv-0074.broadcom.com>
References: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
 <1384283245-9419-4-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384283245-9419-4-git-send-email-geert@linux-m68k.org>
Cc: Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 08:07:16PM +0100, Geert Uytterhoeven wrote:
> device_driver.name is "const char *"
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: linux-mtd@lists.infradead.org

Pushed to l2-mtd.git/next. Thanks!

Brian
