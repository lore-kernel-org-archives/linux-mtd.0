Received: from mail-bn1blp0186.outbound.protection.outlook.com
 ([207.46.163.186] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKFnn-0007Sb-AE
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 00:00:28 +0000
Message-ID: <1408579196.4058.80.camel@snotra.buserror.net>
Subject: Re: [PATCH 2/2] mtd: fsl_ifc_nand: Probe partitions OF node
From: Scott Wood <scottwood@freescale.com>
To: Aaron Sierra <asierra@xes-inc.com>
Date: Wed, 20 Aug 2014 18:59:56 -0500
In-Reply-To: <917570204.96674.1408578333042.JavaMail.zimbra@xes-inc.com>
References: <251532766.70336.1408150059026.JavaMail.zimbra@xes-inc.com>
 <1408577185.4058.77.camel@snotra.buserror.net>
 <917570204.96674.1408578333042.JavaMail.zimbra@xes-inc.com>
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

On Wed, 2014-08-20 at 18:45 -0500, Aaron Sierra wrote:
> ----- Original Message -----
> > From: "Scott Wood" <scottwood@freescale.com>
> > Sent: Wednesday, August 20, 2014 6:26:25 PM
> > 
> > On Fri, 2014-08-15 at 19:47 -0500, Aaron Sierra wrote:
> > > Previously, the OF node defining the IFC NAND controller was being
> > > passed to mtd_device_parse_register(), not the node defining the
> > > partitions. This resulted in no OF-defined partitions being created.
> > 
> > This driver probes on "fsl,ifc-nand", not "fsl,ifc".  So how is it
> > getting the controller node?
> > 
> > What does the device tree look like in which you're seeing this happen?
> > 
> > -Scott
> > 
> 
> This is the node that is defined in my T1042 device tree:
> 
> 		nand0@4,0 {
> 			#address-cells = <0>;
> 			#size-cells = <0>;
> 			compatible = "fsl,ifc-nand";
>                         reg = <4 0x0 0x040000>;
> 
> 			nand@0 {
> 				#address-cells = <1>;
> 				#size-cells = <2>;
> 				compatible = "micron,mt29f32g08";
> 
> 				partition@0 {
> 					label = "NAND Filesystem";
> 					reg = <0 0x1 0x00000000>;
> 				};
> 			};
> 		};

This is wrong.  You shouldn't have a separate nand@0 node.

Your patch will break partition detection on all of the existing IFC
device trees.

> It is based on a node used previously with the fsl_upm NAND driver on
> a P5020:

Why would you base it on a upm node rather than on an ifc node, or on
the IFC binding document
(Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt)?

-Scott
