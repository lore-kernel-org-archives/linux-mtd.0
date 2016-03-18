Received: from mail.kernel.org ([198.145.29.136])
 by casper.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1agxUk-0007Ly-WF
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2016 16:43:27 +0000
Date: Fri, 18 Mar 2016 11:40:38 -0500
From: Rob Herring <robh@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Simon Arlott <simon@fire.lp0.eu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH] mtd: brcmnand: Add support for v6.2 controllers
Message-ID: <20160318164038.GA20290@rob-hp-laptop>
References: <1457652859-767-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457652859-767-1-git-send-email-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 10, 2016 at 03:34:16PM -0800, Florian Fainelli wrote:
> Document and match the brcm,brcmnand-v6.2 compatible string, the controller has
> a register layout identical to the v6.0 version and supports prefetch. Update the
> command shift logic to account for v6.2 controller which are the first ones to
> use a shift of 0 (6.1 used a shift of 24).
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt | 1 +
>  drivers/mtd/nand/brcmnand/brcmnand.c                    | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
