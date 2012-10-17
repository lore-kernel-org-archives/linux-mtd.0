Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOTVa-00089V-N9
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 13:18:04 +0000
From: Marek Vasut <marex@denx.de>
To: dedekind1@gmail.com
Subject: Re: GPMI NAND crashes with UBIFS
Date: Wed, 17 Oct 2012 15:16:55 +0200
References: <201210050345.49507.marex@denx.de>
 <201210111355.33836.marex@denx.de>
 <1350479529.5769.155.camel@sauron.fi.intel.com>
In-Reply-To: <1350479529.5769.155.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210171516.55693.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem Bityutskiy,

> On Thu, 2012-10-11 at 13:55 +0200, Marek Vasut wrote:
> > Dear Artem Bityutskiy,
> > 
> > > On Fri, 2012-10-05 at 03:45 +0200, Marek Vasut wrote:
> > > > Hello guys,
> > > > 
> > > > I tried integck from mtd-utils 1.5.0 on GPMI NAND driver since I
> > > > suspect it still has issues with UBI. See the outcome for yourself,
> > > > log attached. Any suggestions would be very appreciated.
> > > > 
> > > > :~/mtd-utils-1.5.0/tests/fs-tests/integrity# ./integck /media
> > > 
> > > Wait, you have power-cut emulation enabled, did you deliberately enable
> > > it via UBIFS debugfs files?
> > 
> > I enabled this:
> > echo 1 > /sys/kernel/debug/ubifs/tst_recovery
> 
> Then this is expected behavior. You can run integck with -p, then it
> will be aware for the power-cut emulation and will continue running.

Ok, I'll re-check. Though I suspect this problem disappeared with the recently 
applied UBI patches.

Best regards,
Marek Vasut
