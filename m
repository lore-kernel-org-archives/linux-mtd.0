Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCH1Z-00088g-Pa
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 02:23:02 +0000
Received: by mail-pg0-x241.google.com with SMTP id x23so3006439pgx.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 18:22:41 -0800 (PST)
Date: Wed, 30 Nov 2016 18:22:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [GIT PULL] mtd: spi-nor: updates for 4.10
Message-ID: <20161201022238.GA3973@google.com>
References: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 28, 2016 at 02:19:43PM +0100, Cyrille Pitchen wrote:
> Hi Brian,
> 
> this is my very first PR so let me know whether I should change something.
> 
> Best regards,
> 
> Cyrille

I don't see any issues. Thanks for doing this!

BTW, does Marek have access to your repo, or are you planning on doing
all the merging?

> The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> 
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> 
> are available in the git repository at:
> 
>   git://github.com/spi-nor/linux.git tags/spi-nor/for-4.10
> 
> for you to fetch changes up to dfce0cd943fe0554f5f79d5b29624064dafb18cd:
> 
>   mtd: spi-nor: constify fsl_qspi_devtype_data (2016-11-26 17:45:06 +0100)
> 
> ----------------------------------------------------------------
> This pull request contains the following notable changes:
> - add support to new memory parts.
> - fix of spansion_quad_enable().
> - fix of the Candence QSPI driver.
> - constify some structure instances of the Freescale QSPI driver.
> 
> ----------------------------------------------------------------

Merged to l2-mtd.git.

Brian
