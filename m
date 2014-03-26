Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSiMW-0005f6-Ox
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 07:35:01 +0000
Received: by mail-pd0-f169.google.com with SMTP id fp1so1518556pdb.28
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 00:34:38 -0700 (PDT)
Date: Wed, 26 Mar 2014 00:34:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix mention to CONFIG_MTD_NAND_ECC_BCH
Message-ID: <20140326073433.GC31517@norris-Latitude-E6410>
References: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394512286-31481-1-git-send-email-nunes.erico@gmail.com>
Cc: b32955@freescale.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 11, 2014 at 01:31:26AM -0300, Erico Nunes wrote:
> Mention to CONFIG_MTD_ECC_BCH in the warning message can be confusing as this
> doesn't match the exact name of the configuration option.
> This warning showed up once to me when I was starting to set up BCH. After
> checking my .config file, it took a moment before realizing it is
> CONFIG_MTD_NAND_ECC_BCH instead of CONFIG_MTD_ECC_BCH.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
