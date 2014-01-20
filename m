Received: from mail-qe0-x231.google.com ([2607:f8b0:400d:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5Kx9-0002dr-8Q
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:56:11 +0000
Received: by mail-qe0-f49.google.com with SMTP id w4so6692188qeb.8
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:55:50 -0800 (PST)
Date: Mon, 20 Jan 2014 11:55:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdram: add missing 'const'
Message-ID: <20140120195546.GV8919@ld-irv-0074>
References: <1389484627-7628-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389484627-7628-1-git-send-email-computersforpeace@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 11, 2014 at 03:57:07PM -0800, Brian Norris wrote:
> mtdram_init_device() wasn't updated along with mtd_partition.name.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Pushed to l2-mtd.git.

Brian
