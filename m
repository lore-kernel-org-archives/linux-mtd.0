Received: from mail-bl2lp0211.outbound.protection.outlook.com
 ([207.46.163.211] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKG52-000573-Bd
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 00:18:16 +0000
Message-ID: <1408580260.4058.81.camel@snotra.buserror.net>
Subject: Re: [PATCH 2/2] mtd: fsl_ifc_nand: Probe partitions OF node
From: Scott Wood <scottwood@freescale.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Wed, 20 Aug 2014 19:17:40 -0500
In-Reply-To: <1356934794.97763.1408580122332.JavaMail.zimbra@xes-inc.com>
References: <251532766.70336.1408150059026.JavaMail.zimbra@xes-inc.com>
 <1408577185.4058.77.camel@snotra.buserror.net>
 <917570204.96674.1408578333042.JavaMail.zimbra@xes-inc.com>
 <1408579196.4058.80.camel@snotra.buserror.net>
 <1356934794.97763.1408580122332.JavaMail.zimbra@xes-inc.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Prabhakar
 Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-08-20 at 19:15 -0500, Aaron Sierra wrote:
> Ah, I was under the wrong impression that there was a common MTD
> partitioning format. I didn't realize it was defined by each
> driver. Thanks for clearing that up.

The partition nodes should take the same form regardless of controller
type, but not the node that contains the partition nodes.

-Scott
