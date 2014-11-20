Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrO7M-0006Ly-DY
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 09:33:36 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so2181623pab.26
 for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2014 01:33:14 -0800 (PST)
Date: Thu, 20 Nov 2014 01:33:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: oobtest: correct printf() format specifier for
 'size_t'
Message-ID: <20141120093310.GF3212@norris-Latitude-E6410>
References: <1416475783-27380-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1416475783-27380-1-git-send-email-computersforpeace@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 20, 2014 at 01:29:43AM -0800, Brian Norris wrote:
> Fixes warning:
> 
>    drivers/mtd/tests/oobtest.c: In function 'memcmpshow':
>    drivers/mtd/tests/oobtest.c:129: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'size_t'
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Roger Quadros <rogerq@ti.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> ---
> I'll roll this into the change I just merged

Never mind, I just applied this on top, since that's easier.

Brian
