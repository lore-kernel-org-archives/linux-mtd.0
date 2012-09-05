Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T96dw-0003s1-8W
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 03:51:08 +0000
Received: by dajq27 with SMTP id q27so47440daj.36
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 20:51:05 -0700 (PDT)
Date: Wed, 5 Sep 2012 11:51:10 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Subodh Nijsure <snijsure@grid-net.com>
Subject: Re: RCU warning during UBI file system mount
Message-ID: <20120905035108.GV2362@S2101-09.ap.freescale.net>
References: <5042EC5D.1010207@grid-net.com>
 <1346744796.12610.6.camel@sauron.fi.intel.com>
 <20120904144813.GC2593@linux.vnet.ibm.com>
 <50462190.7090702@grid-net.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50462190.7090702@grid-net.com>
Cc: paulmck@linux.vnet.ibm.com, linux-mtd@lists.infradead.org,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 04, 2012 at 08:43:12AM -0700, Subodh Nijsure wrote:
> MX28 is ARM device. I removed following from my config and these
> warnings went away.
> 
> CONFIG_CPU_IDLE=y
> CONFIG_CPU_IDLE_GOV_LADDER=y
> CONFIG_CPU_IDLE_GOV_MENU=y
> 
There is no cpuidle implemented on imx28.  I do not understand how
these options influence the result here.

> I have attached the kernel configuration file I used.
> 
> It doesn't affect specific hw I am working with as device is not
> required to enter idle mode.
> I am Cc-ing linux-arm folks,  in case someone on arm platform
> requires CPU idele &, RCU to work.
> 
I just ran a case with CONFIG_CPU_IDLE and RCU support and failed
to reproduce the warning.  Is this something specific to gpmi-nand
or we can see it with any other imx28 drivers/cases?  Sorry, I do
not have NAND flash set up on my imx28 board.

-- 
Regards,
Shawn
