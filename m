Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dV5ev-0007Zr-EW
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 00:37:43 +0000
Received: by mail-pg0-x235.google.com with SMTP id k14so4092375pgr.0
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jul 2017 17:37:20 -0700 (PDT)
Date: Tue, 11 Jul 2017 17:37:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Linux MTD Development List <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: spi-nor: Changes for 4.13
Message-ID: <20170712003717.GH55942@google.com>
References: <a003346e-ae4f-3ca6-58e2-ce78cab6cf11@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a003346e-ae4f-3ca6-58e2-ce78cab6cf11@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Sat, Jul 01, 2017 at 04:09:34PM +0200, Cyrille Pitchen wrote:
> Hi all,
> 
> this is the PR for 4.13.
> 
> Please note that I did not include the patch for the SFDP support since it
> has spent less than a week in linux-next.
> 
> Best regards,
> 
> Cyrille
> 
> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> 
>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> 
> are available in the git repository at:
> 
>   git://git.infradead.org/l2-mtd.git tags/spi-nor/for-4.13
> 
> for you to fetch changes up to 9447332ffacceeb49467ae5314887a30f6c0aaa9:
> 
>   mtd: st_spi_fsm: remove SPINOR_OP_RDSR2 and use SPINOR_OP_RDCR instead (2017-06-27 21:50:17 +0200)
> 
> ----------------------------------------------------------------
> This pull request contains the following notable changes:
> - introduce support to the SPI 1-2-2 and 1-4-4 protocols.
> - introduce support to the Double Data Rate (DDR) mode.
> - introduce support to the Octo SPI protocols.
> - add support to new memory parts for Spansion, Macronix and Winbond.
> - add fixes for the Aspeed, STM32 and Cadence QSPI controler drivers.
> - clean up the st_spi_fsm driver.
> 
> ----------------------------------------------------------------

Pulled, thanks!
