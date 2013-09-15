Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLD49-0006Wb-8p
 for linux-mtd@lists.infradead.org; Sun, 15 Sep 2013 14:12:45 +0000
From: Marek Vasut <marex@denx.de>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Sun, 15 Sep 2013 16:12:23 +0200
References: <522062B4.4080709@digi.com> <201309041638.52680.marex@denx.de>
 <522755DC.4000301@digi.com>
In-Reply-To: <522755DC.4000301@digi.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201309151612.24167.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "scottwood@freescale.com" <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Hector Palacios,

> Dear Marek,
> 
> On 09/04/2013 04:38 PM, Marek Vasut wrote:
> > Dear Huang Shijie,
> > 
> >> On Wed, Sep 04, 2013 at 04:00:36PM +0200, Marek Vasut wrote:
> >>> Dear Huang Shijie,
> >>> How come hector was then able to write his JFFS2 partition ?
> >> 
> >> If he uses the gpmi, he should not write the JFFS2, since the gpmi
> >> does not support the jffs2. He will get the failure in the end.
> > 
> > Hector, can you comment on this?
> 
> I don't think I'm following these comments. The facts are:
> 1) A JFFS2 filesystem image written with nandwrite (mtd-utils v1.5.0)
> 	a) does not mount on kernel v3.10
> 	b) mounts OK on linux-next kernel (v3.12) with the patchset [1] from 
Huang
> 	(actually I didn't use linux-next but instead a v3.10 where I merged all
> the commits done to MTD in linux-next, which are a lot).
> 
> 2) A JFFS2 filesystem image written with U-Boot v2013.01
> 	a) mounts OK on old FSL kernel 2.6.35
> 	b) does not mount on kernel v3.10 (neither on v3.8, I believe).
> 	c) does not mount on linux-next with the patchset [1]
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2013-August/048360.html
> 
> Marek, could you please confirm 2b on your side, just in case I'm doing
> anything wrong in my custom U-Boot?

Sorry for the late reply. I cannot test it, since I don't have such a setup.

I still believe it'd be worth figuring out what the heck is going on in here. 
There is obviously a bug which breaks compatibility and that must not happen.

[...]

Best regards,
Marek Vasut
