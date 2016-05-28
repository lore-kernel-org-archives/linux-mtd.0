Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6iYO-0006E0-CC
 for linux-mtd@lists.infradead.org; Sat, 28 May 2016 18:01:41 +0000
Date: Sat, 28 May 2016 20:01:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Pawel Moll
 <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard
 Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>, open list
 <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>,
 Simon Arlott <simon@fire.lp0.eu>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: brcmnand: Add v7.2 controller support
Message-ID: <20160528200115.1cdb1d29@free-electrons.com>
In-Reply-To: <1464386293-18862-1-git-send-email-f.fainelli@gmail.com>
References: <1464386293-18862-1-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, 27 May 2016 14:58:11 -0700, Florian Fainelli wrote:

> +	if (ctrl->nand_version >= 0x0702)
> +		bits = 7;
>  	if (ctrl->nand_version >= 0x0600)

Don't you want an "else if" here ?

Otherwise, even for the 7.2 version of your controller bits will be set
to 1.

Ditto when setting ctrl->max_oob.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
