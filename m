Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9izc-0001yw-Q3
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 23:29:25 +0000
Received: by mail-pd0-f174.google.com with SMTP id fp1so19994321pdb.5
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 15:29:03 -0800 (PST)
Date: Fri, 9 Jan 2015 15:29:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] mtd: nftl: reorganize operations in condition check
Message-ID: <20150109232900.GB9759@ld-irv-0074>
References: <1420663040-3857-1-git-send-email-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420663040-3857-1-git-send-email-andy.shevchenko@gmail.com>
Cc: Giel van Schijndel <me@mortis.eu>,
 Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 07, 2015 at 10:37:20PM +0200, Andy Shevchenko wrote:
> We need to compare ret variable for negative value. The current code
> assigns the boolean to the ret and prints it wrongly in the warning
> message.
> 
> Reported-by: Andrey Karpov <karpov@viva64.com>
> Cc: Giel van Schijndel <me@mortis.eu>
> Cc: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

To be clear, this touches some commented out code (yuck). I think you
noted this previously.

For my reference, are you actually testing this driver?

Anyway, pushed to l2-mtd.git. Thanks.

Brian
