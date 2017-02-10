Received: from mail-pg0-x230.google.com ([2607:f8b0:400e:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccFdx-0004Bd-D6
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 18:10:04 +0000
Received: by mail-pg0-x230.google.com with SMTP id 204so12392648pge.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 10:09:40 -0800 (PST)
Date: Fri, 10 Feb 2017 10:09:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [GIT PULL v2] mtd: spi-nor: Changes for 4.11
Message-ID: <20170210180938.GA95539@google.com>
References: <6cdd261f-ad1c-9875-6776-fd10d68ea4c3@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cdd261f-ad1c-9875-6776-fd10d68ea4c3@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 10, 2017 at 03:17:48PM +0100, Cyrille Pitchen wrote:
> Hi Brian,
> 
> I've rewritten the spi-nor history as asked so this is the new PR.
> 
> ChangeLog for the PR:
> 
> v1 -> v2
> - create new tag: spi-nor/for-4.11-v2
> - remove the stable tag from "mtd: m25p80: consider max message size in m25p80_read"
> - fix * alignment in comment block in "mtd: spi-nor: Add support for S3AN spi-nor devices"
> 
> Best regards,
> 
> Cyrille
> 
> 
> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> 
>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> 
> are available in the git repository at:
> 
>   git://github.com/spi-nor/linux.git tags/spi-nor/for-4.11-v2
> 
> for you to fetch changes up to 7fa2c7038cc0ec16ae5d8eee347ea136de0f4b65:
> 
>   mtd: spi-nor: cqspi: remove redundant dead code on error return check (2017-02-10 14:22:00 +0100)
> 
> ----------------------------------------------------------------
> This pull request contains the following notable changes:
> - add support to the 4-byte address instruction set.
> - add support to new memory parts.
> - add support to S3AN memories.
> - add support to the Intel SPI controller.
> - add support to the Aspeed AST2400 and AST2550 controllers.
> - fix max SPI transfer and message sizes in m25p80_read().
> - fix the Candence QSPI driver.
> - fix the Freescale QSPI driver.
> 
> ----------------------------------------------------------------

Merged to l2-mtd.git. Thanks!
