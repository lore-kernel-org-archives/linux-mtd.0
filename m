Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU4SL-0006KA-C0
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 00:50:22 +0000
Received: by mail-ob0-f181.google.com with SMTP id va2so1239604obc.40
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 17:50:00 -0700 (PDT)
Date: Wed, 9 Oct 2013 17:49:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] mtd: sst25l: Remove redundant spi_set_drvdata
Message-ID: <20131010004956.GF23337@ld-irv-0074.broadcom.com>
References: <1381224094-14098-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381224094-14098-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, andre@bluewatersys.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 08, 2013 at 02:51:33PM +0530, Sachin Kamat wrote:
> Driver core will set the driver data to NULL upon detach
> or probe failure.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed the pair to l2-mtd.git. Thanks!

Brian
