Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOPGN-0001QO-S6
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 09:50:36 +0000
From: Marek Vasut <marex@denx.de>
To: Hector Palacios <hector.palacios@digi.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Tue, 24 Sep 2013 11:50:09 +0200
References: <522062B4.4080709@digi.com>
In-Reply-To: <522062B4.4080709@digi.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201309241150.09313.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang,

Can you please explain what is the exact difference between the NAND layout when 
using JFFS2 in FSL 2.6.35 and in mainline with your patches ?

Is there any way to mount JFFS2 written with FSL 2.6.35 on current mainline? 
Thus far, neither me nor Hector were able to mount such partition with the same 
result.

Best regards,
Marek Vasut
