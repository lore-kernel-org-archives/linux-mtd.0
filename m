Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOcxp-00062j-Qo
 for linux-mtd@lists.infradead.org; Sun, 17 Jul 2016 03:41:58 +0000
Received: by mail-pf0-x241.google.com with SMTP id i6so8694246pfe.0
 for <linux-mtd@lists.infradead.org>; Sat, 16 Jul 2016 20:41:37 -0700 (PDT)
Date: Sat, 16 Jul 2016 20:41:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: brcmnand: Change BUG_ON in brcmnand_send_cmd
Message-ID: <20160717034127.GA14096@brian-ubuntu>
References: <1467999399-22288-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467999399-22288-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 08, 2016 at 10:36:39AM -0700, Florian Fainelli wrote:
> Change the BUG_ON() condition in brcmnand_send_cmd() which checks for
> the interrupt status "controller ready" bit to a WARN_ON.
> 
> There is no good reason to kill the system when this condition occur
> because we could have systems which listed the NAND controller as
> available (e.g: from Device Tree), but the NAND chip could be
> malfunctioning and not responding.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to l2-mtd.git
