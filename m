Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGUlF-0006mS-A5
 for linux-mtd@lists.infradead.org; Thu, 01 Jun 2017 18:23:54 +0000
Received: by mail-pf0-x22c.google.com with SMTP id e193so34271978pfh.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jun 2017 11:23:32 -0700 (PDT)
Date: Thu, 1 Jun 2017 11:23:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PULL] mtd: nand: Fixes for 4.12-rc3
Message-ID: <20170601182329.GA142617@google.com>
References: <20170522102131.220657ad@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170522102131.220657ad@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 22, 2017 at 10:21:31AM +0200, Boris Brezillon wrote:
> Hi Brian,
> 
> Here is a fixes PR for 4.12-rc3.
> 
> As usual, let me know if there's a problem and I'll update my PR.
> 
> Thanks,
> 
> Boris
> 
> The following changes since commit 08332893e37af6ae779367e78e444f8f9571511d:
> 
>   Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)
> 
> are available in the git repository at:
> 
>   git://git.infradead.org/linux-mtd.git tags/nand/fixes-for-4.12-rc3
> 
> for you to fetch changes up to d4ed3b9015b5eebc90d629579d9e7944607cbae5:
> 
>   mtd: nand: make nand_ooblayout_lp_hamming_ops static (2017-05-22 09:42:29 +0200)

Pulled into mtd/master. Thanks.
