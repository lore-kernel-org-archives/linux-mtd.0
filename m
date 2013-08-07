Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6ytf-0007mL-M4
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 08:15:08 +0000
Received: by mail-pd0-f180.google.com with SMTP id 15so1128258pdi.25
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2013 01:14:45 -0700 (PDT)
Date: Wed, 7 Aug 2013 01:14:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] mtd: denali: use NAND_CI_CELLTYPE_MSK instead of
 hardcoded constant
Message-ID: <20130807081437.GA6438@norris.computersforpeace.net>
References: <1374934193-21236-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1374934193-21236-1-git-send-email-akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 27, 2013 at 11:09:53PM +0900, Akinobu Mita wrote:
> Use NAND_CI_CELLTYPE_MSK to extract the cell type from nand_chip.cellinfo
> instead of hardcoded constant.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org

Applied to l2-mtd.git. Thanks!

Brian
