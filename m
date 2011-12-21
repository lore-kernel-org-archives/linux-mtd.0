Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RdT99-0004qA-JL
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2011 20:52:20 +0000
Received: by lahc1 with SMTP id c1so6026256lah.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2011 12:52:14 -0800 (PST)
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Wed, 21 Dec 2011 22:52:08 +0200
In-Reply-To: <1324202449-13820-1-git-send-email-jamie@jamieiles.com>
References: <1324202449-13820-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324500731.2110.0.camel@koala>
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-12-18 at 10:00 +0000, Jamie Iles wrote:
> Add device tree bindings so that the gpio-nand driver may be
> instantiated from the device tree.  This also allows the partitions
> to be specified in the device tree.
> 
> v7:	- restore runtime device tree/non device tree detection
> v6:	- convert to mtd_device_parse_register()
> v5:	- fold dt config helpers into a single gpio_nand_of_get_config()
> v4:	- get io sync address from gpio-control-nand,io-sync-reg
> 	  property rather than a resource
> 	- clarified a few details in the binding
> v3:	- remove redundant cast and a couple of whitespace/naming
> 	  changes
> v2:	- add CONFIG_OF guards for non-dt platforms
> 	- compatible becomes gpio-control-nand
> 	- clarify some binding details
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Scott Wood <scottwood@freescale.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Pushed to l2-mtd-2.6.git, thanks!
