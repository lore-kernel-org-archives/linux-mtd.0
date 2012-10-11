Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMHMY-0005Xs-TA
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 11:55:39 +0000
From: Marek Vasut <marex@denx.de>
To: dedekind1@gmail.com
Subject: Re: GPMI NAND crashes with UBIFS
Date: Thu, 11 Oct 2012 13:55:33 +0200
References: <201210050345.49507.marex@denx.de>
 <1349954707.12014.14.camel@sauron.fi.intel.com>
In-Reply-To: <1349954707.12014.14.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210111355.33836.marex@denx.de>
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

> On Fri, 2012-10-05 at 03:45 +0200, Marek Vasut wrote:
> > Hello guys,
> > 
> > I tried integck from mtd-utils 1.5.0 on GPMI NAND driver since I suspect
> > it still has issues with UBI. See the outcome for yourself, log
> > attached. Any suggestions would be very appreciated.
> > 
> > :~/mtd-utils-1.5.0/tests/fs-tests/integrity# ./integck /media
> 
> Wait, you have power-cut emulation enabled, did you deliberately enable
> it via UBIFS debugfs files?

I enabled this:
echo 1 > /sys/kernel/debug/ubifs/tst_recovery

Yes.

> > (pid 492): power_cut_emulated: failing after 19403ms
> 
> ^^^^

Best regards,
Marek Vasut
