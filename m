Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9ffF-0001hH-OK
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 19:23:54 +0000
Received: by mail-pd0-f180.google.com with SMTP id y13so127812pdi.25
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2014 12:23:32 -0700 (PDT)
Date: Tue, 22 Jul 2014 12:23:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Grzeschik <mgr@pengutronix.de>
Subject: Re: [PATH v2] mxc_nand: use our own read_page function
Message-ID: <20140722192328.GC28323@ld-irv-0074>
References: <1403815368-29469-2-git-send-email-m.grzeschik@pengutronix.de>
 <1403865524-25061-1-git-send-email-m.grzeschik@pengutronix.de>
 <20140714191947.GP7537@ld-irv-0074>
 <20140722100954.GA29623@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140722100954.GA29623@pengutronix.de>
Cc: dwmw2@infradead.org, Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael,

On Tue, Jul 22, 2014 at 12:09:54PM +0200, Michael Grzeschik wrote:
> I think your hints all make sense. I was poking around with the
> functions we have and need to asign. Unfortunetly I ran into no clear
> picture to fix it the correct way and came up with this hacky patch.

Your patch is close, so it's not completely a hack. And the various
override functions can be difficult to follow. You can ping back here if
you have questions still.

Regards,
Brian
