Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ycl3k-0001BS-Fa
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 01:33:41 +0000
Received: by pdnc3 with SMTP id c3so3729934pdn.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 18:33:19 -0700 (PDT)
Date: Mon, 30 Mar 2015 18:33:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: dinguyen@opensource.altera.com
Subject: Re: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
Message-ID: <20150331013316.GR32500@ld-irv-0074>
References: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
Cc: dinh.linux@gmail.com, Richard Weinberger <richard@nod.at>,
 josh@joshtriplett.org, linux-kernel@vger.kernel.org, yamada.m@jp.panasonic.com,
 linux-mtd@lists.infradead.org, Ricard Wanderlof <ricard.wanderlof@axis.com>,
 dwmw2@infradead.org, Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 09:38:50AM -0600, dinguyen@opensource.altera.com wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> The Denali Controller IP does not support sub-page writes.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Pushed to l2-mtd.git. Thanks!

Brian
