Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnCe9-0006Kb-KS
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 19:57:53 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so1705309pab.24
 for <linux-mtd@lists.infradead.org>; Wed, 21 May 2014 12:57:32 -0700 (PDT)
Date: Wed, 21 May 2014 12:57:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 0/4] pxa3xx-nand: Allow to specify an ECC scheme
 through DT
Message-ID: <20140521195728.GG22233@ld-irv-0074>
References: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 14, 2014 at 02:58:05PM -0300, Ezequiel Garcia wrote:
> Now that we have agreed on the ECC devicetree binding, here's a patchset
> that makes pxa3xx-nand driver use it.
[...]
> Ezequiel Garcia (4):
>   mtd: nand: Warn the user if the selected ECC strength is too weak
>   mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
>   mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding
>   mtd: nand: pxa3xx: Add supported ECC strength and step size to the DT
>     binding

Pushed all 4 to l2-mtd.git. Thanks!

Brian
