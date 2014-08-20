Received: from mail-bl2lp0212.outbound.protection.outlook.com
 ([207.46.163.212] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKFHN-0004DP-Rh
 for linux-mtd@lists.infradead.org; Wed, 20 Aug 2014 23:26:58 +0000
Message-ID: <1408577185.4058.77.camel@snotra.buserror.net>
Subject: Re: [PATCH 2/2] mtd: fsl_ifc_nand: Probe partitions OF node
From: Scott Wood <scottwood@freescale.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Wed, 20 Aug 2014 18:26:25 -0500
In-Reply-To: <251532766.70336.1408150059026.JavaMail.zimbra@xes-inc.com>
References: <251532766.70336.1408150059026.JavaMail.zimbra@xes-inc.com>
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

On Fri, 2014-08-15 at 19:47 -0500, Aaron Sierra wrote:
> Previously, the OF node defining the IFC NAND controller was being
> passed to mtd_device_parse_register(), not the node defining the
> partitions. This resulted in no OF-defined partitions being created.

This driver probes on "fsl,ifc-nand", not "fsl,ifc".  So how is it
getting the controller node?

What does the device tree look like in which you're seeing this happen?

-Scott
