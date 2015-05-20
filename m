Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvDH2-0006qb-J3
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 23:19:41 +0000
Received: by pdfh10 with SMTP id h10so85671105pdf.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 16:19:18 -0700 (PDT)
Date: Wed, 20 May 2015 16:19:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Properly set SECT_4K for recently added
 flashes
Message-ID: <20150520231910.GV11598@ld-irv-0074>
References: <1429958490-17182-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1429958490-17182-1-git-send-email-zajec5@gmail.com>
Cc: Huang Shijie <shijie.huang@intel.com>,
 Shengzhou Liu <shengzhou.liu@freescale.com>, linux-mtd@lists.infradead.org,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 25, 2015 at 12:41:30PM +0200, Rafał Miłecki wrote:
> Few recently added entries are missing SECT_4K flag despite of these
> flashes supporting 4 KiB erase sectors and 0x20 erase command.
> Also add a comment to help avoiding such mistakes in the future.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> Cc: Knut Wohlrab <knut.wohlrab@de.bosch.com>
> Cc: Huang Shijie <shijie.huang@intel.com>
> Cc: Shengzhou Liu <shengzhou.liu@freescale.com>

Pushed to l2-mtd.git. Thanks!
