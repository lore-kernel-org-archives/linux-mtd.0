Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7fp-0000z9-Dx
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 20:59:25 +0000
Received: by mail-pd0-f171.google.com with SMTP id r10so1473418pdi.30
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 12:59:04 -0800 (PST)
Date: Wed, 5 Nov 2014 12:59:00 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Chunhe Lan <Chunhe.Lan@freescale.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Move n25q032 entry to Micron devices list
Message-ID: <20141105205900.GR23619@ld-irv-0074>
References: <1414639572-28756-1-git-send-email-Chunhe.Lan@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414639572-28756-1-git-send-email-Chunhe.Lan@freescale.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 30, 2014 at 11:26:12AM +0800, Chunhe Lan wrote:
> Because n25q032 is the Micron SPI chip, move it to Micron
> devices list group. In order that know which Micron SPI
> chips have been support at a glance. 
> 
> Signed-off-by: Chunhe Lan <Chunhe.Lan@freescale.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Huang Shijie <shijie8@gmail.com>

Applied to l2-mtd.git. Thanks!

Brian
