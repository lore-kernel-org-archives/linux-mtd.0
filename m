Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlUSh-0006Aq-Qg
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 02:02:44 +0000
Received: by mail-ie0-f176.google.com with SMTP id at1so10403147iec.7
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 18:02:22 -0800 (PST)
Date: Tue, 26 Nov 2013 18:02:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] mtd: dataflash: remove unnecessary spi_set_drvdata()
Message-ID: <20131127020218.GU9468@ld-irv-0074.broadcom.com>
References: <002401cee98d$d603d900$820b8b00$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002401cee98d$d603d900$820b8b00$%han@samsung.com>
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 25, 2013 at 12:24:22PM +0900, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure. Thus, it is not needed to manually clear the
> device driver data to NULL.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed to l2-mtd.git. Thanks!

Brian
