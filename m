Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq09f-00072Q-Dl
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 08:55:52 +0000
Received: by ewy9 with SMTP id 9so3452848ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 01:55:49 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/4 v2] NAND: add support for reading ONFI parameters
Date: Mon, 30 Aug 2010 10:52:35 +0200
References: <201008181401.03741.florian@openwrt.org>
	<1283156633.12995.21.camel@brekeke>
	<1283157376.12995.24.camel@brekeke>
In-Reply-To: <1283157376.12995.24.camel@brekeke>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008301052.35608.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

On Monday 30 August 2010 10:36:16 Artem Bityutskiy wrote:
> On Mon, 2010-08-30 at 11:23 +0300, Artem Bityutskiy wrote:
> > On Wed, 2010-08-18 at 14:01 +0200, Florian Fainelli wrote:
> > > Hi,
> > > 
> > > This is the second version of the patch series adding support for ONFI
> > > parameters to NAND device.
> > > 
> > > Florian Fainelli (4):
> > >   NAND: add NAND_CMD_PARAM (0xec) definition
> > >   NAND: denali should also handle NAND_CMD_PARAM
> > >   lib: add crc16_le helper
> > >   NAND: add support for reading ONFI parameters from NAND device
> > 
> > Hi,
> > 
> > since I did not review your patches, I am picking them and pushing to
> > l2-mtd-2.6.git / dunno branch. I'll try to encourage dwmw2 to look at
> > them and take them to the mtd tree, so they would have some exposure in
> > the -next tree.
> > 
> > But some "Tested-by" / "Reviewed-by" tags would certainly be useful,
> > anyone?
> 
> OK, I've noticed the further discussion. Your patches are not threaded
> with this e-mail, and this confused me.
> 
> So I'm removing your patches from my tree and waiting for newer
> patch-set.

Yes, I will resubmit new patches later today. Thanks!
--
Florian
