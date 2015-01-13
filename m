Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAymw-0004Yf-Hx
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 10:33:31 +0000
Received: by mail-pd0-f178.google.com with SMTP id r10so2749935pdi.9
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 02:33:07 -0800 (PST)
Date: Tue, 13 Jan 2015 02:33:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: dinguyen@opensource.altera.com
Subject: Re: [PATCH] mtd: denali: fix incorrect bitmask error in
 denali_setup_dma
Message-ID: <20150113103303.GB13943@norris-Latitude-E6410>
References: <1420817555-22828-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420817555-22828-1-git-send-email-dinguyen@opensource.altera.com>
Cc: dinh.linux@gmail.com, shijie8@gmail.com, josh@joshtriplett.org,
 linux-kernel@vger.kernel.org, yamada.m@jp.panasonic.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Graham Moore <grmoore@opensource.altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 09, 2015 at 09:32:35AM -0600, dinguyen@opensource.altera.com wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> commit "3157d1ed2309 mtd: denali: remove unnecessary casts" introduced
> an error by using a wrong bitmask.
> 
> A uint16_t cast was replaced with & 0xff, should be & 0xffff.
> 
> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Pushed to l2-mtd.git. Thanks!

Brian
