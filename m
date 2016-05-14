Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1Oj7-0005eO-KR
 for linux-mtd@lists.infradead.org; Sat, 14 May 2016 01:50:46 +0000
Received: by mail-pf0-x241.google.com with SMTP id y7so10548461pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2016 18:50:25 -0700 (PDT)
Date: Fri, 13 May 2016 18:50:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] mtd: spi-nor: support GigaDevice gd25lq64c
Message-ID: <20160514015022.GC89390@google.com>
References: <1462549061-88356-1-git-send-email-computersforpeace@gmail.com>
 <572CC514.1070805@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <572CC514.1070805@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 06, 2016 at 06:23:48PM +0200, Marek Vasut wrote:
> On 05/06/2016 05:37 PM, Brian Norris wrote:
> > Also note the GigaDevice JEDEC ID.
> > 
> > No write-protect support yet, since this flash uses a different status
> > register layout.
> > 
> > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > v2: fixed duplicate flag
> 
> Acked-by: Marek Vasut <marex@denx.de>

Forgot to note: pushed this to l2-mtd.git several days ago
