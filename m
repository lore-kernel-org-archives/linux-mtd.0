Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3YdV-0004HR-6k
 for linux-mtd@lists.infradead.org; Sat, 05 Jul 2014 22:40:49 +0000
Received: by mail-pd0-f170.google.com with SMTP id z10so3443764pdj.29
 for <linux-mtd@lists.infradead.org>; Sat, 05 Jul 2014 15:40:28 -0700 (PDT)
Date: Sat, 5 Jul 2014 15:40:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 1/1] drivers/mtd/devices/phram.c: replace kmalloc/strcpy
 by kstrdup
Message-ID: <20140705224024.GB4083@norris-Latitude-E6410>
References: <20140528223128.c83c3fddac5553ebd315ddf9@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140528223128.c83c3fddac5553ebd315ddf9@skynet.be>
Cc: Joern Engel <joern@lazybastard.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 28, 2014 at 10:31:28PM +0200, Fabian Frederick wrote:
> 
> Cc: Joern Engel <joern@lazybastard.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Modified the subject (mtd: phram: ...) and pushed to l2-mtd.git. Thanks!

Brian
