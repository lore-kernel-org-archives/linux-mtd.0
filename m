Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNUbb-0003F3-OC
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2012 19:43:56 +0000
Message-ID: <4F99A575.2050700@freescale.com>
Date: Thu, 26 Apr 2012 14:43:49 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Shengzhou Liu <Shengzhou.Liu@freescale.com>
Subject: Re: [PATCH v2] powerpc/85xx: Enable MTD/NOR/NAND options by default
 in defconfig
References: <1335436983-21360-1-git-send-email-Shengzhou.Liu@freescale.com>
In-Reply-To: <1335436983-21360-1-git-send-email-Shengzhou.Liu@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/26/2012 05:43 AM, Shengzhou Liu wrote:
> +CONFIG_MTD_NAND_VERIFY_WRITE=y

I don't think we want this on by default.

-Scott
